--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity XBAR_LV is
    generic (
        DATA_WIDTH: integer := 11
    );
    port (
        East_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        West_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        Local_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        sel: in std_logic_vector (2 downto 0);
        Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end;

architecture behavior of XBAR_LV is
begin
process(sel, East_in, West_in, Local_in) begin
    case(sel) is
    	when "010" =>
    		Data_out <= West_in;
    	when "100" =>
    		Data_out <= East_in;
        when others =>
            Data_out <= Local_in;
    end case;
   end process;
end;