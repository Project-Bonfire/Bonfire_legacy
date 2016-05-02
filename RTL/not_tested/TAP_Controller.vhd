--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 USE ieee.numeric_std.ALL; 

entity TAP is
    port (
        -- signals from the PC!
        TRST : in std_logic;    -- Test Reset
        TCK: in std_logic;      -- Test Clock
        TMS: in std_logic;      -- Test Mode Select  
        TDI: in std_logic;      -- Test Data In
        TDO: out std_logic;      -- Test Data out

        -- signals to the boundry scan cell
        SC_IN: in std_logic;    -- Scan chain to TAP
        SC_OUT: out std_logic;   -- TAP to Scan chain 
        CaptureDR: out std_logic;
        ShiftDR: out std_logic;
        EXTEST: out std_logic;
        UpdateDR: out std_logic
    );
end;

architecture behavior of TAP is

------------------------------------------------------------
--          STATE MACHINE DIAGRAM
--         _____________                                                                                    
--     .->| test_ reset |<----------------------------------------------------.                                                     
--    1'--|_____________|                                                     |                               
--               | 0                                                          |                
--         ______▼______     1     _____________     1    _____________   1   |                                                                           
--     .->| run_idle    |-------->| sel_dr_scan |------->| sel_ir_scan |______|                                                                                   
--    0'--|_____________|     .-->|_____________|        |_____________|                                                                                 
--           ▲          _____/           | 0                    | 0                                              
--           |         /           ______▼_______         ______▼______                                                          
--           |        /    _______| capture_dr  |        | capture_ir  |_______                                                         
--           |       /    |    1  |_____________|        |_____________|  1    |                                                  
--           |      /     |              |0                     |0             |             
--           |     /      |              |                      |              |              
--           |    /       |        ______▼______          ______▼______        |                                                  
--           |   |        |    .->| shift_dr    |<-.  .->| shift_ir    |<-.    |                                                     
--           |   |        |   0'--|_____________|  |  |  |_____________|--' 0  | 
--           |   |        |              |1        |  |         |1             |
--           |   |        |              |         |  |         |              | 
--           |   |        |        ______▼______   |  |   ______▼______        |                                                  
--           |   |        '------>|             |  |  |  |             |<------'                                                                 
--           |   |        ._______|  exit1_dr   |  |  |  |   exit1_ir  |_______.                                                                                        
--           |   |        |    1  |_____________|  |  |  |_____________|  1    |           
--           |   |        |              | 0       |  |         | 0            |           
--           |   |        |        ______▼______   |  |   ______▼______        |                                                
--           |   |        |    .->| pause_dr    |  |  |  | pause_ir    |<-.    |                                                 
--           |   |        |   0'--|_____________|  |  |  |_____________|--' 0  |
--           |   |        |              |1        |  |         |1             | 
--           |   |        |              |         |  |         |              |
--           |   |        |        ______▼______   |  |   ______▼______        |                                                 
--           |   |        |       | exit2_dr    |__|  |__| exit2_ir    |       |                                                
--           |   |        |       |_____________| 0    0 |_____________|       |                                                                                    
--           |   |        |              |1                     |1             |           
--           |   |        |              |                      |              |
--           |   |        |        ______▼______          ______▼______        |                                                
--           |   |        '------>| update_dr   |        | update_ir   |<------'                                                        
--           |   |                |_____________|        |_____________|   
--           |   |                   |       |                |     |                               
--           |   '-------------------o-------€----------------'     |                              
--           |                               |                      |                                                                                       
--           '-------------------------------o----------------------'                                                      
--                                                                                                  


TYPE TAP_STATE_TYPE IS (test_reset, run_idle, select_dr_scan, capture_dr, shift_dr, exit1_dr,
                        pause_dr, exit2_dr, update_dr, select_ir_scan, capture_ir, shift_ir,
                        exit1_ir, pause_ir, exit2_ir, update_ir);
    SIGNAL TAP_state, TAP_state_in   : TAP_STATE_TYPE;

    signal IR_shift_reg_in, IR_shift_reg_out: std_logic_vector(3 downto 0);
    signal IR_in, IR_out: std_logic_vector(3 downto 0);
    
    signal ID_counter_out, ID_counter_in: std_logic_vector(4 downto 0);
    signal BYPASS_REG_IN, BYPASS_REG_OUT: std_logic;

    constant ID: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
begin

-- http://www.corelis.com/images/diagrams/mainbuildingblocksofaJTAGde.jpg
-- http://www.gojtag.com/sites/default/files/BS%20testing%20-%20goJTAG%20v.11.02%20print.pdf

process (TCK, TRST)begin
    if TRST = '0' then
        TAP_state <= test_reset;
        ID_counter_out <= (others => '0');
        IR_shift_reg_out <= (others => '0');
        IR_out <= (others => '0');
    elsif TCK'event and TCK = '1' then
        TAP_state <= TAP_state_in;
        ID_counter_out <= ID_counter_in ;
        IR_shift_reg_out <= IR_shift_reg_in;
        IR_out <= IR_in;
    end if;
end process;


-- everything bellow here should be combinational!

