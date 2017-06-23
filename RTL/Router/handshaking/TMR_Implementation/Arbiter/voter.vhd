--Copyright (C) 2016 Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity voter is
    generic (
        DATA_WIDTH: integer := 9
    );
    port (
        input0: in std_logic_vector(DATA_WIDTH-1 downto 0);
        input1: in std_logic_vector(DATA_WIDTH-1 downto 0);
        input2: in std_logic_vector(DATA_WIDTH-1 downto 0);

        voted_output: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end;

architecture behavior of voter is

signal S0, S1, S2: std_logic_vector(DATA_WIDTH-1 downto 0);

begin

    S0 <= input0 and input1;
    S1 <= input1 and input2;
    S2 <= input0 and input2;

    voted_output <= S0 or S1 or S2;

end;