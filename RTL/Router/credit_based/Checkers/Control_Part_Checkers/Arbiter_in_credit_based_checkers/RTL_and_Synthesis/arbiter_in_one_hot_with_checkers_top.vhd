library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Arbiter_in_one_hot_with_checkers_top is
    port (  req_X_N, req_X_E, req_X_W, req_X_S, req_X_L:in std_logic; -- From LBDR modules
    	    state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter_in's FSM

            X_N, X_E, X_W, X_S, X_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            state_in: out std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM            

            -- Checker outputs

			err_Requests_state_in_state_not_equal, 

			err_IDLE_Req_N, 
			err_IDLE_grant_N,
			err_North_Req_N, 
			err_North_grant_N, 
			err_East_Req_E, 
			err_East_grant_E, 
			err_West_Req_W, 
			err_West_grant_W, 
			err_South_Req_S,
			err_South_grant_S,
			err_Local_Req_L, 
			err_Local_grant_L,

			err_IDLE_Req_E,
			err_IDLE_grant_E,
			err_North_Req_E,
			err_North_grant_E,
			err_East_Req_W,
			err_East_grant_W,
			err_West_Req_S,
			err_West_grant_S,
			err_South_Req_L,
			err_South_grant_L,
			err_Local_Req_N,
			err_Local_grant_N,

			err_IDLE_Req_W,
			err_IDLE_grant_W,
			err_North_Req_W,
			err_North_grant_W,
			err_East_Req_S,
			err_East_grant_S,
			err_West_Req_L,
			err_West_grant_L,
			err_South_Req_N, 
			err_South_grant_N,
			err_Local_Req_E,
			err_Local_grant_E, 

			err_IDLE_Req_S, 
			err_IDLE_grant_S, 
			err_North_Req_S, 
			err_North_grant_S, 
			err_East_Req_L, 
			err_East_grant_L, 
			err_West_Req_N, 
			err_West_grant_N, 
			err_South_Req_E, 
			err_South_grant_E, 
			err_Local_Req_W, 
			err_Local_grant_W, 

			err_IDLE_Req_L, 
			err_IDLE_grant_L, 
			err_North_Req_L, 
			err_North_grant_L, 
			err_East_Req_N, 
			err_East_grant_N, 
			err_West_Req_E, 
			err_West_grant_E, 
			err_South_Req_W, 
			err_South_grant_W, 
			err_Local_Req_S, 
			err_Local_grant_S, 

			err_state_in_onehot, 
			err_no_request_grants, 
			err_request_no_grants, 

			err_no_Req_N_grant_N,
			err_no_Req_E_grant_E, 
			err_no_Req_W_grant_W, 
			err_no_Req_S_grant_S, 
			err_no_Req_L_grant_L : out std_logic
            );
end Arbiter_in_one_hot_with_checkers_top;

architecture behavior of Arbiter_in_one_hot_with_checkers_top is

component arbiter_in_one_hot_pseudo is
    port (  req_X_N, req_X_E, req_X_W, req_X_S, req_X_L:in std_logic; -- From LBDR modules
    	    state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter_in's FSM

            X_N, X_E, X_W, X_S, X_L : out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            state_in: out std_logic_vector (5 downto 0) -- 6 states for Arbiter's FSM            
            );
end component;