-- the state machine 
process(TAP_state, TMS) begin 
    case(TAP_state) is
        when test_reset => 	if  TMS = '0' then TAP_state_in <= run_idle; else  TAP_state_in <=test_reset; end if;
        when run_idle =>        if  TMS = '0' then TAP_state_in <= run_idle; else  TAP_state_in <=select_dr_scan; end if;
        when select_dr_scan =>  if  TMS = '0' then TAP_state_in <= capture_dr; else  TAP_state_in <=select_ir_scan; end if;
        when capture_dr =>      if  TMS = '0' then TAP_state_in <= shift_dr ; else  TAP_state_in <=exit1_dr; end if;
        when shift_dr =>        if  TMS = '0' then TAP_state_in <= shift_dr  ; else  TAP_state_in <=exit1_dr; end if;
        when exit1_dr =>        if  TMS = '0' then TAP_state_in <= pause_dr  ; else  TAP_state_in <=update_dr; end if;
        when pause_dr =>        if  TMS = '0' then TAP_state_in <= pause_dr  ; else  TAP_state_in <=exit2_dr; end if;
        when exit2_dr =>        if  TMS = '0' then TAP_state_in <= shift_dr  ; else  TAP_state_in <=update_dr; end if;
        when update_dr =>       if  TMS = '0' then TAP_state_in <= run_idle  ; else  TAP_state_in <=select_dr_scan; end if;
        when select_ir_scan =>  if  TMS = '0' then TAP_state_in <= capture_ir; else  TAP_state_in <=test_reset; end if;
        when capture_ir =>      if  TMS = '0' then TAP_state_in <= shift_ir  ; else  TAP_state_in <=exit1_ir; end if;
        when shift_ir =>        if  TMS = '0' then TAP_state_in <= shift_ir  ; else  TAP_state_in <=exit1_ir; end if;
        when exit1_ir =>        if  TMS = '0' then TAP_state_in <= pause_ir  ; else  TAP_state_in <=update_ir; end if;
        when pause_ir =>        if  TMS = '0' then TAP_state_in <= pause_ir  ; else  TAP_state_in <=exit2_ir; end if;
        when exit2_ir =>        if  TMS = '0' then TAP_state_in <= shift_ir  ; else  TAP_state_in <=update_ir; end if;
        when update_ir =>       if  TMS = '0' then TAP_state_in <= run_idle  ; else  TAP_state_in <=select_dr_scan; end if;
    end case ;
end process;
 
-- everything else
process(TAP_state, TDI, IR_out, SC_IN,  BYPASS_REG_OUT) begin

    -- default values

    CaptureDR<= '0';
    UpdateDR <= '0';
    ShiftDR <= '0';     --primary input outputs are connected to scan registers!
    EXTEST<= '0';

    case TAP_state is 
        when shift_dr =>
            case(IR_out) is
                when "0000" =>   -- EXTEST: shifting (mandatory) 
                    EXTEST <= '1';
                    ShiftDR <= '1'; --scan registers are loaded with SCAN INPUT!
                when "0001" =>   -- PRELOAD (mandatory)
                    ShiftDR <= '1';     --scan registers are loaded with SCAN INPUT!
                when others =>
                    null;
            end case ;
        when capture_dr =>
            case(IR_out) is
                when "0000" =>   -- EXTEST: driving and sensing (mandatory)
                    CaptureDR<='1';
                    EXTEST <= '1';
                when "0001" =>   -- SAMPLE (mandatory)
                    CaptureDR<='1';
                when others =>
                    null;
            end case ;
        when update_dr =>
            UpdateDR <= '1';
        when others =>
            null;
    end case;
end process;


process(TAP_state, IR_out) begin
    if TAP_state = update_ir then 
        IR_in <= IR_shift_reg_out;
    else
        IR_in<= IR_out;
    end if;
end process;


process(TAP_state, TDI, IR_out, IR_shift_reg_out, SC_IN,  BYPASS_REG_OUT) begin

    -- default values
    BYPASS_REG_IN <= BYPASS_REG_OUT;
    IR_shift_reg_in <= IR_shift_reg_out;
    ID_counter_in <= ID_counter_out;

    SC_OUT <= 'Z';
    TDO <= 'Z';

    case TAP_state is 
        when shift_ir =>
            IR_shift_reg_in <= TDI & IR_shift_reg_out(3 downto 1);
            TDO <= IR_shift_reg_out(0);
        when shift_dr =>
            case(IR_out) is
                when "0000" =>   -- EXTEST: shifting (mandatory) 
                    SC_OUT <= TDI;
                    TDO <= SC_IN;
                when "0001" =>   -- PRELOAD (mandatory)
                    SC_OUT <= TDI;
                    TDO <= SC_IN;
                when "1111"  =>   --BYPASS (mandatory)
                    BYPASS_REG_IN <= TDI;
                    TDO <= BYPASS_REG_OUT;
                when "0010"  =>   --IDCODE (this is optional but meh!)
                    ID_counter_in <= ID_counter_out+1;
                    TDO <= ID(to_integer(unsigned(ID_counter_out)));
                when others =>
                    null;
            end case ;
        when capture_dr =>
            case(IR_out) is
                when "0000" =>   -- EXTEST: driving and sensing (mandatory)
                    TDO <= SC_IN;
                    SC_OUT <= TDI;
                when "0001" =>   -- SAMPLE (mandatory)
                    SC_OUT <= TDI;
                    TDO <= SC_IN;
                when others =>
                    null;
            end case ;
        when others =>
            null;
    end case;

end process;

end;




