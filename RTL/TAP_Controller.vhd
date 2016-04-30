--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity TAP is
    port (
        TRST : in std_logic;    -- Test Reset
        TCK: in std_logic;      -- Test Clock
        TMS: in std_logic;      -- Test Mode Select  
        TDI: in std_logic;      -- Test Data In
        TDO: out std_logic      -- Test Data out
    );
end;

architecture behavior of TAP is
TYPE TAP_STATE_TYPE IS (test_reset, run_idle, select_dr_scan, capture_dr, shift_dr, exit1_dr,
                        pause_dr, exit2_dr, update_dr, select_ir_scan, capture_ir, shift_ir,
                        exit1_ir, pause_ir, exit2_ir, update_ir);
    SIGNAL TAP_state, TAP_state_in   : TAP_STATE_TYPE;

    signal IR_shift_reg_in, IR_shift_reg_out: std_logic_vector(4 downto 0);

    signal DR_shift_reg1_in, DR_shift_reg1_out: std_logic_vector(31 downto 0);
    
    signal ID_counter_out, ID_counter_in: std_logic_vector(4 downto 0);
    signal BYPASS_REG_IN, BYPASS_REG_OUT: std_logic;

    constant ID: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
begin



process (TCK, TRST)begin
    if TRST = '0' then
        TAP_state <= test_reset;
        ID_counter_out <= (others => '0');
        IR_shift_reg_out <= (others => '0');
        DR_shift_reg1_out <= (others => '0');

    elsif TCK'event and TCK = '1' then
        TAP_state <= TAP_state_in;
        ID_counter_out <= ID_counter_in ;
        IR_shift_reg_out <= IR_shift_reg_in;
        DR_shift_reg1_out <= DR_shift_reg1_in;
    end if;
end process;


-- everything bellow here should be combinational!


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

process(TAP_state, TDI, IR_shift_reg_out, DR_shift_reg1_out, BYPASS_REG_OUT, IDCODE_out) begin

    -- default values
    DR_shift_reg1_in <= DR_shift_reg1_out;
    BYPASS_REG_IN <= BYPASS_REG_OUT;
    IR_shift_reg_in <= IR_shift_reg_out;
    ID_counter_in <= ID_counter_out;

    if TAP_state = shift_ir then 
        IR_shift_reg_in <= TDI & IR_shift_reg_out(IR_DEPTH-1 downto 1);
        TDO <= IR_shift_reg_out(0);

    elsif TAP_state = shift_dr then 
        case(IR_shift_reg_out) is
            when "00000" =>   -- EXTEST (mandatory TODO: I have to figure out what it does!)
                null;
            when "00001" =>   -- SAMPLE/PRELOAD (mandatory TODO: I have to figure out what it does!)
                null;
            when "00010" =>   -- I made this up!
                    DR_shift_reg1_in <= TDI & DR_shift_reg1_out(31 downto 1);
                    TDO <= DR_shift_reg1_out(0);
            when "11111"  =>   --BYPASS (mandatory)
                BYPASS_REG_IN <= TDI;
                TDO <= BYPASS_REG_OUT;
            when "00100"  =>   --IDCODE (this is optional but meh!)
                ID_counter_in <= ID_counter_out+1;
                TDO <= ID(ID_counter_out);
        end case ;
    end if;
end process;


end;




