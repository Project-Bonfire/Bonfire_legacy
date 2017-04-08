--Copyright (C) 2016 Behrad Niazmand
library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;
use work.component_pack.all;

entity Arbiter_in_one_hot_checkers is
    port (  
            req_X_N, req_X_E, req_X_W, req_X_S, req_X_L :in std_logic;
            state: in std_logic_vector (5 downto 0);
            state_in: in std_logic_vector (5 downto 0);
			X_N, X_E, X_W, X_S, X_L :in std_logic;

            -- Checker outputs
			err_Requests_state_in_state_not_equal, 

			err_IDLE_Req_N, err_IDLE_grant_N,err_North_Req_N, err_North_grant_N, err_East_Req_E, err_East_grant_E, 
			err_West_Req_W, err_West_grant_W, err_South_Req_S,err_South_grant_S,err_Local_Req_L, err_Local_grant_L,

			err_IDLE_Req_E, err_IDLE_grant_E, err_North_Req_E, err_North_grant_E, err_East_Req_W, err_East_grant_W,
			err_West_Req_S,	err_West_grant_S, err_South_Req_L, err_South_grant_L, err_Local_Req_N, err_Local_grant_N,

			err_IDLE_Req_W, err_IDLE_grant_W, err_North_Req_W, err_North_grant_W, err_East_Req_S, err_East_grant_S,
			err_West_Req_L, err_West_grant_L, err_South_Req_N,  err_South_grant_N, err_Local_Req_E, err_Local_grant_E, 

			err_IDLE_Req_S, err_IDLE_grant_S, err_North_Req_S, err_North_grant_S, err_East_Req_L, err_East_grant_L, 
			err_West_Req_N, err_West_grant_N, err_South_Req_E, err_South_grant_E, err_Local_Req_W, err_Local_grant_W, 

			err_IDLE_Req_L, err_IDLE_grant_L, err_North_Req_L, err_North_grant_L, err_East_Req_N, err_East_grant_N, 
			err_West_Req_E, err_West_grant_E, err_South_Req_W, err_South_grant_W, err_Local_Req_S, err_Local_grant_S, 

			err_state_in_onehot, err_no_request_grants, err_request_no_grants, err_no_Req_N_grant_N,
			err_no_Req_E_grant_E, err_no_Req_W_grant_W, err_no_Req_S_grant_S, err_no_Req_L_grant_L : out std_logic
            );
end Arbiter_in_one_hot_checkers;

architecture behavior of Arbiter_in_one_hot_checkers is


SIGNAL   Requests: std_logic_vector (4 downto 0);
SIGNAL   Grants: std_logic_vector (4 downto 0);

begin 

Requests <= req_X_N & req_X_E & req_X_W & req_X_S & req_X_L;
Grants   <= X_N & X_E & X_W & X_S & X_L;

-- Checkers

--checked
process (state, Requests, state_in)
begin 
	 --if ( (state = North or state = East or state = West or state = South or state = Local or state = IDLE) and Requests = "00000" and state_in /= state ) then
	if (Requests = "00000" and state_in /= state ) then
		err_Requests_state_in_state_not_equal <= '1';
	else
		err_Requests_state_in_state_not_equal <= '0';
	end if;
end process;

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Round 1
--checked
-- N has highest priority, then E, W, S and L (and then again N). 

process (state, req_X_N, state_in)
begin 
	if ( state = IDLE and req_X_N = '1' and state_in /= North ) then
		err_IDLE_Req_N <= '1';
	else 
		err_IDLE_Req_N <= '0';	
	end if;
end process;

process (state, req_X_N, X_N)
begin 
	if ( state = IDLE and req_X_N = '1' and X_N = '0' ) then
		err_IDLE_grant_N <= '1';
	else 
		err_IDLE_grant_N <= '0';	
	end if;
end process;

process (state, req_X_N, state_in)
begin 
	if (state = North and req_X_N = '1' and state_in /= North) then
		err_North_Req_N <= '1';
	else 
		err_North_Req_N <= '0';	
	end if;
end process;

