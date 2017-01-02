--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

-- Is this like the old arbiter in the router with handshaking FC ??
entity arbiter_in is
    port (  reset: in  std_logic;
            clk: in  std_logic;
            Req_X_N, Req_X_E, Req_X_W, Req_X_S, Req_X_L:in std_logic; -- From LBDR modules
            X_N, X_E, X_W, X_S, X_L:out std_logic -- Grants given to LBDR requests (encoded as one-hot)
            );
end;

architecture behavior of arbiter_in is

 
 TYPE STATE_TYPE IS (IDLE, North, East, West, South, Local);
 SIGNAL state, state_in   : STATE_TYPE := IDLE;

begin
process (clk, reset)begin
  if reset = '0' then
      state <= IDLE;
  elsif clk'event and clk ='1'then
      state <= state_in;
  end if;
end process;

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
      			   -- Here it seems N has the higest priority, is it fine ? 
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
      when others =>

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
