---------------------------------------------------------------------
-- Copyright (C) 2016 Siavoosh Payandeh Azad
--
-- 	Network interface: Its an interrupt based memory mapped I/O for sending and recieving packets.
--	the data that is sent to NI should be of the following form:
-- 	FIRST write:  4bit source(31-28), 4 bit destination(27-14), 8bit packet length(23-16)
-- 	Body write:  28 bit data(27-0)
-- 	Last write:  28 bit data(27-0)

---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use work.mlite_pack.all;
use ieee.std_logic_misc.all;


entity NI is
   generic(current_address : integer := 10; 	-- the current node's address
           SHMU_address : integer := 0;
   		     reserved_address : std_logic_vector(29 downto 0) := "000000000000000001111111111111"; -- Behrad: NI's reserved address ?
           flag_address : std_logic_vector(29 downto 0) :=     "000000000000000010000000000000";	-- reserved address for the memory mapped I/O
           counter_address : std_logic_vector(29 downto 0) :=     "000000000000000010000000000001";
           reconfiguration_address : std_logic_vector(29 downto 0) :=     "000000000000000010000000000010";  -- reserved address for reconfiguration register
           self_diagnosis_address : std_logic_vector(29 downto 0) :=     "000000000000000010000000000011");	-- reserved address for self diagnosis register
   port(clk               : in std_logic;
        reset             : in std_logic;
        enable            : in std_logic;
        write_byte_enable : in std_logic_vector(3 downto 0);
        address           : in std_logic_vector(31 downto 2);
        data_write        : in std_logic_vector(31 downto 0);
        data_read         : out std_logic_vector(31 downto 0);

        -- Flags used by JNIFR and JNIFW instructions
        --NI_read_flag      : out  std_logic; 	-- One if the N2P fifo is empty. No read should be performed if one.
        --NI_write_flag      : out  std_logic;	-- One if P2N fifo is full. no write should be performed if one.

        -- interrupt signal: generated evertime a packet is recieved!
        irq_out           : out std_logic;

        -- signals for sending packets to network
        credit_in : in std_logic;
        valid_out: out std_logic;
        TX: out std_logic_vector(31 downto 0);	-- data sent to the NoC

        -- signals for reciving packets from the network
        credit_out : out std_logic;
        valid_in: in std_logic;
        RX: in std_logic_vector(31 downto 0);	-- data recieved form the NoC

        -- fault information signals from the router
        link_faults: in std_logic_vector(4 downto 0);
        turn_faults: in std_logic_vector(19 downto 0);

        Rxy_reconf_PE: out  std_logic_vector(7 downto 0);   
        Cx_reconf_PE: out  std_logic_vector(3 downto 0);    -- if you are not going to update Cx you should write all ones! (it will be and will the current Cx bits)
        Reconfig_command : out std_logic
	);
end; --entity NI

