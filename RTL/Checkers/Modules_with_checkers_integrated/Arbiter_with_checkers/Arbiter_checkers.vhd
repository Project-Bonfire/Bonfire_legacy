library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Arbiter_checkers is
    port (  
    	    Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic;
            DCTS: in std_logic;	
    		Grant_N, Grant_E, Grant_W, Grant_S, Grant_L: in std_logic;
            Xbar_sel : in std_logic_vector(4 downto 0);
			state: in std_logic_vector (5 downto 0);
            state_in: in std_logic_vector (5 downto 0);
            next_state_out: in std_logic_vector (5 downto 0);
            RTS_FF: in std_logic;
			RTS_FF_in: in std_logic;

            -- Checker outputs
            err_Arbiter_Xbar_sel_onehot: out std_logic;
--          err_Arbiter_no_req_Grant: out std_logic;
            err_Arbiter_DCTS_RTS: out std_logic; 
            err_Arbiter_DCTS_RTS1: out std_logic; 
            err_Arbiter_DCTS_RTS2: out std_logic; 
            err_Arbiter_DCTS_RTS3: out std_logic; 
            err_Arbiter_state_and_grants_onehot: out std_logic; 
            err_Arbiter_no_req_state_change: out std_logic; 
            err_Arbiter_valid_state: out std_logic;
            Serr_switchgrantN, Serr_switchgrantE, Serr_switchgrantW, Serr_switchgrantS, Serr_switchgrantL: out std_logic;
            err_Arbiter_state_update, err_Arbiter_state_RTS_FF_in: out std_logic; 
            Serr_switchgrantN_not_active, Serr_switchgrantE_not_active, Serr_switchgrantW_not_active, Serr_switchgrantS_not_active, Serr_switchgrantL_not_active: out std_logic;
            Serr_switchgrantN_not_active1, Serr_switchgrantE_not_active1, Serr_switchgrantW_not_active1, Serr_switchgrantS_not_active1, Serr_switchgrantL_not_active1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_IDLE, err_Arbiter_Xbar_sel_invalid_North, err_Arbiter_Xbar_sel_invalid_East, err_Arbiter_Xbar_sel_invalid_West, err_Arbiter_Xbar_sel_invalid_South, err_Arbiter_Xbar_sel_invalid_Local: out std_logic; --, err_Arbiter_Xbar_sel_invalid_Local: out std_logic;
            err_Arbiter_Xbar_sel_invalid_North1, err_Arbiter_Xbar_sel_invalid_East1, err_Arbiter_Xbar_sel_invalid_West1, err_Arbiter_Xbar_sel_invalid_South1, err_Arbiter_Xbar_sel_invalid_Local1: out std_logic;
            Serr_priorityIDLE3, Serr_priorityL3, Serr_priorityN3, Serr_priorityE3, Serr_priorityW3, Serr_priorityS3: out std_logic;
            Serr_switchgrantN1, Serr_switchgrantE1, Serr_switchgrantW1, Serr_switchgrantS1, Serr_switchgrantL1: out std_logic;
            err_Arbiter_state_not_update: out std_logic; 
            err_Arbiter_no_Grant: out std_logic
--            err_Arbiter_invalid_state: out std_logic -- , err_Arbiter_invalid_state1, err_Arbiter_invalid_state2, err_Arbiter_invalid_state3: out std_logic
            );
end Arbiter_checkers;

architecture behavior of Arbiter_checkers is

CONSTANT IDLE: std_logic_vector (5 downto 0) := "000001";
CONSTANT Local: std_logic_vector (5 downto 0) := "000010";
CONSTANT North: std_logic_vector (5 downto 0) := "000100";
CONSTANT East: std_logic_vector (5 downto 0) := "001000";
CONSTANT West: std_logic_vector (5 downto 0) := "010000";
CONSTANT South: std_logic_vector (5 downto 0) := "100000";

begin 

-- Checkers

process (state, RTS_FF_in) begin
    if (state = IDLE and RTS_FF_in = '1') then 
        err_Arbiter_state_RTS_FF_in <= '1';
    else
   		err_Arbiter_state_RTS_FF_in <= '0';
   	end if;
end process;

-- If there is a request from Arbiter to next router/NI, but the FIFO of the next router is full (not ready), previous state must be stored in state_in!
process (RTS_FF, DCTS, state, state_in) begin
    if (RTS_FF = '1' and DCTS = '0' and state_in /= state) then 
        err_Arbiter_state_update <= '1';
    else
   		err_Arbiter_state_update <= '0';
   	end if;
end process;

