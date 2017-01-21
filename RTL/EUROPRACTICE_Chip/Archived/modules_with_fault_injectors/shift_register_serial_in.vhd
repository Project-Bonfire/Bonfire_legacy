--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity shift_register_serial_in is
    generic (
        REG_WIDTH: integer := 8
    );
    port (
        clk, reset : in std_logic;
        shift: in std_logic;
        data_in_serial: in std_logic;
        data_out_parallel: out std_logic_vector(REG_WIDTH-1 downto 0);
        data_out_serial: out std_logic
    );
end;

architecture behavior of shift_register_serial_in is

signal shift_register_mem_out : std_logic_vector(REG_WIDTH-1 downto 0); 

begin
process (clk, reset)
begin 
    if reset = '0'  then
        shift_register_mem_out <= (others => '0');
    elsif clk'event and clk = '1' then 
        if shift = '1' then
            shift_register_mem_out <=  shift_register_mem_out (REG_WIDTH-2 downto 0) & data_in_serial;
        end if;
    end if;

end process;

data_out_parallel <= shift_register_mem_out;
data_out_serial <= shift_register_mem_out (REG_WIDTH-2);

end;