architecture logic of NI is

  -- all the following signals are for sending data from processor to NoC
  signal storage, storage_in : std_logic_vector(31 downto 0);
  signal valid_data_in, valid_data: std_logic;

  signal old_address: std_logic_vector(31 downto 2); -- Behrad: What is old address ?
  signal P2N_FIFO_read_pointer, P2N_FIFO_read_pointer_in,  P2N_FIFO_write_pointer, P2N_FIFO_write_pointer_in: std_logic_vector(3 downto 0);
  signal P2N_write_en: std_logic;
  signal P2N_FIFO_MEM_1, P2N_FIFO_MEM_1_in : std_logic_vector(31 downto 0);
  signal P2N_FIFO_MEM_2, P2N_FIFO_MEM_2_in : std_logic_vector(31 downto 0);
  signal P2N_FIFO_MEM_3, P2N_FIFO_MEM_3_in : std_logic_vector(31 downto 0);
  signal P2N_FIFO_MEM_4, P2N_FIFO_MEM_4_in : std_logic_vector(31 downto 0);
  signal P2N_full, P2N_empty: std_logic;
  

  signal credit_counter_in, credit_counter_out: std_logic_vector(1 downto 0);
  signal packet_counter_in, packet_counter_out: std_logic_vector(7 downto 0);
  signal packet_length_counter_in, packet_length_counter_out: std_logic_vector(11 downto 0);
  signal grant : std_logic;

  type STATE_TYPE IS (IDLE, HEADER_FLIT, BODY_FLIT, TAIL_FLIT, DIAGNOSIS_HEADER, DIAGNOSIS_BODY, DIAGNOSIS_TAIL);
  signal state, state_in   : STATE_TYPE := IDLE;
  signal FIFO_Data_out : std_logic_vector(31 downto 0);
  signal flag_register, flag_register_in : std_logic_vector(31 downto 0);


  -- all the following signals are for sending the packets from NoC to processor
  signal N2P_FIFO_MEM_1, N2P_FIFO_MEM_1_in : std_logic_vector(31 downto 0);
  signal N2P_FIFO_MEM_2, N2P_FIFO_MEM_2_in : std_logic_vector(31 downto 0);
  signal N2P_FIFO_MEM_3, N2P_FIFO_MEM_3_in : std_logic_vector(31 downto 0);
  signal N2P_FIFO_MEM_4, N2P_FIFO_MEM_4_in : std_logic_vector(31 downto 0);

  signal N2P_Data_out, data_read_in : std_logic_vector(31 downto 0);

  signal N2P_FIFO_read_pointer, N2P_FIFO_read_pointer_in: std_logic_vector(3 downto 0);
  signal N2P_FIFO_write_pointer, N2P_FIFO_write_pointer_in: std_logic_vector(3 downto 0);

  signal N2P_full, N2P_empty: std_logic;
  signal N2P_read_en, N2P_read_en_in, N2P_write_en: std_logic;
  signal counter_register_in, counter_register : std_logic_vector(1 downto 0);

  signal fault_info, fault_info_in: std_logic_vector(24 downto 0);
  signal sent_info, fault_info_ready, fault_info_ready_in: std_logic;
  signal self_diagnosis_reg_out, self_diagnosis_reg_in: std_logic_vector(31 downto 0);
  signal self_diagnosis_flag, self_diagnosis_flag_in: std_logic;
begin 

process(clk, enable, write_byte_enable) begin
   if reset = '1' then
      storage <= (others => '0');
      valid_data <= '0';
      P2N_FIFO_read_pointer  <= "0001";
      P2N_FIFO_write_pointer <= "0001";
      P2N_FIFO_MEM_1 <= (others=>'0');
      P2N_FIFO_MEM_2 <= (others=>'0');
      P2N_FIFO_MEM_3 <= (others=>'0');
      P2N_FIFO_MEM_4 <= (others=>'0');
      credit_counter_out <= "11";
      packet_length_counter_out <= "000000000000";
      state <= IDLE;
      packet_counter_out <= "00000000";
      ------------------------------------------------
      N2P_FIFO_MEM_1 <= (others=>'0');
      N2P_FIFO_MEM_2 <= (others=>'0');
      N2P_FIFO_MEM_3 <= (others=>'0');
      N2P_FIFO_MEM_4 <= (others=>'0');

      N2P_FIFO_read_pointer  <= "0001";
      N2P_FIFO_write_pointer <= "0001";
      credit_out <= '0';
      counter_register <= (others => '0');
      N2P_read_en <= '0';
      flag_register <= (others =>'0');
      old_address <= (others =>'0');

      fault_info <= (others => '0');
      fault_info_ready <= '0';
      self_diagnosis_reg_out <= (others => '0');
      self_diagnosis_flag <= '0';

   elsif clk'event and clk = '1'  then
      old_address <= address;
      P2N_FIFO_write_pointer <= P2N_FIFO_write_pointer_in;
      P2N_FIFO_read_pointer  <=  P2N_FIFO_read_pointer_in;
      credit_counter_out <= credit_counter_in;
      packet_length_counter_out <= packet_length_counter_in;
      valid_data <= valid_data_in;
      if P2N_write_en = '1' then
        --write into the memory
        P2N_FIFO_MEM_1 <= P2N_FIFO_MEM_1_in;
        P2N_FIFO_MEM_2 <= P2N_FIFO_MEM_2_in;
        P2N_FIFO_MEM_3 <= P2N_FIFO_MEM_3_in;
        P2N_FIFO_MEM_4 <= P2N_FIFO_MEM_4_in;
       end if;
      packet_counter_out <= packet_counter_in;
      if write_byte_enable /= "0000" then
         storage <= storage_in;
      end if;
      state <= state_in;
      ------------------------------------------------
      if N2P_write_en = '1' then
        --write into the memory
        N2P_FIFO_MEM_1 <= N2P_FIFO_MEM_1_in;
        N2P_FIFO_MEM_2 <= N2P_FIFO_MEM_2_in;
        N2P_FIFO_MEM_3 <= N2P_FIFO_MEM_3_in;
        N2P_FIFO_MEM_4 <= N2P_FIFO_MEM_4_in;
      end if;
      counter_register <= counter_register_in;
      N2P_FIFO_write_pointer <= N2P_FIFO_write_pointer_in;
      N2P_FIFO_read_pointer  <= N2P_FIFO_read_pointer_in;
      credit_out <= '0';
      N2P_read_en <= N2P_read_en_in;
      if N2P_read_en = '1' then
        credit_out <= '1';
      end if;
      flag_register <= flag_register_in;

      fault_info <= fault_info_in; 
      fault_info_ready <= fault_info_ready_in;
      self_diagnosis_reg_out <= self_diagnosis_reg_in;
      self_diagnosis_flag <= self_diagnosis_flag_in;

   end if;
