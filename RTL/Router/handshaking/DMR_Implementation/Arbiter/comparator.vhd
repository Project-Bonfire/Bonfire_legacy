--Copyright (C) 2016 Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity comparator is
    generic (
        DATA_WIDTH: integer := 9
    );
    port (
        input0: in std_logic_vector(DATA_WIDTH-1 downto 0);
        input1: in std_logic_vector(DATA_WIDTH-1 downto 0);

        error_out: out std_logic
    );
end;

architecture behavior of comparator is

signal S0, S1, S2: std_logic_vector(DATA_WIDTH-1 downto 0);

begin

process (input0, input1) 
begin

	error_out <= '0';

	if (input0 = input1)
		error_out <= '0';
	else 
		error_out <= '1';
	end if;

end process;

end;