component Arbiter_in_one_hot_checkers is
    port (  
            req_X_N :in std_logic; 
            req_X_E :in std_logic; 
            req_X_W :in std_logic; 
            req_X_S :in std_logic;
            req_X_L :in std_logic;
            state: in std_logic_vector (5 downto 0);
            state_in: in std_logic_vector (5 downto 0);
			X_N :in std_logic;
			X_E :in std_logic;
			X_W :in std_logic;
			X_S :in std_logic;
			X_L :in std_logic;

            -- Checker outputs
			err_Requests_state_in_state_not_equal, 

			err_IDLE_Req_N, 
			err_IDLE_grant_N,
			err_North_Req_N, 
			err_North_grant_N, 
			err_East_Req_E, 
			err_East_grant_E, 
			err_West_Req_W, 
			err_West_grant_W, 
			err_South_Req_S,
			err_South_grant_S,
			err_Local_Req_L, 
			err_Local_grant_L,

			err_IDLE_Req_E,
			err_IDLE_grant_E,
			err_North_Req_E,
			err_North_grant_E,
			err_East_Req_W,
			err_East_grant_W,
			err_West_Req_S,
			err_West_grant_S,
			err_South_Req_L,
			err_South_grant_L,
			err_Local_Req_N,
			err_Local_grant_N,

			err_IDLE_Req_W,
			err_IDLE_grant_W,
			err_North_Req_W,
			err_North_grant_W,
			err_East_Req_S,
			err_East_grant_S,
			err_West_Req_L,
			err_West_grant_L,
			err_South_Req_N, 
			err_South_grant_N,
			err_Local_Req_E,
			err_Local_grant_E, 

			err_IDLE_Req_S, 
			err_IDLE_grant_S, 
			err_North_Req_S, 
			err_North_grant_S, 
			err_East_Req_L, 
			err_East_grant_L, 
			err_West_Req_N, 
			err_West_grant_N, 
			err_South_Req_E, 
			err_South_grant_E, 
			err_Local_Req_W, 
			err_Local_grant_W, 

			err_IDLE_Req_L, 
			err_IDLE_grant_L, 
			err_North_Req_L, 
			err_North_grant_L, 
			err_East_Req_N, 
			err_East_grant_N, 
			err_West_Req_E, 
			err_West_grant_E, 
			err_South_Req_W, 
			err_South_grant_W, 
			err_Local_Req_S, 
			err_Local_grant_S, 

			err_state_in_onehot, 
			err_no_request_grants, 
			err_request_no_grants, 

			err_no_Req_N_grant_N,
			err_no_Req_E_grant_E, 
			err_no_Req_W_grant_W, 
			err_no_Req_S_grant_S, 
			err_no_Req_L_grant_L : out std_logic
            );
end component;

signal X_N_sig, X_E_sig, X_W_sig, X_S_sig, X_L_sig: std_logic;
signal state_in_sig: std_logic_vector (5 downto 0);

begin 

X_N <= X_N_sig;
X_E <= X_E_sig;
X_W <= X_W_sig;
X_S <= X_S_sig;
X_L <= X_L_sig;
state_in <= state_in_sig;

-- Arbiter instantiation
ARBITER_IN_ONE_HOT: arbiter_in_one_hot_pseudo port map   (
                                    req_X_N => req_X_N, 
                                    req_X_E => req_X_E, 
                                    req_X_W => req_X_W, 
                                    req_X_S => req_X_S, 
                                    req_X_L => req_X_L,
 						            state => state,

                                    X_N => X_N_sig, 
                                    X_E => X_E_sig, 
                                    X_W => X_W_sig, 
                                    X_S => X_S_sig, 
                                    X_L => X_L_sig,
                                    state_in => state_in_sig
                                    );

