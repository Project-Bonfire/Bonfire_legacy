--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity scan_cell is
    port (
        SC_IN: in std_logic;    -- Scan in
        Data_In: in std_logic;
        ShiftDR, UpdateDR: in std_logic;
        Mode: in std_logic;
        ClockDR: in std_logic;
        SC_OUT: out std_logic;   -- Scan out
        Data_out: out std_logic
    );
end;

architecture behavior of scan_cell is
    signal capture_scan_cell_in, capture_scan_cell_out: std_logic;
    signal update_hold_cell_in, update_hold_cell_out: std_logic;
begin


-- everything bellow here should be combinational!

process (ClockDR)begin
    if ClockDR'event and ClockDR = '1' then
        capture_scan_cell_out <= capture_scan_cell_in;
    end if;
end process;

process (UpdateDR)begin
    if UpdateDR'event and UpdateDR = '1' then
        update_hold_cell_out <= update_hold_cell_in;
    end if;
end process;


SC_OUT <= capture_scan_cell_out;
update_hold_cell_in <= capture_scan_cell_out;

process(update_hold_cell_out, Data_In, Mode)begin
    case Mode is 
        when '0' => Data_out <=  Data_In;
        others => Data_out <=  update_hold_cell_out;
    end case;
end process;

process(update_hold_cell_out, Data_In, ShiftDR)begin
    case Mode is 
        when '0' => capture_scan_cell_in <=  Data_In;
        others => capture_scan_cell_in <=  SC_IN;
    end case;
end process;

end;




