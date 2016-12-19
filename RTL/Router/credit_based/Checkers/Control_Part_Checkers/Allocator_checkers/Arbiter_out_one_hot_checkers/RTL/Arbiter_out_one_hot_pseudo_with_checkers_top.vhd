library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Arbiter_out_one_hot_pseudo_with_checkers_top is
    port (  credit: in std_logic_vector(1 downto 0);
			req_X_N, req_X_E, req_X_W, req_X_S, req_X_L :in std_logic; -- From LBDR modules
            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter_out's FSM

            grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L : out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            state_in: out std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM

            -- Checker outputs
			err_Requests_state_in_state_not_equal, 
 
			err_IDLE_req_X_N, 
			err_North_req_X_N, 
			err_North_credit_not_zero_req_X_N_grant_N, 
			err_North_credit_zero_or_not_req_X_N_not_grant_N, 
			err_East_req_X_E, 
			err_East_credit_not_zero_req_X_E_grant_E, 
			err_East_credit_zero_or_not_req_X_E_not_grant_E, 
			err_West_req_X_W, 
			err_West_credit_not_zero_req_X_E_grant_E, 
			err_West_credit_zero_or_not_req_X_W_not_grant_W, 
			err_South_req_X_S, 
			err_South_credit_not_zero_req_X_S_grant_S, 
			err_South_credit_zero_or_not_req_X_S_not_grant_S, 
			err_Local_req_X_L, 
			err_Local_credit_not_zero_req_X_L_grant_L, 
			err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

			err_IDLE_req_X_E, 
			err_North_req_X_E, 
			err_East_req_X_W, 
			err_West_req_X_S, 
			err_South_req_X_L, 
			err_Local_req_X_N, 
 
			err_IDLE_req_X_W, 
			err_North_req_X_W, 
			err_East_req_X_S, 
			err_West_req_X_L, 
			err_South_req_X_N, 
			err_Local_req_X_E, 
 
			err_IDLE_req_X_S, 
			err_North_req_X_S, 
			err_East_req_X_L, 
			err_West_req_X_N, 
			err_South_req_X_E, 
			err_Local_req_X_W, 
 
			err_IDLE_req_X_L, 
			err_North_req_X_L, 
			err_East_req_X_N, 
			err_West_req_X_E, 
			err_South_req_X_W, 
			err_Local_req_X_S, 
 
			err_state_in_onehot, 
			err_no_request_grants, 
			err_request_IDLE_state, 

            err_request_IDLE_not_Grants, 
            err_state_North_Invalid_Grant, 
            err_state_East_Invalid_Grant, 
            err_state_West_Invalid_Grant, 
            err_state_South_Invalid_Grant, 
            err_state_Local_Invalid_Grant, 
            err_Grants_onehot_or_all_zero : out std_logic             
         );
end Arbiter_out_one_hot_pseudo_with_checkers_top;

architecture behavior of Arbiter_out_one_hot_pseudo_with_checkers_top is

component arbiter_out_one_hot_pseudo is
    port (  credit: in std_logic_vector(1 downto 0);
			req_X_E, req_X_N, req_X_W, req_X_S, req_X_L :in std_logic; -- From LBDR modules
            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter_out's FSM

            grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L : out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            state_in: out std_logic_vector (5 downto 0) -- 6 states for Arbiter's FSM
         );
end component;

