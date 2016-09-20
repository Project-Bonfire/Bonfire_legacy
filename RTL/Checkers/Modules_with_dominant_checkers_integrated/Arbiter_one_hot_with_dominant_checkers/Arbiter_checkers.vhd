library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Arbiter_checkers is
    port (  
            Req_N, Req_E, Req_W, Req_S, Req_L :in std_logic;
            DCTS: in std_logic; 
            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L: in std_logic;
            Xbar_sel : in std_logic_vector(4 downto 0);
            state: in std_logic_vector (5 downto 0);
            state_in: in std_logic_vector (5 downto 0);
            next_state_out: in std_logic_vector (5 downto 0);
            RTS_FF: in std_logic;
            RTS_FF_in: in std_logic;

            -- Checker outputs
			err_state_IDLE_xbar,
			err_state_not_IDLE_xbar,
			err_state_IDLE_RTS_FF_in, 
			err_state_not_IDLE_RTS_FF_RTS_FF_in,
			err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in, 
			err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in, 
			err_RTS_FF_not_DCTS_state_state_in, 
			err_not_RTS_FF_state_in_next_state, 
			err_RTS_FF_DCTS_state_in_next_state, 
			err_not_DCTS_Grants, 
			err_DCTS_not_RTS_FF_Grants, 
			err_DCTS_RTS_FF_IDLE_Grants, 
			err_DCTS_RTS_FF_not_IDLE_Grants_onehot, 
			err_Requests_next_state_IDLE, 
			err_IDLE_Req_L, 
			err_Local_Req_L,
			err_North_Req_N, 
			--err_East_Req_E, 
			--err_West_Req_W, 
			--err_South_Req_S, 
			err_IDLE_Req_N, 
			err_Local_Req_N,			
			--err_North_Req_E, 
			--err_East_Req_W, 
			--err_West_Req_S, 
			err_South_Req_L, 
			--err_IDLE_Req_E,
			--err_Local_Req_E,			
			--err_North_Req_W,
			--err_East_Req_S,
			err_West_Req_L,
			err_South_Req_N,
			--err_IDLE_Req_W,
			--err_Local_Req_W,
			--err_North_Req_S,
			err_East_Req_L,
			err_West_Req_N,
			--err_South_Req_E,
			--err_IDLE_Req_S,
			--err_Local_Req_S,			
			--err_North_Req_L,
			err_East_Req_N,
			--err_West_Req_E,
			--err_South_Req_W,
			err_next_state_onehot, 
			err_state_in_onehot, 
			--err_DCTS_RTS_FF_state_Grant_L,
			--err_DCTS_RTS_FF_state_Grant_N,
			--err_DCTS_RTS_FF_state_Grant_E,
			--err_DCTS_RTS_FF_state_Grant_W,
			--err_DCTS_RTS_FF_state_Grant_S, 
			err_state_north_xbar_sel, 
			err_state_east_xbar_sel, 
			err_state_west_xbar_sel, 
			err_state_south_xbar_sel : out std_logic 
			--err_state_local_xbar_sel : out std_logic
            );
end Arbiter_checkers;

architecture behavior of Arbiter_checkers is

CONSTANT IDLE: std_logic_vector (5 downto 0) := "000001";
CONSTANT Local: std_logic_vector (5 downto 0) := "000010";
CONSTANT North: std_logic_vector (5 downto 0) := "000100";
CONSTANT East: std_logic_vector (5 downto 0) := "001000";
CONSTANT West: std_logic_vector (5 downto 0) := "010000";
CONSTANT South: std_logic_vector (5 downto 0) := "100000";
SIGNAL   Requests: std_logic_vector (4 downto 0);
SIGNAL   Grants: std_logic_vector (4 downto 0);

begin 

Requests <= Req_N & Req_E & Req_W & Req_S & Req_L;
Grants   <= Grant_N & Grant_E & Grant_W & Grant_S & Grant_L;

-- Checkers
--checked
process (Xbar_sel, state)
begin
	if (state = IDLE and Xbar_sel /= "00000") then
		err_state_IDLE_xbar <= '1';
	else 
		err_state_IDLE_xbar <= '0';		
	end if;