-- Checkers instantiation
CHECKERS: Arbiter_in_one_hot_checkers port map (
                                      req_X_N => req_X_N, 
                                      req_X_E => req_X_E, 
                                      req_X_W => req_X_W, 
                                      req_X_S => req_X_S, 
                                      req_X_L => req_X_L,
                                      state => state, 

                                      state_in => state_in_sig, 
                                      X_N => X_N_sig, 
                                      X_E => X_E_sig, 
                                      X_W => X_W_sig, 
                                      X_S => X_S_sig, 
                                      X_L => X_L_sig, 

									  err_Requests_state_in_state_not_equal => err_Requests_state_in_state_not_equal,
  
									  err_IDLE_Req_N => err_IDLE_Req_N,
									  err_IDLE_grant_N => err_IDLE_grant_N,
									  err_North_Req_N => err_North_Req_N,
									  err_North_grant_N => err_North_grant_N,
									  err_East_Req_E => err_East_Req_E,
									  err_East_grant_E => err_East_grant_E,
									  err_West_Req_W => err_West_Req_W,
									  err_West_grant_W => err_West_grant_W,
									  err_South_Req_S => err_South_Req_S,
									  err_South_grant_S => err_South_grant_S,
									  err_Local_Req_L => err_Local_Req_L,
									  err_Local_grant_L => err_Local_grant_L,
  
									  err_IDLE_Req_E => err_IDLE_Req_E,
									  err_IDLE_grant_E => err_IDLE_grant_E,
									  err_North_Req_E => err_North_Req_E,
									  err_North_grant_E => err_North_grant_E,
									  err_East_Req_W => err_East_Req_W,
									  err_East_grant_W => err_East_grant_W,
									  err_West_Req_S => err_West_Req_S,
									  err_West_grant_S => err_West_grant_S,
									  err_South_Req_L => err_South_Req_L,
									  err_South_grant_L => err_South_grant_L,
									  err_Local_Req_N => err_Local_Req_N,
									  err_Local_grant_N => err_Local_grant_N,
  
									  err_IDLE_Req_W => err_IDLE_Req_W,
									  err_IDLE_grant_W => err_IDLE_grant_W,
									  err_North_Req_W => err_North_Req_W,
									  err_North_grant_W => err_North_grant_W,
									  err_East_Req_S => err_East_Req_S,
									  err_East_grant_S => err_East_grant_S,
									  err_West_Req_L => err_West_Req_L,
									  err_West_grant_L => err_West_grant_L,
									  err_South_Req_N => err_South_Req_N,
									  err_South_grant_N => err_South_grant_N,
									  err_Local_Req_E => err_Local_Req_E,
									  err_Local_grant_E => err_Local_grant_E,
  
									  err_IDLE_Req_S => err_IDLE_Req_S,
									  err_IDLE_grant_S => err_IDLE_grant_S,
									  err_North_Req_S => err_North_Req_S,
									  err_North_grant_S => err_North_grant_S,
									  err_East_Req_L => err_East_Req_L,
									  err_East_grant_L => err_East_grant_L,
									  err_West_Req_N => err_West_Req_N,
									  err_West_grant_N => err_West_grant_N,
									  err_South_Req_E => err_South_Req_E,
									  err_South_grant_E => err_South_grant_E,
									  err_Local_Req_W => err_Local_Req_W,
									  err_Local_grant_W => err_Local_grant_W,
  
									  err_IDLE_Req_L => err_IDLE_Req_L,
									  err_IDLE_grant_L => err_IDLE_grant_L,
									  err_North_Req_L => err_North_Req_L,
									  err_North_grant_L => err_North_grant_L,
									  err_East_Req_N => err_East_Req_N,
									  err_East_grant_N => err_East_grant_N,
									  err_West_Req_E => err_West_Req_E,
									  err_West_grant_E => err_West_grant_E,
									  err_South_Req_W => err_South_Req_W,
									  err_South_grant_W => err_South_grant_W,
									  err_Local_Req_S => err_Local_Req_S,
									  err_Local_grant_S => err_Local_grant_S,
  
									  err_state_in_onehot => err_state_in_onehot, 
									  err_no_request_grants => err_no_request_grants,
									  err_request_no_grants => err_request_no_grants, 

									  err_no_Req_N_grant_N => err_no_Req_N_grant_N,
									  err_no_Req_E_grant_E => err_no_Req_E_grant_E,
									  err_no_Req_W_grant_W => err_no_Req_W_grant_W,
									  err_no_Req_S_grant_S => err_no_Req_S_grant_S,
									  err_no_Req_L_grant_L => err_no_Req_L_grant_L								  
                                     );

end behavior;