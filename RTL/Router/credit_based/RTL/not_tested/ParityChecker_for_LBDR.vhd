--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity parity_checker_for_LBDR is 
	generic(DATA_WIDTH : integer := 32);
	port(
		RX: in std_logic_vector(DATA_WIDTH-1 downto 0);
		empty: in std_logic;
		faulty: out std_logic
		);
end parity_checker_for_LBDR;

architecture behavior of parity_checker_for_LBDR is

signal xor_all: std_logic;

begin 

process(empty, RX) begin
	if empty = '0' then 
		xor_all <= XOR_REDUCE(RX(DATA_WIDTH-1 downto 1));
	else
		xor_all <= '0';
	end if;
end process;

process(RX, xor_all)begin 
	faulty <= '0';
	if xor_all /= RX(0) then 
		faulty <= '1';
	end if;
end process;
end;


