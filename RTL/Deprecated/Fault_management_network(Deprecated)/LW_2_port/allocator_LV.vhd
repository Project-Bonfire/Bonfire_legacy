--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity allocator_LV is      
     
    port (  reset: in  std_logic;
            clk: in  std_logic;
            -- flow control
            credit_in_E, credit_in_W, credit_in_L: in std_logic;

           
           	req_E_E, req_E_W, req_E_L: in std_logic;
           	req_W_E, req_W_W, req_W_L: in std_logic;
           	req_L_E, req_L_W, req_L_L: in std_logic;
           	

            empty_E, empty_W, empty_L: in std_logic;
           	-- grant_X_Y means the grant for X output port towards Y input port
           	-- this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
            valid_E, valid_W, valid_L : out std_logic;

           	grant_N_E, grant_N_W, grant_N_L: out std_logic;
           	grant_E_E, grant_E_W, grant_E_L: out std_logic;
           	grant_W_E, grant_W_W, grant_W_L: out std_logic;
           	grant_S_E, grant_S_W, grant_S_L: out std_logic;
           	grant_L_E, grant_L_W, grant_L_L: out std_logic
            );
end allocator_LV;

architecture behavior of allocator_LV is

-- so the idea is that we should have counters that keep track of credit!
signal credit_counter_E_in, credit_counter_E_out: std_logic;
signal credit_counter_W_in, credit_counter_W_out: std_logic;
signal credit_counter_L_in, credit_counter_L_out: std_logic;

signal grant_E, grant_W, grant_L: std_logic;

 

signal grant_E_E_sig, grant_E_W_sig, grant_E_L_sig: std_logic;
signal grant_W_E_sig, grant_W_W_sig, grant_W_L_sig: std_logic;
signal grant_L_E_sig, grant_L_W_sig, grant_L_L_sig: std_logic;
 

component arbiter_out_LV is
    port (  reset: in  std_logic;
            clk: in  std_logic;
            X_E_Y, X_W_Y, X_L_Y:in std_logic; -- From LBDR modules
            credit: in std_logic;
            grant_Y_E, grant_Y_W, grant_Y_L :out std_logic -- Grants given to LBDR requests (encoded as one-hot)
            );
end component;

begin 
  
-- sequential part
process(clk, reset)
begin
	if reset = '0' then 
		-- we start with all full cradit
		credit_counter_E_out <= '1';
		credit_counter_W_out <= '1';
		credit_counter_L_out <= '1';
	elsif clk'event and clk = '1' then 
		credit_counter_E_out <= credit_counter_E_in;
		credit_counter_W_out <= credit_counter_W_in;
		credit_counter_L_out <= credit_counter_L_in;

	end if;
end process;
 
-- The combionational part

grant_E_E <= grant_E_E_sig and not empty_E;
grant_E_W <= grant_E_W_sig and not empty_W;
grant_E_L <= grant_E_L_sig and not empty_L;

grant_W_E <= grant_W_E_sig and not empty_E;
grant_W_W <= grant_W_W_sig and not empty_W;
grant_W_L <= grant_W_L_sig and not empty_L;

grant_L_E <= grant_L_E_sig and not empty_E;
grant_L_W <= grant_L_W_sig and not empty_W;
grant_L_L <= grant_L_L_sig and not empty_L;
  
grant_E <=  (grant_E_E_sig and not empty_E) or (grant_E_W_sig and not empty_W) or (grant_E_L_sig and not empty_L);
grant_W <=  (grant_W_E_sig and not empty_E) or (grant_W_W_sig and not empty_W) or (grant_W_L_sig and not empty_L);
grant_L <=  (grant_L_E_sig and not empty_E) or (grant_L_W_sig and not empty_W) or (grant_L_L_sig and not empty_L);

-- this process handels the credit counters!
process(credit_in_E, credit_in_W, credit_in_L, grant_E, grant_W, grant_L,
		    credit_counter_E_out, credit_counter_W_out, credit_counter_L_out)
 begin
 	credit_counter_E_in <= credit_counter_E_out;
 	credit_counter_W_in <= credit_counter_W_out;
 	credit_counter_L_in <= credit_counter_L_out;


  if credit_in_E = '1'  and grant_E = '0' then 
    credit_counter_E_in <= '1';
  elsif credit_in_E = '0'  and grant_E = '1' then 
    credit_counter_E_in <= '0';
  end if;

  if credit_in_W = '1'  and grant_W = '0' then 
    credit_counter_W_in <= '1';
  elsif credit_in_W = '0'  and grant_W = '1' then 
    credit_counter_W_in <= '0';
  end if;

  if credit_in_L = '1'  and grant_L = '0' then 
    credit_counter_L_in <= '1';
  elsif credit_in_L = '0'  and grant_L = '1' then 
    credit_counter_L_in <= '0';
  end if;

 end process;

-- Y is E now
arb_X_E: arbiter_out_LV port map (reset => reset, clk => clk,
                               X_E_Y => req_E_E, X_W_Y => req_W_E, X_L_Y => req_L_E, 
                               credit => credit_counter_E_out,
                               grant_Y_E => grant_E_E_sig, 
                               grant_Y_W => grant_E_W_sig, 
                               grant_Y_L => grant_E_L_sig);

-- Y is W now
arb_X_W: arbiter_out_LV port map (reset => reset, clk => clk,
                               X_E_Y => req_E_W, X_W_Y => req_W_W, X_L_Y => req_L_W, 
                               credit => credit_counter_W_out,
                               grant_Y_E => grant_W_E_sig, 
                               grant_Y_W => grant_W_W_sig, 
                               grant_Y_L => grant_W_L_sig);

-- Y is L now
arb_X_L: arbiter_out_LV port map (reset => reset, clk => clk, 
                               X_E_Y => req_E_L, X_W_Y => req_W_L, X_L_Y => req_L_L,
                               credit => credit_counter_L_out,
                               grant_Y_E => grant_L_E_sig, 
                               grant_Y_W => grant_L_W_sig, 
                               grant_Y_L => grant_L_L_sig);

valid_E <= grant_E;
valid_W <= grant_W;
valid_L <= grant_L;
 

END;





