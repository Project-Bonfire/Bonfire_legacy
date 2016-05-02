--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity scan_cell is
    port (
        Data_In: in std_logic;


        SC_IN: in std_logic;    -- Scan in
        SC_OUT: out std_logic;   -- Scan out
        EXTEST: in std_logic;
        CaptureDR, ShiftDR, UpdateDR: in std_logic;

        ClockDR: in std_logic;
        Data_out: out std_logic
    );
end;

architecture behavior of scan_cell is
    signal capture_scan_cell_in, capture_scan_cell_out: std_logic;
    signal update_hold_cell_in, update_hold_cell_out: std_logic;
             
------------------------------------------------------------                                                             
--                              SC_OUT           _                       
--                               |              | \                            
--  Data_In ---o-----------------€--------------|0 |___ Data_out
--             |                 |           ___|1 |                        
--             |   _       ___   |   ___    |   |▲/                           
--             |__| \     |   |  |  |   |   |    |                                
--                |1 |____|   |--o--|   |___|   EXTEST                                       
--    SC_IN ------|0 |    |   |     |   |                                             
--                |▲/  .->|_▲_|  .->|_▲_|                                              
--                 |   |    |    |    |                          
--           CaptureDR | ClockDR |  ClockDR         
--                     |         |     
--                     |         |    
--       CaptureDR or ShiftDR    UpdateDR     
--                  as enable     as enable
------------------------------------------------------------


begin


-- everything bellow here should be combinational!

process (ClockDR)begin
    if ClockDR'event and ClockDR = '1' then
        if (ShiftDR or CaptureDR) = '1' then
            capture_scan_cell_out <= capture_scan_cell_in;
        end if;
        if UpdateDR = '1' then
            update_hold_cell_out <= update_hold_cell_in;
        end if;
    end if;
end process;

SC_OUT <= capture_scan_cell_out;
update_hold_cell_in <= capture_scan_cell_out;

process(update_hold_cell_out, Data_In, EXTEST)begin
    case EXTEST is 
        when '0' => Data_out <=  Data_In;
        when others => Data_out <=   update_hold_cell_out;
    end case;
end process;

process(SC_IN, Data_In, CaptureDR)begin
    case CaptureDR is 
        when '0' => capture_scan_cell_in <=  SC_IN ;
        when others => capture_scan_cell_in <=  Data_In;
    end case;
end process;

end;