end process;

-- everything bellow this line is pure combinatorial!

---------------------------------------------------------------------------------------
--below this is code for communication from PE 2 NoC
 

-- Process used for sending reconfiguration command from PE to router (which is part of NoC)

process(enable, address, write_byte_enable) begin
  -- Some initializations
  Reconfig_command <= '0'; 
  Rxy_reconf_PE <= (others =>'0');
  Cx_reconf_PE <= (others =>'0');

  if address = reconfiguration_address and enable = '1' then
    if write_byte_enable /= "0000" then
      -- In this case, data_write definitely includes the connectivity bits and routing bits for 
      -- reconfiguring LBDR logic.
      Rxy_reconf_PE <= data_write(7 downto 0); -- Rxy is 8 bits long 
      Cx_reconf_PE <= data_write(4 downto 8); -- Cx is 4 bits long
      Reconfig_command <= '1';
    end if;
  end if;
end process;


process(write_byte_enable, enable, address, storage, data_write, valid_data, P2N_write_en) begin
   storage_in <= storage ;
   valid_data_in <= valid_data;

   -- If PE wants to send data to NoC via NI (data is valid)
   if enable = '1' and address = reserved_address then
      if write_byte_enable /= "0000" then
        valid_data_in <= '1';
      end if;

      -- Behrad: So according to Plasma, is write_byte_enable always one-hot ? 
      --         (of course it can also be "0000")
      if write_byte_enable(0) = '1' then
         storage_in(7 downto 0) <= data_write(7 downto 0);
      end if;
      if write_byte_enable(1) = '1' then
         storage_in(15 downto 8) <= data_write(15 downto 8);
      end if;
      if write_byte_enable(2) = '1' then
         storage_in(23 downto 16) <= data_write(23 downto 16);
      end if;
      if write_byte_enable(3) = '1' then
         storage_in(31 downto 24) <= data_write(31 downto 24);
    end if;
   end if;

   if P2N_write_en = '1' then
      valid_data_in <= '0';
    end if;

end process;