end process;
--checked
process (state, Xbar_sel)
begin
	if ( state /= IDLE and 
		 Xbar_sel /= "00001" and Xbar_sel /= "00010" and Xbar_sel /= "00100" and Xbar_sel /= "01000" and Xbar_sel /= "10000") then
		err_state_not_IDLE_xbar <= '1';
	else 
		err_state_not_IDLE_xbar <= '0';		
	end if;
end process;
--checked
process (state, RTS_FF_in)
begin
	if (state = IDLE and RTS_FF_in = '1') then
		err_state_IDLE_RTS_FF_in <= '1';
	else 
		err_state_IDLE_RTS_FF_in <= '0';
	end if;		
end process;
--checked
process (state, RTS_FF, RTS_FF_in)
begin
	if ( (state = North or state = East or state = West or state = South or state = Local) and RTS_FF = '0' and RTS_FF = '0' and RTS_FF_in = '0') then
		err_state_not_IDLE_RTS_FF_RTS_FF_in <= '1';
	else 
		err_state_not_IDLE_RTS_FF_RTS_FF_in <= '0';	
	end if;		
end process;

--checked
process (state, DCTS, RTS_FF, RTS_FF_in)
begin
	if ( (state = North or state = East or state = West or state = South or state = Local) and RTS_FF = '1' and DCTS = '1' and RTS_FF_in = '1') then
		err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in <= '1';
	else 
		err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in <= '0';	
	end if;		
end process;

--checked
process (state, DCTS, RTS_FF, RTS_FF_in)
begin
	if ( (state = North or state = East or state = West or state = South or state = Local) and RTS_FF = '1' and DCTS = '0' and RTS_FF_in = '0') then
		err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in <= '1';
	else 
		err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in <= '0';
	end if;			
end process;
--checked
process (RTS_FF, DCTS, state, state_in)
begin
	if (RTS_FF = '1' and DCTS = '0' and state /= state_in) then
		err_RTS_FF_not_DCTS_state_state_in <= '1';
	else
		err_RTS_FF_not_DCTS_state_state_in <= '0';
	end if;	 
end process;
--checked
process (RTS_FF, state_in, next_state_out)
begin
	if (RTS_FF = '0' and state_in /= next_state_out) then
		err_not_RTS_FF_state_in_next_state <= '1';
	else
		err_not_RTS_FF_state_in_next_state <= '0';
	end if;	 
end process;
--checked
process (RTS_FF, DCTS, state_in, next_state_out)
begin
	if (RTS_FF = '1' and DCTS = '1' and state_in /= next_state_out) then
		err_RTS_FF_DCTS_state_in_next_state <= '1';
	else
		err_RTS_FF_DCTS_state_in_next_state <= '0';
	end if;	 
end process;
--checked
process (RTS_FF, Grants)
begin
	if (RTS_FF = '0' and Grants /= "00000") then
		err_not_DCTS_Grants <= '1';
	else
		err_not_DCTS_Grants <= '0';
	end if;	 
end process;
--checked
process (DCTS, RTS_FF, Grants)
begin
	if (RTS_FF = '1' and DCTS = '0' and Grants /= "00000") then
		err_DCTS_not_RTS_FF_Grants <= '1';
	else
		err_DCTS_not_RTS_FF_Grants <= '0';
	end if;	 
end process;
--checked
process (DCTS, RTS_FF, state, Grants)
begin
	if (DCTS = '1' and RTS_FF = '1' and state = IDLE and Grants /= "00000") then
		err_DCTS_RTS_FF_IDLE_Grants <= '1';
	else
		err_DCTS_RTS_FF_IDLE_Grants <= '0';
	end if;	 
end process;
--checked
process (DCTS, RTS_FF, state, Grants)
begin
	if (DCTS = '1' and RTS_FF = '1' and state /= IDLE and 
		Grants /= "00001" and Grants /= "00010" and Grants /= "00100" and Grants /= "01000" and Grants /= "10000") then

		err_DCTS_RTS_FF_not_IDLE_Grants_onehot <= '1';
	else
		err_DCTS_RTS_FF_not_IDLE_Grants_onehot <= '0';
	end if;	 
end process;

--checked
process (state, Requests, next_state_out)
begin 
	if ( (state = North or state = East or state = West or state = South or state = Local or state = IDLE) and Requests = "00000" and next_state_out /= IDLE ) then
		err_Requests_next_state_IDLE <= '1';
	else
		err_Requests_next_state_IDLE <= '0';
	end if;
