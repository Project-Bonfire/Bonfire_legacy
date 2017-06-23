--Copyright (C) 2016 Siavoosh Payandeh Azad and Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO_credit_based_pseudo is
    port (  valid_in: in std_logic;
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            read_pointer: in std_logic_vector(3 downto 0);
            write_pointer: in std_logic_vector(3 downto 0);
            state_out: in std_logic_vector(4 downto 0);
            faulty_packet_out: in std_logic;
            fake_credit_counter: in std_logic_vector(1 downto 0);
            flit_type: in std_logic_vector(2 downto 0);
            fault_out: in std_logic;

            credit_out: out std_logic; -- credit_in removed due to creation of pseudo-combinational register, credit_out directly taken to the output interface.
            empty_out: out std_logic;
            full_out: out std_logic;
            fault_info: out  std_logic;
            health_info: out  std_logic;
            read_en_out: out std_logic;
            write_en_out: out std_logic;
            read_pointer_in: out std_logic_vector(3 downto 0);
            write_pointer_in: out std_logic_vector(3 downto 0);
            state_in: out std_logic_vector(4 downto 0);
            faulty_packet_in: out std_logic;
            fake_credit_out: out std_logic;
            write_fake_flit_out: out std_logic;
            fake_credit_counter_in: out std_logic_vector(1 downto 0)
    );
end FIFO_credit_based_pseudo;

architecture behavior of FIFO_credit_based_pseudo is

   CONSTANT Idle: std_logic_vector (4 downto 0) := "00001";
   CONSTANT Header_flit: std_logic_vector (4 downto 0) := "00010";
   CONSTANT Body_flit: std_logic_vector (4 downto 0) := "00100";
   CONSTANT Tail_flit: std_logic_vector (4 downto 0) := "01000";
   CONSTANT Packet_drop: std_logic_vector (4 downto 0) := "10000";

   signal full, empty: std_logic;
   signal read_en, write_en: std_logic;
   --alias flit_type :  std_logic_vector(2 downto 0) is RX(DATA_WIDTH-1 downto DATA_WIDTH-3); -- Related to data-path checkers! Taken to input interface.
   --signal xor_all, fault_out: std_logic; -- Related to data-path checkers!
   signal fake_credit, write_fake_flit: std_logic;


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
-- Packet drop state machine
--                            +---+ No                     +---+  No
--                            |   | Flit                   |   |  Flit
--                            |   v                        |   v
--                 healthy  +--------+                  +--------+
--             +---header-->|        |                  |        |-------------------+
--             |         +->| Header |---Healthy body-->| Body   |------------+      |
--             |         |  +--------+                  +--------+            |      |
--             |         |     | ^  |              Healthy |   ^            Healthy  |
--             |         |     | |  |               body   |   |              Tail   |
--             |         |     | |  |                      +---+              |      |
--             |         |     | |  |                                         v      |
--         +--------+    |     | |  |                                    +--------+  |
-- No  +-->|        |    |     | |  +-----------------Healthy Tail------>|        |  |
-- Flit|   |  IDLE  |    |     | |                                       | Tail   |--)--+
--     +---|        |    |     | +-----------Healthy Header--------------|        |  |  |
--         +--------+    |     |                                         +--------+  |  |
--           ^  |  ^     |     Faulty            No    Faulty                        |  |
--           |  |  |     |     Flit             Flit   Flit                          |  |
--           |  |  |     |     +------------+   +---+  +---+                         |  |
--           |  |  |     + --Healthy------+ |   |   |  |   |                         |  |
--           |  |  |          header      | v   |   v  |   v                         |  |
--           |  |  |                     +------------------+                        |  |
--           |  |  +----Healthy Tail-----|     Packet       |                        |  |
--           |  +-------Faulty Flit----->|      Drop        |<-----------------------+  |
--           |                           +------------------+                           |
--           +-------------------------------------------------No Flit------------------+
--
------------------------------------------------------------------------------------------------

   --process (clk, reset)begin
   --     if reset = '0' then
   --         read_pointer  <= "0001";
   --         write_pointer <= "0001";

   --         FIFO_MEM_1 <= (others=>'0');
   --         FIFO_MEM_2 <= (others=>'0');
   --         FIFO_MEM_3 <= (others=>'0');
   --         FIFO_MEM_4 <= (others=>'0');

   --         fake_credit_counter <= (others=>'0');
   --         faulty_packet_out <= '0';
   --         credit_out <= '0';
   --         state_out <= Idle;

   --     elsif clk'event and clk = '1' then
   --         write_pointer <= write_pointer_in;
   --         read_pointer  <=  read_pointer_in;
   --         state_out <= state_in;

   --         faulty_packet_out <=  faulty_packet_in;
   --         credit_out <= credit_in;
   --         fake_credit_counter <= fake_credit_counter_in;

   --         if write_en = '1' then
   --             --write into the memory
   --               FIFO_MEM_1 <= FIFO_MEM_1_in;
   --               FIFO_MEM_2 <= FIFO_MEM_2_in;
   --               FIFO_MEM_3 <= FIFO_MEM_3_in;
   --               FIFO_MEM_4 <= FIFO_MEM_4_in;
   --         end if;
   --     end if;
   -- end process;

 -- anything below here is pure combinational


  read_en <= (read_en_N or read_en_E or read_en_W or read_en_S or read_en_L) and not empty;
  empty_out <= empty;
  read_en_out <= read_en;
  write_en_out <= write_en;
  full_out <= full;
  fake_credit_out <= fake_credit;
  write_fake_flit_out <= write_fake_flit;

   -- combinatorial part