component Arbiter_out_one_hot_pseudo_checkers is
    port (  credit: in std_logic_vector(1 downto 0);
            req_X_N, req_X_E, req_X_W, req_X_S, req_X_L :in std_logic; -- From LBDR modules
            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter_out's FSM

            grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L : in std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            state_in: in std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM

            -- Checker outputs
			err_Requests_state_in_state_not_equal, 
 
			err_IDLE_req_X_N, 
			err_North_req_X_N, 
			err_North_credit_not_zero_req_X_N_grant_N, 
			err_North_credit_zero_or_not_req_X_N_not_grant_N, 
			err_East_req_X_E, 
			err_East_credit_not_zero_req_X_E_grant_E, 
			err_East_credit_zero_or_not_req_X_E_not_grant_E, 
			err_West_req_X_W, 
			err_West_credit_not_zero_req_X_E_grant_E, 
			err_West_credit_zero_or_not_req_X_W_not_grant_W, 
			err_South_req_X_S, 
			err_South_credit_not_zero_req_X_S_grant_S, 
			err_South_credit_zero_or_not_req_X_S_not_grant_S, 
			err_Local_req_X_L, 
			err_Local_credit_not_zero_req_X_L_grant_L, 
			err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

			err_IDLE_req_X_E, 
			err_North_req_X_E, 
			err_East_req_X_W, 
			err_West_req_X_S, 
			err_South_req_X_L, 
			err_Local_req_X_N, 
 
			err_IDLE_req_X_W, 
			err_North_req_X_W, 
			err_East_req_X_S, 
			err_West_req_X_L, 
			err_South_req_X_N, 
			err_Local_req_X_E, 
 
			err_IDLE_req_X_S, 
			err_North_req_X_S, 
			err_East_req_X_L, 
			err_West_req_X_N, 
			err_South_req_X_E, 
			err_Local_req_X_W, 
 
			err_IDLE_req_X_L, 
			err_North_req_X_L, 
			err_East_req_X_N, 
			err_West_req_X_E, 
			err_South_req_X_W, 
			err_Local_req_X_S, 
 
			err_state_in_onehot, 
			err_no_request_grants, 
			err_request_IDLE_state, 

            err_request_IDLE_not_Grants, 
            err_state_North_Invalid_Grant, 
            err_state_East_Invalid_Grant, 
            err_state_West_Invalid_Grant, 
            err_state_South_Invalid_Grant, 
            err_state_Local_Invalid_Grant, 
            err_Grants_onehot_or_all_zero : out std_logic             
         );
end component;

signal grant_Y_N_sig, grant_Y_E_sig, grant_Y_W_sig, grant_Y_S_sig, grant_Y_L_sig: std_logic;
signal state_in_sig: std_logic_vector (5 downto 0);

begin 

grant_Y_N  <= grant_Y_N_sig;
grant_Y_E  <= grant_Y_E_sig;
grant_Y_W  <= grant_Y_W_sig;
grant_Y_S  <= grant_Y_S_sig;
grant_Y_L  <= grant_Y_L_sig;
state_in   <= state_in_sig;

-- Arbiter_out instantiation
ARBITER_OUT_ONE_HOT: arbiter_out_one_hot_pseudo port map   (
						                                     credit => credit, 
						                                     req_X_N  => req_X_N, 
						                                     req_X_E  => req_X_E, 
						                                     req_X_W  => req_X_W, 
						                                     req_X_S  => req_X_S, 
						                                     req_X_L  => req_X_L,
						 						             state  => state,
 
						                                     grant_Y_N => grant_Y_N_sig, 
						                                     grant_Y_E => grant_Y_E_sig, 
						                                     grant_Y_W => grant_Y_W_sig, 
						                                     grant_Y_S => grant_Y_S_sig, 
						                                     grant_Y_L => grant_Y_L_sig,
						                                     state_in  => state_in_sig
                                    					   );