end process;
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Round 1
--checked

process (state, Req_L, next_state_out)
begin 
	if ( state = IDLE and Req_L = '1' and next_state_out /= Local) then
		err_IDLE_Req_L <= '1';
	else 
		err_IDLE_Req_L <= '0';	
	end if;
end process;

process (state, Req_L, next_state_out)
begin 
	if ( state /= IDLE and state /= North and state /=East and state /= West and state /= South and Req_L = '1' and next_state_out /= Local) then
		err_Local_Req_L <= '1';
	else 
		err_Local_Req_L <= '0';	
	end if;
end process;
--checked
process (state, Req_N, next_state_out)
begin 
	if (state = North and Req_N = '1' and next_state_out /= North) then
		err_North_Req_N <= '1';
	else 
		err_North_Req_N <= '0';	
	end if;
end process;
----checked
--process (state, Req_E, next_state_out)
--begin 
--	if (state = East and Req_E = '1' and next_state_out /= East) then
--		err_East_Req_E <= '1';
--	else 
--		err_East_Req_E <= '0';	
--	end if;
--end process;
----checked
--process (state, Req_W, next_state_out)
--begin 
--	if (state = West and Req_W = '1' and next_state_out /= West) then
--		err_West_Req_W <= '1';
--	else 
--		err_West_Req_W <= '0';	
--	end if;
--end process;
----checked
--process (state, Req_S, next_state_out)
--begin 
--	if (state = South and Req_S = '1' and next_state_out /= South) then
--		err_South_Req_S <= '1';
--	else 
--		err_South_Req_S <= '0';	
--	end if;
--end process;
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Round 2
--checked

process (state, Req_L, Req_N, next_state_out)
begin 
	if ( state = IDLE and Req_L = '0' and Req_N = '1' and next_state_out /= North) then
		err_IDLE_Req_N <= '1';
	else 
		err_IDLE_Req_N <= '0';	
	end if;
end process;

process (state, Req_L, Req_N, next_state_out)
begin 
	if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and Req_L = '0' and Req_N = '1' and next_state_out /= North) then
		err_Local_Req_N <= '1';
	else 
		err_Local_Req_N <= '0';	
	end if;
end process;
----checked
--process (state, Req_N, Req_E, next_state_out)
--begin 
--	if (state = North and Req_N = '0' and Req_E = '1' and next_state_out /= East) then
--		err_North_Req_E <= '1';
--	else 
--		err_North_Req_E <= '0';	
--	end if;
--end process;

--process (state, Req_E, Req_W, next_state_out)
--begin 
--	if (state = East and Req_E = '0' and Req_W = '1' and next_state_out /= West) then
--		err_East_Req_W <= '1';
--	else 
--		err_East_Req_W <= '0';	
--	end if;
--end process;

--process (state, Req_W, Req_S, next_state_out)
--begin 
--	if (state = West and Req_W = '0' and Req_S = '1' and next_state_out /= South) then
--		err_West_Req_S <= '1';
--	else 
--		err_West_Req_S <= '0';	
--	end if;
--end process;

process (state, Req_S, Req_L, next_state_out)
begin 
	if (state = South and Req_S = '0' and Req_L = '1' and next_state_out /= Local) then
		err_South_Req_L <= '1';
	else 
		err_South_Req_L <= '0';	
	end if;
end process;
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Round 3

--process (state, Req_L, Req_N, Req_E, next_state_out)
--begin 
--	if ( state = IDLE and Req_L = '0' and Req_N = '0' and Req_E = '1' and next_state_out /= East) then
--		err_IDLE_Req_E <= '1';
--	else 
--		err_IDLE_Req_E <= '0';	
--	end if;
--end process;

--process (state, Req_L, Req_N, Req_E, next_state_out)
--begin 
--	if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and 
--		 Req_L = '0' and Req_N = '0' and Req_E = '1' and next_state_out /= East) then
--		err_Local_Req_E <= '1';
--	else 
--		err_Local_Req_E <= '0';	
--	end if;
--end process;