process (state, req_X_N, X_N)
begin 
	if ( state = North and req_X_N = '1' and X_N = '0' ) then
		err_North_grant_N <= '1';
	else 
		err_North_grant_N <= '0';	
	end if;
end process;

process (state, req_X_E, state_in)
begin 
	if (state = East and req_X_E = '1' and state_in /= East) then
		err_East_Req_E <= '1';
	else 
		err_East_Req_E <= '0';	
	end if;
end process;

process (state, req_X_E, X_E)
begin 
	if ( state = East and req_X_E = '1' and X_E = '0' ) then
		err_East_grant_E <= '1';
	else 
		err_East_grant_E <= '0';	
	end if;
end process;


process (state, req_X_W, state_in)
begin 
	if (state = West and req_X_W = '1' and state_in /= West) then
		err_West_Req_W <= '1';
	else 
		err_West_Req_W <= '0';	
	end if;
end process;

process (state, req_X_W, X_W)
begin 
	if ( state = West and req_X_W = '1' and X_W = '0' ) then
		err_West_grant_W <= '1';
	else 
		err_West_grant_W <= '0';	
	end if;
end process;


process (state, req_X_S, state_in)
begin 
	if (state = South and req_X_S = '1' and state_in /= South) then
		err_South_Req_S <= '1';
	else 
		err_South_Req_S <= '0';	
	end if;
end process;

process (state, req_X_S, X_S)
begin 
	if ( state = South and req_X_S = '1' and X_S = '0' ) then
		err_South_grant_S <= '1';
	else 
		err_South_grant_S <= '0';	
	end if;
end process;


-- Local is a bit different (including others case)
process (state, req_X_L, state_in)
begin 
	if ( state /= IDLE and state /= North and state /=East and state /= West and state /= South and 
		 req_X_L = '1' and state_in /= Local) then
		err_Local_Req_L <= '1';
	else 
		err_Local_Req_L <= '0';	
	end if;
end process;

process (state, req_X_L, X_L)
begin 
	if ( state /= IDLE and state /= North and state /=East and state /= West and state /= South and 
		 req_X_L = '1' and X_L = '0' ) then
		err_Local_grant_L <= '1';
	else 
		err_Local_grant_L <= '0';	
	end if;
end process;

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Round 2
--checked

process (state, req_X_N, req_X_E, state_in)
begin 
	if ( state = IDLE and req_X_N = '0' and req_X_E = '1' and state_in /= East) then
		err_IDLE_Req_E <= '1';
	else 
		err_IDLE_Req_E <= '0';	
	end if;
end process;

process (state, req_X_N, req_X_E, X_E)
begin 
	if ( state = IDLE and req_X_N = '0' and req_X_E = '1' and X_E = '0' ) then
		err_IDLE_grant_E <= '1';
	else 
		err_IDLE_grant_E <= '0';	
	end if;
end process;


process (state, req_X_N, req_X_E, state_in)
begin 
	if ( state = North and req_X_N = '0' and req_X_E = '1' and state_in /= East) then
		err_North_Req_E <= '1';
	else 
		err_North_Req_E <= '0';	
	end if;
end process;

process (state, req_X_N, req_X_E, X_E)
begin 
	if ( state = North and req_X_N = '0' and req_X_E = '1' and X_E = '0' ) then
		err_North_grant_E <= '1';
	else 
		err_North_grant_E <= '0';	
	end if;
end process;


process (state, req_X_E, req_X_W, state_in)
begin 
	if ( state = East and req_X_E = '0' and req_X_W = '1' and state_in /= West) then
		err_East_Req_W <= '1';
	else 
		err_East_Req_W <= '0';	
	end if;
end process;

process (state, req_X_E, req_X_W, X_W)
begin 
	if ( state = East and req_X_E = '0' and req_X_W = '1' and X_W = '0' ) then
		err_East_grant_W <= '1';
	else 
		err_East_grant_W <= '0';	
	end if;
end process;


process (state, req_X_W, req_X_S, state_in)
begin 
	if ( state = West and req_X_W = '0' and req_X_S = '1' and state_in /= South) then
		err_West_Req_S <= '1';
	else 
		err_West_Req_S <= '0';	
	end if;
end process;