process(fake_credit, read_en, fake_credit_counter) begin
  fake_credit_counter_in <= fake_credit_counter;
  credit_out <= '0';

    if fake_credit = '1' and read_en = '1' then
        fake_credit_counter_in <= fake_credit_counter + 1 ;
    end if;

    if fake_credit = '1' or read_en ='1' then
        credit_out <= '1';
    end if;

    if fake_credit = '0' and read_en = '0' and fake_credit_counter > 0 then
        fake_credit_counter_in <= fake_credit_counter - 1 ;
        credit_out <= '1';
    end if;
end process;

-- These are data-path related checkers, thus commented. Correct ??

--process(valid_in, RX) begin
--  if valid_in = '1' then
--    xor_all <= XOR_REDUCE(RX(DATA_WIDTH-1 downto 1));
--  else
--    xor_all <= '0';
--  end if;
--end process;

-- Shall this also be removed, because it is related to part of data-path (RX(0)) (parity checking) ??
--process(valid_in, RX, xor_all)begin
--  fault_out <= '0';
--  if valid_in = '1' and   xor_all /= RX(0) then
--    fault_out <= '1';
--  end if;
--end process;

-- Valid input pattern : valid_in = '0', but fault_out = '1' !

-- These are data-path related checkers, thus commented. Correct ??

    process(faulty_packet_out, fault_out, state_out, flit_type, valid_in) begin
      -- this is the default value of the memory!
      --case( write_pointer ) is
      --    when "0001" => FIFO_MEM_1_in <= RX;         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
      --    when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= RX;         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
      --    when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= RX;         FIFO_MEM_4_in <= FIFO_MEM_4;
      --    when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= RX;
      --    when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
      --end case ;

     --some defaults
     fault_info <= '0';
     health_info <= '0';
     fake_credit <= '0';
     write_fake_flit <= '0';
     state_in <= state_out;
     faulty_packet_in <= faulty_packet_out;

      case(state_out) is

          when Idle =>
            if fault_out = '0' then
                if valid_in = '1' then
                  state_in <= Header_flit;
                else
                  state_in <= state_out;
                end if;
            else
              fake_credit <= '1';
              --FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
              state_in <= Packet_drop;
              fault_info <= '1';
              faulty_packet_in <= '1';
            end if;

          when Header_flit =>
              if valid_in = '1' then
                if fault_out = '0' then
                    if flit_type = "010" then
                       state_in <= Body_flit;
                    elsif flit_type ="100" then
                        state_in <= Tail_flit;
                    else
                        -- we should not be here!
                        state_in <= state_out;
                    end if;
                else
                    write_fake_flit <= '1';
                    --case( write_pointer ) is
                    --    when "0001" => FIFO_MEM_1_in <= fake_tail;  FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                    --    when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= fake_tail;  FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                    --    when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= fake_tail;  FIFO_MEM_4_in <= FIFO_MEM_4;
                    --    when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= fake_tail;
                    --    when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                    --end case ;
                    state_in <= Packet_drop;
                    fault_info <= '1';
                    faulty_packet_in <= '1';
                end if;
              else
                    state_in <= state_out;
              end if;

          when Body_flit =>
              if valid_in = '1' then
                  if fault_out = '0' then
                      if flit_type = "010" then
                          state_in <= state_out;
                      elsif flit_type = "100" then
                          state_in <= Tail_flit;
                          health_info <= '1';
                      else
                          -- we should not be here!
                          state_in <= state_out;
                      end if;
                  else
                      write_fake_flit <= '1';
                      --case( write_pointer ) is
                      --    when "0001" => FIFO_MEM_1_in <= fake_tail;  FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                      --    when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= fake_tail;  FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                      --    when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= fake_tail;  FIFO_MEM_4_in <= FIFO_MEM_4;
                      --    when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= fake_tail;
                      --    when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                      --end case ;
                      state_in <= Packet_drop;
                      fault_info <= '1';
                      faulty_packet_in <= '1';
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
                          state_in <= state_out;
                      end if;
                  else
                      fake_credit <= '1';
                      --FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                      state_in <= Packet_drop;
                      fault_info <= '1';
                      faulty_packet_in <= '1';
                  end if;
              	else
                      state_in <= Idle;
              	end if;

          when Packet_drop =>
            if faulty_packet_out = '1' then
               if valid_in = '1' and flit_type = "001" and fault_out = '0' then
                    faulty_packet_in <= '0';
                    state_in <= Header_flit;
                    write_fake_flit <= '1';
                    --case( write_pointer ) is
                    --    when "0001" => FIFO_MEM_1_in <= RX;         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                    --    when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= RX;         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                    --    when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= RX;         FIFO_MEM_4_in <= FIFO_MEM_4;
                    --    when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= RX;
                    --    when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                    --end case ;

               elsif valid_in = '1' and flit_type = "100" and fault_out = '0' then
                    --FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                    faulty_packet_in <= '0';
                    state_in <= Idle;
                    fake_credit <= '1';

               else
                  if valid_in = '1' then
                      fake_credit <= '1';
                  end if;

                  --FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                  state_in <= state_out;
               end if;
            else
              -- we should not be here!
              state_in <= state_out;
            end if;

       when others =>
       			state_in <= state_out;

       end case;
    end process;

  --process(read_pointer, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4)begin
  --  case( read_pointer ) is
  --      when "0001" => Data_out <= FIFO_MEM_1;
  --      when "0010" => Data_out <= FIFO_MEM_2;
  --      when "0100" => Data_out <= FIFO_MEM_3;
  --      when "1000" => Data_out <= FIFO_MEM_4;
  --      when others => Data_out <= FIFO_MEM_1;
  --  end case ;
  --end process;

  -- Checkers for the lines below are more or less similar (some of them) to the normal FIFO for credit-based router.
  process(write_en, write_pointer)begin
    if write_en = '1' then
       write_pointer_in <= write_pointer(2 downto 0)&write_pointer(3);
    else
       write_pointer_in <= write_pointer;
    end if;
  end process;

  process(read_en, empty, read_pointer)begin
       if (read_en = '1' and empty = '0') then
           read_pointer_in <= read_pointer(2 downto 0)&read_pointer(3);
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
