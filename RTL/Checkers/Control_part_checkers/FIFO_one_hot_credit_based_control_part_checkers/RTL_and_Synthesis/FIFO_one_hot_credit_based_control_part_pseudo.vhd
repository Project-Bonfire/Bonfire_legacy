--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO_credit_based_control_part_pseudo is
    port (  valid_in: in std_logic;  
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            read_pointer: in std_logic_vector(3 downto 0);
            write_pointer: in std_logic_vector(3 downto 0);

            credit_out: out std_logic; 
            empty_out: out std_logic; 
            full_out: out std_logic;
            read_pointer_in: out std_logic_vector(3 downto 0); 
            write_pointer_in: out std_logic_vector(3 downto 0);
            read_en_out: out std_logic;
            write_en_out: out std_logic                     
    );
end FIFO_credit_based_control_part_pseudo;

architecture behavior of FIFO_credit_based_control_part_pseudo is
   signal full, empty: std_logic;
   signal read_en, write_en: std_logic;

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

   --process (clk, reset)begin
   --     if reset = '0' then
   --         read_pointer  <= "0001";
   --         write_pointer <= "0001";

   --         FIFO_MEM_1 <= (others=>'0');
   --         FIFO_MEM_2 <= (others=>'0');
   --         FIFO_MEM_3 <= (others=>'0');
   --         FIFO_MEM_4 <= (others=>'0');

   --         credit_out <= '0';

   --     elsif clk'event and clk = '1' then
   --         write_pointer <= write_pointer_in;
   --         read_pointer  <=  read_pointer_in;
   --         credit_out <= '0';
   --         if write_en = '1' then 
   --             --write into the memory
   --               FIFO_MEM_1 <= FIFO_MEM_1_in;
   --               FIFO_MEM_2 <= FIFO_MEM_2_in;
   --               FIFO_MEM_3 <= FIFO_MEM_3_in;
   --               FIFO_MEM_4 <= FIFO_MEM_4_in;                   
   --         end if;
   --         if read_en = '1' then 
   --           credit_out <= '1';
   --         end if;
   --     end if;
   -- end process;

-- Since generating credit_out is part of the control part and the process with clk and reset is already
-- removed, I am not sure whether it is correct to create another separate process and check read_en in 
-- it and based on that generate credit_out or not, something like the following: 

   process (read_en)
   begin
      credit_out <= '0';

      if read_en = '1' then
          credit_out <= '1';
      else 
          credit_out <= '0';
      end if;

   end process;

 -- anything below here is pure combinational
 
   -- combinatorial part

  read_en <= (read_en_N or read_en_E or read_en_W or read_en_S or read_en_L) and not empty; 
  empty_out <= empty;
  read_en_out <= read_en;
  write_en_out <= write_en;
  full_out <= full;

  process(write_en, write_pointer)begin
    if write_en = '1'then
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

  process(full, valid_in) begin
     if valid_in = '1' and full ='0' then
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