-- Checkers instantiation
CHECKERS: Arbiter_out_one_hot_pseudo_checkers port map (
														  credit => credit, 
					                                      req_X_N  => req_X_N, 
														  req_X_E  => req_X_E, 
														  req_X_W  => req_X_W, 
														  req_X_S  => req_X_S, 
														  req_X_L  => req_X_L,
														  state  => state,
		                                      
					                                      grant_Y_N => grant_Y_N_sig, 
					                                      grant_Y_E => grant_Y_E_sig, 
					                                      grant_Y_W => grant_Y_W_sig, 
					                                      grant_Y_S => grant_Y_S_sig, 
					                                      grant_Y_L => grant_Y_L_sig, 
					                                      state_in  => state_in_sig, 

					                                      -- Checker Outputs
														  err_Requests_state_in_state_not_equal => err_Requests_state_in_state_not_equal, 
												  
														  err_IDLE_req_X_N => err_IDLE_req_X_N, 
														  err_North_req_X_N => err_North_req_X_N, 
														  err_North_credit_not_zero_req_X_N_grant_N => err_North_credit_not_zero_req_X_N_grant_N, 
														  err_North_credit_zero_or_not_req_X_N_not_grant_N => err_North_credit_zero_or_not_req_X_N_not_grant_N, 
														  err_East_req_X_E => err_East_req_X_E, 
														  err_East_credit_not_zero_req_X_E_grant_E => err_East_credit_not_zero_req_X_E_grant_E, 
														  err_East_credit_zero_or_not_req_X_E_not_grant_E => err_East_credit_zero_or_not_req_X_E_not_grant_E, 
														  err_West_req_X_W => err_West_req_X_W, 
														  err_West_credit_not_zero_req_X_E_grant_E => err_West_credit_not_zero_req_X_E_grant_E, 
														  err_West_credit_zero_or_not_req_X_W_not_grant_W => err_West_credit_zero_or_not_req_X_W_not_grant_W, 
														  err_South_req_X_S => err_South_req_X_S, 
														  err_South_credit_not_zero_req_X_S_grant_S => err_South_credit_not_zero_req_X_S_grant_S, 
														  err_South_credit_zero_or_not_req_X_S_not_grant_S => err_South_credit_zero_or_not_req_X_S_not_grant_S, 
														  err_Local_req_X_L => err_Local_req_X_L, 
														  err_Local_credit_not_zero_req_X_L_grant_L => err_Local_credit_not_zero_req_X_L_grant_L, 
														  err_Local_credit_zero_or_not_req_X_L_not_grant_L => err_Local_credit_zero_or_not_req_X_L_not_grant_L,   
														  err_IDLE_req_X_E => err_IDLE_req_X_E, 
														  err_North_req_X_E => err_North_req_X_E, 
														  err_East_req_X_W => err_East_req_X_W, 
														  err_West_req_X_S => err_West_req_X_S, 
														  err_South_req_X_L => err_South_req_X_L, 
														  err_Local_req_X_N => err_Local_req_X_N, 
												  
														  err_IDLE_req_X_W => err_IDLE_req_X_W, 
														  err_North_req_X_W => err_North_req_X_W, 
														  err_East_req_X_S => err_East_req_X_S, 
														  err_West_req_X_L => err_West_req_X_L, 
														  err_South_req_X_N => err_South_req_X_N, 
														  err_Local_req_X_E => err_Local_req_X_E, 
												  
														  err_IDLE_req_X_S => err_IDLE_req_X_S, 
														  err_North_req_X_S => err_North_req_X_S, 
														  err_East_req_X_L => err_East_req_X_L, 
														  err_West_req_X_N => err_West_req_X_N, 
														  err_South_req_X_E => err_South_req_X_E, 
														  err_Local_req_X_W => err_Local_req_X_W, 
												  
														  err_IDLE_req_X_L => err_IDLE_req_X_L, 
														  err_North_req_X_L => err_North_req_X_L, 
														  err_East_req_X_N => err_East_req_X_N, 
														  err_West_req_X_E => err_West_req_X_E, 
														  err_South_req_X_W => err_South_req_X_W, 
														  err_Local_req_X_S => err_Local_req_X_S, 
												  
														  err_state_in_onehot => err_state_in_onehot, 
														  err_no_request_grants => err_no_request_grants, 
														  err_request_IDLE_state => err_request_IDLE_state, 

														  err_request_IDLE_not_Grants => err_request_IDLE_not_Grants, 
														  err_state_North_Invalid_Grant => err_state_North_Invalid_Grant, 
														  err_state_East_Invalid_Grant => err_state_East_Invalid_Grant, 
														  err_state_West_Invalid_Grant => err_state_West_Invalid_Grant, 
														  err_state_South_Invalid_Grant => err_state_South_Invalid_Grant, 
														  err_state_Local_Invalid_Grant => err_state_Local_Invalid_Grant, 
														  err_Grants_onehot_or_all_zero => err_Grants_onehot_or_all_zero
                                    		   		   );

end behavior;