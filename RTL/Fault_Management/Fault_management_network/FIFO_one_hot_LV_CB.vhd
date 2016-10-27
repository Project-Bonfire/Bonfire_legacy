--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO_LV is
    generic (
        DATA_WIDTH: integer := 11
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
end FIFO_LV;

architecture behavior of FIFO_LV is
   signal full, full_in: std_logic;
   signal read_en, write_en: std_logic;

   signal FIFO_MEM, FIFO_MEM_in : std_logic_vector(DATA_WIDTH-1 downto 0);
 

begin
 --------------------------------------------------------------------------------------------
--                           block diagram of the FIFO!
 --------------------------------------------------------------------------------------------

   process (clk, reset)begin
        if reset = '0' then
            FIFO_MEM <= (others=>'0');
            credit_out <= '0';
            full <= '0';
        elsif clk'event and clk = '1' then
            credit_out <= '0';
            full <= full_in;
            if write_en = '1' then
                --write into the memory
                  FIFO_MEM <= FIFO_MEM_in;
            end if;
            if read_en = '1' then 
              credit_out <= '1';
            end if;
            read_pointer <=  read_pointer_in;
        end if;
    end process;

 -- anything below here is pure combinational
 
   -- combinatorial part
   

   

  read_en <= (read_en_N or read_en_E or read_en_W or read_en_S or read_en_L) and full; 
  empty_out <= not full;
  

  process(write_en, FIFO_MEM)begin
    if write_en = '1'then
       FIFO_MEM_in <= RX;
    else
       FIFO_MEM_in <= FIFO_MEM;
    end if;
  end process;

  Data_out <= FIFO_MEM;


  process(read_en, write_en)begin
    if read_en = '1' and write_en = '1' then
        full_in <= full;
    elsif read_en = '1' and write_en = '0' then
        full_in <= '0';
    elsif  read_en = '0' and write_en = '1' then
        full_in <= '1';
    else
        full_in <= full;
    end if;
      

  end process;
   
  process(full, valid_in) begin
     if valid_in = '1' and full ='0' then
         write_en <= '1';
     else
         write_en <= '0';
     end if;        
  end process;
                 
 empty <= not full;

end;