process (state, req_X_W, req_X_S, X_S)
begin 
	if ( state = West and req_X_W = '0' and req_X_S = '1' and X_S = '0' ) then
		err_West_grant_S <= '1';
	else 
		err_West_grant_S <= '0';	
	end if;
end process;

-- Shall I consider local for this case or the others case ? I guess local, according to the previous checkers
-- for the router with CTS/RTS handshaking Flow Control
process (state, req_X_S, req_X_L, state_in)
begin 
	if ( state = South and req_X_S = '0' and req_X_L = '1' and state_in /= Local) then
		err_South_Req_L <= '1';
	else 
		err_South_Req_L <= '0';	
	end if;
end process;

process (state, req_X_S, req_X_L, X_L)
begin 
	if ( state = South and req_X_S = '0' and req_X_L = '1' and X_L = '0' ) then
		err_South_grant_L <= '1';
	else 
		err_South_grant_L <= '0';	
	end if;
end process;

-- Local and invalid states (others case)

process (state, req_X_L, req_X_N, state_in)
begin 
	if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and 
		 req_X_L = '0' and req_X_N = '1' and state_in /= North) then
		err_Local_Req_N <= '1';
	else 
		err_Local_Req_N <= '0';	
	end if;
end process;

process (state, req_X_L, req_X_N, X_N)
begin 
	if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and 
		 req_X_L = '0' and req_X_N = '1' and X_N = '0' ) then
		err_Local_grant_N <= '1';
	else 
		err_Local_grant_N <= '0';	
	end if;
end process;

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Round 3

process (state, req_X_N, req_X_E, req_X_W, state_in)
begin 
	if (state = IDLE and req_X_N = '0' and req_X_E = '0' and req_X_W = '1' and state_in /= West) then
		err_IDLE_Req_W <= '1';
	else 
		err_IDLE_Req_W <= '0';	
	end if;
end process;

process (state, req_X_N, req_X_E, req_X_W, X_W)
begin 
	if ( state = IDLE and req_X_N = '0' and req_X_E = '0' and req_X_W = '1' and X_W = '0' ) then
		err_IDLE_grant_W <= '1';
	else 
		err_IDLE_grant_W <= '0';	
	end if;
end process;


process (state, req_X_N, req_X_E, req_X_W, state_in)
begin 
	if (state = North and req_X_N = '0' and req_X_E = '0' and req_X_W = '1' and state_in /= West) then
		err_North_Req_W <= '1';
	else 
		err_North_Req_W <= '0';	
	end if;
end process;

process (state, req_X_N, req_X_E, req_X_W, X_W)
begin 
	if ( state = North and req_X_N = '0' and req_X_E = '0' and req_X_W = '1' and X_W = '0' ) then
		err_North_grant_W <= '1';
	else 
		err_North_grant_W <= '0';	
	end if;
end process;


process (state, req_X_E, req_X_W, req_X_S, state_in)
begin 
	if (state = East and req_X_E = '0' and req_X_W = '0' and req_X_S = '1' and state_in /= South) then
		err_East_Req_S <= '1';
	else 
		err_East_Req_S <= '0';	
	end if;
end process;

process (state, req_X_E, req_X_W, req_X_S, X_S)
begin 
	if ( state = East and req_X_E = '0' and req_X_W = '0' and req_X_S = '1' and X_S = '0' ) then
		err_East_grant_S <= '1';
	else 
		err_East_grant_S <= '0';	
	end if;
end process;


process (state, req_X_W, req_X_S, req_X_L, state_in)
begin 
	if (state = West and req_X_W = '0' and req_X_S = '0' and req_X_L = '1' and state_in /= Local) then
		err_West_Req_L <= '1';
	else 
		err_West_Req_L <= '0';	
	end if;
end process;

process (state, req_X_W, req_X_S, req_X_L, X_L)
begin 
	if ( state = West and req_X_W = '0' and req_X_S = '0' and req_X_L = '1' and X_L = '0' ) then
		err_West_grant_L <= '1';
	else 
		err_West_grant_L <= '0';	
	end if;
end process;


