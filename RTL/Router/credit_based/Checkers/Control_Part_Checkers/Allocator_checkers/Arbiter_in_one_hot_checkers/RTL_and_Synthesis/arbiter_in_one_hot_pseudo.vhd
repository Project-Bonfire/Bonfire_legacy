--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

-- Is this like the old arbiter in the router with handshaking FC ??
entity arbiter_in_one_hot_pseudo is
    port (  req_X_N, req_X_E, req_X_W, req_X_S, req_X_L:in std_logic; -- From LBDR modules
    	    state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter_in's FSM

            X_N, X_E, X_W, X_S, X_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            state_in: out std_logic_vector (5 downto 0) -- 6 states for Arbiter's FSM
            );
end;

architecture behavior of arbiter_in_one_hot_pseudo is

 CONSTANT IDLE: std_logic_vector (5 downto 0) := "000001";
 CONSTANT Local: std_logic_vector (5 downto 0) := "000010";
 CONSTANT North: std_logic_vector (5 downto 0) := "000100";
 CONSTANT East: std_logic_vector (5 downto 0) := "001000";
 CONSTANT West: std_logic_vector (5 downto 0) := "010000";
 CONSTANT South: std_logic_vector (5 downto 0) := "100000";

begin

-- anything below here is pure combinational

process(state, req_X_N, req_X_E, req_X_W, req_X_S, req_X_L)
begin

    X_N <= '0';
    X_E <= '0';
    X_W <= '0';
    X_S <= '0';
    X_L <= '0';

    case state is

      when IDLE => -- In the arbiter for hand-shaking FC router, L had the  highest priority (L, N, E, W, S)
      			   -- Here it seems N has the higest priority, am I correct ?
      	if req_X_N ='1'  then
      		state_in <= North;
        	X_N <= '1';
	    elsif req_X_E = '1' then
	    	state_in <= East;
	        X_E <= '1';
	    elsif req_X_W = '1' then
	    	state_in <= West;
	        X_W <= '1';
	    elsif req_X_S = '1' then
	    	state_in <= South;
	        X_S <= '1';
	    elsif req_X_L = '1' then
	    	state_in <= Local;
	        X_L <= '1';
	    else
	    	state_in <= state;
	    end if;

      when North =>
      	if req_X_N ='1'  then
      		state_in <= North;
        	X_N <= '1';
	    elsif req_X_E = '1' then
	    	state_in <= East;
	        X_E <= '1';
	    elsif req_X_W = '1' then
	    	state_in <= West;
	        X_W <= '1';
	    elsif req_X_S = '1' then
	    	state_in <= South;
	        X_S <= '1';
	    elsif req_X_L = '1' then
	    	state_in <= Local;
	        X_L <= '1';
	    else
	    	state_in <= state;
	    end if;

      when East =>
	    if req_X_E = '1' then
	    	state_in <= East;
	        X_E <= '1';
	    elsif req_X_W = '1' then
	    	state_in <= West;
	        X_W <= '1';
	    elsif req_X_S = '1' then
	    	state_in <= South;
	        X_S <= '1';
	    elsif req_X_L = '1' then
	    	state_in <= Local;
	        X_L <= '1';
	    elsif req_X_N ='1'  then
      		state_in <= North;
        	X_N <= '1';
	    else
	    	state_in <= state;
	    end if;

      when West =>
	    if req_X_W = '1' then
	    	state_in <= West;
	        X_W <= '1';
	    elsif req_X_S = '1' then
	    	state_in <= South;
	        X_S <= '1';
	    elsif req_X_L = '1' then
	    	state_in <= Local;
	        X_L <= '1';
	    elsif req_X_N ='1'  then
      		state_in <= North;
        	X_N <= '1';
        elsif req_X_E = '1' then
	    	state_in <= East;
	        X_E <= '1';
	    else
	    	state_in <= state;
	    end if;

      when South =>
	    if req_X_S = '1' then
	    	state_in <= South;
	        X_S <= '1';
	    elsif req_X_L = '1' then
	    	state_in <= Local;
	        X_L <= '1';
	    elsif req_X_N ='1'  then
      		state_in <= North;
        	X_N <= '1';
        elsif req_X_E = '1' then
	    	state_in <= East;
	        X_E <= '1';
	    elsif req_X_W = '1' then
	    	state_in <= West;
	        X_W <= '1';
	    else
	    	state_in <= state;
	    end if;

      when others => -- Local state and invalid states
	    if req_X_L = '1' then
	    	state_in <= Local;
	        X_L <= '1';
	    elsif req_X_N ='1'  then
      		state_in <= North;
        	X_N <= '1';
        elsif req_X_E = '1' then
	    	state_in <= East;
	        X_E <= '1';
	    elsif req_X_W = '1' then
	    	state_in <= West;
	        X_W <= '1';
	    elsif req_X_S = '1' then
	    	state_in <= South;
	        X_S <= '1';
	    else
	    	state_in <= state;
	    end if;

    end case;

end process;
end;
