--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity TAP is
    port (
        reset : in std_logic;
        TMS: in std_logic;
        TCK: in std_logic
    );
end;

architecture behavior of TAP is
TYPE TAP_STATE_TYPE IS (test_reset, run_idle, select_dr_scan, capture_dr, shift_dr, exit1_dr,
                        pause_dr, exit2_dr, update_dr, select_ir_scan, capture_ir, shift_ir,
                        exit1_ir, pause_ir, exit2_ir, update_ir);
    SIGNAL TAP_state, TAP_state_in   : TAP_STATE_TYPE;

begin



process (TCK, reset)begin
    if reset = '0' then
        TAP_state <= test_reset;
    elsif TCK'event and TCK = '1' then
        TAP_state <= TAP_state_in;
    end if;
end process;


process(TAP_state, TMS) begin 
    case(TAP_state) is
        when test_reset =>      TAP_state_in <= run_idle when TMS = '0' else test_reset;
        when run_idle =>        TAP_state_in <= run_idle when TMS = '0' else select_dr_scan;
        when select_dr_scan =>  TAP_state_in <= capture_dr when TMS = '0' else select_ir_scan;
        when capture_dr =>      TAP_state_in <= shift_dr when TMS = '0' else exit1_dr;
        when shift_dr =>        TAP_state_in <= shift_dr when TMS = '0' else exit1_dr;
        when exit1_dr =>        TAP_state_in <= pause_dr when TMS = '0' else update_dr;
        when pause_dr =>        TAP_state_in <= pause_dr when TMS = '0' else exit2_dr;
        when exit2_dr =>        TAP_state_in <= shift_dr when TMS = '0' else update_dr;
        when update_dr =>       TAP_state_in <= run_idle when TMS = '0' else select_dr_scan;
        when select_ir_scan =>  TAP_state_in <= capture_ir when TMS = '0' else test_reset;
        when capture_ir =>      TAP_state_in <= shift_ir when TMS = '0' else exit1_ir;
        when shift_ir =>        TAP_state_in <= shift_ir when TMS = '0' else exit1_ir;
        when exit1_ir =>        TAP_state_in <= pause_ir when TMS = '0' else update_ir;
        when pause_ir =>        TAP_state_in <= pause_ir when TMS = '0' else exit2_ir;
        when exit2_ir =>        TAP_state_in <= shift_ir when TMS = '0' else update_ir;
        when update_ir =>       TAP_state_in <= run_idle when TMS = '0' else select_dr_scan;
    end case ;
end process;

end;