process (state, req_X_S, req_X_L, req_X_N, state_in)
begin 
	if (state = South and req_X_S = '0' and req_X_L = '0' and req_X_N = '1' and state_in /= North) then
		err_South_Req_N <= '1';
	else 
		err_South_Req_N <= '0';	
	end if;
end process;

process (state, req_X_S, req_X_L, req_X_N, X_N)
begin 
	if ( state = South and req_X_S = '0' and req_X_L = '0' and req_X_N = '1' and X_N = '0' ) then
		err_South_grant_N <= '1';
	else 
		err_South_grant_N <= '0';	
	end if;
end process;


-- Local and invalid state(s) (others case)
process (state, req_X_L, req_X_N, req_X_E, state_in)
begin 
	if (state /= IDLE and state /= North and state /=East and state /=West and state /= South and 
		req_X_L = '0' and req_X_N = '0' and req_X_E = '1' and state_in /= East) then
		err_Local_Req_E <= '1';
	else 
		err_Local_Req_E <= '0';	
	end if;
end process;

process (state, req_X_L, req_X_N, req_X_E, X_E)
begin 
	if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and 
		 req_X_L = '0' and req_X_N = '0' and req_X_E = '1' and X_E = '0' ) then
		err_Local_grant_E <= '1';
	else 
		err_Local_grant_E <= '0';	
	end if;
end process;

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Round 4

process (state, req_X_N, req_X_E, req_X_W, req_X_S, state_in)
begin 
	if ( state = IDLE and req_X_N = '0' and req_X_E = '0' and req_X_W = '0' and req_X_S = '1' and 
		 state_in /= South) then
		err_IDLE_Req_S <= '1';
	else 
		err_IDLE_Req_S <= '0';	
	end if;
end process;

process (state, req_X_N, req_X_E, req_X_W, req_X_S, X_S)
begin 
	if ( state = IDLE and req_X_N = '0' and req_X_E = '0' and req_X_W = '0' and req_X_S = '1' and 
		 X_S = '0') then
		err_IDLE_grant_S <= '1';
	else 
		err_IDLE_grant_S <= '0';	
	end if;
end process;


process (state, req_X_N, req_X_E, req_X_W, req_X_S, state_in)
begin 
	if ( state = North and req_X_N = '0' and req_X_E = '0' and req_X_W = '0' and req_X_S = '1' and 
		 state_in /= South) then
		err_North_Req_S <= '1';
	else 
		err_North_Req_S <= '0';	
	end if;
end process;

process (state, req_X_N, req_X_E, req_X_W, req_X_S, X_S)
begin 
	if ( state = North and req_X_N = '0' and req_X_E = '0' and req_X_W = '0' and req_X_S = '1' and 
		 X_S = '0') then
		err_North_grant_S <= '1';
	else 
		err_North_grant_S <= '0';	
	end if;
end process;


process (state, req_X_E, req_X_W, req_X_S, req_X_L, state_in)
begin 
	if ( state = East and req_X_E = '0' and req_X_W = '0' and req_X_S = '0' and req_X_L = '1' and 
		 state_in /= Local) then
		err_East_Req_L <= '1';
	else 
		err_East_Req_L <= '0';	
	end if;
end process;

process (state, req_X_E, req_X_W, req_X_S, req_X_L, X_L)
begin 
	if ( state = East and req_X_E = '0' and req_X_W = '0' and req_X_S = '0' and req_X_L = '1' and 
		 X_L = '0') then
		err_East_grant_L <= '1';
	else 
		err_East_grant_L <= '0';	
	end if;
end process;


process (state, req_X_W, req_X_S, req_X_L, req_X_N, state_in)
begin 
	if ( state = West and req_X_W = '0' and req_X_S = '0' and req_X_L = '0' and req_X_N = '1' and 
		 state_in /= North) then
		err_West_Req_N <= '1';
	else 
		err_West_Req_N <= '0';	
	end if;
end process;

process (state, req_X_W, req_X_S, req_X_L, req_X_N, X_N)
begin 
	if ( state = West and req_X_W = '0' and req_X_S = '0' and req_X_L = '0' and req_X_N = '1' and 
		 X_N = '0') then
		err_West_grant_N <= '1';
	else 
		err_West_grant_N <= '0';	
	end if;
