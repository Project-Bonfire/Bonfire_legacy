library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL; 
use IEEE.math_real."ceil";
use IEEE.math_real."log2";

entity fault_injector is 
	generic(DATA_WIDTH : integer := 32);
	port(
		data_in: in std_logic_vector (DATA_WIDTH-1 downto 0);
		address: in std_logic_vector(integer(ceil(log2(real(DATA_WIDTH))))-1 downto 0);
		sta_0: in std_logic;
		sta_1: in std_logic;
		data_out: out std_logic_vector (DATA_WIDTH-1 downto 0)
		);
end fault_injector;

architecture behavior of fault_injector is
signal mask: std_logic_vector (DATA_WIDTH-1 downto 0);
begin 

--  data_in |  sta_0 | sta_1  |  data_out
--  --------|--------|--------|----------  
--      0   |    0   |  0     |   0       
--      1   |    0   |  0     |   1   
--      X   |    0   |  1     |   1                     
--      X   |    1   |  0     |   0      
  mask <=  std_logic_vector(to_unsigned(to_integer(signed(address)), mask'length));
  Gen_faulty:
  for i in 0 to DATA_WIDTH-1 generate
	data_out(i)  <= (data_in(i) and not sta_1 and not sta_0) or (mask(i) and sta_1);
  end generate;                          
end;