-- Process for storing in FIFO (based on the position write pointer is pointing to)
-- Write pointer is encoded as one-hot!
process(storage, P2N_FIFO_write_pointer, P2N_FIFO_MEM_1, P2N_FIFO_MEM_2, P2N_FIFO_MEM_3, P2N_FIFO_MEM_4)begin
      case(P2N_FIFO_write_pointer) is
          when "0001" => P2N_FIFO_MEM_1_in <= storage;    	  P2N_FIFO_MEM_2_in <= P2N_FIFO_MEM_2; P2N_FIFO_MEM_3_in <= P2N_FIFO_MEM_3; P2N_FIFO_MEM_4_in <= P2N_FIFO_MEM_4;
          when "0010" => P2N_FIFO_MEM_1_in <= P2N_FIFO_MEM_1; P2N_FIFO_MEM_2_in <= storage;    	   P2N_FIFO_MEM_3_in <= P2N_FIFO_MEM_3; P2N_FIFO_MEM_4_in <= P2N_FIFO_MEM_4;
          when "0100" => P2N_FIFO_MEM_1_in <= P2N_FIFO_MEM_1; P2N_FIFO_MEM_2_in <= P2N_FIFO_MEM_2; P2N_FIFO_MEM_3_in <= storage;        P2N_FIFO_MEM_4_in <= P2N_FIFO_MEM_4;
          when "1000" => P2N_FIFO_MEM_1_in <= P2N_FIFO_MEM_1; P2N_FIFO_MEM_2_in <= P2N_FIFO_MEM_2; P2N_FIFO_MEM_3_in <= P2N_FIFO_MEM_3; P2N_FIFO_MEM_4_in <= storage;
          when others => P2N_FIFO_MEM_1_in <= P2N_FIFO_MEM_1; P2N_FIFO_MEM_2_in <= P2N_FIFO_MEM_2; P2N_FIFO_MEM_3_in <= P2N_FIFO_MEM_3; P2N_FIFO_MEM_4_in <= P2N_FIFO_MEM_4;
      end case ;
end process;

-- Process for reading from FIFO (based on the position read pointer is pointing to)
-- read pointer is encoded as one-hot!
process(P2N_FIFO_read_pointer, P2N_FIFO_MEM_1, P2N_FIFO_MEM_2, P2N_FIFO_MEM_3, P2N_FIFO_MEM_4)begin
    case( P2N_FIFO_read_pointer ) is
        when "0001" => FIFO_Data_out <= P2N_FIFO_MEM_1;
        when "0010" => FIFO_Data_out <= P2N_FIFO_MEM_2;
        when "0100" => FIFO_Data_out <= P2N_FIFO_MEM_3;
        when "1000" => FIFO_Data_out <= P2N_FIFO_MEM_4;
        when others => FIFO_Data_out <= P2N_FIFO_MEM_1;
    end case ;
  end process;

-- Write pointer update process (after each write operation, write pointer is rotated one bit to the left)
process(P2N_write_en, P2N_FIFO_write_pointer)begin
    if P2N_write_en = '1' then
       P2N_FIFO_write_pointer_in <= P2N_FIFO_write_pointer(2 downto 0) & P2N_FIFO_write_pointer(3);
    else
       P2N_FIFO_write_pointer_in <= P2N_FIFO_write_pointer;
    end if;
  end process;

-- Read pointer update process (after each read operation, read pointer is rotated one bit to the left)
 process(P2N_FIFO_read_pointer, grant)begin
  P2N_FIFO_read_pointer_in <=  P2N_FIFO_read_pointer;
  if grant  = '1' then -- Behrad: so grant here works somehow like read_en signal for FIFO ?
    P2N_FIFO_read_pointer_in <=  P2N_FIFO_read_pointer(2 downto 0) & P2N_FIFO_read_pointer(3);
  end if;
end process;

process(P2N_full, valid_data) begin
     if valid_data = '1' and P2N_full ='0' then
         P2N_write_en <= '1';
     else
         P2N_write_en <= '0';
     end if;
  end process;

-- Process for updating full and empty signals
process(P2N_FIFO_write_pointer, P2N_FIFO_read_pointer) begin
      P2N_empty <= '0';
      P2N_full <= '0';
      if P2N_FIFO_read_pointer = P2N_FIFO_write_pointer  then
              P2N_empty <= '1';
      end if;
      if P2N_FIFO_write_pointer = P2N_FIFO_read_pointer(0) & P2N_FIFO_read_pointer(3 downto 1) then
              P2N_full <= '1';
      end if;
  end process;