end process;

process (state, req_X_S, req_X_L, req_X_N, req_X_E, state_in)
begin 
	if ( state = South and req_X_S = '0' and req_X_L = '0' and req_X_N = '0' and req_X_E = '1' and 
		 state_in /= East) then
		err_South_Req_E <= '1';
	else 
		err_South_Req_E <= '0';	
	end if;
end process;

process (state, req_X_S, req_X_L, req_X_N, req_X_E, X_E)
begin 
	if ( state = South and req_X_S = '0' and req_X_L = '0' and req_X_N = '0' and req_X_E = '1' and 
		 X_E = '0') then
		err_South_grant_E <= '1';
	else 
		err_South_grant_E <= '0';	
	end if;
end process;


-- Local state or invalid state(s) (others case)
process (state, req_X_L, req_X_N, req_X_E, req_X_W, state_in)
begin 
	if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and 
		 req_X_L = '0' and req_X_N = '0' and req_X_E = '0' and req_X_W = '1' and 
		 state_in /= West) then
		err_Local_Req_W <= '1';
	else 
		err_Local_Req_W <= '0';	
	end if;
end process;

process (state, req_X_L, req_X_N, req_X_E, req_X_W, X_W)
begin 
	if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and 
		 req_X_L = '0' and req_X_N = '0' and req_X_E = '0' and req_X_W = '1' and 
		 X_W = '0') then
		err_Local_grant_W <= '1';
	else 
		err_Local_grant_W <= '0';	
	end if;
end process;

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Round 5

process (state, req_X_N, req_X_E, req_X_W, req_X_S, req_X_L, state_in)
begin 
	if ( state = IDLE and req_X_N = '0' and req_X_E = '0' and req_X_W = '0' and req_X_S = '0' and req_X_L = '1' 
		and state_in /= Local) then
		err_IDLE_Req_L <= '1';
	else 
		err_IDLE_Req_L <= '0';	
	end if;
end process;

process (state, req_X_N, req_X_E, req_X_W, req_X_S, req_X_L, X_L)
begin 
	if ( state = IDLE and req_X_N = '0' and req_X_E = '0' and req_X_W = '0' and req_X_S = '0' and req_X_L = '1' and 
		 X_L = '0' ) then
		err_IDLE_grant_L <= '1';
	else 
		err_IDLE_grant_L <= '0';	
	end if;
end process;


process (state, req_X_N, req_X_E, req_X_W, req_X_S, req_X_L, state_in)
begin 
	if ( state = North and req_X_N = '0' and req_X_E = '0' and req_X_W = '0' and req_X_S = '0' and req_X_L = '1' 
		and state_in /= Local) then
		err_North_Req_L <= '1';
	else 
		err_North_Req_L <= '0';	
	end if;
end process;

process (state, req_X_N, req_X_E, req_X_W, req_X_S, req_X_L, X_L)
begin 
	if ( state = North and req_X_N = '0' and req_X_E = '0' and req_X_W = '0' and req_X_S = '0' and req_X_L = '1' and 
		 X_L = '0' ) then
		err_North_grant_L <= '1';
	else 
		err_North_grant_L <= '0';	
	end if;
end process;


process (state, req_X_E, req_X_W, req_X_S, req_X_L, req_X_N, state_in)
begin 
	if ( state = East and req_X_E = '0' and req_X_W = '0' and req_X_S = '0' and req_X_L = '0' and req_X_N = '1' and 
		 state_in /= North) then
		err_East_Req_N <= '1';
	else 
		err_East_Req_N <= '0';	
	end if;
end process;

process (state, req_X_E, req_X_W, req_X_S, req_X_L, req_X_N, X_N)
begin 
	if ( state = East and req_X_E = '0' and req_X_W = '0' and req_X_S = '0' and req_X_L = '0' and req_X_N = '1' and 
		 X_N = '0' ) then
		err_East_grant_N <= '1';
	else 
		err_East_grant_N <= '0';	
	end if;
end process;