--process (state, Req_N, Req_E, Req_W, next_state_out)
--begin 
--	if (state = North and Req_N = '0' and Req_E = '0' and Req_W = '1' and next_state_out /= West) then
--		err_North_Req_W <= '1';
--	else 
--		err_North_Req_W <= '0';	
--	end if;
--end process;

--process (state, Req_E, Req_W, Req_S, next_state_out)
--begin 
--	if (state = East and Req_E = '0' and Req_W = '0' and Req_S = '1' and next_state_out /= South) then
--		err_East_Req_S <= '1';
--	else 
--		err_East_Req_S <= '0';	
--	end if;
--end process;

process (state, Req_W, Req_S, Req_L, next_state_out)
begin 
	if (state = West and Req_W = '0' and Req_S = '0' and Req_L = '1' and next_state_out /= Local) then
		err_West_Req_L <= '1';
	else 
		err_West_Req_L <= '0';	
	end if;
end process;

process (state, Req_S, Req_L, Req_N, next_state_out)
begin 
	if (state = South and Req_S = '0' and Req_L = '0' and Req_N = '1' and next_state_out /= North) then
		err_South_Req_N <= '1';
	else 
		err_South_Req_N <= '0';	
	end if;
end process;
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Round 4

--process (state, Req_L, Req_N, Req_E, Req_W, next_state_out)
--begin 
--	if ( state = IDLE and Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '1' and next_state_out /= West) then
--		err_IDLE_Req_W <= '1';
--	else 
--		err_IDLE_Req_W <= '0';	
--	end if;
--end process;

--process (state, Req_L, Req_N, Req_E, Req_W, next_state_out)
--begin 
--	if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and 
--		 Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '1' and next_state_out /= West) then
--		err_Local_Req_W <= '1';
--	else 
--		err_Local_Req_W <= '0';	
--	end if;
--end process;

--process (state, Req_N, Req_E, Req_W, Req_S, next_state_out)
--begin 
--	if (state = North and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1' and next_state_out /= South) then
--		err_North_Req_S <= '1';
--	else 
--		err_North_Req_S <= '0';	
--	end if;
--end process;

process (state, Req_E, Req_W, Req_S, Req_L, next_state_out)
begin 
	if (state = East and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '1' and next_state_out /= Local) then
		err_East_Req_L <= '1';
	else 
		err_East_Req_L <= '0';	
	end if;
end process;

process (state, Req_W, Req_S, Req_L, Req_N, next_state_out)
begin 
	if (state = West and Req_W = '0' and Req_S = '0' and Req_L = '0' and Req_N = '1' and next_state_out /= North) then
		err_West_Req_N <= '1';
	else 
		err_West_Req_N <= '0';	
	end if;
end process;

--process (state, Req_S, Req_L, Req_N, Req_E, next_state_out)
--begin 
--	if (state = South and Req_S = '0' and Req_L = '0' and Req_N = '0' and Req_E = '1' and next_state_out /= East) then
--		err_South_Req_E <= '1';
--	else 
--		err_South_Req_E <= '0';	
--	end if;
--end process;
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Round 5

--process (state, Req_L, Req_N, Req_E, Req_W, Req_S, next_state_out)
--begin 
--	if ( state = IDLE and Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1' 
--		and next_state_out /= South) then
--		err_IDLE_Req_S <= '1';
--	else 
--		err_IDLE_Req_S <= '0';	
--	end if;
--end process;

--process (state, Req_L, Req_N, Req_E, Req_W, Req_S, next_state_out)
--begin 
--	if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and 
--		 Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1' 
--		and next_state_out /= South) then
--		err_Local_Req_S <= '1';
--	else 
--		err_Local_Req_S <= '0';	
--	end if;
--end process;

--process (state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out)
--begin 
--	if (state = North and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '1' 
--		and next_state_out /= Local) then
--		err_North_Req_L <= '1';
--	else 
--		err_North_Req_L <= '0';	
--	end if;
--end process;

process (state, Req_E, Req_W, Req_S, Req_L, Req_N, next_state_out)
begin 
	if (state = East and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '0' and Req_N = '1' 
		and next_state_out /= North) then
		err_East_Req_N <= '1';
	else 
		err_East_Req_N <= '0';	
	end if;
end process;