process (RTS_FF, DCTS, next_state_out, state_in) begin
    if ((RTS_FF = '0' or DCTS = '1') and state_in /= next_state_out) then 
        err_Arbiter_state_not_update <= '1';
    else
   		err_Arbiter_state_not_update <= '0';
   	end if;
end process;


-- Arbiter Grants and state variable must be one-hot!
process (DCTS, RTS_FF, Req_N, Req_E, Req_W, Req_S, Req_L, state_in, Grant_N, Grant_E, Grant_W, Grant_S, Grant_L) begin
if (DCTS = '1' and RTS_FF = '1' and (Req_N = '1' or Req_E = '1' or Req_W = '1' or Req_S = '1' or Req_L = '1') and ((state_in /= North and state_in /= East and state_in /= West and state_in /= South and state_in /= Local) or (Grant_N = '0' and Grant_E = '0' and Grant_W = '0' and Grant_S = '0' and Grant_L = '0') )) then 
	err_Arbiter_state_and_grants_onehot <= '1';
else 
	err_Arbiter_state_and_grants_onehot <= '0';
end if;	
end process;

process (state_in) begin
if (state_in /= IDLE and state_in /= North and state_in /= East and state_in /= West and state_in /= South and state_in /= Local ) then
	err_Arbiter_valid_state <= '1';
else
	err_Arbiter_valid_state <= '0';
end if;
end process;

-- Arbiter select lines for Crossbar Switch must be one-hot!  
-- process(DCTS, RTS_FF, Req_N, Req_E, Req_W, Req_L, Xbar_sel) begin
process(Xbar_sel) begin
--	if (DCTS = '1' and RTS_FF = '1' and (Req_N = '1' or Req_E = '1' or Req_W = '1' or Req_L = '1') and Xbar_sel /= "0001" and Xbar_sel /= "0010" and Xbar_sel /= "0100" and Xbar_sel /= "1000" ) then
	if (Xbar_sel /= "00000" and Xbar_sel /= "00001" and Xbar_sel /= "00010" and Xbar_sel /= "00100" and Xbar_sel /= "01000" and Xbar_sel /= "10000") then
		err_Arbiter_Xbar_sel_onehot <= '1';		
	else
		err_Arbiter_Xbar_sel_onehot <= '0';
	end if;
end process;

process(state, RTS_FF, DCTS, RTS_FF_in) begin
	if ( (state = North or state = East or state = West or state = South or state = Local) and  RTS_FF = '1' and DCTS = '1' and RTS_FF_in = '1') then
		err_Arbiter_DCTS_RTS <= '1';		
	else
		err_Arbiter_DCTS_RTS <= '0';
	end if;
end process;

process(state, RTS_FF, DCTS, RTS_FF_in) begin
	if ( (state = North or state = East or state = West or state = South or state = Local) and  RTS_FF = '0' and DCTS = '0' and RTS_FF_in = '0') then
		err_Arbiter_DCTS_RTS1 <= '1';		
	else
		err_Arbiter_DCTS_RTS1 <= '0';
	end if;
end process;

process(RTS_FF, DCTS, state, RTS_FF_in) begin
	if ( RTS_FF = '1' and DCTS = '0' and state /= IDLE and RTS_FF_in = '0') then
		err_Arbiter_DCTS_RTS2 <= '1';		
	else
		err_Arbiter_DCTS_RTS2 <= '0';
	end if;
end process;

process(RTS_FF, DCTS, state, RTS_FF_in) begin
	if ( RTS_FF = '0' and DCTS = '1' and state /= IDLE and RTS_FF_in = '0') then
		err_Arbiter_DCTS_RTS3 <= '1';		
	else
		err_Arbiter_DCTS_RTS3 <= '0';
	end if;
end process;

-- If there is no request for arbitration, the arbiter's next state must be IDLE!
process(Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin
	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '0') and next_state_out /= IDLE) then
		err_Arbiter_no_req_state_change <= '1';
	else
		err_Arbiter_no_req_state_change <= '0';		
	end if;	
end process;

-- If there is no request for arbitration and the next router/NI is also not ready to receive any flits, the arbiter must not active any Grant signals in its output!
--process(Req_N, Req_E, Req_W, Req_S, Req_L, DCTS, RTS_FF_in, Grant_N, Grant_E, Grant_W, Grant_L) begin
--	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '0') and DCTS = '1' and ( RTS_FF_in = '1' or (Grant_N = '1' or Grant_E = '1' or Grant_W = '1' or Grant_L = '1')) ) then
--		err_Arbiter_no_req_Grant <= '1';
--	else 
--		err_Arbiter_no_req_Grant <= '0';
--	end if;	
--end process;