process (credit_in, credit_counter_out, grant)begin
    credit_counter_in <= credit_counter_out;
    if credit_in = '1' and grant = '1' then
         credit_counter_in <= credit_counter_out;
    elsif credit_in = '1'  and credit_counter_out < 3 then
         credit_counter_in <= credit_counter_out + 1;
    elsif grant = '1' and credit_counter_out > 0 then
         credit_counter_in <= credit_counter_out - 1;
    end if;
end process;


-- flag setting and clearing for self diagnosis 
process(link_faults, turn_faults, self_diagnosis_flag, old_address)begin
  if (link_faults  /= "00000" or turn_faults /= "00000000000000000000") and SHMU_address = current_address then
    self_diagnosis_flag_in <= '1';
  elsif old_address = self_diagnosis_address then
    self_diagnosis_flag_in <= '0';
  else
    self_diagnosis_flag_in <= self_diagnosis_flag;
  end if;
end process;

-- handling fault information!
process(link_faults, turn_faults, sent_info, fault_info_ready, fault_info)begin
 
  self_diagnosis_reg_in <= self_diagnosis_reg_out;

  -- If current node is not SHMU, we need to send fault information to SHMU
  if (link_faults  /= "00000" or turn_faults /= "00000000") and SHMU_address /= current_address then
    fault_info_in <= turn_faults & link_faults;
    fault_info_ready_in <= '1';
  -- If current node is SHMU, we handle it locally
  elsif (link_faults  /= "00000" or turn_faults /= "00000000") and SHMU_address = current_address then
      self_diagnosis_reg_in <= "0000000" & turn_faults & link_faults;
  else
    fault_info_in <= fault_info;
    fault_info_ready_in <= fault_info_ready;
  end if;

  if sent_info = '1' then 
      fault_info_ready_in <= '0';
  end if;

end process; 