--process (state, Req_W, Req_S, Req_L, Req_N, Req_E, next_state_out)
--begin 
--	if (state = West and Req_W = '0' and Req_S = '0' and Req_L = '0' and Req_N = '0' and Req_E = '1' 
--		and next_state_out /= East) then
--		err_West_Req_E <= '1';
--	else 
--		err_West_Req_E <= '0';	
--	end if;
--end process;

--process (state, Req_S, Req_L, Req_N, Req_E, Req_W, next_state_out)
--begin 
--	if (state = South and Req_S = '0' and Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '1' 
--		and next_state_out /= West) then
--		err_South_Req_W <= '1';
--	else 
--		err_South_Req_W <= '0';	
--	end if;
--end process;
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

process (next_state_out)
begin
	if (next_state_out /= IDLE and next_state_out /= North and next_state_out /= East and next_state_out /= West and 
		next_state_out /= South and next_state_out /= Local) then
		err_next_state_onehot <= '1';
	else 
		err_next_state_onehot <= '0';	
	end if;
end process;

process (state_in)
begin
	if (state_in /= IDLE and state_in /= North and state_in /= East and state_in /= West and 
		state_in /= South and state_in /= Local) then
		err_state_in_onehot <= '1';
	else 
		err_state_in_onehot <= '0';
	end if;
end process;

--process (DCTS, RTS_FF, state, Grant_L)
--begin
--	if (DCTS = '1' and RTS_FF = '1' and state /= IDLE and state /= North and state /=East and state /=West and 
--		state /= South and Grant_L = '0' ) then
--		err_DCTS_RTS_FF_state_Grant_L <= '1';
--	else
--		err_DCTS_RTS_FF_state_Grant_L <= '0';
--	end if;	 
--end process;

--process (DCTS, RTS_FF, state, Grant_N)
--begin
--	if (DCTS = '1' and RTS_FF = '1' and state = North and Grant_N = '0' ) then
--		err_DCTS_RTS_FF_state_Grant_N <= '1';
--	else
--		err_DCTS_RTS_FF_state_Grant_N <= '0';
--	end if;	 
--end process;

--process (DCTS, RTS_FF, state, Grant_E)
--begin
--	if (DCTS = '1' and RTS_FF = '1' and state = East and Grant_E = '0' ) then
--		err_DCTS_RTS_FF_state_Grant_E <= '1';
--	else
--		err_DCTS_RTS_FF_state_Grant_E <= '0';
--	end if;	 
--end process;

--process (DCTS, RTS_FF, state, Grant_W)
--begin
--	if (DCTS = '1' and RTS_FF = '1' and state = West and Grant_W = '0' ) then
--		err_DCTS_RTS_FF_state_Grant_W <= '1';
--	else
--		err_DCTS_RTS_FF_state_Grant_W <= '0';
--	end if;	 
--end process;

--process (DCTS, RTS_FF, state, Grant_S)
--begin
--	if (DCTS = '1' and RTS_FF = '1' and state = South and Grant_S = '0' ) then
--		err_DCTS_RTS_FF_state_Grant_S <= '1';
--	else
--		err_DCTS_RTS_FF_state_Grant_S <= '0';
--	end if;	 
--end process;

process (state, Xbar_sel)
begin
	if (state = North and Xbar_sel /= "00001" ) then
		err_state_north_xbar_sel <= '1';
	else
		err_state_north_xbar_sel <= '0';
	end if;	 
end process;

process (state, Xbar_sel)
begin
	if (state = East and Xbar_sel /= "00010" ) then
		err_state_east_xbar_sel <= '1';
	else
		err_state_east_xbar_sel <= '0';
	end if;	 
end process;

process (state, Xbar_sel)
begin
	if (state = West and Xbar_sel /= "00100" ) then
		err_state_west_xbar_sel <= '1';
	else
		err_state_west_xbar_sel <= '0';
	end if;	 
end process;

process (state, Xbar_sel)
begin
	if (state = South and Xbar_sel /= "01000" ) then
		err_state_south_xbar_sel <= '1';
	else
		err_state_south_xbar_sel <= '0';
	end if;	 
end process;

--process (state, Xbar_sel)
--begin
--	if (state /= IDLE and state /= North and state /= East and state /= West and state /= South and Xbar_sel /= "10000" ) then
--		err_state_local_xbar_sel <= '1';
--	else
--		err_state_local_xbar_sel <= '0';
--	end if;	 
--end process;

end behavior;