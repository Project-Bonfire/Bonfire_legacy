--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity shift_register_serial_in is
    generic (
        REG_WIDTH: integer := 32
    );
    port (
        TCK, reset : in std_logic;  
        SE: in std_logic;       -- shift enable 
        UE: in std_logic;       -- update enable
        SI: in std_logic;       -- serial Input
        SO: out std_logic;      -- serial output
        data_out_parallel: out std_logic_vector(REG_WIDTH-1 downto 0)
    );
end;

architecture behavior of shift_register_serial_in is
signal shift_register_mem_out : std_logic_vector(REG_WIDTH-1 downto 0); 
signal output_strobe : std_logic;

begin
process (TCK, reset)
begin 
    if reset = '0'  then
        shift_register_mem_out <= (others => '0');
    elsif TCK'event and TCK = '1' then 
        if SE = '1' then
            shift_register_mem_out <=  shift_register_mem_out (REG_WIDTH-2 downto 0) & SI;
        end if;
    end if;

end process;

process(TCK) begin
    if TCK'event and TCK = '0' then
        output_strobe <= UE;
    end if;
end process;

process(output_strobe, shift_register_mem_out) begin
    if output_strobe = '1'  then
        data_out_parallel <= shift_register_mem_out;
    else
        data_out_parallel <= (others => '0');
    end if;
end process;

SO <= shift_register_mem_out (REG_WIDTH-1);

end;