process(P2N_empty, state, credit_counter_out, packet_length_counter_out, packet_counter_out, FIFO_Data_out, fault_info_ready)

    begin
        -- Some initializations
    	  sent_info <= '0';
        TX <= (others => '0');
        grant<= '0';
        packet_length_counter_in <= packet_length_counter_out;
        packet_counter_in <= packet_counter_out;

        case(state) is
            when IDLE =>
                if fault_info_ready = '1' then 
                    state_in <= DIAGNOSIS_HEADER;
                elsif P2N_empty = '0' then
                    state_in <= HEADER_FLIT;
                else
                    state_in <= IDLE;
                end if;

            when HEADER_FLIT =>
                if credit_counter_out /= "00" and P2N_empty = '0' then
                    
                    packet_length_counter_in <=   ("0000" & FIFO_Data_out(23 downto 16))-1;
                    grant <= '1';

                    TX <= "001" &  "0000" & FIFO_Data_out(23 downto 16) & FIFO_Data_out(31 downto 28) &
                           std_logic_vector(to_unsigned(current_address, 4))  & packet_counter_out & XOR_REDUCE("001" &  "0000" &
                            FIFO_Data_out(23 downto 16) &  FIFO_Data_out(31 downto 28) &
                           std_logic_vector(to_unsigned(current_address, 4))  & packet_counter_out);

                    state_in <= BODY_FLIT;
                    
                else
                    state_in <= HEADER_FLIT;
                end if;

            when BODY_FLIT =>
                if credit_counter_out /= "00" and P2N_empty = '0'then
                    grant <= '1';
                    TX <= "010" & FIFO_Data_out(27 downto 0) & XOR_REDUCE("010" & FIFO_Data_out(27 downto 0));
                    packet_length_counter_in <= packet_length_counter_out - 1;

                    if packet_length_counter_out > 2 then
                      state_in <= BODY_FLIT;
                    else
                      state_in <= TAIL_FLIT;
                    end if;
                else
                    state_in <= BODY_FLIT;
                end if;

            when TAIL_FLIT =>
                if credit_counter_out /= "00" and P2N_empty = '0' then
                    grant <= '1';
                    packet_length_counter_in <= packet_length_counter_out - 1;
                    TX <= "100" & FIFO_Data_out(27 downto 0) & XOR_REDUCE("100" & FIFO_Data_out(27 downto 0));
                    packet_counter_in <= packet_counter_out +1;
                    state_in <= IDLE;
                else
                    state_in <= TAIL_FLIT;
                end if;


            -- SHMU stuff ----------------------------------------------------------------------------------------
            ------------------------------------------------------------------------------------------------------
            when DIAGNOSIS_HEADER =>

                if credit_counter_out /= "00" then
                    grant <= '1';
                    TX <= "001" & "000000000011" & "0000" & std_logic_vector(to_unsigned(current_address, 4)) & packet_counter_out & XOR_REDUCE("001" & "000000000011" & "0000" & std_logic_vector(to_unsigned(current_address, 4)) & packet_counter_out);
                    state_in <= DIAGNOSIS_BODY;
                else
                    state_in <= DIAGNOSIS_HEADER;
                end if; 

            when DIAGNOSIS_BODY => 
                if credit_counter_out /= "00" then
                    grant <= '1';
                    --FD (Fault Diagnosis) : 01000110 01000100
                    -- fault info is 13 bits 
                    TX <= "010" & "0100011001000100" & fault_info(11 downto 0) & XOR_REDUCE("010" & "0100011001000100" & fault_info(11 downto 0));
                    state_in <= DIAGNOSIS_TAIL;
                else
                    state_in <= DIAGNOSIS_BODY;
                end if; 

            when DIAGNOSIS_TAIL =>
                if credit_counter_out /= "00" then
                    grant <= '1';
                    TX <= "100" & fault_info(24 downto 12) & "000000000000000" & XOR_REDUCE("100" & fault_info(12) & "000000000000000000000000000");
                    state_in <= IDLE;
                    sent_info <= '1';
                    packet_counter_in <= packet_counter_out +1;
                else
                    state_in <= DIAGNOSIS_TAIL;
                end if; 

            when others =>
                state_in <= IDLE;
        end case ;

end procesS;

valid_out <= grant;