process(RTS_FF, DCTS, Req_N, Req_E, Req_W, Req_S, Req_L, state_in) begin
	if ( (Req_N = '1' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '0') and RTS_FF = '1' and DCTS = '1' and state_in /= North) then
		Serr_switchgrantN <= '1';
	else 
		Serr_switchgrantN <= '0';
	end if;
end process;

process(Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin
	if ( (Req_N = '1' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '0') and next_state_out /= North) then
		Serr_switchgrantN1 <= '1';
	else 
		Serr_switchgrantN1 <= '0';
	end if;
end process;

process(state, RTS_FF, DCTS, Grant_N, RTS_FF_in) begin
	if ( (state = North) and RTS_FF = '1' and DCTS = '1' and (Grant_N = '0' or RTS_FF_in = '1') ) then
		Serr_switchgrantN_not_active <= '1';
	else 
		Serr_switchgrantN_not_active <= '0';
	end if;
end process;

process(state, RTS_FF, DCTS, Grant_N) begin
	if ((state = North) and (RTS_FF = '0' or DCTS = '0') and Grant_N = '1') then
		Serr_switchgrantN_not_active1 <= '1';
	else 
		Serr_switchgrantN_not_active1 <= '0';
	end if;
end process;

process(RTS_FF, DCTS, Req_N, Req_E, Req_W, Req_S, Req_L, state_in) begin
	if ( (Req_N = '0' and Req_E = '1' and Req_W = '0' and Req_S = '0' and Req_L = '0') and RTS_FF = '1' and DCTS = '1' and state_in /= East) then
		Serr_switchgrantE <= '1';
	else 
		Serr_switchgrantE <= '0';
	end if;		
end process;

process(Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin
	if ( (Req_N = '0' and Req_E = '1' and Req_W = '0' and Req_S = '0' and Req_L = '0') and next_state_out /= East) then
		Serr_switchgrantE1 <= '1';
	else 
		Serr_switchgrantE1 <= '0';
	end if;		
end process;

process(state, RTS_FF, DCTS, Grant_E, RTS_FF_in) begin
	if ( (state = East) and RTS_FF = '1' and DCTS = '1' and (Grant_E = '0' or RTS_FF_in = '1') ) then
		Serr_switchgrantE_not_active <= '1';
	else 
		Serr_switchgrantE_not_active <= '0';
	end if;
end process;

process(state, RTS_FF, DCTS, Grant_E) begin
	if ((state = East) and (RTS_FF = '0' or DCTS = '0') and Grant_E = '1') then
		Serr_switchgrantE_not_active1 <= '1';
	else 
		Serr_switchgrantE_not_active1 <= '0';
	end if;
end process;

process(RTS_FF, DCTS, Req_N, Req_E, Req_W, Req_S, Req_L, state_in) begin
	if ( (Req_N = '0' and Req_E = '0' and Req_W = '1' and Req_S = '0' and Req_L = '0') and RTS_FF = '1' and DCTS = '1' and state_in /= West) then
		Serr_switchgrantW <= '1';
	else 
		Serr_switchgrantW <= '0';
	end if;		
end process;

process(Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin
	if ( (Req_N = '0' and Req_E = '0' and Req_W = '1' and Req_S = '0' and Req_L = '0') and next_state_out /= West) then
		Serr_switchgrantW1 <= '1';
	else 
		Serr_switchgrantW1 <= '0';
	end if;		
end process;

process(state, RTS_FF, DCTS, Grant_W, RTS_FF_in) begin
	if ( (state = West) and RTS_FF = '1' and DCTS = '1' and (Grant_W = '0' or RTS_FF_in = '1') ) then
		Serr_switchgrantW_not_active <= '1';
	else 
		Serr_switchgrantW_not_active <= '0';
	end if;
end process;

process(state, RTS_FF, DCTS, Grant_W) begin
	if ((state = West) and (RTS_FF = '0' or DCTS = '0') and Grant_W = '1') then
		Serr_switchgrantW_not_active1 <= '1';
	else 
		Serr_switchgrantW_not_active1 <= '0';
	end if;
end process;

process(RTS_FF, DCTS, Req_N, Req_E, Req_W, Req_S, Req_L, state_in) begin
	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1' and Req_L = '0') and RTS_FF = '1' and DCTS = '1' and state_in /= South) then
		Serr_switchgrantS <= '1';
	else 
		Serr_switchgrantS <= '0';
	end if;		
end process;

process(Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin
	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1' and Req_L = '0') and next_state_out /= South) then
		Serr_switchgrantS1 <= '1';
	else 
		Serr_switchgrantS1 <= '0';
	end if;		
end process;


process(state, RTS_FF, DCTS, Grant_S, RTS_FF_in) begin
	if ( state = South and RTS_FF = '1' and DCTS = '1' and (Grant_S = '0' or RTS_FF_in = '1') ) then
		Serr_switchgrantS_not_active <= '1';
	else 
		Serr_switchgrantS_not_active <= '0';
	end if;
end process;

process(state, RTS_FF, DCTS, Grant_S) begin
	if ((state = South) and (RTS_FF = '0' or DCTS = '0') and Grant_S = '1') then
		Serr_switchgrantS_not_active1 <= '1';
	else 
		Serr_switchgrantS_not_active1 <= '0';
	end if;
end process;


process(RTS_FF, DCTS, Req_N, Req_E, Req_W, Req_S, Req_L, state_in) begin
	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '1') and RTS_FF = '1' and DCTS = '1' and state_in /= Local) then
		Serr_switchgrantL <= '1';
	else 
		Serr_switchgrantL <= '0';
	end if;		
end process;

process(Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin
	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '1') and next_state_out /= Local) then
		Serr_switchgrantL1 <= '1';
	else 
		Serr_switchgrantL1 <= '0';
	end if;		
end process;


process(state, RTS_FF, DCTS, Grant_L, RTS_FF_in) begin
	if ( state = Local and RTS_FF = '1' and DCTS = '1' and (Grant_L = '0' or RTS_FF_in = '1') ) then
		Serr_switchgrantL_not_active <= '1';
	else 
		Serr_switchgrantL_not_active <= '0';
	end if;
end process;

process(state, RTS_FF, DCTS, Grant_L) begin
	if ((state = Local) and (RTS_FF = '0' or DCTS = '0') and Grant_L = '1') then
		Serr_switchgrantL_not_active1 <= '1';
	else 
		Serr_switchgrantL_not_active1 <= '0';
	end if;
end process;

process(state, RTS_FF, DCTS, Grant_N, Grant_E, Grant_W, Grant_S, Grant_L) begin
	if (state /= IDLE and RTS_FF = '1' and DCTS = '1' and Grant_N = '0' and Grant_E = '0' and Grant_W = '0' and Grant_S = '0' and Grant_L = '0') then
		err_Arbiter_no_Grant <= '1';
	else 
		err_Arbiter_no_Grant <= '0';
	end if;
end process;

process(state, Xbar_sel) begin
	if (state = IDLE and Xbar_sel /= "00000") then
		err_Arbiter_Xbar_sel_invalid_IDLE <= '1';		
	else
		err_Arbiter_Xbar_sel_invalid_IDLE <= '0';
	end if;
end process;

process(state, Xbar_sel) begin
	if (state = North and Xbar_sel /= "00001") then
		err_Arbiter_Xbar_sel_invalid_North <= '1';		
	else
		err_Arbiter_Xbar_sel_invalid_North <= '0';
	end if;
end process;

process(state, DCTS, RTS_FF, Grant_N, Xbar_sel) begin
	if (state /= North and RTS_FF = '1' and DCTS = '1' and (Grant_N = '1' or Xbar_sel = "00001") ) then
		err_Arbiter_Xbar_sel_invalid_North1 <= '1';		
	else
		err_Arbiter_Xbar_sel_invalid_North1 <= '0';
	end if;
end process;

process(state, Xbar_sel) begin
	if (state = East and Xbar_sel /= "00010") then
		err_Arbiter_Xbar_sel_invalid_East <= '1';		
	else
		err_Arbiter_Xbar_sel_invalid_East <= '0';
	end if;
end process;

process(state, DCTS, RTS_FF, Grant_E, Xbar_sel) begin
	if (state /= East and RTS_FF = '1' and DCTS = '1' and (Grant_E = '1' or Xbar_sel = "00010") ) then
		err_Arbiter_Xbar_sel_invalid_East1 <= '1';		
	else
		err_Arbiter_Xbar_sel_invalid_East1 <= '0';
	end if;
end process;


process(state, Xbar_sel) begin
	if (state = West and Xbar_sel /= "00100") then
		err_Arbiter_Xbar_sel_invalid_West <= '1';		
	else
		err_Arbiter_Xbar_sel_invalid_West <= '0';
	end if;
end process;

process(state, DCTS, RTS_FF, Grant_W, Xbar_sel) begin
	if (state /= West and RTS_FF = '1' and DCTS = '1' and (Grant_W = '1' or Xbar_sel = "00100") ) then
		err_Arbiter_Xbar_sel_invalid_West1 <= '1';		
	else
		err_Arbiter_Xbar_sel_invalid_West1 <= '0';
	end if;
end process;

process(state, Xbar_sel) begin
	if (state = South and Xbar_sel /= "01000") then
		err_Arbiter_Xbar_sel_invalid_South <= '1';		
	else
		err_Arbiter_Xbar_sel_invalid_South <= '0';
	end if;
end process;

process(state, DCTS, RTS_FF, Grant_S, Xbar_sel) begin
	if (state /= South and RTS_FF = '1' and DCTS = '1' and (Grant_S = '1' or Xbar_sel = "01000") ) then
		err_Arbiter_Xbar_sel_invalid_South1 <= '1';		
	else
		err_Arbiter_Xbar_sel_invalid_South1 <= '0';
	end if;
end process;

process(state, Xbar_sel) begin
	if (state = Local and Xbar_sel /= "10000") then
		err_Arbiter_Xbar_sel_invalid_Local <= '1';		
	else
		err_Arbiter_Xbar_sel_invalid_Local <= '0';
	end if;
end process;

process(state, DCTS, RTS_FF, Grant_L, Xbar_sel) begin
	if (state /= Local and RTS_FF = '1' and DCTS = '1' and (Grant_L = '1' or Xbar_sel = "10000") ) then
		err_Arbiter_Xbar_sel_invalid_Local1 <= '1';		
	else
		err_Arbiter_Xbar_sel_invalid_Local1 <= '0';
	end if;
end process;

-- Grants Priority

process(state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin
	if ( state = IDLE and (Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1') and next_state_out /= South) then
		Serr_priorityIDLE3 <= '1';
	else 
		Serr_priorityIDLE3 <= '0';
	end if;
end process;

process(state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin
	if ( state = Local and (Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1') and next_state_out /= South) then
		Serr_priorityL3 <= '1';
	else 
		Serr_priorityL3 <= '0';
	end if;
end process;

process(state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin
	if ( state = North and (Req_L = '1' and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0') and next_state_out /= Local) then
		Serr_priorityN3 <= '1';
	else 
		Serr_priorityN3 <= '0';
	end if;
end process;

process(state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin
	if ( state = East and (Req_L = '0' and Req_N = '1' and Req_E = '0' and Req_W = '0' and Req_S = '0') and next_state_out /= North) then
		Serr_priorityE3 <= '1';
	else 
		Serr_priorityE3 <= '0';
	end if;
end process;

process(state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin
	if ( state = West and (Req_L = '0' and Req_N = '0' and Req_E = '1' and Req_W = '0' and Req_S = '0') and next_state_out /= East) then
		Serr_priorityW3 <= '1';
	else 
		Serr_priorityW3 <= '0';
	end if;
end process;

process(state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin
	if ( state = South and (Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '1' and Req_S = '0') and next_state_out /= West) then
		Serr_priorityS3 <= '1';
	else 
		Serr_priorityS3 <= '0';
	end if;
end process;

--process(state, Grant_N, Grant_E, Grant_W, Grant_L) begin
--	if (state /= IDLE and state /= North and state /= East and state /= West and state /= Local and 
--		(Grant_N = '1' or Grant_E = '1' or Grant_W = '1' or Grant_L = '1') ) then
--		err_Arbiter_invalid_state <= '1';
--	else 
--		err_Arbiter_invalid_state <= '0';
--	end if;
--end process;

--process(state, Xbar_sel) begin
--	if (state /= IDLE and state /= North and state /= East and state /= West and state /= Local and 
--		(Xbar_sel /= "0000") ) then
--		err_Arbiter_invalid_state1 <= '1';
--	else 
--		err_Arbiter_invalid_state1 <= '0';
--	end if;
--end process;

--process(state, next_state_out) begin
--	if (state /= IDLE and state /= North and state /= East and state /= West and state /= Local and next_state_out /= IDLE) then
--		err_Arbiter_invalid_state2 <= '1';
--	else 
--		err_Arbiter_invalid_state2 <= '0';
--	end if;
--end process;

--process(state, next_state_out) begin
--	if (state /= IDLE and state /= North and state /= East and state /= West and state /= Local and (RTS_FF = '0' or DCTS = '1') and state_in /= IDLE) then
--		err_Arbiter_invalid_state3 <= '1';
--	else 
--		err_Arbiter_invalid_state3 <= '0';
--	end if;
--end process;

end behavior;