process (state, req_X_W, req_X_S, req_X_L, req_X_N, req_X_E, state_in)
begin 
	if ( state = West and req_X_W = '0' and req_X_S = '0' and req_X_L = '0' and req_X_N = '0' and req_X_E = '1' and 
		 state_in /= East) then
		err_West_Req_E <= '1';
	else 
		err_West_Req_E <= '0';	
	end if;
end process;

process (state, req_X_W, req_X_S, req_X_L, req_X_N, req_X_E, X_E)
begin 
	if ( state = West and req_X_W = '0' and req_X_S = '0' and req_X_L = '0' and req_X_N = '0' and req_X_E = '1' and 
		 X_E = '0' ) then
		err_West_grant_E <= '1';
	else 
		err_West_grant_E <= '0';	
	end if;
end process;


process (state, req_X_S, req_X_L, req_X_N, req_X_E, req_X_W, state_in)
begin 
	if ( state = South and req_X_S = '0' and req_X_L = '0' and req_X_N = '0' and req_X_E = '0' and req_X_W = '1' and 
		 state_in /= West) then
		err_South_Req_W <= '1';
	else 
		err_South_Req_W <= '0';	
	end if;
end process;

process (state, req_X_S, req_X_L, req_X_N, req_X_E, req_X_W, X_W)
begin 
	if ( state = South and req_X_S = '0' and req_X_L = '0' and req_X_N = '0' and req_X_E = '0' and req_X_W = '1' and 
		 X_W = '0' ) then
		err_South_grant_W <= '1';
	else 
		err_South_grant_W <= '0';
	end if;
end process;

-- Local state or invalid state(s) (others case)

process (state, req_X_L, req_X_N, req_X_E, req_X_W, req_X_S, state_in)
begin 
	if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and 
		 req_X_L = '0' and req_X_N = '0' and req_X_E = '0' and req_X_W = '0' and req_X_S = '1' and 
		 state_in /= South) then
		err_Local_Req_S <= '1';
	else 
		err_Local_Req_S <= '0';	
	end if;
end process;

process (state, req_X_L, req_X_N, req_X_E, req_X_W, req_X_S, X_S)
begin 
	if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and 
		 req_X_L = '0' and req_X_N = '0' and req_X_E = '0' and req_X_W = '0' and req_X_S = '1' and 
		 X_S = '0' ) then
		err_Local_grant_S <= '1';
	else 
		err_Local_grant_S <= '0';
	end if;
end process;

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

process (state_in)
begin
	if (state_in /= IDLE and state_in /= North and state_in /= East and state_in /= West and 
		state_in /= South and state_in /= Local) then
		err_state_in_onehot <= '1';
	else 
		err_state_in_onehot <= '0';
	end if;
end process;

process (Requests, Grants)
begin
	if ( Requests = "00000" and Grants /= "00000") then
		err_no_request_grants <= '1';
	else 
		err_no_request_grants <= '0';
	end if;
end process;

process (Requests, Grants)
begin
	if ( Requests /= "00000" and Grants = "00000") then
		err_request_no_grants <= '1';
	else 
		err_request_no_grants <= '0';
	end if;
end process;

process (req_X_N, X_N)
begin
	if (req_X_N = '0' and X_N = '1') then
		err_no_Req_N_grant_N <= '1';
	else 
		err_no_Req_N_grant_N <= '0';
	end if;
end process;

process (req_X_E, X_E)
begin
	if (req_X_E = '0' and X_E = '1') then
		err_no_Req_E_grant_E <= '1';
	else 
		err_no_Req_E_grant_E <= '0';
	end if;
end process;

process (req_X_W, X_W)
begin
	if (req_X_W = '0' and X_W = '1') then
		err_no_Req_W_grant_W <= '1';
	else 
		err_no_Req_W_grant_W <= '0';
	end if;
end process;

process (req_X_S, X_S)
begin
	if (req_X_S = '0' and X_S = '1') then
		err_no_Req_S_grant_S <= '1';
	else 
		err_no_Req_S_grant_S <= '0';
	end if;
end process;

process (req_X_L, X_L)
begin
	if (req_X_L = '0' and X_L = '1') then
		err_no_Req_L_grant_L <= '1';
	else 
		err_no_Req_L_grant_L <= '0';
	end if;
end process;



end behavior;