----------------------------------------------------------------------------------------
--below this is code for communication from NoC 2 PE

   process(RX, N2P_FIFO_write_pointer, N2P_FIFO_MEM_1, N2P_FIFO_MEM_2, N2P_FIFO_MEM_3, N2P_FIFO_MEM_4)begin
      case( N2P_FIFO_write_pointer ) is
          when "0001" => N2P_FIFO_MEM_1_in <= RX;             N2P_FIFO_MEM_2_in <= N2P_FIFO_MEM_2; N2P_FIFO_MEM_3_in <= N2P_FIFO_MEM_3; N2P_FIFO_MEM_4_in <= N2P_FIFO_MEM_4;
          when "0010" => N2P_FIFO_MEM_1_in <= N2P_FIFO_MEM_1; N2P_FIFO_MEM_2_in <= RX;             N2P_FIFO_MEM_3_in <= N2P_FIFO_MEM_3; N2P_FIFO_MEM_4_in <= N2P_FIFO_MEM_4;
          when "0100" => N2P_FIFO_MEM_1_in <= N2P_FIFO_MEM_1; N2P_FIFO_MEM_2_in <= N2P_FIFO_MEM_2; N2P_FIFO_MEM_3_in <= RX;             N2P_FIFO_MEM_4_in <= N2P_FIFO_MEM_4;
          when "1000" => N2P_FIFO_MEM_1_in <= N2P_FIFO_MEM_1; N2P_FIFO_MEM_2_in <= N2P_FIFO_MEM_2; N2P_FIFO_MEM_3_in <= N2P_FIFO_MEM_3; N2P_FIFO_MEM_4_in <= RX;
          when others => N2P_FIFO_MEM_1_in <= N2P_FIFO_MEM_1; N2P_FIFO_MEM_2_in <= N2P_FIFO_MEM_2; N2P_FIFO_MEM_3_in <= N2P_FIFO_MEM_3; N2P_FIFO_MEM_4_in <= N2P_FIFO_MEM_4;
      end case ;
   end process;

  process(N2P_FIFO_read_pointer, N2P_FIFO_MEM_1, N2P_FIFO_MEM_2, N2P_FIFO_MEM_3, N2P_FIFO_MEM_4)begin
    case( N2P_FIFO_read_pointer ) is
        when "0001" => N2P_Data_out <= N2P_FIFO_MEM_1;
        when "0010" => N2P_Data_out <= N2P_FIFO_MEM_2;
        when "0100" => N2P_Data_out <= N2P_FIFO_MEM_3;
        when "1000" => N2P_Data_out <= N2P_FIFO_MEM_4;
        when others => N2P_Data_out <= N2P_FIFO_MEM_1;
    end case ;
  end process;

  process(address, write_byte_enable, N2P_empty)begin
    if address = reserved_address and write_byte_enable = "0000" and N2P_empty = '0' then
      N2P_read_en_in <= '1';
    else
      N2P_read_en_in <= '0';
    end if;
  end process;


  process(N2P_write_en, N2P_FIFO_write_pointer)begin
    if N2P_write_en = '1'then
       N2P_FIFO_write_pointer_in <= N2P_FIFO_write_pointer(2 downto 0)&N2P_FIFO_write_pointer(3);
    else
       N2P_FIFO_write_pointer_in <= N2P_FIFO_write_pointer;
    end if;
  end process;

  process(N2P_read_en, N2P_empty, N2P_FIFO_read_pointer)begin
       if (N2P_read_en = '1' and N2P_empty = '0') then
           N2P_FIFO_read_pointer_in <= N2P_FIFO_read_pointer(2 downto 0)&N2P_FIFO_read_pointer(3);
       else
           N2P_FIFO_read_pointer_in <= N2P_FIFO_read_pointer;
       end if;
  end process;

  process(N2P_full, valid_in) begin
     if (valid_in = '1' and N2P_full ='0') then
         N2P_write_en <= '1';
     else
         N2P_write_en <= '0';
     end if;
  end process;

  process(N2P_FIFO_write_pointer, N2P_FIFO_read_pointer) begin
      if N2P_FIFO_read_pointer = N2P_FIFO_write_pointer  then
              N2P_empty <= '1';
      else
              N2P_empty <= '0';
      end if;

      if N2P_FIFO_write_pointer = N2P_FIFO_read_pointer(0)&N2P_FIFO_read_pointer(3 downto 1) then
              N2P_full <= '1';
      else
              N2P_full <= '0';
      end if;
  end process;


process(N2P_read_en, N2P_Data_out, old_address, flag_register) begin
  if old_address = reserved_address and N2P_read_en = '1' then
    data_read <= N2P_Data_out;
  elsif old_address = flag_address then
    data_read <= flag_register;
  elsif old_address = counter_address then
  	data_read <= "000000000000000000000000000000" & counter_register;
  elsif old_address = self_diagnosis_address then
    data_read <= self_diagnosis_reg_out;
  else
    data_read <= (others => 'U');
  end if;
end process;


process(N2P_write_en, N2P_read_en, RX, N2P_Data_out)begin
  counter_register_in <= counter_register;
  if N2P_write_en = '1' and RX(31 downto 29) = "001" and N2P_read_en = '1' and N2P_Data_out(31 downto 29) = "100" then
  	counter_register_in <= counter_register;
  elsif N2P_write_en = '1' and RX(31 downto 29) = "001" then
    counter_register_in <= counter_register +1;
  elsif N2P_read_en = '1' and N2P_Data_out(31 downto 29) = "100" then
  	counter_register_in <= counter_register -1;
  end if;
end process;

flag_register_in <= N2P_empty & P2N_full & self_diagnosis_flag & "00000000000000000000000000000";
--NI_read_flag <= N2P_empty;
--NI_write_flag <= P2N_full;

irq_out <= '0';
end; --architecture logic
