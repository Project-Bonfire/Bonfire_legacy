library ieee;
use ieee.std_logic_1164.all;
use std_logic_misc.all;

entity parity_checker is 
	generic(DATAWIDTH : integer := 32)
	port(
		RX: in std_logic_vector(DATAWIDTH-1 downto 0);
		RTS: in std_logic;
		fault_out: out std_logic
		);
end parity_checker;

architecture behavior of parity_checker is
begin 

fault_out <= '0' when (RTS and (XOR_REDUCE(RX(DATAWIDTH-1 downto 1)))) = RX(0) else '1';

end;