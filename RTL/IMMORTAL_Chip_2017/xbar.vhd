--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity XBAR is
    generic (
        DATA_WIDTH: integer := 8
    );
    port (
        North_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        East_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        West_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        South_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        Local_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        sel: in std_logic_vector (4 downto 0);
        Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end;

architecture behavior of XBAR is
begin
process(sel, North_in, East_in, West_in, South_in, Local_in) begin
    case(sel) is
    
    	when "00001" =>
    		Data_out <= Local_in;
    	when "00010" =>
    		Data_out <= South_in;
    	when "00100" =>
    		Data_out <= West_in;
    	when "01000" =>
    		Data_out <= East_in;
    	when others =>
    		Data_out <= North_in;	
    end case;
   end process;
end;