--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO_credit_based is
    generic (
        DATA_WIDTH: integer := 32
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            RX: in std_logic_vector(DATA_WIDTH-1 downto 0);
            valid_in: in std_logic;
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            credit_out: out std_logic;
            empty_out: out std_logic;
            Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end FIFO_credit_based;

architecture behavior of FIFO_credit_based is
   signal read_pointer, read_pointer_in,  write_pointer, write_pointer_in: std_logic_vector(3 downto 0);
   signal full, empty: std_logic;
   signal read_en, write_en: std_logic;

   signal FIFO_MEM_1, FIFO_MEM_1_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_2, FIFO_MEM_2_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_3, FIFO_MEM_3_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_4, FIFO_MEM_4_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   constant fake_tail :  std_logic_vector := "10000000000000000000000000000001";

   alias flit_type :  std_logic_vector(2 downto 0) is RX(DATA_WIDTH-1 downto DATA_WIDTH-3);
   signal faulty_packet_in, faulty_packet_out: std_logic;
   signal xor_all, fault_out: std_logic;
   type state_type is (Idle, Header_flit, Body_flit, Tail_flit, Packet_drop);
   signal  state_out, state_in : state_type;
   signal fake_credit, credit_in,  write_fake_flit: std_logic;
   signal fake_credit_counter, fake_credit_counter_in: std_logic_vector(1 downto 0);


begin
 --------------------------------------------------------------------------------------------
--                           block diagram of the FIFO!


 --------------------------------------------------------------------------------------------
--  circular buffer structure
--                                   <--- WriteP
--              ---------------------------------
--              |   3   |   2   |   1   |   0   |
--              ---------------------------------
--                                   <--- readP
 --------------------------------------------------------------------------------------------

   process (clk, reset)begin
        if reset = '0' then
            read_pointer  <= "0001";
            write_pointer <= "0001";

            FIFO_MEM_1 <= (others=>'0');
            FIFO_MEM_2 <= (others=>'0');
            FIFO_MEM_3 <= (others=>'0');
            FIFO_MEM_4 <= (others=>'0');

            fake_credit_counter <= (others=>'0');
            faulty_packet_out <= '0';
            credit_out <= '0';
            state_out <= Idle;

        elsif clk'event and clk = '1' then
            write_pointer <= write_pointer_in;
            read_pointer  <=  read_pointer_in;
            state_out <= state_in;

            faulty_packet_out <=  faulty_packet_in;
            credit_out <= credit_in;
            fake_credit_counter <= fake_credit_counter_in;

            if write_en = '1' then
                --write into the memory
                  FIFO_MEM_1 <= FIFO_MEM_1_in;
                  FIFO_MEM_2 <= FIFO_MEM_2_in;
                  FIFO_MEM_3 <= FIFO_MEM_3_in;
                  FIFO_MEM_4 <= FIFO_MEM_4_in;
            end if;



        end if;
    end process;

 -- anything below here is pure combinational

   -- combinatorial part
process(fake_credit, read_en, fake_credit_counter) begin
	fake_credit_counter_in <= fake_credit_counter;
	credit_in <= '0'; -- Is this actually credit_out from the router module ?

	if fake_credit = '1' and read_en = '1' then
        fake_credit_counter_in <= fake_credit_counter + 1 ;
    end if;

    if (read_en ='1' or fake_credit = '1') then
        credit_in <= '1'; -- Is this actually credit_out from the router module ?
    end if;

    if read_en = '0' and fake_credit = '0' and fake_credit_counter > 0 then
        fake_credit_counter_in <= fake_credit_counter - 1 ;
        credit_in <= '1';
    end if;
end process;



process(valid_in, RX) begin
  if valid_in = '1' then
    xor_all <= XOR_REDUCE(RX(DATA_WIDTH-1 downto 1));
  else
    xor_all <= '0'; -- Is this correct ? This means parity is zero. Or does it mean we don't care about parity in this case ?
  end if;
end process;

process(valid_in, RX, xor_all)begin
  fault_out <= '0';
  if valid_in = '1' and   xor_all /= RX(0) then -- Parity checker (integrated inside FIFO)
    fault_out <= '1';
  end if;
end process;

    process(RX, faulty_packet_out, fault_out, write_pointer, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4, state_out, flit_type, valid_in)begin
      -- this is the default value of the memory!
      -- Store data from input (RX) to the appropriate FIFO slot, according to write pointer (which is encoded as one-hot)

      case( write_pointer ) is
          when "0001" => FIFO_MEM_1_in <= RX;         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
          when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= RX;         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
          when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= RX;         FIFO_MEM_4_in <= FIFO_MEM_4;
          when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= RX;
          when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
      end case ;

     -- Up to here, we have written the data (RX) in FIFO, but we do not know yet, if it is faulty or not
     -- The parity is checked later (in the FSM)

     --some defaults
     fake_credit <= '0';
     state_in <= state_out;
     faulty_packet_in <= faulty_packet_out;
      write_fake_flit <= '0';

      -- FSM for FIFO (including the packet dropping capability)

      case(state_out) is
      	  when Idle =>
            -- fault_out is updated in another by checking the parity bit for input data (RX)
            -- if (xor_all /= RX(0)) => fault_out = 1.
            if fault_out = '0' then -- Input data is correct and parity bit matches the one integrated in the data
                                    -- The next expected flit (Header flit) is healthy
                if valid_in = '1' then -- There is a request from previous router/NI
                  state_in <= Header_flit;
                else -- No packet (flit)
                  state_in <= state_out;
                end if;
            else -- If the received data (RX) (Header flit) is faulty, and detected by parity checker in current router
              if flit_type /= "001" then
                  faulty_packet_in <= '0';
                  case( write_pointer ) is
                     -- Is this the place where we do the saving for packet drop ?
                     when "0001" => FIFO_MEM_1_in <= "001"&RX(DATA_WIDTH-4 downto 0);         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                     when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= "001"&RX(DATA_WIDTH-4 downto 0);         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                     when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= "001"&RX(DATA_WIDTH-4 downto 0);         FIFO_MEM_4_in <= FIFO_MEM_4;
                     when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= "001"&RX(DATA_WIDTH-4 downto 0);
                     when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                   end case ;
                  state_in <= Header_flit;
              else
                -- Fakely tell previous router/NI that FIFO has enough slots
                fake_credit <= '1';
                FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;

                -- We must drop the packet (FSM must go to Packet_drop state)
                state_in <= Packet_drop;
                faulty_packet_in <= '1'; -- Shows the packet is faulty
              end if;
            end if;

      	  when Header_flit =>
      	  		if valid_in = '1' then
	              if fault_out = '0' then -- We expect body or tail flit, and the flit is healthy (parity matches)
	                    if flit_type = "010" then
	                       state_in <= Body_flit;
	                    elsif flit_type ="100" then
	                        state_in <= Tail_flit;
	                    else -- Either flit type is invalid or there is no packet (but this should not happen)
                           -- we should not be here!
	                        state_in <= state_out;
	                    end if;
	              else
                    -- Parity checker has detected a fault in body/tail flit (parity mismatch)
                    -- (fault_out = 1)

                    write_fake_flit <= '1';
	              		if flit_type = "010" then -- the flit is faulty, but its flit type field is correct and valid
                                              -- But, the payload is faulty.
                         faulty_packet_in <= '0';
                          -- We change state to Body Flit
	                       state_in <= Body_flit;
	                  elsif flit_type ="100" then
                          faulty_packet_in <= '0';
	                        state_in <= Tail_flit;

	                  else -- if flit type field is damaged (incorrect)
        					        case( write_pointer ) is
                              -- we store a fake tail instead of the faulty data in
                              -- the FIFO slot corresponding to the write pointer's location
        					            when "0001" => FIFO_MEM_1_in <= fake_tail;  FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
        					            when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= fake_tail;  FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
        					            when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= fake_tail;  FIFO_MEM_4_in <= FIFO_MEM_4;
        					            when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= fake_tail;
        					            when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
        					        end case ;
                          -- And we still go to Packet drop state
        					        state_in <= Packet_drop;
					                faulty_packet_in <= '1';
	                  end if;
	              end if;
	            else
	                state_in <= state_out;
	            end if;

      	  when Body_flit =>
      	  		if valid_in = '1' then
	              	if fault_out = '0' then -- data (flit) is not faulty
	                      if flit_type = "010" then
	                          state_in <= state_out; -- We can also write (state_in <= Body_flit) ?? As the state is not changed.
	                      elsif flit_type = "100" then
	                          state_in <= Tail_flit;
	                      else
	                          -- we should not be here!
	                          state_in <= state_out;
	                      end if;
	                else -- Parity mismatch (flit is faulty)
                    write_fake_flit <= '1';

	                  if flit_type = "010" then -- flit type is not damaged (only payload is damaged)
                                              -- Handling the error in payload is delegated to application level
                            faulty_packet_in <= '0';
	                          state_in <= state_out;

	                  elsif flit_type = "100" then -- flit type is not damaged (only payload is damaged)
                                                 -- Handling the error in payload is delegated to application level
                            faulty_packet_in <= '0';
	                          state_in <= Tail_flit;
	                  else
                        -- flit type is damaged (incorrect)
                        -- makes fake tail and goes to packet drop state
    				            case( write_pointer ) is
    				              when "0001" => FIFO_MEM_1_in <= fake_tail;  FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
    				              when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= fake_tail;  FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
    				              when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= fake_tail;  FIFO_MEM_4_in <= FIFO_MEM_4;
    				              when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= fake_tail;
    				              when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
    				            end case ;
    				            state_in <= Packet_drop;
    				            faulty_packet_in <= '1';
 						        end if;
	              end if;
	            else
	                state_in <= state_out;
	            end if;

      	  when Tail_flit =>
              if valid_in = '1' then
                  if fault_out = '0' then
                      if flit_type = "001" then
                          state_in <= Header_flit;
                      else
                          -- what is this case ??
                          -- we should not be here ??
                          state_in <= state_out;
                      end if;
                  else -- Parity mismatch (error in flit)
                      fake_credit <= '1';
                      -- Dropping the flit (writing back previous values to FIFO slots)
                      FIFO_MEM_1_in <= FIFO_MEM_1;
                      FIFO_MEM_2_in <= FIFO_MEM_2;
                      FIFO_MEM_3_in <= FIFO_MEM_3;
                      FIFO_MEM_4_in <= FIFO_MEM_4;

                      state_in <= Packet_drop;
                      faulty_packet_in <= '1';
                  end if;
              else
                      state_in <= state_out;
              end if;

          when Packet_drop =>
            if faulty_packet_out = '1' then
               if valid_in = '1' and flit_type = "001"  and fault_out = '0' then -- next flit is header and parity matches
                    faulty_packet_in <= '0';
                    state_in <= Header_flit;
                    write_fake_flit <= '1';
                    case( write_pointer ) is
                        when "0001" => FIFO_MEM_1_in <= RX;         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                        when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= RX;         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                        when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= RX;         FIFO_MEM_4_in <= FIFO_MEM_4;
                        when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= RX;
                        when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                    end case ;

               elsif valid_in = '1' and flit_type ="100" and fault_out = '0' then -- next flit is Tail, and not faulty (parity matches)

                    -- flit is dropped ?? Previous values of FIFO slots are re-written
                    FIFO_MEM_1_in <= FIFO_MEM_1;
                    FIFO_MEM_2_in <= FIFO_MEM_2;
                    FIFO_MEM_3_in <= FIFO_MEM_3;
                    FIFO_MEM_4_in <= FIFO_MEM_4;

                    faulty_packet_in <= '0';
                    state_in <= Idle;
                    fake_credit <= '1';

               else -- includes the case that packet is faulty (parity mismatch)
                  if valid_in = '1' then
                      fake_credit <= '1';
                  end if;
                  -- previous values of FIFO slots are re-written (flit is dropped ??)
                  FIFO_MEM_1_in <= FIFO_MEM_1;
                  FIFO_MEM_2_in <= FIFO_MEM_2;
                  FIFO_MEM_3_in <= FIFO_MEM_3;
                  FIFO_MEM_4_in <= FIFO_MEM_4;

                  state_in <= state_out; -- We stay in Packet Drop state
               end if;
            else
              -- we should not be here!
              state_in <= state_out;
            end if;
	     when others => state_in <= state_out;
       end case;
    end process;



  process(read_pointer, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4)begin
    case( read_pointer ) is
        when "0001" => Data_out <= FIFO_MEM_1;
        when "0010" => Data_out <= FIFO_MEM_2;
        when "0100" => Data_out <= FIFO_MEM_3;
        when "1000" => Data_out <= FIFO_MEM_4;
        when others => Data_out <= FIFO_MEM_1;
    end case ;
  end process;

  read_en <= (read_en_N or read_en_E or read_en_W or read_en_S or read_en_L) and not empty;
  empty_out <= empty;


  process(write_en, write_pointer) begin
    if write_en = '1' then
       write_pointer_in <= write_pointer(2 downto 0)&write_pointer(3); -- Rotate one bit to left
    else
       write_pointer_in <= write_pointer;
    end if;
  end process;

  process(read_en, empty, read_pointer) begin
       if (read_en = '1' and empty = '0') then
           read_pointer_in <= read_pointer(2 downto 0)&read_pointer(3); -- Rotate one bit to left
       else
           read_pointer_in <= read_pointer;
       end if;
  end process;

  process(full, valid_in, write_fake_flit, faulty_packet_out, fault_out) begin
     if valid_in = '1' and ((faulty_packet_out = '0' and fault_out = '0') or write_fake_flit = '1') and full ='0' then
         write_en <= '1';
     else
         write_en <= '0';
     end if;
  end process;

  process(write_pointer, read_pointer) begin
      if read_pointer = write_pointer  then
              empty <= '1';
      else
              empty <= '0';
      end if;
      --      if write_pointer = read_pointer>>1 then
      if write_pointer = read_pointer(0)&read_pointer(3 downto 1) then
              full <= '1';
      else
              full <= '0';
      end if;
  end process;

end;
