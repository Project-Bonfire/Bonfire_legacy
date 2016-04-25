library ieee;
use ieee.std_logic_1164.all;
use std_logic_misc.all;

entity fault_injector is 
	generic(DATAWIDTH : integer := 32)
	port(
		data_in: in std_logic;
		sta_0: in std_logic;
		sta_1: in std_logic;
		data_out: out std_logic
		);
end fault_injector;

architecture behavior of fault_injector is
begin 

--	data_in |  sta_0 | sta_1  |  data_out
--	--------|--------|--------|----------  
--		0	|    0   |  0     |   0       
--		1	|    0   |  0     |   1   
--      X   |    0   |  1     |   1                     
--      X   |    1   |  0     |   0                    

data_out <= (data_in and not sta_0 and not sta_1) or (sta_1 and not sta_0);
                           
end;