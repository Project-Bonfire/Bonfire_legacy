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
   		   reserved_address : std_logic_vector(29 downto 0) := "000000000000000001111111111111";
         flag_address : std_logic_vector(29 downto 0) :=     "000000000000000010000000000000";	-- reserved address for the memory mapped I/O
         counter_address : std_logic_vector(29 downto 0) :=     "000000000000000010000000000001");	-- reserved address for the counter
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
        RX: in std_logic_vector(31 downto 0)	-- data recieved form the NoC
	);
end; --entity NI

architecture logic of NI is

  -- all the following signals are for sending data from processor to NoC
  signal storage, storage_in : std_logic_vector(31 downto 0);
  signal valid_data_in, valid_data: std_logic;

  signal old_address: std_logic_vector(31 downto 2);
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

  type STATE_TYPE IS (IDLE, HEADER_FLIT, BODY_FLIT, TAIL_FLIT);
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

begin

process(clk, enable, write_byte_enable)
begin
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
   end if;
end process;

-- everything bellow this line is pure combinatorial!

---------------------------------------------------------------------------------------
--below this is code for communication from PE 2 NoC

process(write_byte_enable, enable, address, storage, data_write, valid_data, P2N_write_en)
 begin
   storage_in <= storage ;
   valid_data_in <= valid_data;

   if enable = '1' and address = reserved_address then
      if write_byte_enable /= "0000" then
        valid_data_in <= '1';
      end if;

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

process(storage, P2N_FIFO_write_pointer, P2N_FIFO_MEM_1, P2N_FIFO_MEM_2, P2N_FIFO_MEM_3, P2N_FIFO_MEM_4)begin
      case(P2N_FIFO_write_pointer) is
          when "0001" => P2N_FIFO_MEM_1_in <= storage;    	  P2N_FIFO_MEM_2_in <= P2N_FIFO_MEM_2; P2N_FIFO_MEM_3_in <= P2N_FIFO_MEM_3; P2N_FIFO_MEM_4_in <= P2N_FIFO_MEM_4;
          when "0010" => P2N_FIFO_MEM_1_in <= P2N_FIFO_MEM_1; P2N_FIFO_MEM_2_in <= storage;    	   P2N_FIFO_MEM_3_in <= P2N_FIFO_MEM_3; P2N_FIFO_MEM_4_in <= P2N_FIFO_MEM_4;
          when "0100" => P2N_FIFO_MEM_1_in <= P2N_FIFO_MEM_1; P2N_FIFO_MEM_2_in <= P2N_FIFO_MEM_2; P2N_FIFO_MEM_3_in <= storage;        P2N_FIFO_MEM_4_in <= P2N_FIFO_MEM_4;
          when "1000" => P2N_FIFO_MEM_1_in <= P2N_FIFO_MEM_1; P2N_FIFO_MEM_2_in <= P2N_FIFO_MEM_2; P2N_FIFO_MEM_3_in <= P2N_FIFO_MEM_3; P2N_FIFO_MEM_4_in <= storage;
          when others => P2N_FIFO_MEM_1_in <= P2N_FIFO_MEM_1; P2N_FIFO_MEM_2_in <= P2N_FIFO_MEM_2; P2N_FIFO_MEM_3_in <= P2N_FIFO_MEM_3; P2N_FIFO_MEM_4_in <= P2N_FIFO_MEM_4;
      end case ;
end process;

process(P2N_FIFO_read_pointer, P2N_FIFO_MEM_1, P2N_FIFO_MEM_2, P2N_FIFO_MEM_3, P2N_FIFO_MEM_4)begin
    case( P2N_FIFO_read_pointer ) is
        when "0001" => FIFO_Data_out <= P2N_FIFO_MEM_1;
        when "0010" => FIFO_Data_out <= P2N_FIFO_MEM_2;
        when "0100" => FIFO_Data_out <= P2N_FIFO_MEM_3;
        when "1000" => FIFO_Data_out <= P2N_FIFO_MEM_4;
        when others => FIFO_Data_out <= P2N_FIFO_MEM_1;
    end case ;
  end process;

process(P2N_write_en, P2N_FIFO_write_pointer)begin
    if P2N_write_en = '1'then
       P2N_FIFO_write_pointer_in <= P2N_FIFO_write_pointer(2 downto 0) & P2N_FIFO_write_pointer(3);
    else
       P2N_FIFO_write_pointer_in <= P2N_FIFO_write_pointer;
    end if;
  end process;

 process(P2N_FIFO_read_pointer, grant)begin
  P2N_FIFO_read_pointer_in <=  P2N_FIFO_read_pointer;
  if grant  = '1' then
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



process(P2N_empty, state, credit_counter_out, packet_length_counter_out, packet_counter_out, FIFO_Data_out)
    variable LINEVARIABLE : line;
    file VEC_FILE : text is out "sent.txt";
    begin
        TX <= (others => '0');
        grant<= '0';
        packet_length_counter_in <= packet_length_counter_out;
        packet_counter_in <= packet_counter_out;
        case(state) is

            when IDLE =>
                if P2N_empty = '0' then
                    state_in <= HEADER_FLIT;
                else
                    state_in <= IDLE;
                end if;

            when HEADER_FLIT =>
                if credit_counter_out /= "00" then
                    grant <= '1';


                    TX <= "001" &  "0000" & FIFO_Data_out(23 downto 16) & FIFO_Data_out(31 downto 28) &
                           std_logic_vector(to_unsigned(current_address, 4))  & packet_counter_out & XOR_REDUCE("001" &  "0000" &
                            FIFO_Data_out(23 downto 16) &  FIFO_Data_out(31 downto 28) &
                           std_logic_vector(to_unsigned(current_address, 4))  & packet_counter_out);

                    state_in <= BODY_FLIT;
                    packet_length_counter_in <=   ("0000" & FIFO_Data_out(23 downto 16))-1;
                else
                    state_in <= HEADER_FLIT;
                end if;

            when BODY_FLIT =>
                if credit_counter_out /= "00" and P2N_empty = '0'then
                    grant <= '1';
                    TX <= "010" & FIFO_Data_out(27 downto 0) & XOR_REDUCE("010" & FIFO_Data_out(27 downto 0));
                    packet_length_counter_in <= packet_length_counter_out - "000000000001";
                    if packet_length_counter_out = "000000000010" then
                      state_in <= TAIL_FLIT;
                    else
                      state_in <= BODY_FLIT;
                    end if;
                else
                    state_in <= BODY_FLIT;
                end if;

            when TAIL_FLIT =>
                if credit_counter_out /= "00" and P2N_empty = '0' then
                    grant <= '1';
                    TX <= "100" & FIFO_Data_out(27 downto 0) & XOR_REDUCE("100" & FIFO_Data_out(27 downto 0));
                    packet_counter_in <= packet_counter_out +1;
                    state_in <= IDLE;
                else
                    state_in <= TAIL_FLIT;
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

flag_register_in <= N2P_empty & P2N_full & "000000000000000000000000000000";
--NI_read_flag <= N2P_empty;
--NI_write_flag <= P2N_full;

irq_out <= '0';
end; --architecture logic
