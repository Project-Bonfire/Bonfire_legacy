--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity allocator is       -- table based routing module
     
    port (  reset: in  std_logic;
            clk: in  std_logic
          
            );
end allocator;

architecture behavior of allocator is


begin 
  
-- sequential part
process(clk, reset)
begin
if reset = '0' then 
 
elsif clk'event and clk = '1' then 

end if;
end process;
 
-- The combionational part
 

END;