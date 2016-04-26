library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity parity_checker is 
	generic(DATA_WIDTH : integer := 32);
	port(
		RX: in std_logic_vector(DATA_WIDTH-1 downto 0);
		DRTS: in std_logic;
		fault_out: out std_logic
		);
end parity_checker;

architecture behavior of parity_checker is
signal xor_all: std_logic;
begin 
xor_all <= XOR_REDUCE(RX(DATA_WIDTH-1 downto 1));
process(DRTS, RX)begin 
if DRTS = '1' then 
	if xor_all = RX(0) then 
		fault_out <= '0';
	else
		fault_out <= '1';
	end if;
else
	fault_out <= '0';
end if;
end process;
end;