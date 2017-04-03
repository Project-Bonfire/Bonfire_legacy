--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity allocator is      
    port (  reset: in  std_logic;
            clk: in  std_logic;
            -- flow control
            credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L: in std_logic;

           	req_N_N, req_N_E, req_N_W, req_N_S, req_N_L: in std_logic;
           	req_E_N, req_E_E, req_E_W, req_E_S, req_E_L: in std_logic;
           	req_W_N, req_W_E, req_W_W, req_W_S, req_W_L: in std_logic;
           	req_S_N, req_S_E, req_S_W, req_S_S, req_S_L: in std_logic;
           	req_L_N, req_L_E, req_L_W, req_L_S, req_L_L: in std_logic;

            empty_N, empty_E, empty_W, empty_S, empty_L: in std_logic;
           	-- grant_X_Y means the grant for X output port towards Y input port
           	-- this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
            valid_N, valid_E, valid_W, valid_S, valid_L : out std_logic;

           	grant_N_N, grant_N_E, grant_N_W, grant_N_S, grant_N_L: out std_logic;
           	grant_E_N, grant_E_E, grant_E_W, grant_E_S, grant_E_L: out std_logic;
           	grant_W_N, grant_W_E, grant_W_W, grant_W_S, grant_W_L: out std_logic;
           	grant_S_N, grant_S_E, grant_S_W, grant_S_S, grant_S_L: out std_logic;
           	grant_L_N, grant_L_E, grant_L_W, grant_L_S, grant_L_L: out std_logic;

            -- fault injector shift register with serial input signals
            TCK: in std_logic;  
            SE: in std_logic;       -- shift enable 
            UE: in std_logic;       -- update enable
            SI: in std_logic;       -- serial Input
            SO: out std_logic;      -- serial output

            -- Allocator logic checker outputs
            err_grant_N_N_sig_not_empty_N_grant_N_N, 
            err_not_grant_N_N_sig_or_empty_N_not_grant_N_N, 
            err_grant_N_E_sig_not_empty_E_grant_N_E, 
            err_not_grant_N_E_sig_or_empty_E_not_grant_N_E, 
            err_grant_N_W_sig_not_empty_W_grant_N_W, 
            err_not_grant_N_W_sig_or_empty_W_not_grant_N_W, 
            err_grant_N_S_sig_not_empty_S_grant_N_S, 
            err_not_grant_N_S_sig_or_empty_S_not_grant_N_S, 
            err_grant_N_L_sig_not_empty_L_grant_N_L, 
            err_not_grant_N_L_sig_or_empty_L_not_grant_N_L, 

            err_grant_E_N_sig_not_empty_N_grant_E_N, 
            err_not_grant_E_N_sig_or_empty_N_not_grant_E_N, 
            err_grant_E_E_sig_not_empty_E_grant_E_E, 
            err_not_grant_E_E_sig_or_empty_E_not_grant_E_E, 
            err_grant_E_W_sig_not_empty_W_grant_E_W, 
            err_not_grant_E_W_sig_or_empty_W_not_grant_E_W, 
            err_grant_E_S_sig_not_empty_S_grant_E_S, 
            err_not_grant_E_S_sig_or_empty_S_not_grant_E_S, 
            err_grant_E_L_sig_not_empty_L_grant_E_L, 
            err_not_grant_E_L_sig_or_empty_L_not_grant_E_L, 

            err_grant_W_N_sig_not_empty_N_grant_W_N, 
            err_not_grant_W_N_sig_or_empty_N_not_grant_W_N, 
            err_grant_W_E_sig_not_empty_E_grant_W_E, 
            err_not_grant_W_E_sig_or_empty_E_not_grant_W_E, 
            err_grant_W_W_sig_not_empty_W_grant_W_W, 
            err_not_grant_W_W_sig_or_empty_W_not_grant_W_W, 
            err_grant_W_S_sig_not_empty_S_grant_W_S, 
            err_not_grant_W_S_sig_or_empty_S_not_grant_W_S, 
            err_grant_W_L_sig_not_empty_L_grant_W_L, 
            err_not_grant_W_L_sig_or_empty_L_not_grant_W_L, 

            err_grant_S_N_sig_not_empty_N_grant_S_N, 
            err_not_grant_S_N_sig_or_empty_N_not_grant_S_N, 
            err_grant_S_E_sig_not_empty_E_grant_S_E, 
            err_not_grant_S_E_sig_or_empty_E_not_grant_S_E, 
            err_grant_S_W_sig_not_empty_W_grant_S_W, 
            err_not_grant_S_W_sig_or_empty_W_not_grant_S_W, 
            err_grant_S_S_sig_not_empty_S_grant_S_S, 
            err_not_grant_S_S_sig_or_empty_S_not_grant_S_S, 
            err_grant_S_L_sig_not_empty_L_grant_S_L, 
            err_not_grant_S_L_sig_or_empty_L_not_grant_S_L, 

            err_grant_L_N_sig_not_empty_N_grant_L_N, 
            err_not_grant_L_N_sig_or_empty_N_not_grant_L_N, 
            err_grant_L_E_sig_not_empty_E_grant_L_E, 
            err_not_grant_L_E_sig_or_empty_E_not_grant_L_E, 
            err_grant_L_W_sig_not_empty_W_grant_L_W, 
            err_not_grant_L_W_sig_or_empty_W_not_grant_L_W, 
            err_grant_L_S_sig_not_empty_S_grant_L_S, 
            err_not_grant_L_S_sig_or_empty_S_not_grant_L_S, 
            err_grant_L_L_sig_not_empty_L_grant_L_L, 
            err_not_grant_L_L_sig_or_empty_L_not_grant_L_L, 

            err_grant_signals_not_empty_grant_N, 
            err_not_grant_signals_empty_not_grant_N, 
            err_grant_signals_not_empty_grant_E, 
            err_not_grant_signals_empty_not_grant_E, 
            err_grant_signals_not_empty_grant_W, 
            err_not_grant_signals_empty_not_grant_W, 
            err_grant_signals_not_empty_grant_S, 
            err_not_grant_signals_empty_not_grant_S, 
            err_grant_signals_not_empty_grant_L, 
            err_not_grant_signals_empty_not_grant_L, 

            err_grants_valid_not_match, 

            -- Allocator credit counter logic checker outputs
            err_credit_in_N_grant_N_credit_counter_N_in_credit_counter_N_out_equal, 
            err_credit_in_N_credit_counter_N_out_increment, 
            err_not_credit_in_N_credit_counter_N_out_max_credit_counter_N_in_not_change, 
            err_grant_N_credit_counter_N_out_decrement, 
            err_not_grant_N_or_credit_counter_N_out_zero_credit_counter_N_in_not_change,             
            err_not_credit_in_N_not_grant_N_credit_counter_N_in_credit_counter_N_out_equal, 

            err_credit_in_E_grant_E_credit_counter_E_in_credit_counter_E_out_equal, 
            err_credit_in_E_credit_counter_E_out_increment, 
            err_not_credit_in_E_credit_counter_E_out_max_credit_counter_E_in_not_change, 
            err_grant_E_credit_counter_E_out_decrement, 
            err_not_grant_E_or_credit_counter_E_out_zero_credit_counter_E_in_not_change,             
            err_not_credit_in_E_not_grant_E_credit_counter_E_in_credit_counter_E_out_equal, 

            err_credit_in_W_grant_W_credit_counter_W_in_credit_counter_W_out_equal, 
            err_credit_in_W_credit_counter_W_out_increment, 
            err_not_credit_in_W_credit_counter_W_out_max_credit_counter_W_in_not_change, 
            err_grant_W_credit_counter_W_out_decrement, 
            err_not_grant_W_or_credit_counter_W_out_zero_credit_counter_W_in_not_change,             
            err_not_credit_in_W_not_grant_W_credit_counter_W_in_credit_counter_W_out_equal, 

            err_credit_in_S_grant_S_credit_counter_S_in_credit_counter_S_out_equal, 
            err_credit_in_S_credit_counter_S_out_increment, 
            err_not_credit_in_S_credit_counter_S_out_max_credit_counter_S_in_not_change, 
            err_grant_S_credit_counter_S_out_decrement, 
            err_not_grant_S_or_credit_counter_S_out_zero_credit_counter_S_in_not_change,             
            err_not_credit_in_S_not_grant_S_credit_counter_S_in_credit_counter_S_out_equal, 

            err_credit_in_L_grant_L_credit_counter_L_in_credit_counter_L_out_equal, 
            err_credit_in_L_credit_counter_L_out_increment, 
            err_not_credit_in_L_credit_counter_L_out_max_credit_counter_L_in_not_change, 
            err_grant_L_credit_counter_L_out_decrement, 
            err_not_grant_L_or_credit_counter_L_out_zero_credit_counter_L_in_not_change, 
            err_not_credit_in_L_not_grant_L_credit_counter_L_in_credit_counter_L_out_equal, 

            -- Arbiter_in checker outputs

            -- North Arbiter_in checker outputs
            N_err_Requests_state_in_state_not_equal, 

            N_err_IDLE_Req_N, 
            N_err_IDLE_grant_N,
            N_err_North_Req_N, 
            N_err_North_grant_N, 
            N_err_East_Req_E, 
            N_err_East_grant_E, 
            N_err_West_Req_W, 
            N_err_West_grant_W, 
            N_err_South_Req_S,
            N_err_South_grant_S,
            N_err_Local_Req_L, 
            N_err_Local_grant_L,

            N_err_IDLE_Req_E,
            N_err_IDLE_grant_E,
            N_err_North_Req_E,
            N_err_North_grant_E,
            N_err_East_Req_W,
            N_err_East_grant_W,
            N_err_West_Req_S,
            N_err_West_grant_S,
            N_err_South_Req_L,
            N_err_South_grant_L,
            N_err_Local_Req_N,
            N_err_Local_grant_N,

            N_err_IDLE_Req_W,
            N_err_IDLE_grant_W,
            N_err_North_Req_W,
            N_err_North_grant_W,
            N_err_East_Req_S,
            N_err_East_grant_S,
            N_err_West_Req_L,
            N_err_West_grant_L,
            N_err_South_Req_N, 
            N_err_South_grant_N,
            N_err_Local_Req_E,
            N_err_Local_grant_E, 

            N_err_IDLE_Req_S, 
            N_err_IDLE_grant_S, 
            N_err_North_Req_S, 
            N_err_North_grant_S, 
            N_err_East_Req_L, 
            N_err_East_grant_L, 
            N_err_West_Req_N, 
            N_err_West_grant_N, 
            N_err_South_Req_E, 
            N_err_South_grant_E, 
            N_err_Local_Req_W, 
            N_err_Local_grant_W, 

            N_err_IDLE_Req_L, 
            N_err_IDLE_grant_L, 
            N_err_North_Req_L, 
            N_err_North_grant_L, 
            N_err_East_Req_N, 
            N_err_East_grant_N, 
            N_err_West_Req_E, 
            N_err_West_grant_E, 
            N_err_South_Req_W, 
            N_err_South_grant_W, 
            N_err_Local_Req_S, 
            N_err_Local_grant_S, 

            N_err_state_in_onehot, 
            N_err_no_request_grants, 
            N_err_request_no_grants, 

            N_err_no_Req_N_grant_N,
            N_err_no_Req_E_grant_E, 
            N_err_no_Req_W_grant_W, 
            N_err_no_Req_S_grant_S, 
            N_err_no_Req_L_grant_L, 

            -- East Arbiter_in checker outputs
            E_err_Requests_state_in_state_not_equal, 

            E_err_IDLE_Req_N, 
            E_err_IDLE_grant_N,
            E_err_North_Req_N, 
            E_err_North_grant_N, 
            E_err_East_Req_E, 
            E_err_East_grant_E, 
            E_err_West_Req_W, 
            E_err_West_grant_W, 
            E_err_South_Req_S,
            E_err_South_grant_S,
            E_err_Local_Req_L, 
            E_err_Local_grant_L,

            E_err_IDLE_Req_E,
            E_err_IDLE_grant_E,
            E_err_North_Req_E,
            E_err_North_grant_E,
            E_err_East_Req_W,
            E_err_East_grant_W,
            E_err_West_Req_S,
            E_err_West_grant_S,
            E_err_South_Req_L,
            E_err_South_grant_L,
            E_err_Local_Req_N,
            E_err_Local_grant_N,

            E_err_IDLE_Req_W,
            E_err_IDLE_grant_W,
            E_err_North_Req_W,
            E_err_North_grant_W,
            E_err_East_Req_S,
            E_err_East_grant_S,
            E_err_West_Req_L,
            E_err_West_grant_L,
            E_err_South_Req_N, 
            E_err_South_grant_N,
            E_err_Local_Req_E,
            E_err_Local_grant_E, 

            E_err_IDLE_Req_S, 
            E_err_IDLE_grant_S, 
            E_err_North_Req_S, 
            E_err_North_grant_S, 
            E_err_East_Req_L, 
            E_err_East_grant_L, 
            E_err_West_Req_N, 
            E_err_West_grant_N, 
            E_err_South_Req_E, 
            E_err_South_grant_E, 
            E_err_Local_Req_W, 
            E_err_Local_grant_W, 

            E_err_IDLE_Req_L, 
            E_err_IDLE_grant_L, 
            E_err_North_Req_L, 
            E_err_North_grant_L, 
            E_err_East_Req_N, 
            E_err_East_grant_N, 
            E_err_West_Req_E, 
            E_err_West_grant_E, 
            E_err_South_Req_W, 
            E_err_South_grant_W, 
            E_err_Local_Req_S, 
            E_err_Local_grant_S, 

            E_err_state_in_onehot, 
            E_err_no_request_grants, 
            E_err_request_no_grants, 

            E_err_no_Req_N_grant_N,
            E_err_no_Req_E_grant_E, 
            E_err_no_Req_W_grant_W, 
            E_err_no_Req_S_grant_S, 
            E_err_no_Req_L_grant_L, 

            -- West Arbiter_in checker outputs
            W_err_Requests_state_in_state_not_equal, 

            W_err_IDLE_Req_N, 
            W_err_IDLE_grant_N,
            W_err_North_Req_N, 
            W_err_North_grant_N, 
            W_err_East_Req_E, 
            W_err_East_grant_E, 
            W_err_West_Req_W, 
            W_err_West_grant_W, 
            W_err_South_Req_S,
            W_err_South_grant_S,
            W_err_Local_Req_L, 
            W_err_Local_grant_L,

            W_err_IDLE_Req_E,
            W_err_IDLE_grant_E,
            W_err_North_Req_E,
            W_err_North_grant_E,
            W_err_East_Req_W,
            W_err_East_grant_W,
            W_err_West_Req_S,
            W_err_West_grant_S,
            W_err_South_Req_L,
            W_err_South_grant_L,
            W_err_Local_Req_N,
            W_err_Local_grant_N,

            W_err_IDLE_Req_W,
            W_err_IDLE_grant_W,
            W_err_North_Req_W,
            W_err_North_grant_W,
            W_err_East_Req_S,
            W_err_East_grant_S,
            W_err_West_Req_L,
            W_err_West_grant_L,
            W_err_South_Req_N, 
            W_err_South_grant_N,
            W_err_Local_Req_E,
            W_err_Local_grant_E, 

            W_err_IDLE_Req_S, 
            W_err_IDLE_grant_S, 
            W_err_North_Req_S, 
            W_err_North_grant_S, 
            W_err_East_Req_L, 
            W_err_East_grant_L, 
            W_err_West_Req_N, 
            W_err_West_grant_N, 
            W_err_South_Req_E, 
            W_err_South_grant_E, 
            W_err_Local_Req_W, 
            W_err_Local_grant_W, 

            W_err_IDLE_Req_L, 
            W_err_IDLE_grant_L, 
            W_err_North_Req_L, 
            W_err_North_grant_L, 
            W_err_East_Req_N, 
            W_err_East_grant_N, 
            W_err_West_Req_E, 
            W_err_West_grant_E, 
            W_err_South_Req_W, 
            W_err_South_grant_W, 
            W_err_Local_Req_S, 
            W_err_Local_grant_S, 

            W_err_state_in_onehot, 
            W_err_no_request_grants, 
            W_err_request_no_grants, 

            W_err_no_Req_N_grant_N,
            W_err_no_Req_E_grant_E, 
            W_err_no_Req_W_grant_W, 
            W_err_no_Req_S_grant_S, 
            W_err_no_Req_L_grant_L, 

            -- South Arbiter_in checker outputs
            S_err_Requests_state_in_state_not_equal, 

            S_err_IDLE_Req_N, 
            S_err_IDLE_grant_N,
            S_err_North_Req_N, 
            S_err_North_grant_N, 
            S_err_East_Req_E, 
            S_err_East_grant_E, 
            S_err_West_Req_W, 
            S_err_West_grant_W, 
            S_err_South_Req_S,
            S_err_South_grant_S,
            S_err_Local_Req_L, 
            S_err_Local_grant_L,

            S_err_IDLE_Req_E,
            S_err_IDLE_grant_E,
            S_err_North_Req_E,
            S_err_North_grant_E,
            S_err_East_Req_W,
            S_err_East_grant_W,
            S_err_West_Req_S,
            S_err_West_grant_S,
            S_err_South_Req_L,
            S_err_South_grant_L,
            S_err_Local_Req_N,
            S_err_Local_grant_N,

            S_err_IDLE_Req_W,
            S_err_IDLE_grant_W,
            S_err_North_Req_W,
            S_err_North_grant_W,
            S_err_East_Req_S,
            S_err_East_grant_S,
            S_err_West_Req_L,
            S_err_West_grant_L,
            S_err_South_Req_N, 
            S_err_South_grant_N,
            S_err_Local_Req_E,
            S_err_Local_grant_E, 

            S_err_IDLE_Req_S, 
            S_err_IDLE_grant_S, 
            S_err_North_Req_S, 
            S_err_North_grant_S, 
            S_err_East_Req_L, 
            S_err_East_grant_L, 
            S_err_West_Req_N, 
            S_err_West_grant_N, 
            S_err_South_Req_E, 
            S_err_South_grant_E, 
            S_err_Local_Req_W, 
            S_err_Local_grant_W, 

            S_err_IDLE_Req_L, 
            S_err_IDLE_grant_L, 
            S_err_North_Req_L, 
            S_err_North_grant_L, 
            S_err_East_Req_N, 
            S_err_East_grant_N, 
            S_err_West_Req_E, 
            S_err_West_grant_E, 
            S_err_South_Req_W, 
            S_err_South_grant_W, 
            S_err_Local_Req_S, 
            S_err_Local_grant_S, 

            S_err_state_in_onehot, 
            S_err_no_request_grants, 
            S_err_request_no_grants, 

            S_err_no_Req_N_grant_N,
            S_err_no_Req_E_grant_E, 
            S_err_no_Req_W_grant_W, 
            S_err_no_Req_S_grant_S, 
            S_err_no_Req_L_grant_L, 

            -- Local Arbiter_in checker outputs
            L_err_Requests_state_in_state_not_equal, 

            L_err_IDLE_Req_N, 
            L_err_IDLE_grant_N,
            L_err_North_Req_N, 
            L_err_North_grant_N, 
            L_err_East_Req_E, 
            L_err_East_grant_E, 
            L_err_West_Req_W, 
            L_err_West_grant_W, 
            L_err_South_Req_S,
            L_err_South_grant_S,
            L_err_Local_Req_L, 
            L_err_Local_grant_L,

            L_err_IDLE_Req_E,
            L_err_IDLE_grant_E,
            L_err_North_Req_E,
            L_err_North_grant_E,
            L_err_East_Req_W,
            L_err_East_grant_W,
            L_err_West_Req_S,
            L_err_West_grant_S,
            L_err_South_Req_L,
            L_err_South_grant_L,
            L_err_Local_Req_N,
            L_err_Local_grant_N,

            L_err_IDLE_Req_W,
            L_err_IDLE_grant_W,
            L_err_North_Req_W,
            L_err_North_grant_W,
            L_err_East_Req_S,
            L_err_East_grant_S,
            L_err_West_Req_L,
            L_err_West_grant_L,
            L_err_South_Req_N, 
            L_err_South_grant_N,
            L_err_Local_Req_E,
            L_err_Local_grant_E, 

            L_err_IDLE_Req_S, 
            L_err_IDLE_grant_S, 
            L_err_North_Req_S, 
            L_err_North_grant_S, 
            L_err_East_Req_L, 
            L_err_East_grant_L, 
            L_err_West_Req_N, 
            L_err_West_grant_N, 
            L_err_South_Req_E, 
            L_err_South_grant_E, 
            L_err_Local_Req_W, 
            L_err_Local_grant_W, 

            L_err_IDLE_Req_L, 
            L_err_IDLE_grant_L, 
            L_err_North_Req_L, 
            L_err_North_grant_L, 
            L_err_East_Req_N, 
            L_err_East_grant_N, 
            L_err_West_Req_E, 
            L_err_West_grant_E, 
            L_err_South_Req_W, 
            L_err_South_grant_W, 
            L_err_Local_Req_S, 
            L_err_Local_grant_S, 

            L_err_state_in_onehot, 
            L_err_no_request_grants, 
            L_err_request_no_grants, 

            L_err_no_Req_N_grant_N,
            L_err_no_Req_E_grant_E, 
            L_err_no_Req_W_grant_W, 
            L_err_no_Req_S_grant_S, 
            L_err_no_Req_L_grant_L, 

            -- Arbiter_out checker outputs

            -- North Arbiter_out checker outputs
            N_arbiter_out_err_Requests_state_in_state_not_equal, 
       
            N_err_IDLE_req_X_N, 
            N_err_North_req_X_N, 
            N_err_North_credit_not_zero_req_X_N_grant_N, 
            N_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
            N_err_East_req_X_E, 
            N_err_East_credit_not_zero_req_X_E_grant_E, 
            N_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
            N_err_West_req_X_W, 
            N_err_West_credit_not_zero_req_X_W_grant_W, 
            N_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
            N_err_South_req_X_S, 
            N_err_South_credit_not_zero_req_X_S_grant_S, 
            N_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
            N_err_Local_req_X_L, 
            N_err_Local_credit_not_zero_req_X_L_grant_L, 
            N_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

            N_err_IDLE_req_X_E, 
            N_err_North_req_X_E, 
            N_err_East_req_X_W, 
            N_err_West_req_X_S, 
            N_err_South_req_X_L, 
            N_err_Local_req_X_N, 
       
            N_err_IDLE_req_X_W, 
            N_err_North_req_X_W, 
            N_err_East_req_X_S, 
            N_err_West_req_X_L, 
            N_err_South_req_X_N, 
            N_err_Local_req_X_E, 
       
            N_err_IDLE_req_X_S, 
            N_err_North_req_X_S, 
            N_err_East_req_X_L, 
            N_err_West_req_X_N, 
            N_err_South_req_X_E, 
            N_err_Local_req_X_W, 
       
            N_err_IDLE_req_X_L, 
            N_err_North_req_X_L, 
            N_err_East_req_X_N, 
            N_err_West_req_X_E, 
            N_err_South_req_X_W, 
            N_err_Local_req_X_S, 
       
            N_arbiter_out_err_state_in_onehot, 
            N_arbiter_out_err_no_request_grants, 
            N_err_request_IDLE_state, 

            N_err_request_IDLE_not_Grants, 
            N_err_state_North_Invalid_Grant, 
            N_err_state_East_Invalid_Grant, 
            N_err_state_West_Invalid_Grant, 
            N_err_state_South_Invalid_Grant, 
            N_err_state_Local_Invalid_Grant, 
            N_err_Grants_onehot_or_all_zero,              

            -- East Arbiter_out checker outputs
            E_arbiter_out_err_Requests_state_in_state_not_equal, 
       
            E_err_IDLE_req_X_N, 
            E_err_North_req_X_N, 
            E_err_North_credit_not_zero_req_X_N_grant_N, 
            E_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
            E_err_East_req_X_E, 
            E_err_East_credit_not_zero_req_X_E_grant_E, 
            E_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
            E_err_West_req_X_W, 
            E_err_West_credit_not_zero_req_X_W_grant_W, 
            E_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
            E_err_South_req_X_S, 
            E_err_South_credit_not_zero_req_X_S_grant_S, 
            E_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
            E_err_Local_req_X_L, 
            E_err_Local_credit_not_zero_req_X_L_grant_L, 
            E_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

            E_err_IDLE_req_X_E, 
            E_err_North_req_X_E, 
            E_err_East_req_X_W, 
            E_err_West_req_X_S, 
            E_err_South_req_X_L, 
            E_err_Local_req_X_N, 
       
            E_err_IDLE_req_X_W, 
            E_err_North_req_X_W, 
            E_err_East_req_X_S, 
            E_err_West_req_X_L, 
            E_err_South_req_X_N, 
            E_err_Local_req_X_E, 
       
            E_err_IDLE_req_X_S, 
            E_err_North_req_X_S, 
            E_err_East_req_X_L, 
            E_err_West_req_X_N, 
            E_err_South_req_X_E, 
            E_err_Local_req_X_W, 
       
            E_err_IDLE_req_X_L, 
            E_err_North_req_X_L, 
            E_err_East_req_X_N, 
            E_err_West_req_X_E, 
            E_err_South_req_X_W, 
            E_err_Local_req_X_S, 
       
            E_arbiter_out_err_state_in_onehot, 
            E_arbiter_out_err_no_request_grants, 
            E_err_request_IDLE_state, 

            E_err_request_IDLE_not_Grants, 
            E_err_state_North_Invalid_Grant,
            E_err_state_East_Invalid_Grant, 
            E_err_state_West_Invalid_Grant, 
            E_err_state_South_Invalid_Grant,
            E_err_state_Local_Invalid_Grant,
            E_err_Grants_onehot_or_all_zero,

            -- West Arbiter_out checker outputs
            W_arbiter_out_err_Requests_state_in_state_not_equal, 
       
            W_err_IDLE_req_X_N, 
            W_err_North_req_X_N, 
            W_err_North_credit_not_zero_req_X_N_grant_N, 
            W_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
            W_err_East_req_X_E, 
            W_err_East_credit_not_zero_req_X_E_grant_E, 
            W_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
            W_err_West_req_X_W, 
            W_err_West_credit_not_zero_req_X_W_grant_W, 
            W_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
            W_err_South_req_X_S, 
            W_err_South_credit_not_zero_req_X_S_grant_S, 
            W_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
            W_err_Local_req_X_L, 
            W_err_Local_credit_not_zero_req_X_L_grant_L, 
            W_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

            W_err_IDLE_req_X_E, 
            W_err_North_req_X_E, 
            W_err_East_req_X_W, 
            W_err_West_req_X_S, 
            W_err_South_req_X_L, 
            W_err_Local_req_X_N, 
       
            W_err_IDLE_req_X_W, 
            W_err_North_req_X_W, 
            W_err_East_req_X_S, 
            W_err_West_req_X_L, 
            W_err_South_req_X_N, 
            W_err_Local_req_X_E, 
       
            W_err_IDLE_req_X_S, 
            W_err_North_req_X_S, 
            W_err_East_req_X_L, 
            W_err_West_req_X_N, 
            W_err_South_req_X_E, 
            W_err_Local_req_X_W, 
       
            W_err_IDLE_req_X_L, 
            W_err_North_req_X_L, 
            W_err_East_req_X_N, 
            W_err_West_req_X_E, 
            W_err_South_req_X_W, 
            W_err_Local_req_X_S, 
       
            W_arbiter_out_err_state_in_onehot, 
            W_arbiter_out_err_no_request_grants, 
            W_err_request_IDLE_state, 

            W_err_request_IDLE_not_Grants, 
            W_err_state_North_Invalid_Grant,
            W_err_state_East_Invalid_Grant, 
            W_err_state_West_Invalid_Grant, 
            W_err_state_South_Invalid_Grant,
            W_err_state_Local_Invalid_Grant,
            W_err_Grants_onehot_or_all_zero,

            -- South Arbiter_out checker outputs
            S_arbiter_out_err_Requests_state_in_state_not_equal, 
       
            S_err_IDLE_req_X_N, 
            S_err_North_req_X_N, 
            S_err_North_credit_not_zero_req_X_N_grant_N, 
            S_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
            S_err_East_req_X_E, 
            S_err_East_credit_not_zero_req_X_E_grant_E, 
            S_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
            S_err_West_req_X_W, 
            S_err_West_credit_not_zero_req_X_W_grant_W, 
            S_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
            S_err_South_req_X_S, 
            S_err_South_credit_not_zero_req_X_S_grant_S, 
            S_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
            S_err_Local_req_X_L, 
            S_err_Local_credit_not_zero_req_X_L_grant_L, 
            S_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

            S_err_IDLE_req_X_E, 
            S_err_North_req_X_E, 
            S_err_East_req_X_W, 
            S_err_West_req_X_S, 
            S_err_South_req_X_L, 
            S_err_Local_req_X_N, 
       
            S_err_IDLE_req_X_W, 
            S_err_North_req_X_W, 
            S_err_East_req_X_S, 
            S_err_West_req_X_L, 
            S_err_South_req_X_N, 
            S_err_Local_req_X_E, 
       
            S_err_IDLE_req_X_S, 
            S_err_North_req_X_S, 
            S_err_East_req_X_L, 
            S_err_West_req_X_N, 
            S_err_South_req_X_E, 
            S_err_Local_req_X_W, 
       
            S_err_IDLE_req_X_L, 
            S_err_North_req_X_L, 
            S_err_East_req_X_N, 
            S_err_West_req_X_E, 
            S_err_South_req_X_W, 
            S_err_Local_req_X_S, 
       
            S_arbiter_out_err_state_in_onehot, 
            S_arbiter_out_err_no_request_grants, 
            S_err_request_IDLE_state, 

            S_err_request_IDLE_not_Grants, 
            S_err_state_North_Invalid_Grant,
            S_err_state_East_Invalid_Grant, 
            S_err_state_West_Invalid_Grant, 
            S_err_state_South_Invalid_Grant,
            S_err_state_Local_Invalid_Grant,
            S_err_Grants_onehot_or_all_zero,

            -- Local Arbiter_out checker outputs
            L_arbiter_out_err_Requests_state_in_state_not_equal, 
       
            L_err_IDLE_req_X_N, 
            L_err_North_req_X_N, 
            L_err_North_credit_not_zero_req_X_N_grant_N, 
            L_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
            L_err_East_req_X_E, 
            L_err_East_credit_not_zero_req_X_E_grant_E, 
            L_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
            L_err_West_req_X_W, 
            L_err_West_credit_not_zero_req_X_W_grant_W, 
            L_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
            L_err_South_req_X_S, 
            L_err_South_credit_not_zero_req_X_S_grant_S, 
            L_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
            L_err_Local_req_X_L, 
            L_err_Local_credit_not_zero_req_X_L_grant_L, 
            L_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

            L_err_IDLE_req_X_E, 
            L_err_North_req_X_E, 
            L_err_East_req_X_W, 
            L_err_West_req_X_S, 
            L_err_South_req_X_L, 
            L_err_Local_req_X_N, 
       
            L_err_IDLE_req_X_W, 
            L_err_North_req_X_W, 
            L_err_East_req_X_S, 
            L_err_West_req_X_L, 
            L_err_South_req_X_N, 
            L_err_Local_req_X_E, 
       
            L_err_IDLE_req_X_S, 
            L_err_North_req_X_S, 
            L_err_East_req_X_L, 
            L_err_West_req_X_N, 
            L_err_South_req_X_E, 
            L_err_Local_req_X_W, 
       
            L_err_IDLE_req_X_L, 
            L_err_North_req_X_L, 
            L_err_East_req_X_N, 
            L_err_West_req_X_E, 
            L_err_South_req_X_W, 
            L_err_Local_req_X_S, 
       
            L_arbiter_out_err_state_in_onehot, 
            L_arbiter_out_err_no_request_grants, 
            L_err_request_IDLE_state, 

            L_err_request_IDLE_not_Grants, 
            L_err_state_North_Invalid_Grant,
            L_err_state_East_Invalid_Grant, 
            L_err_state_West_Invalid_Grant, 
            L_err_state_South_Invalid_Grant,
            L_err_state_Local_Invalid_Grant,
            L_err_Grants_onehot_or_all_zero : out std_logic
            );
end allocator;

architecture behavior of allocator is

-- Allocator logic checker outputs and allocator credit counter logic checker outputs go directly to the output interface of Allocator

component Arbiter_in is
    port (  reset: in std_logic;
            clk: in std_logic;
            Req_X_N, Req_X_E, Req_X_W, Req_X_S, Req_X_L: in std_logic; -- From LBDR modules

            X_N, X_E, X_W, X_S, X_L: out std_logic; -- Grants given to LBDR requests (encoded as one-hot)

            -- fault injector signals
            shift: in std_logic;
            fault_clk: in std_logic;
            data_in_serial: in std_logic;
            data_out_serial: out std_logic;

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

component arbiter_out is
    port (  reset: in  std_logic;
            clk: in  std_logic;
            X_N_Y, X_E_Y, X_W_Y, X_S_Y, X_L_Y:in std_logic; -- From LBDR modules
            credit: in std_logic_vector(1 downto 0);

            grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L :out std_logic; -- Grants given to LBDR requests (encoded as one-hot)

            -- fault injector signals
            shift: in std_logic;
            fault_clk: in std_logic;
            data_in_serial: in std_logic;
            data_out_serial: out std_logic;

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
            err_West_credit_not_zero_req_X_W_grant_W, 
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

-- Checker modules

component allocator_logic_pseudo_checkers is
    port (  
            -- grant_X_Y means the grant for X output port towards Y input port
            -- this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
            empty_N, empty_E, empty_W, empty_S, empty_L: in std_logic;            
            grant_N_N_sig, grant_N_E_sig, grant_N_W_sig, grant_N_S_sig, grant_N_L_sig: in std_logic;
            grant_E_N_sig, grant_E_E_sig, grant_E_W_sig, grant_E_S_sig, grant_E_L_sig: in std_logic;
            grant_W_N_sig, grant_W_E_sig, grant_W_W_sig, grant_W_S_sig, grant_W_L_sig: in std_logic;
            grant_S_N_sig, grant_S_E_sig, grant_S_W_sig, grant_S_S_sig, grant_S_L_sig: in std_logic;
            grant_L_N_sig, grant_L_E_sig, grant_L_W_sig, grant_L_S_sig, grant_L_L_sig: in std_logic;

            valid_N, valid_E, valid_W, valid_S, valid_L : in std_logic;
            grant_N_N, grant_N_E, grant_N_W, grant_N_S, grant_N_L: in std_logic;
            grant_E_N, grant_E_E, grant_E_W, grant_E_S, grant_E_L: in std_logic;
            grant_W_N, grant_W_E, grant_W_W, grant_W_S, grant_W_L: in std_logic;
            grant_S_N, grant_S_E, grant_S_W, grant_S_S, grant_S_L: in std_logic;
            grant_L_N, grant_L_E, grant_L_W, grant_L_S, grant_L_L: in std_logic;
            grant_N, grant_E, grant_W, grant_S, grant_L : in std_logic;

            -- Checker outputs
            err_grant_N_N_sig_not_empty_N_grant_N_N, 
            err_not_grant_N_N_sig_or_empty_N_not_grant_N_N, 
            err_grant_N_E_sig_not_empty_E_grant_N_E, 
            err_not_grant_N_E_sig_or_empty_E_not_grant_N_E, 
            err_grant_N_W_sig_not_empty_W_grant_N_W, 
            err_not_grant_N_W_sig_or_empty_W_not_grant_N_W, 
            err_grant_N_S_sig_not_empty_S_grant_N_S, 
            err_not_grant_N_S_sig_or_empty_S_not_grant_N_S, 
            err_grant_N_L_sig_not_empty_L_grant_N_L, 
            err_not_grant_N_L_sig_or_empty_L_not_grant_N_L, 

            err_grant_E_N_sig_not_empty_N_grant_E_N, 
            err_not_grant_E_N_sig_or_empty_N_not_grant_E_N, 
            err_grant_E_E_sig_not_empty_E_grant_E_E, 
            err_not_grant_E_E_sig_or_empty_E_not_grant_E_E, 
            err_grant_E_W_sig_not_empty_W_grant_E_W, 
            err_not_grant_E_W_sig_or_empty_W_not_grant_E_W, 
            err_grant_E_S_sig_not_empty_S_grant_E_S, 
            err_not_grant_E_S_sig_or_empty_S_not_grant_E_S, 
            err_grant_E_L_sig_not_empty_L_grant_E_L, 
            err_not_grant_E_L_sig_or_empty_L_not_grant_E_L, 

            err_grant_W_N_sig_not_empty_N_grant_W_N, 
            err_not_grant_W_N_sig_or_empty_N_not_grant_W_N, 
            err_grant_W_E_sig_not_empty_E_grant_W_E, 
            err_not_grant_W_E_sig_or_empty_E_not_grant_W_E, 
            err_grant_W_W_sig_not_empty_W_grant_W_W, 
            err_not_grant_W_W_sig_or_empty_W_not_grant_W_W, 
            err_grant_W_S_sig_not_empty_S_grant_W_S, 
            err_not_grant_W_S_sig_or_empty_S_not_grant_W_S, 
            err_grant_W_L_sig_not_empty_L_grant_W_L, 
            err_not_grant_W_L_sig_or_empty_L_not_grant_W_L, 

            err_grant_S_N_sig_not_empty_N_grant_S_N, 
            err_not_grant_S_N_sig_or_empty_N_not_grant_S_N, 
            err_grant_S_E_sig_not_empty_E_grant_S_E, 
            err_not_grant_S_E_sig_or_empty_E_not_grant_S_E, 
            err_grant_S_W_sig_not_empty_W_grant_S_W, 
            err_not_grant_S_W_sig_or_empty_W_not_grant_S_W, 
            err_grant_S_S_sig_not_empty_S_grant_S_S, 
            err_not_grant_S_S_sig_or_empty_S_not_grant_S_S, 
            err_grant_S_L_sig_not_empty_L_grant_S_L, 
            err_not_grant_S_L_sig_or_empty_L_not_grant_S_L, 

            err_grant_L_N_sig_not_empty_N_grant_L_N, 
            err_not_grant_L_N_sig_or_empty_N_not_grant_L_N, 
            err_grant_L_E_sig_not_empty_E_grant_L_E, 
            err_not_grant_L_E_sig_or_empty_E_not_grant_L_E, 
            err_grant_L_W_sig_not_empty_W_grant_L_W, 
            err_not_grant_L_W_sig_or_empty_W_not_grant_L_W, 
            err_grant_L_S_sig_not_empty_S_grant_L_S, 
            err_not_grant_L_S_sig_or_empty_S_not_grant_L_S, 
            err_grant_L_L_sig_not_empty_L_grant_L_L, 
            err_not_grant_L_L_sig_or_empty_L_not_grant_L_L, 

            err_grant_signals_not_empty_grant_N, 
            err_not_grant_signals_empty_not_grant_N, 
            err_grant_signals_not_empty_grant_E, 
            err_not_grant_signals_empty_not_grant_E, 
            err_grant_signals_not_empty_grant_W, 
            err_not_grant_signals_empty_not_grant_W, 
            err_grant_signals_not_empty_grant_S, 
            err_not_grant_signals_empty_not_grant_S, 
            err_grant_signals_not_empty_grant_L, 
            err_not_grant_signals_empty_not_grant_L, 

            err_grants_valid_not_match : out std_logic
         );
end component;

component allocator_credit_counter_logic_pseudo_checkers is
    port (  
            -- flow control
            credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L: in std_logic;
            credit_counter_N_out, credit_counter_E_out, credit_counter_W_out, credit_counter_S_out, credit_counter_L_out : in std_logic_vector(1 downto 0);            
            valid_N, valid_E, valid_W, valid_S, valid_L: in std_logic; -- ?? Not sure yet ! grant or valid !

            credit_counter_N_in, credit_counter_E_in, credit_counter_W_in, credit_counter_S_in, credit_counter_L_in : in std_logic_vector(1 downto 0);

            -- Checker outputs
            -- Not complete yet !
            err_credit_in_N_grant_N_credit_counter_N_in_credit_counter_N_out_equal, 
            err_credit_in_N_credit_counter_N_out_increment, 
            err_not_credit_in_N_credit_counter_N_out_max_credit_counter_N_in_not_change, 
            err_grant_N_credit_counter_N_out_decrement, 
            err_not_grant_N_or_credit_counter_N_out_zero_credit_counter_N_in_not_change,             
            err_not_credit_in_N_not_grant_N_credit_counter_N_in_credit_counter_N_out_equal, 

            err_credit_in_E_grant_E_credit_counter_E_in_credit_counter_E_out_equal, 
            err_credit_in_E_credit_counter_E_out_increment, 
            err_not_credit_in_E_credit_counter_E_out_max_credit_counter_E_in_not_change, 
            err_grant_E_credit_counter_E_out_decrement, 
            err_not_grant_E_or_credit_counter_E_out_zero_credit_counter_E_in_not_change,             
            err_not_credit_in_E_not_grant_E_credit_counter_E_in_credit_counter_E_out_equal, 

            err_credit_in_W_grant_W_credit_counter_W_in_credit_counter_W_out_equal, 
            err_credit_in_W_credit_counter_W_out_increment, 
            err_not_credit_in_W_credit_counter_W_out_max_credit_counter_W_in_not_change, 
            err_grant_W_credit_counter_W_out_decrement, 
            err_not_grant_W_or_credit_counter_W_out_zero_credit_counter_W_in_not_change,             
            err_not_credit_in_W_not_grant_W_credit_counter_W_in_credit_counter_W_out_equal, 

            err_credit_in_S_grant_S_credit_counter_S_in_credit_counter_S_out_equal, 
            err_credit_in_S_credit_counter_S_out_increment, 
            err_not_credit_in_S_credit_counter_S_out_max_credit_counter_S_in_not_change, 
            err_grant_S_credit_counter_S_out_decrement, 
            err_not_grant_S_or_credit_counter_S_out_zero_credit_counter_S_in_not_change,             
            err_not_credit_in_S_not_grant_S_credit_counter_S_in_credit_counter_S_out_equal, 

            err_credit_in_L_grant_L_credit_counter_L_in_credit_counter_L_out_equal, 
            err_credit_in_L_credit_counter_L_out_increment, 
            err_not_credit_in_L_credit_counter_L_out_max_credit_counter_L_in_not_change, 
            err_grant_L_credit_counter_L_out_decrement, 
            err_not_grant_L_or_credit_counter_L_out_zero_credit_counter_L_in_not_change, 
            err_not_credit_in_L_not_grant_L_credit_counter_L_in_credit_counter_L_out_equal : out std_logic
         );
end component;


component fault_injector is 
  generic ( DATA_WIDTH    : integer := 32; 
            ADDRESS_WIDTH : integer := 5  );
  port(
    data_in: in std_logic_vector (DATA_WIDTH-1 downto 0);
    address: in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
    sta_0: in std_logic;
    sta_1: in std_logic;
    data_out: out std_logic_vector (DATA_WIDTH-1 downto 0)
    );
end component;

--component shift_register_serial_in is
--    generic (
--        REG_WIDTH: integer := 35
--    );
--    port (
--        clk, reset : in std_logic;
--        shift: in std_logic;
--        data_in_serial: in std_logic;
--        data_out_parallel: out std_logic_vector(REG_WIDTH-1 downto 0);
--        data_out_serial: out std_logic
--    );
--end component;


 ----------------------------------------
 -- Signals related to fault injection --
 ----------------------------------------
 
 -- Total: 9 bits
 -- What about Arbiter_in and Arbiter_out ?!
 signal FI_add_sta: std_logic_vector (8 downto 0); -- 7 bits for fault injection location address (ceil of log2(80) = 7)
                                                   -- 2 bits for type of fault (SA0 or SA1)
 signal non_faulty_signals: std_logic_vector (79 downto 0); -- 80 bits for internal- and output-related signals (non-faulty)                                          
 signal faulty_signals: std_logic_vector(79 downto 0); -- 80 bits for internal- and output-related signals (with single stuck-at fault injected in one of them)
 
 -- For making the chain of faulty data from L, N, E, W and S Arbiter_in and then to L, N, E, W and S Arbiter_out and then to the output of Allocator
 signal fault_DO_serial_L_Arbiter_in_N_Arbiter_in, fault_DO_serial_N_Arbiter_in_E_Arbiter_in, fault_DO_serial_E_Arbiter_in_W_Arbiter_in: std_logic;
 signal fault_DO_serial_W_Arbiter_in_S_Arbiter_in, fault_DO_serial_S_Arbiter_in_L_Arbiter_out, fault_DO_serial_L_Arbiter_out_N_Arbiter_out: std_logic;
 signal fault_DO_serial_N_Arbiter_out_E_Arbiter_out, fault_DO_serial_E_Arbiter_out_W_Arbiter_out, fault_DO_serial_W_Arbiter_out_S_Arbiter_out: std_logic;

 ----------------------------------------
 ----------------------------------------

-- So the idea is that we should have counters that keep track of credit!
signal credit_counter_N_in, credit_counter_N_out: std_logic_vector(1 downto 0);
signal credit_counter_E_in, credit_counter_E_out: std_logic_vector(1 downto 0);
signal credit_counter_W_in, credit_counter_W_out: std_logic_vector(1 downto 0);
signal credit_counter_S_in, credit_counter_S_out: std_logic_vector(1 downto 0);
signal credit_counter_L_in, credit_counter_L_out: std_logic_vector(1 downto 0);

signal grant_N, grant_E, grant_W, grant_S, grant_L: std_logic;

signal X_N_N, X_N_E, X_N_W, X_N_S, X_N_L: std_logic;
signal X_E_N, X_E_E, X_E_W, X_E_S, X_E_L: std_logic;
signal X_W_N, X_W_E, X_W_W, X_W_S, X_W_L: std_logic;
signal X_S_N, X_S_E, X_S_W, X_S_S, X_S_L: std_logic;
signal X_L_N, X_L_E, X_L_W, X_L_S, X_L_L: std_logic;

-- These signals belong to Allocator
signal grant_N_N_sig, grant_N_E_sig, grant_N_W_sig, grant_N_S_sig, grant_N_L_sig: std_logic;
signal grant_E_N_sig, grant_E_E_sig, grant_E_W_sig, grant_E_S_sig, grant_E_L_sig: std_logic;
signal grant_W_N_sig, grant_W_E_sig, grant_W_W_sig, grant_W_S_sig, grant_W_L_sig: std_logic;
signal grant_S_N_sig, grant_S_E_sig, grant_S_W_sig, grant_S_S_sig, grant_S_L_sig: std_logic;
signal grant_L_N_sig, grant_L_E_sig, grant_L_W_sig, grant_L_S_sig, grant_L_L_sig: std_logic;

-- These signals are introduced when connecting output-related signals to the allocator checkers
signal valid_N_sig, valid_E_sig, valid_W_sig, valid_S_sig, valid_L_sig : std_logic;

signal grant_N_N_signal, grant_N_E_signal, grant_N_W_signal, grant_N_S_signal, grant_N_L_signal: std_logic;
signal grant_E_N_signal, grant_E_E_signal, grant_E_W_signal, grant_E_S_signal, grant_E_L_signal: std_logic;
signal grant_W_N_signal, grant_W_E_signal, grant_W_W_signal, grant_W_S_signal, grant_W_L_signal: std_logic;
signal grant_S_N_signal, grant_S_E_signal, grant_S_W_signal, grant_S_S_signal, grant_S_L_signal: std_logic;
signal grant_L_N_signal, grant_L_E_signal, grant_L_W_signal, grant_L_S_signal, grant_L_L_signal: std_logic;


-- Signal(s) used for creating the chain of injected fault locations
-- Total: ?? bits ??!!
-- Allocator internal-related signals
signal credit_counter_N_in_faulty, credit_counter_N_out_faulty: std_logic_vector(1 downto 0);
signal credit_counter_E_in_faulty, credit_counter_E_out_faulty: std_logic_vector(1 downto 0);
signal credit_counter_W_in_faulty, credit_counter_W_out_faulty: std_logic_vector(1 downto 0);
signal credit_counter_S_in_faulty, credit_counter_S_out_faulty: std_logic_vector(1 downto 0);
signal credit_counter_L_in_faulty, credit_counter_L_out_faulty: std_logic_vector(1 downto 0);
signal grant_N_faulty, grant_E_faulty, grant_W_faulty, grant_S_faulty, grant_L_faulty: std_logic;
signal grant_N_N_sig_faulty, grant_N_E_sig_faulty, grant_N_W_sig_faulty, grant_N_S_sig_faulty, grant_N_L_sig_faulty: std_logic;
signal grant_E_N_sig_faulty, grant_E_E_sig_faulty, grant_E_W_sig_faulty, grant_E_S_sig_faulty, grant_E_L_sig_faulty: std_logic;
signal grant_W_N_sig_faulty, grant_W_E_sig_faulty, grant_W_W_sig_faulty, grant_W_S_sig_faulty, grant_W_L_sig_faulty: std_logic;
signal grant_S_N_sig_faulty, grant_S_E_sig_faulty, grant_S_W_sig_faulty, grant_S_S_sig_faulty, grant_S_L_sig_faulty: std_logic;
signal grant_L_N_sig_faulty, grant_L_E_sig_faulty, grant_L_W_sig_faulty, grant_L_S_sig_faulty, grant_L_L_sig_faulty: std_logic;

-- Allocator output-related signals
signal valid_N_sig_faulty, valid_E_sig_faulty, valid_W_sig_faulty, valid_S_sig_faulty, valid_L_sig_faulty : std_logic;
signal grant_N_N_signal_faulty, grant_N_E_signal_faulty, grant_N_W_signal_faulty, grant_N_S_signal_faulty, grant_N_L_signal_faulty: std_logic;
signal grant_E_N_signal_faulty, grant_E_E_signal_faulty, grant_E_W_signal_faulty, grant_E_S_signal_faulty, grant_E_L_signal_faulty: std_logic;
signal grant_W_N_signal_faulty, grant_W_E_signal_faulty, grant_W_W_signal_faulty, grant_W_S_signal_faulty, grant_W_L_signal_faulty: std_logic;
signal grant_S_N_signal_faulty, grant_S_E_signal_faulty, grant_S_W_signal_faulty, grant_S_S_signal_faulty, grant_S_L_signal_faulty: std_logic;
signal grant_L_N_signal_faulty, grant_L_E_signal_faulty, grant_L_W_signal_faulty, grant_L_S_signal_faulty, grant_L_L_signal_faulty: std_logic;


begin 
  
-------------------------------------      
---- Related to fault injection -----
-------------------------------------      

-- Total: 80 bits
-- for valid and grant output signals, not sure whether to include them or the signals with _sig and _signal suffix in their name ??!!
non_faulty_signals <=  credit_counter_N_in & credit_counter_N_out & credit_counter_E_in & credit_counter_E_out &
                       credit_counter_W_in & credit_counter_W_out & credit_counter_S_in & credit_counter_S_out &
                       credit_counter_L_in & credit_counter_L_out & grant_N & grant_E & grant_W & grant_S & 
                       grant_L & grant_N_N_sig & grant_N_E_sig & grant_N_W_sig & grant_N_S_sig & grant_N_L_sig &
                       grant_E_N_sig & grant_E_E_sig & grant_E_W_sig & grant_E_S_sig & grant_E_L_sig &
                       grant_W_N_sig & grant_W_E_sig & grant_W_W_sig & grant_W_S_sig & grant_W_L_sig &
                       grant_S_N_sig & grant_S_E_sig & grant_S_W_sig & grant_S_S_sig & grant_S_L_sig &
                       grant_L_N_sig & grant_L_E_sig & grant_L_W_sig & grant_L_S_sig & grant_L_L_sig &
                       valid_N_sig & valid_E_sig & valid_W_sig & valid_S_sig & valid_L_sig &
                       grant_N_N_signal & grant_N_E_signal & grant_N_W_signal & grant_N_S_signal & grant_N_L_signal &
                       grant_E_N_signal & grant_E_E_signal & grant_E_W_signal & grant_E_S_signal & grant_E_L_signal &
                       grant_W_N_signal & grant_W_E_signal & grant_W_W_signal & grant_W_S_signal & grant_W_L_signal &
                       grant_S_N_signal & grant_S_E_signal & grant_S_W_signal & grant_S_S_signal & grant_S_L_signal &
                       grant_L_N_signal & grant_L_E_signal & grant_L_W_signal & grant_L_S_signal & grant_L_L_signal;

-- Fault injector module instantiation
FI: fault_injector generic map(DATA_WIDTH => 80, ADDRESS_WIDTH => 7) 
           port map (data_in=> non_faulty_signals , address => FI_add_sta(8 downto 2), sta_0=> FI_add_sta(1), sta_1=> FI_add_sta(0), data_out=> faulty_signals
            );


-- Extracting faulty values for internal- and output-related signals
-- Total: 17 bits

credit_counter_N_in_faulty           <= faulty_signals (79 downto 78);
credit_counter_N_out_faulty          <= faulty_signals (77 downto 76);
credit_counter_E_in_faulty           <= faulty_signals (75 downto 74);
credit_counter_E_out_faulty          <= faulty_signals (73 downto 72);
credit_counter_W_in_faulty           <= faulty_signals (71 downto 70);
credit_counter_W_out_faulty          <= faulty_signals (69 downto 68);
credit_counter_S_in_faulty           <= faulty_signals (67 downto 66);
credit_counter_S_out_faulty          <= faulty_signals (65 downto 64);
credit_counter_L_in_faulty           <= faulty_signals (63 downto 62);
credit_counter_L_out_faulty          <= faulty_signals (61 downto 60);
grant_N_faulty                       <= faulty_signals (59);
grant_E_faulty                       <= faulty_signals (58);
grant_W_faulty                       <= faulty_signals (57);
grant_S_faulty                       <= faulty_signals (56);
grant_L_faulty                       <= faulty_signals (55);
grant_N_N_sig_faulty                 <= faulty_signals (54);
grant_N_E_sig_faulty                 <= faulty_signals (53);
grant_N_W_sig_faulty                 <= faulty_signals (52);
grant_N_S_sig_faulty                 <= faulty_signals (51);
grant_N_L_sig_faulty                 <= faulty_signals (50);
grant_E_N_sig_faulty                 <= faulty_signals (49);
grant_E_E_sig_faulty                 <= faulty_signals (48);
grant_E_W_sig_faulty                 <= faulty_signals (47);
grant_E_S_sig_faulty                 <= faulty_signals (46);
grant_E_L_sig_faulty                 <= faulty_signals (45);
grant_W_N_sig_faulty                 <= faulty_signals (44);
grant_W_E_sig_faulty                 <= faulty_signals (43);
grant_W_W_sig_faulty                 <= faulty_signals (42);
grant_W_S_sig_faulty                 <= faulty_signals (41);
grant_W_L_sig_faulty                 <= faulty_signals (40);
grant_S_N_sig_faulty                 <= faulty_signals (39);
grant_S_E_sig_faulty                 <= faulty_signals (38);
grant_S_W_sig_faulty                 <= faulty_signals (37);
grant_S_S_sig_faulty                 <= faulty_signals (36);
grant_S_L_sig_faulty                 <= faulty_signals (35);
grant_L_N_sig_faulty                 <= faulty_signals (34);
grant_L_E_sig_faulty                 <= faulty_signals (33);
grant_L_W_sig_faulty                 <= faulty_signals (32);
grant_L_S_sig_faulty                 <= faulty_signals (31);
grant_L_L_sig_faulty                 <= faulty_signals (30);                              
valid_N_sig_faulty                   <= faulty_signals (29);
valid_E_sig_faulty                   <= faulty_signals (28);
valid_W_sig_faulty                   <= faulty_signals (27);
valid_S_sig_faulty                   <= faulty_signals (26);
valid_L_sig_faulty                   <= faulty_signals (25);
grant_N_N_signal_faulty              <= faulty_signals (24);
grant_N_E_signal_faulty              <= faulty_signals (23);
grant_N_W_signal_faulty              <= faulty_signals (22);
grant_N_S_signal_faulty              <= faulty_signals (21);
grant_N_L_signal_faulty              <= faulty_signals (20);
grant_E_N_signal_faulty              <= faulty_signals (19);
grant_E_E_signal_faulty              <= faulty_signals (18);
grant_E_W_signal_faulty              <= faulty_signals (17);
grant_E_S_signal_faulty              <= faulty_signals (16);
grant_E_L_signal_faulty              <= faulty_signals (15);
grant_W_N_signal_faulty              <= faulty_signals (14);
grant_W_E_signal_faulty              <= faulty_signals (13);
grant_W_W_signal_faulty              <= faulty_signals (12);
grant_W_S_signal_faulty              <= faulty_signals (11);
grant_W_L_signal_faulty              <= faulty_signals (10);
grant_S_N_signal_faulty              <= faulty_signals (9);
grant_S_E_signal_faulty              <= faulty_signals (8);
grant_S_W_signal_faulty              <= faulty_signals (7);
grant_S_S_signal_faulty              <= faulty_signals (6);
grant_S_L_signal_faulty              <= faulty_signals (5);
grant_L_N_signal_faulty              <= faulty_signals (4);
grant_L_E_signal_faulty              <= faulty_signals (3);
grant_L_W_signal_faulty              <= faulty_signals (2);
grant_L_S_signal_faulty              <= faulty_signals (1);
grant_L_L_signal_faulty              <= faulty_signals (0);

-- Total: 9 bits
--SR: shift_register_serial_in generic map(REG_WIDTH => 9) -- What about Arbiter_in and Arbiter_out ?!
--          port map ( clk=> fault_clk, reset=>reset, shift=> shift,data_in_serial=> data_in_serial, 
--                     data_out_parallel=> FI_add_sta, data_out_serial=> data_out_serial
--                   );

-------------------------------------      
-------------------------------------      

-- We did this because of the checkers

valid_N <= valid_N_sig;  
valid_E <= valid_E_sig;  
valid_W <= valid_W_sig;  
valid_S <= valid_S_sig;  
valid_L <= valid_L_sig; 

grant_N_N <= grant_N_N_signal;
grant_E_N <= grant_E_N_signal;
grant_W_N <= grant_W_N_signal;
grant_S_N <= grant_S_N_signal;
grant_L_N <= grant_L_N_signal;

grant_N_E <= grant_N_E_signal;
grant_E_E <= grant_E_E_signal;
grant_W_E <= grant_W_E_signal;
grant_S_E <= grant_S_E_signal;
grant_L_E <= grant_L_E_signal;

grant_N_W <= grant_N_W_signal;
grant_E_W <= grant_E_W_signal;
grant_W_W <= grant_W_W_signal;
grant_S_W <= grant_S_W_signal;
grant_L_W <= grant_L_W_signal;

grant_N_S <= grant_N_S_signal;
grant_E_S <= grant_E_S_signal;
grant_W_S <= grant_W_S_signal;
grant_S_S <= grant_S_S_signal;
grant_L_S <= grant_L_S_signal;

grant_N_L <= grant_N_L_signal;
grant_E_L <= grant_E_L_signal;
grant_W_L <= grant_W_L_signal;
grant_S_L <= grant_S_L_signal;
grant_L_L <= grant_L_L_signal;


-- sequential part

process(clk, reset)
begin
	if reset = '0' then 
		-- we start with all full cradit
	 	credit_counter_N_out <= (others=>'1');
		credit_counter_E_out <= (others=>'1');
		credit_counter_W_out <= (others=>'1');
		credit_counter_S_out <= (others=>'1');
		credit_counter_L_out <= (others=>'1');
	elsif clk'event and clk = '1' then 
		credit_counter_N_out <= credit_counter_N_in;
		credit_counter_E_out <= credit_counter_E_in;
		credit_counter_W_out <= credit_counter_W_in;
		credit_counter_S_out <= credit_counter_S_in;
		credit_counter_L_out <= credit_counter_L_in;

	end if;
end process;
 
-- The combionational part

-- Taking Arbiter_in checker outputs to outputs of Allocator ??!! (Behrad has written this :( )


    grant_N_N_signal <= grant_N_N_sig and not empty_N;
    grant_N_E_signal <= grant_N_E_sig and not empty_E;
    grant_N_W_signal <= grant_N_W_sig and not empty_W;
    grant_N_S_signal <= grant_N_S_sig and not empty_S;
    grant_N_L_signal <= grant_N_L_sig and not empty_L;

    grant_E_N_signal <= grant_E_N_sig and not empty_N;
    grant_E_E_signal <= grant_E_E_sig and not empty_E;
    grant_E_W_signal <= grant_E_W_sig and not empty_W;
    grant_E_S_signal <= grant_E_S_sig and not empty_S;
    grant_E_L_signal <= grant_E_L_sig and not empty_L;

    grant_W_N_signal <= grant_W_N_sig and not empty_N;
    grant_W_E_signal <= grant_W_E_sig and not empty_E;
    grant_W_W_signal <= grant_W_W_sig and not empty_W;
    grant_W_S_signal <= grant_W_S_sig and not empty_S;
    grant_W_L_signal <= grant_W_L_sig and not empty_L;

    grant_S_N_signal <= grant_S_N_sig and not empty_N;
    grant_S_E_signal <= grant_S_E_sig and not empty_E;
    grant_S_W_signal <= grant_S_W_sig and not empty_W;
    grant_S_S_signal <= grant_S_S_sig and not empty_S;
    grant_S_L_signal <= grant_S_L_sig and not empty_L;

    grant_L_N_signal <= grant_L_N_sig and not empty_N;
    grant_L_E_signal <= grant_L_E_sig and not empty_E;
    grant_L_W_signal <= grant_L_W_sig and not empty_W;
    grant_L_S_signal <= grant_L_S_sig and not empty_S;
    grant_L_L_signal <= grant_L_L_sig and not empty_L;
    
grant_N <=  (grant_N_N_sig and not empty_N )or (grant_N_E_sig and not empty_E) or (grant_N_W_sig and not empty_W) or (grant_N_S_sig and not empty_S) or (grant_N_L_sig and not empty_L);
grant_E <=  (grant_E_N_sig and not empty_N )or (grant_E_E_sig and not empty_E) or (grant_E_W_sig and not empty_W) or (grant_E_S_sig and not empty_S) or (grant_E_L_sig and not empty_L);
grant_W <=  (grant_W_N_sig and not empty_N )or (grant_W_E_sig and not empty_E) or (grant_W_W_sig and not empty_W) or (grant_W_S_sig and not empty_S) or (grant_W_L_sig and not empty_L);
grant_S <=  (grant_S_N_sig and not empty_N )or (grant_S_E_sig and not empty_E) or (grant_S_W_sig and not empty_W) or (grant_S_S_sig and not empty_S) or (grant_S_L_sig and not empty_L);
grant_L <=  (grant_L_N_sig and not empty_N )or (grant_L_E_sig and not empty_E) or (grant_L_W_sig and not empty_W) or (grant_L_S_sig and not empty_S) or (grant_L_L_sig and not empty_L);

-- this process handles the credit counters!
process(credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L, grant_N, grant_E, grant_W, grant_S, grant_L,
		credit_counter_N_out, credit_counter_E_out, credit_counter_W_out, credit_counter_S_out, credit_counter_L_out
		)
 begin
 	credit_counter_N_in <= credit_counter_N_out;
 	credit_counter_E_in <= credit_counter_E_out;
 	credit_counter_W_in <= credit_counter_W_out;
 	credit_counter_S_in <= credit_counter_S_out;
 	credit_counter_L_in <= credit_counter_L_out;

  if credit_in_N = '1' and grant_N = '1' then 
       credit_counter_N_in <= credit_counter_N_out; 
  elsif credit_in_N = '1'  and credit_counter_N_out < 3 then 
 	 credit_counter_N_in <= credit_counter_N_out + 1;
  elsif grant_N = '1' and credit_counter_N_out > 0 then
 	 credit_counter_N_in <= credit_counter_N_out - 1;
  end if;
 	
  if credit_in_E = '1' and grant_E = '1' then 
       credit_counter_E_in <= credit_counter_E_out; 
 elsif credit_in_E = '1' and credit_counter_E_out < 3 then 
 	credit_counter_E_in <= credit_counter_E_out + 1;
 elsif grant_E = '1' and credit_counter_E_out > 0 then
 	credit_counter_E_in <= credit_counter_E_out - 1;
 end if;

 	if credit_in_W = '1' and grant_W = '1' then 
       credit_counter_W_in <= credit_counter_W_out; 
  elsif credit_in_W = '1' and credit_counter_W_out < 3 then 
    credit_counter_W_in <= credit_counter_W_out + 1;
  elsif grant_W = '1' and credit_counter_W_out > 0 then
    credit_counter_W_in <= credit_counter_W_out - 1;
  end if;

 	if credit_in_S = '1' and grant_S = '1' then 
       credit_counter_S_in <= credit_counter_S_out; 
  elsif credit_in_S = '1' and credit_counter_S_out < 3 then 
    credit_counter_S_in <= credit_counter_S_out + 1;
  elsif grant_S = '1' and credit_counter_S_out > 0 then
    credit_counter_S_in <= credit_counter_S_out - 1;
  end if;

 	
 	if credit_in_L = '1' and grant_L = '1' then 
       credit_counter_L_in <= credit_counter_L_out; 
  elsif credit_in_L = '1' and credit_counter_L_out < 3 then 
    credit_counter_L_in <= credit_counter_L_out + 1;
  elsif grant_L = '1' and credit_counter_L_out > 0 then
    credit_counter_L_in <= credit_counter_L_out - 1;
  end if;

 end process;

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-- Allocator logic checkers module instantiation
ALLOCATOR_LOGIC_CHECKERS: allocator_logic_pseudo_checkers  PORT MAP (
                                                       empty_N => empty_N,  
                                                       empty_E => empty_E,  
                                                       empty_W => empty_W,  
                                                       empty_S => empty_S,  
                                                       empty_L => empty_L, 
                                                       grant_N_N_sig => grant_N_N_sig_faulty, grant_N_E_sig => grant_N_E_sig_faulty, grant_N_W_sig => grant_N_W_sig_faulty, grant_N_S_sig => grant_N_S_sig_faulty, grant_N_L_sig => grant_N_L_sig_faulty, 
                                                       grant_E_N_sig => grant_E_N_sig_faulty, grant_E_E_sig => grant_E_E_sig_faulty, grant_E_W_sig => grant_E_W_sig_faulty, grant_E_S_sig => grant_E_S_sig_faulty, grant_E_L_sig => grant_E_L_sig_faulty,
                                                       grant_W_N_sig => grant_W_N_sig_faulty, grant_W_E_sig => grant_W_E_sig_faulty, grant_W_W_sig => grant_W_W_sig_faulty, grant_W_S_sig => grant_W_S_sig_faulty, grant_W_L_sig => grant_W_L_sig_faulty,
                                                       grant_S_N_sig => grant_S_N_sig_faulty, grant_S_E_sig => grant_S_E_sig_faulty, grant_S_W_sig => grant_S_W_sig_faulty, grant_S_S_sig => grant_S_S_sig_faulty, grant_S_L_sig => grant_S_L_sig_faulty,
                                                       grant_L_N_sig => grant_L_N_sig_faulty, grant_L_E_sig => grant_L_E_sig_faulty, grant_L_W_sig => grant_L_W_sig_faulty, grant_L_S_sig => grant_L_S_sig_faulty, grant_L_L_sig => grant_L_L_sig_faulty,

                                                       valid_N => valid_N_sig_faulty, 
                                                       valid_E => valid_E_sig_faulty, 
                                                       valid_W => valid_W_sig_faulty, 
                                                       valid_S => valid_S_sig_faulty, 
                                                       valid_L => valid_L_sig_faulty,
                                                       grant_N_N => grant_N_N_signal_faulty, 
                                                       grant_N_E => grant_N_E_signal_faulty, 
                                                       grant_N_W => grant_N_W_signal_faulty, 
                                                       grant_N_S => grant_N_S_signal_faulty, 
                                                       grant_N_L => grant_N_L_signal_faulty, 
                                                       grant_E_N => grant_E_N_signal_faulty, 
                                                       grant_E_E => grant_E_E_signal_faulty, 
                                                       grant_E_W => grant_E_W_signal_faulty, 
                                                       grant_E_S => grant_E_S_signal_faulty, 
                                                       grant_E_L => grant_E_L_signal_faulty, 
                                                       grant_W_N => grant_W_N_signal_faulty, 
                                                       grant_W_E => grant_W_E_signal_faulty, 
                                                       grant_W_W => grant_W_W_signal_faulty, 
                                                       grant_W_S => grant_W_S_signal_faulty, 
                                                       grant_W_L => grant_W_L_signal_faulty, 
                                                       grant_S_N => grant_S_N_signal_faulty, 
                                                       grant_S_E => grant_S_E_signal_faulty, 
                                                       grant_S_W => grant_S_W_signal_faulty, 
                                                       grant_S_S => grant_S_S_signal_faulty, 
                                                       grant_S_L => grant_S_L_signal_faulty, 
                                                       grant_L_N => grant_L_N_signal_faulty, 
                                                       grant_L_E => grant_L_E_signal_faulty, 
                                                       grant_L_W => grant_L_W_signal_faulty, 
                                                       grant_L_S => grant_L_S_signal_faulty, 
                                                       grant_L_L => grant_L_L_signal_faulty, 
                                                       grant_N   => grant_N_faulty, 
                                                       grant_E   => grant_E_faulty, 
                                                       grant_W   => grant_W_faulty, 
                                                       grant_S   => grant_S_faulty, 
                                                       grant_L   => grant_L_faulty,

                                                      -- Checker Outputs
                                                      err_grant_N_N_sig_not_empty_N_grant_N_N => err_grant_N_N_sig_not_empty_N_grant_N_N, 
                                                      err_not_grant_N_N_sig_or_empty_N_not_grant_N_N => err_not_grant_N_N_sig_or_empty_N_not_grant_N_N, 
                                                      err_grant_N_E_sig_not_empty_E_grant_N_E => err_grant_N_E_sig_not_empty_E_grant_N_E, 
                                                      err_not_grant_N_E_sig_or_empty_E_not_grant_N_E => err_not_grant_N_E_sig_or_empty_E_not_grant_N_E, 
                                                      err_grant_N_W_sig_not_empty_W_grant_N_W => err_grant_N_W_sig_not_empty_W_grant_N_W, 
                                                      err_not_grant_N_W_sig_or_empty_W_not_grant_N_W => err_not_grant_N_W_sig_or_empty_W_not_grant_N_W, 
                                                      err_grant_N_S_sig_not_empty_S_grant_N_S => err_grant_N_S_sig_not_empty_S_grant_N_S, 
                                                      err_not_grant_N_S_sig_or_empty_S_not_grant_N_S => err_not_grant_N_S_sig_or_empty_S_not_grant_N_S, 
                                                      err_grant_N_L_sig_not_empty_L_grant_N_L => err_grant_N_L_sig_not_empty_L_grant_N_L, 
                                                      err_not_grant_N_L_sig_or_empty_L_not_grant_N_L => err_not_grant_N_L_sig_or_empty_L_not_grant_N_L, 

                                                      err_grant_E_N_sig_not_empty_N_grant_E_N => err_grant_E_N_sig_not_empty_N_grant_E_N, 
                                                      err_not_grant_E_N_sig_or_empty_N_not_grant_E_N => err_not_grant_E_N_sig_or_empty_N_not_grant_E_N, 
                                                      err_grant_E_E_sig_not_empty_E_grant_E_E => err_grant_E_E_sig_not_empty_E_grant_E_E, 
                                                      err_not_grant_E_E_sig_or_empty_E_not_grant_E_E => err_not_grant_E_E_sig_or_empty_E_not_grant_E_E, 
                                                      err_grant_E_W_sig_not_empty_W_grant_E_W => err_grant_E_W_sig_not_empty_W_grant_E_W, 
                                                      err_not_grant_E_W_sig_or_empty_W_not_grant_E_W => err_not_grant_E_W_sig_or_empty_W_not_grant_E_W, 
                                                      err_grant_E_S_sig_not_empty_S_grant_E_S => err_grant_E_S_sig_not_empty_S_grant_E_S, 
                                                      err_not_grant_E_S_sig_or_empty_S_not_grant_E_S => err_not_grant_E_S_sig_or_empty_S_not_grant_E_S, 
                                                      err_grant_E_L_sig_not_empty_L_grant_E_L => err_grant_E_L_sig_not_empty_L_grant_E_L, 
                                                      err_not_grant_E_L_sig_or_empty_L_not_grant_E_L => err_not_grant_E_L_sig_or_empty_L_not_grant_E_L, 

                                                      err_grant_W_N_sig_not_empty_N_grant_W_N => err_grant_W_N_sig_not_empty_N_grant_W_N, 
                                                      err_not_grant_W_N_sig_or_empty_N_not_grant_W_N => err_not_grant_W_N_sig_or_empty_N_not_grant_W_N, 
                                                      err_grant_W_E_sig_not_empty_E_grant_W_E => err_grant_W_E_sig_not_empty_E_grant_W_E, 
                                                      err_not_grant_W_E_sig_or_empty_E_not_grant_W_E => err_not_grant_W_E_sig_or_empty_E_not_grant_W_E, 
                                                      err_grant_W_W_sig_not_empty_W_grant_W_W => err_grant_W_W_sig_not_empty_W_grant_W_W, 
                                                      err_not_grant_W_W_sig_or_empty_W_not_grant_W_W => err_not_grant_W_W_sig_or_empty_W_not_grant_W_W, 
                                                      err_grant_W_S_sig_not_empty_S_grant_W_S => err_grant_W_S_sig_not_empty_S_grant_W_S, 
                                                      err_not_grant_W_S_sig_or_empty_S_not_grant_W_S => err_not_grant_W_S_sig_or_empty_S_not_grant_W_S, 
                                                      err_grant_W_L_sig_not_empty_L_grant_W_L => err_grant_W_L_sig_not_empty_L_grant_W_L, 
                                                      err_not_grant_W_L_sig_or_empty_L_not_grant_W_L => err_not_grant_W_L_sig_or_empty_L_not_grant_W_L, 

                                                      err_grant_S_N_sig_not_empty_N_grant_S_N => err_grant_S_N_sig_not_empty_N_grant_S_N, 
                                                      err_not_grant_S_N_sig_or_empty_N_not_grant_S_N => err_not_grant_S_N_sig_or_empty_N_not_grant_S_N, 
                                                      err_grant_S_E_sig_not_empty_E_grant_S_E => err_grant_S_E_sig_not_empty_E_grant_S_E, 
                                                      err_not_grant_S_E_sig_or_empty_E_not_grant_S_E => err_not_grant_S_E_sig_or_empty_E_not_grant_S_E, 
                                                      err_grant_S_W_sig_not_empty_W_grant_S_W => err_grant_S_W_sig_not_empty_W_grant_S_W, 
                                                      err_not_grant_S_W_sig_or_empty_W_not_grant_S_W => err_not_grant_S_W_sig_or_empty_W_not_grant_S_W, 
                                                      err_grant_S_S_sig_not_empty_S_grant_S_S => err_grant_S_S_sig_not_empty_S_grant_S_S, 
                                                      err_not_grant_S_S_sig_or_empty_S_not_grant_S_S => err_not_grant_S_S_sig_or_empty_S_not_grant_S_S, 
                                                      err_grant_S_L_sig_not_empty_L_grant_S_L => err_grant_S_L_sig_not_empty_L_grant_S_L, 
                                                      err_not_grant_S_L_sig_or_empty_L_not_grant_S_L => err_not_grant_S_L_sig_or_empty_L_not_grant_S_L, 

                                                      err_grant_L_N_sig_not_empty_N_grant_L_N => err_grant_L_N_sig_not_empty_N_grant_L_N, 
                                                      err_not_grant_L_N_sig_or_empty_N_not_grant_L_N => err_not_grant_L_N_sig_or_empty_N_not_grant_L_N, 
                                                      err_grant_L_E_sig_not_empty_E_grant_L_E => err_grant_L_E_sig_not_empty_E_grant_L_E, 
                                                      err_not_grant_L_E_sig_or_empty_E_not_grant_L_E => err_not_grant_L_E_sig_or_empty_E_not_grant_L_E, 
                                                      err_grant_L_W_sig_not_empty_W_grant_L_W => err_grant_L_W_sig_not_empty_W_grant_L_W, 
                                                      err_not_grant_L_W_sig_or_empty_W_not_grant_L_W => err_not_grant_L_W_sig_or_empty_W_not_grant_L_W, 
                                                      err_grant_L_S_sig_not_empty_S_grant_L_S => err_grant_L_S_sig_not_empty_S_grant_L_S, 
                                                      err_not_grant_L_S_sig_or_empty_S_not_grant_L_S => err_not_grant_L_S_sig_or_empty_S_not_grant_L_S, 
                                                      err_grant_L_L_sig_not_empty_L_grant_L_L => err_grant_L_L_sig_not_empty_L_grant_L_L, 
                                                      err_not_grant_L_L_sig_or_empty_L_not_grant_L_L => err_not_grant_L_L_sig_or_empty_L_not_grant_L_L, 

                                                      err_grant_signals_not_empty_grant_N     => err_grant_signals_not_empty_grant_N     , 
                                                      err_not_grant_signals_empty_not_grant_N => err_not_grant_signals_empty_not_grant_N , 
                                                      err_grant_signals_not_empty_grant_E     => err_grant_signals_not_empty_grant_E     , 
                                                      err_not_grant_signals_empty_not_grant_E => err_not_grant_signals_empty_not_grant_E , 
                                                      err_grant_signals_not_empty_grant_W     => err_grant_signals_not_empty_grant_W     , 
                                                      err_not_grant_signals_empty_not_grant_W => err_not_grant_signals_empty_not_grant_W , 
                                                      err_grant_signals_not_empty_grant_S     => err_grant_signals_not_empty_grant_S     , 
                                                      err_not_grant_signals_empty_not_grant_S => err_not_grant_signals_empty_not_grant_S , 
                                                      err_grant_signals_not_empty_grant_L     => err_grant_signals_not_empty_grant_L     , 
                                                      err_not_grant_signals_empty_not_grant_L => err_not_grant_signals_empty_not_grant_L , 

                                                      err_grants_valid_not_match => err_grants_valid_not_match
                                                    );


-- Allocator credit counter logic checkers module instantiation
ALLOCATOR_CREDIT_COUNTER_LOGIC_CHECKERS: allocator_credit_counter_logic_pseudo_checkers  PORT MAP (
                                                                       credit_in_N => credit_in_N, 
                                                                       credit_in_E => credit_in_E, 
                                                                       credit_in_W => credit_in_W, 
                                                                       credit_in_S => credit_in_S, 
                                                                       credit_in_L => credit_in_L, 
                                                                       credit_counter_N_out => credit_counter_N_out_faulty, credit_counter_E_out => credit_counter_E_out_faulty, credit_counter_W_out => credit_counter_W_out_faulty, credit_counter_S_out => credit_counter_S_out_faulty, credit_counter_L_out => credit_counter_L_out_faulty,
                                                                       valid_N => grant_N_faulty, -- Must be connected to grant signals!
                                                                       valid_E => grant_E_faulty, -- Must be connected to grant signals!
                                                                       valid_W => grant_W_faulty, -- Must be connected to grant signals!
                                                                       valid_S => grant_S_faulty, -- Must be connected to grant signals!
                                                                       valid_L => grant_L_faulty, -- Must be connected to grant signals!

                                                                       credit_counter_N_in => credit_counter_N_in_faulty, 
                                                                       credit_counter_E_in => credit_counter_E_in_faulty, 
                                                                       credit_counter_W_in => credit_counter_W_in_faulty, 
                                                                       credit_counter_S_in => credit_counter_S_in_faulty, 
                                                                       credit_counter_L_in => credit_counter_L_in_faulty, 

                                                                       -- Checker Outputs
                                                                       err_credit_in_N_grant_N_credit_counter_N_in_credit_counter_N_out_equal => err_credit_in_N_grant_N_credit_counter_N_in_credit_counter_N_out_equal, 
                                                                       err_credit_in_N_credit_counter_N_out_increment => err_credit_in_N_credit_counter_N_out_increment, 
                                                                       err_not_credit_in_N_credit_counter_N_out_max_credit_counter_N_in_not_change => err_not_credit_in_N_credit_counter_N_out_max_credit_counter_N_in_not_change, 
                                                                       err_grant_N_credit_counter_N_out_decrement => err_grant_N_credit_counter_N_out_decrement, 
                                                                       err_not_grant_N_or_credit_counter_N_out_zero_credit_counter_N_in_not_change => err_not_grant_N_or_credit_counter_N_out_zero_credit_counter_N_in_not_change, 
                                                                       err_not_credit_in_N_not_grant_N_credit_counter_N_in_credit_counter_N_out_equal => err_not_credit_in_N_not_grant_N_credit_counter_N_in_credit_counter_N_out_equal, 
 
                                                                       err_credit_in_E_grant_E_credit_counter_E_in_credit_counter_E_out_equal => err_credit_in_E_grant_E_credit_counter_E_in_credit_counter_E_out_equal, 
                                                                       err_credit_in_E_credit_counter_E_out_increment => err_credit_in_E_credit_counter_E_out_increment, 
                                                                       err_not_credit_in_E_credit_counter_E_out_max_credit_counter_E_in_not_change => err_not_credit_in_E_credit_counter_E_out_max_credit_counter_E_in_not_change, 
                                                                       err_grant_E_credit_counter_E_out_decrement => err_grant_E_credit_counter_E_out_decrement, 
                                                                       err_not_grant_E_or_credit_counter_E_out_zero_credit_counter_E_in_not_change => err_not_grant_E_or_credit_counter_E_out_zero_credit_counter_E_in_not_change,
                                                                       err_not_credit_in_E_not_grant_E_credit_counter_E_in_credit_counter_E_out_equal => err_not_credit_in_E_not_grant_E_credit_counter_E_in_credit_counter_E_out_equal, 
 
                                                                       err_credit_in_W_grant_W_credit_counter_W_in_credit_counter_W_out_equal => err_credit_in_W_grant_W_credit_counter_W_in_credit_counter_W_out_equal, 
                                                                       err_credit_in_W_credit_counter_W_out_increment => err_credit_in_W_credit_counter_W_out_increment, 
                                                                       err_not_credit_in_W_credit_counter_W_out_max_credit_counter_W_in_not_change => err_not_credit_in_W_credit_counter_W_out_max_credit_counter_W_in_not_change, 
                                                                       err_grant_W_credit_counter_W_out_decrement => err_grant_W_credit_counter_W_out_decrement, 
                                                                       err_not_grant_W_or_credit_counter_W_out_zero_credit_counter_W_in_not_change => err_not_grant_W_or_credit_counter_W_out_zero_credit_counter_W_in_not_change, 
                                                                       err_not_credit_in_W_not_grant_W_credit_counter_W_in_credit_counter_W_out_equal => err_not_credit_in_W_not_grant_W_credit_counter_W_in_credit_counter_W_out_equal, 
 
                                                                       err_credit_in_S_grant_S_credit_counter_S_in_credit_counter_S_out_equal => err_credit_in_S_grant_S_credit_counter_S_in_credit_counter_S_out_equal, 
                                                                       err_credit_in_S_credit_counter_S_out_increment => err_credit_in_S_credit_counter_S_out_increment, 
                                                                       err_not_credit_in_S_credit_counter_S_out_max_credit_counter_S_in_not_change => err_not_credit_in_S_credit_counter_S_out_max_credit_counter_S_in_not_change, 
                                                                       err_grant_S_credit_counter_S_out_decrement => err_grant_S_credit_counter_S_out_decrement, 
                                                                       err_not_grant_S_or_credit_counter_S_out_zero_credit_counter_S_in_not_change => err_not_grant_S_or_credit_counter_S_out_zero_credit_counter_S_in_not_change, 
                                                                       err_not_credit_in_S_not_grant_S_credit_counter_S_in_credit_counter_S_out_equal => err_not_credit_in_S_not_grant_S_credit_counter_S_in_credit_counter_S_out_equal, 
 
                                                                       err_credit_in_L_grant_L_credit_counter_L_in_credit_counter_L_out_equal => err_credit_in_L_grant_L_credit_counter_L_in_credit_counter_L_out_equal, 
                                                                       err_credit_in_L_credit_counter_L_out_increment => err_credit_in_L_credit_counter_L_out_increment, 
                                                                       err_not_credit_in_L_credit_counter_L_out_max_credit_counter_L_in_not_change => err_not_credit_in_L_credit_counter_L_out_max_credit_counter_L_in_not_change, 
                                                                       err_grant_L_credit_counter_L_out_decrement => err_grant_L_credit_counter_L_out_decrement, 
                                                                       err_not_grant_L_or_credit_counter_L_out_zero_credit_counter_L_in_not_change => err_not_grant_L_or_credit_counter_L_out_zero_credit_counter_L_in_not_change,
                                                                       err_not_credit_in_L_not_grant_L_credit_counter_L_in_credit_counter_L_out_equal => err_not_credit_in_L_not_grant_L_credit_counter_L_in_credit_counter_L_out_equal 
                                                                   );

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-- Arbiter In

-- North Arbiter_in with checkers integrated (module instantiation)
arb_N_X: Arbiter_in  PORT MAP (reset => reset, clk => clk,
				       Req_X_N=>req_N_N, Req_X_E=> req_N_E, Req_X_W=>req_N_W, Req_X_S=>req_N_S, Req_X_L=>req_N_L,
                               X_N=>X_N_N, X_E=>X_N_E, X_W=>X_N_W, X_S=>X_N_S, X_L=>X_N_L, 

                              shift=>shift, fault_clk=>fault_clk, data_in_serial=> fault_DO_serial_L_Arbiter_in_N_Arbiter_in, 
                              data_out_serial=>fault_DO_serial_N_Arbiter_in_E_Arbiter_in,
                                      
                               -- North Arbiter_in Checker outputs
                              err_Requests_state_in_state_not_equal => N_err_Requests_state_in_state_not_equal,
            
                              err_IDLE_Req_N =>    N_err_IDLE_Req_N,
                              err_IDLE_grant_N =>  N_err_IDLE_grant_N,
                              err_North_Req_N =>   N_err_North_Req_N,
                              err_North_grant_N => N_err_North_grant_N,
                              err_East_Req_E =>    N_err_East_Req_E,
                              err_East_grant_E =>  N_err_East_grant_E,
                              err_West_Req_W =>    N_err_West_Req_W,
                              err_West_grant_W =>  N_err_West_grant_W,
                              err_South_Req_S =>   N_err_South_Req_S,
                              err_South_grant_S => N_err_South_grant_S,
                              err_Local_Req_L =>   N_err_Local_Req_L,
                              err_Local_grant_L => N_err_Local_grant_L,
            
                              err_IDLE_Req_E => N_err_IDLE_Req_E,
                              err_IDLE_grant_E => N_err_IDLE_grant_E,
                              err_North_Req_E => N_err_North_Req_E,
                              err_North_grant_E => N_err_North_grant_E,
                              err_East_Req_W => N_err_East_Req_W,
                              err_East_grant_W => N_err_East_grant_W,
                              err_West_Req_S => N_err_West_Req_S,
                              err_West_grant_S => N_err_West_grant_S,
                              err_South_Req_L => N_err_South_Req_L,
                              err_South_grant_L => N_err_South_grant_L,
                              err_Local_Req_N => N_err_Local_Req_N,
                              err_Local_grant_N => N_err_Local_grant_N,
            
                              err_IDLE_Req_W => N_err_IDLE_Req_W,
                              err_IDLE_grant_W => N_err_IDLE_grant_W,
                              err_North_Req_W => N_err_North_Req_W,
                              err_North_grant_W => N_err_North_grant_W,
                              err_East_Req_S => N_err_East_Req_S,
                              err_East_grant_S => N_err_East_grant_S,
                              err_West_Req_L => N_err_West_Req_L,
                              err_West_grant_L => N_err_West_grant_L,
                              err_South_Req_N => N_err_South_Req_N,
                              err_South_grant_N => N_err_South_grant_N,
                              err_Local_Req_E => N_err_Local_Req_E,
                              err_Local_grant_E => N_err_Local_grant_E,
            
                              err_IDLE_Req_S => N_err_IDLE_Req_S,
                              err_IDLE_grant_S => N_err_IDLE_grant_S,
                              err_North_Req_S => N_err_North_Req_S,
                              err_North_grant_S => N_err_North_grant_S,
                              err_East_Req_L => N_err_East_Req_L,
                              err_East_grant_L => N_err_East_grant_L,
                              err_West_Req_N => N_err_West_Req_N,
                              err_West_grant_N => N_err_West_grant_N,
                              err_South_Req_E => N_err_South_Req_E,
                              err_South_grant_E => N_err_South_grant_E,
                              err_Local_Req_W => N_err_Local_Req_W,
                              err_Local_grant_W => N_err_Local_grant_W,
            
                              err_IDLE_Req_L => N_err_IDLE_Req_L,
                              err_IDLE_grant_L => N_err_IDLE_grant_L,
                              err_North_Req_L => N_err_North_Req_L,
                              err_North_grant_L => N_err_North_grant_L,
                              err_East_Req_N => N_err_East_Req_N,
                              err_East_grant_N => N_err_East_grant_N,
                              err_West_Req_E => N_err_West_Req_E,
                              err_West_grant_E => N_err_West_grant_E,
                              err_South_Req_W => N_err_South_Req_W,
                              err_South_grant_W => N_err_South_grant_W,
                              err_Local_Req_S => N_err_Local_Req_S,
                              err_Local_grant_S => N_err_Local_grant_S,
            
                              err_state_in_onehot   => N_err_state_in_onehot, 
                              err_no_request_grants => N_err_no_request_grants,
                              err_request_no_grants => N_err_request_no_grants, 

                              err_no_Req_N_grant_N => N_err_no_Req_N_grant_N,
                              err_no_Req_E_grant_E => N_err_no_Req_E_grant_E,
                              err_no_Req_W_grant_W => N_err_no_Req_W_grant_W,
                              err_no_Req_S_grant_S => N_err_no_Req_S_grant_S,
                              err_no_Req_L_grant_L => N_err_no_Req_L_grant_L                  
                               );

arb_E_X: Arbiter_in  PORT MAP (reset => reset, clk => clk,
				                       Req_X_N=>req_E_N, Req_X_E=> req_E_E, Req_X_W=>req_E_W, Req_X_S=>req_E_S, Req_X_L=>req_E_L,
                               X_N=>X_E_N, X_E=>X_E_E, X_W=>X_E_W, X_S=>X_E_S, X_L=>X_E_L, 

                              shift=>shift, fault_clk=>fault_clk, data_in_serial=> fault_DO_serial_N_Arbiter_in_E_Arbiter_in, 
                              data_out_serial=>fault_DO_serial_E_Arbiter_in_W_Arbiter_in,
                                      
                               -- East Arbiter_in Checker outputs
                              err_Requests_state_in_state_not_equal => E_err_Requests_state_in_state_not_equal,
            
                              err_IDLE_Req_N =>    E_err_IDLE_Req_N,
                              err_IDLE_grant_N =>  E_err_IDLE_grant_N,
                              err_North_Req_N =>   E_err_North_Req_N,
                              err_North_grant_N => E_err_North_grant_N,
                              err_East_Req_E =>    E_err_East_Req_E,
                              err_East_grant_E =>  E_err_East_grant_E,
                              err_West_Req_W =>    E_err_West_Req_W,
                              err_West_grant_W =>  E_err_West_grant_W,
                              err_South_Req_S =>   E_err_South_Req_S,
                              err_South_grant_S => E_err_South_grant_S,
                              err_Local_Req_L =>   E_err_Local_Req_L,
                              err_Local_grant_L => E_err_Local_grant_L,
            
                              err_IDLE_Req_E => E_err_IDLE_Req_E,
                              err_IDLE_grant_E => E_err_IDLE_grant_E,
                              err_North_Req_E => E_err_North_Req_E,
                              err_North_grant_E => E_err_North_grant_E,
                              err_East_Req_W => E_err_East_Req_W,
                              err_East_grant_W => E_err_East_grant_W,
                              err_West_Req_S => E_err_West_Req_S,
                              err_West_grant_S => E_err_West_grant_S,
                              err_South_Req_L => E_err_South_Req_L,
                              err_South_grant_L => E_err_South_grant_L,
                              err_Local_Req_N => E_err_Local_Req_N,
                              err_Local_grant_N => E_err_Local_grant_N,
            
                              err_IDLE_Req_W => E_err_IDLE_Req_W,
                              err_IDLE_grant_W => E_err_IDLE_grant_W,
                              err_North_Req_W => E_err_North_Req_W,
                              err_North_grant_W => E_err_North_grant_W,
                              err_East_Req_S => E_err_East_Req_S,
                              err_East_grant_S => E_err_East_grant_S,
                              err_West_Req_L => E_err_West_Req_L,
                              err_West_grant_L => E_err_West_grant_L,
                              err_South_Req_N => E_err_South_Req_N,
                              err_South_grant_N => E_err_South_grant_N,
                              err_Local_Req_E => E_err_Local_Req_E,
                              err_Local_grant_E => E_err_Local_grant_E,
            
                              err_IDLE_Req_S => E_err_IDLE_Req_S,
                              err_IDLE_grant_S => E_err_IDLE_grant_S,
                              err_North_Req_S => E_err_North_Req_S,
                              err_North_grant_S => E_err_North_grant_S,
                              err_East_Req_L => E_err_East_Req_L,
                              err_East_grant_L => E_err_East_grant_L,
                              err_West_Req_N => E_err_West_Req_N,
                              err_West_grant_N => E_err_West_grant_N,
                              err_South_Req_E => E_err_South_Req_E,
                              err_South_grant_E => E_err_South_grant_E,
                              err_Local_Req_W => E_err_Local_Req_W,
                              err_Local_grant_W => E_err_Local_grant_W,
            
                              err_IDLE_Req_L => E_err_IDLE_Req_L,
                              err_IDLE_grant_L => E_err_IDLE_grant_L,
                              err_North_Req_L => E_err_North_Req_L,
                              err_North_grant_L => E_err_North_grant_L,
                              err_East_Req_N => E_err_East_Req_N,
                              err_East_grant_N => E_err_East_grant_N,
                              err_West_Req_E => E_err_West_Req_E,
                              err_West_grant_E => E_err_West_grant_E,
                              err_South_Req_W => E_err_South_Req_W,
                              err_South_grant_W => E_err_South_grant_W,
                              err_Local_Req_S => E_err_Local_Req_S,
                              err_Local_grant_S => E_err_Local_grant_S,
            
                              err_state_in_onehot   => E_err_state_in_onehot, 
                              err_no_request_grants => E_err_no_request_grants,
                              err_request_no_grants => E_err_request_no_grants, 

                              err_no_Req_N_grant_N => E_err_no_Req_N_grant_N,
                              err_no_Req_E_grant_E => E_err_no_Req_E_grant_E,
                              err_no_Req_W_grant_W => E_err_no_Req_W_grant_W,
                              err_no_Req_S_grant_S => E_err_no_Req_S_grant_S,
                              err_no_Req_L_grant_L => E_err_no_Req_L_grant_L 
                               );

arb_W_X: Arbiter_in  PORT MAP (reset => reset, clk => clk,
                               Req_X_N=>req_W_N, Req_X_E=> req_W_E, Req_X_W=>req_W_W, Req_X_S=>req_W_S, Req_X_L=>req_W_L,
                               X_N=>X_W_N, X_E=>X_W_E, X_W=>X_W_W, X_S=>X_W_S, X_L=>X_W_L, 

                              shift=>shift, fault_clk=>fault_clk, data_in_serial=> fault_DO_serial_E_Arbiter_in_W_Arbiter_in, 
                              data_out_serial=>fault_DO_serial_W_Arbiter_in_S_Arbiter_in,
                                      
                               -- West Arbiter_in Checker outputs
                              err_Requests_state_in_state_not_equal => W_err_Requests_state_in_state_not_equal,
            
                              err_IDLE_Req_N =>    W_err_IDLE_Req_N,
                              err_IDLE_grant_N =>  W_err_IDLE_grant_N,
                              err_North_Req_N =>   W_err_North_Req_N,
                              err_North_grant_N => W_err_North_grant_N,
                              err_East_Req_E =>    W_err_East_Req_E,
                              err_East_grant_E =>  W_err_East_grant_E,
                              err_West_Req_W =>    W_err_West_Req_W,
                              err_West_grant_W =>  W_err_West_grant_W,
                              err_South_Req_S =>   W_err_South_Req_S,
                              err_South_grant_S => W_err_South_grant_S,
                              err_Local_Req_L =>   W_err_Local_Req_L,
                              err_Local_grant_L => W_err_Local_grant_L,
            
                              err_IDLE_Req_E => W_err_IDLE_Req_E,
                              err_IDLE_grant_E => W_err_IDLE_grant_E,
                              err_North_Req_E => W_err_North_Req_E,
                              err_North_grant_E => W_err_North_grant_E,
                              err_East_Req_W => W_err_East_Req_W,
                              err_East_grant_W => W_err_East_grant_W,
                              err_West_Req_S => W_err_West_Req_S,
                              err_West_grant_S => W_err_West_grant_S,
                              err_South_Req_L => W_err_South_Req_L,
                              err_South_grant_L => W_err_South_grant_L,
                              err_Local_Req_N => W_err_Local_Req_N,
                              err_Local_grant_N => W_err_Local_grant_N,
            
                              err_IDLE_Req_W => W_err_IDLE_Req_W,
                              err_IDLE_grant_W => W_err_IDLE_grant_W,
                              err_North_Req_W => W_err_North_Req_W,
                              err_North_grant_W => W_err_North_grant_W,
                              err_East_Req_S => W_err_East_Req_S,
                              err_East_grant_S => W_err_East_grant_S,
                              err_West_Req_L => W_err_West_Req_L,
                              err_West_grant_L => W_err_West_grant_L,
                              err_South_Req_N => W_err_South_Req_N,
                              err_South_grant_N => W_err_South_grant_N,
                              err_Local_Req_E => W_err_Local_Req_E,
                              err_Local_grant_E => W_err_Local_grant_E,
            
                              err_IDLE_Req_S => W_err_IDLE_Req_S,
                              err_IDLE_grant_S => W_err_IDLE_grant_S,
                              err_North_Req_S => W_err_North_Req_S,
                              err_North_grant_S => W_err_North_grant_S,
                              err_East_Req_L => W_err_East_Req_L,
                              err_East_grant_L => W_err_East_grant_L,
                              err_West_Req_N => W_err_West_Req_N,
                              err_West_grant_N => W_err_West_grant_N,
                              err_South_Req_E => W_err_South_Req_E,
                              err_South_grant_E => W_err_South_grant_E,
                              err_Local_Req_W => W_err_Local_Req_W,
                              err_Local_grant_W => W_err_Local_grant_W,
            
                              err_IDLE_Req_L => W_err_IDLE_Req_L,
                              err_IDLE_grant_L => W_err_IDLE_grant_L,
                              err_North_Req_L => W_err_North_Req_L,
                              err_North_grant_L => W_err_North_grant_L,
                              err_East_Req_N => W_err_East_Req_N,
                              err_East_grant_N => W_err_East_grant_N,
                              err_West_Req_E => W_err_West_Req_E,
                              err_West_grant_E => W_err_West_grant_E,
                              err_South_Req_W => W_err_South_Req_W,
                              err_South_grant_W => W_err_South_grant_W,
                              err_Local_Req_S => W_err_Local_Req_S,
                              err_Local_grant_S => W_err_Local_grant_S,
            
                              err_state_in_onehot   => W_err_state_in_onehot, 
                              err_no_request_grants => W_err_no_request_grants,
                              err_request_no_grants => W_err_request_no_grants, 

                              err_no_Req_N_grant_N => W_err_no_Req_N_grant_N,
                              err_no_Req_E_grant_E => W_err_no_Req_E_grant_E,
                              err_no_Req_W_grant_W => W_err_no_Req_W_grant_W,
                              err_no_Req_S_grant_S => W_err_no_Req_S_grant_S,
                              err_no_Req_L_grant_L => W_err_no_Req_L_grant_L 
                               );

arb_S_X: Arbiter_in  PORT MAP (reset => reset, clk => clk,
                               Req_X_N=>req_S_N, Req_X_E=> req_S_E, Req_X_W=>req_S_W, Req_X_S=>req_S_S, Req_X_L=>req_S_L,
                               X_N=>X_S_N, X_E=>X_S_E, X_W=>X_S_W, X_S=>X_S_S, X_L=>X_S_L, 

                              shift=>shift, fault_clk=>fault_clk, data_in_serial=> fault_DO_serial_W_Arbiter_in_S_Arbiter_in, 
                              data_out_serial=>fault_DO_serial_S_Arbiter_in_L_Arbiter_out,

                               -- South Arbiter_in Checker outputs
                              err_Requests_state_in_state_not_equal => S_err_Requests_state_in_state_not_equal,
            
                              err_IDLE_Req_N =>    S_err_IDLE_Req_N,
                              err_IDLE_grant_N =>  S_err_IDLE_grant_N,
                              err_North_Req_N =>   S_err_North_Req_N,
                              err_North_grant_N => S_err_North_grant_N,
                              err_East_Req_E =>    S_err_East_Req_E,
                              err_East_grant_E =>  S_err_East_grant_E,
                              err_West_Req_W =>    S_err_West_Req_W,
                              err_West_grant_W =>  S_err_West_grant_W,
                              err_South_Req_S =>   S_err_South_Req_S,
                              err_South_grant_S => S_err_South_grant_S,
                              err_Local_Req_L =>   S_err_Local_Req_L,
                              err_Local_grant_L => S_err_Local_grant_L,
            
                              err_IDLE_Req_E => S_err_IDLE_Req_E,
                              err_IDLE_grant_E => S_err_IDLE_grant_E,
                              err_North_Req_E => S_err_North_Req_E,
                              err_North_grant_E => S_err_North_grant_E,
                              err_East_Req_W => S_err_East_Req_W,
                              err_East_grant_W => S_err_East_grant_W,
                              err_West_Req_S => S_err_West_Req_S,
                              err_West_grant_S => S_err_West_grant_S,
                              err_South_Req_L => S_err_South_Req_L,
                              err_South_grant_L => S_err_South_grant_L,
                              err_Local_Req_N => S_err_Local_Req_N,
                              err_Local_grant_N => S_err_Local_grant_N,
            
                              err_IDLE_Req_W => S_err_IDLE_Req_W,
                              err_IDLE_grant_W => S_err_IDLE_grant_W,
                              err_North_Req_W => S_err_North_Req_W,
                              err_North_grant_W => S_err_North_grant_W,
                              err_East_Req_S => S_err_East_Req_S,
                              err_East_grant_S => S_err_East_grant_S,
                              err_West_Req_L => S_err_West_Req_L,
                              err_West_grant_L => S_err_West_grant_L,
                              err_South_Req_N => S_err_South_Req_N,
                              err_South_grant_N => S_err_South_grant_N,
                              err_Local_Req_E => S_err_Local_Req_E,
                              err_Local_grant_E => S_err_Local_grant_E,
            
                              err_IDLE_Req_S => S_err_IDLE_Req_S,
                              err_IDLE_grant_S => S_err_IDLE_grant_S,
                              err_North_Req_S => S_err_North_Req_S,
                              err_North_grant_S => S_err_North_grant_S,
                              err_East_Req_L => S_err_East_Req_L,
                              err_East_grant_L => S_err_East_grant_L,
                              err_West_Req_N => S_err_West_Req_N,
                              err_West_grant_N => S_err_West_grant_N,
                              err_South_Req_E => S_err_South_Req_E,
                              err_South_grant_E => S_err_South_grant_E,
                              err_Local_Req_W => S_err_Local_Req_W,
                              err_Local_grant_W => S_err_Local_grant_W,
            
                              err_IDLE_Req_L => S_err_IDLE_Req_L,
                              err_IDLE_grant_L => S_err_IDLE_grant_L,
                              err_North_Req_L => S_err_North_Req_L,
                              err_North_grant_L => S_err_North_grant_L,
                              err_East_Req_N => S_err_East_Req_N,
                              err_East_grant_N => S_err_East_grant_N,
                              err_West_Req_E => S_err_West_Req_E,
                              err_West_grant_E => S_err_West_grant_E,
                              err_South_Req_W => S_err_South_Req_W,
                              err_South_grant_W => S_err_South_grant_W,
                              err_Local_Req_S => S_err_Local_Req_S,
                              err_Local_grant_S => S_err_Local_grant_S,
            
                              err_state_in_onehot   => S_err_state_in_onehot, 
                              err_no_request_grants => S_err_no_request_grants,
                              err_request_no_grants => S_err_request_no_grants, 

                              err_no_Req_N_grant_N => S_err_no_Req_N_grant_N,
                              err_no_Req_E_grant_E => S_err_no_Req_E_grant_E,
                              err_no_Req_W_grant_W => S_err_no_Req_W_grant_W,
                              err_no_Req_S_grant_S => S_err_no_Req_S_grant_S,
                              err_no_Req_L_grant_L => S_err_no_Req_L_grant_L 
                               );

arb_L_X: Arbiter_in  PORT MAP (reset => reset, clk => clk,
                               Req_X_N=>req_L_N, Req_X_E=> req_L_E, Req_X_W=>req_L_W, Req_X_S=>req_L_S, Req_X_L=>req_L_L,
                               X_N=>X_L_N, X_E=>X_L_E, X_W=>X_L_W, X_S=>X_L_S, X_L=>X_L_L, 

                              shift=>shift, fault_clk=>fault_clk, data_in_serial=> data_in_serial, data_out_serial=>fault_DO_serial_L_Arbiter_in_N_Arbiter_in,

                               -- Local Arbiter_in Checker outputs
                              err_Requests_state_in_state_not_equal => L_err_Requests_state_in_state_not_equal,
            
                              err_IDLE_Req_N =>    L_err_IDLE_Req_N,
                              err_IDLE_grant_N =>  L_err_IDLE_grant_N,
                              err_North_Req_N =>   L_err_North_Req_N,
                              err_North_grant_N => L_err_North_grant_N,
                              err_East_Req_E =>    L_err_East_Req_E,
                              err_East_grant_E =>  L_err_East_grant_E,
                              err_West_Req_W =>    L_err_West_Req_W,
                              err_West_grant_W =>  L_err_West_grant_W,
                              err_South_Req_S =>   L_err_South_Req_S,
                              err_South_grant_S => L_err_South_grant_S,
                              err_Local_Req_L =>   L_err_Local_Req_L,
                              err_Local_grant_L => L_err_Local_grant_L,
            
                              err_IDLE_Req_E => L_err_IDLE_Req_E,
                              err_IDLE_grant_E => L_err_IDLE_grant_E,
                              err_North_Req_E => L_err_North_Req_E,
                              err_North_grant_E => L_err_North_grant_E,
                              err_East_Req_W => L_err_East_Req_W,
                              err_East_grant_W => L_err_East_grant_W,
                              err_West_Req_S => L_err_West_Req_S,
                              err_West_grant_S => L_err_West_grant_S,
                              err_South_Req_L => L_err_South_Req_L,
                              err_South_grant_L => L_err_South_grant_L,
                              err_Local_Req_N => L_err_Local_Req_N,
                              err_Local_grant_N => L_err_Local_grant_N,
            
                              err_IDLE_Req_W => L_err_IDLE_Req_W,
                              err_IDLE_grant_W => L_err_IDLE_grant_W,
                              err_North_Req_W => L_err_North_Req_W,
                              err_North_grant_W => L_err_North_grant_W,
                              err_East_Req_S => L_err_East_Req_S,
                              err_East_grant_S => L_err_East_grant_S,
                              err_West_Req_L => L_err_West_Req_L,
                              err_West_grant_L => L_err_West_grant_L,
                              err_South_Req_N => L_err_South_Req_N,
                              err_South_grant_N => L_err_South_grant_N,
                              err_Local_Req_E => L_err_Local_Req_E,
                              err_Local_grant_E => L_err_Local_grant_E,
            
                              err_IDLE_Req_S => L_err_IDLE_Req_S,
                              err_IDLE_grant_S => L_err_IDLE_grant_S,
                              err_North_Req_S => L_err_North_Req_S,
                              err_North_grant_S => L_err_North_grant_S,
                              err_East_Req_L => L_err_East_Req_L,
                              err_East_grant_L => L_err_East_grant_L,
                              err_West_Req_N => L_err_West_Req_N,
                              err_West_grant_N => L_err_West_grant_N,
                              err_South_Req_E => L_err_South_Req_E,
                              err_South_grant_E => L_err_South_grant_E,
                              err_Local_Req_W => L_err_Local_Req_W,
                              err_Local_grant_W => L_err_Local_grant_W,
            
                              err_IDLE_Req_L => L_err_IDLE_Req_L,
                              err_IDLE_grant_L => L_err_IDLE_grant_L,
                              err_North_Req_L => L_err_North_Req_L,
                              err_North_grant_L => L_err_North_grant_L,
                              err_East_Req_N => L_err_East_Req_N,
                              err_East_grant_N => L_err_East_grant_N,
                              err_West_Req_E => L_err_West_Req_E,
                              err_West_grant_E => L_err_West_grant_E,
                              err_South_Req_W => L_err_South_Req_W,
                              err_South_grant_W => L_err_South_grant_W,
                              err_Local_Req_S => L_err_Local_Req_S,
                              err_Local_grant_S => L_err_Local_grant_S,
            
                              err_state_in_onehot   => L_err_state_in_onehot, 
                              err_no_request_grants => L_err_no_request_grants,
                              err_request_no_grants => L_err_request_no_grants, 

                              err_no_Req_N_grant_N => L_err_no_Req_N_grant_N,
                              err_no_Req_E_grant_E => L_err_no_Req_E_grant_E,
                              err_no_Req_W_grant_W => L_err_no_Req_W_grant_W,
                              err_no_Req_S_grant_S => L_err_no_Req_S_grant_S,
                              err_no_Req_L_grant_L => L_err_no_Req_L_grant_L 
                               );

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-- Arbiter Out mobuldes instantiation(s)

-- Y is N now
-- North Arbiter_out with checkers integrated
arb_X_N: arbiter_out port map (reset => reset, clk => clk,
                               X_N_Y => X_N_N, X_E_Y => X_E_N,  X_W_Y => X_W_N,  X_S_Y => X_S_N,  X_L_Y => X_L_N, 
                               credit => credit_counter_N_out,

                               grant_Y_N => grant_N_N_sig, 
                               grant_Y_E => grant_N_E_sig, 
                               grant_Y_W => grant_N_W_sig, 
                               grant_Y_S => grant_N_S_sig, 
                               grant_Y_L => grant_N_L_sig, 

                               shift=>shift, fault_clk=>fault_clk, data_in_serial=> fault_DO_serial_L_Arbiter_out_N_Arbiter_out, 
                               data_out_serial=>fault_DO_serial_N_Arbiter_out_E_Arbiter_out,

                               -- Checker outputs
                               err_Requests_state_in_state_not_equal => N_arbiter_out_err_Requests_state_in_state_not_equal, 
                          
                               err_IDLE_req_X_N => N_err_IDLE_req_X_N, 
                               err_North_req_X_N => N_err_North_req_X_N, 
                               err_North_credit_not_zero_req_X_N_grant_N => N_err_North_credit_not_zero_req_X_N_grant_N, 
                               err_North_credit_zero_or_not_req_X_N_not_grant_N => N_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
                               err_East_req_X_E => N_err_East_req_X_E, 
                               err_East_credit_not_zero_req_X_E_grant_E => N_err_East_credit_not_zero_req_X_E_grant_E, 
                               err_East_credit_zero_or_not_req_X_E_not_grant_E => N_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
                               err_West_req_X_W => N_err_West_req_X_W, 
                               err_West_credit_not_zero_req_X_W_grant_W => N_err_West_credit_not_zero_req_X_W_grant_W, 
                               err_West_credit_zero_or_not_req_X_W_not_grant_W => N_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
                               err_South_req_X_S => N_err_South_req_X_S, 
                               err_South_credit_not_zero_req_X_S_grant_S => N_err_South_credit_not_zero_req_X_S_grant_S, 
                               err_South_credit_zero_or_not_req_X_S_not_grant_S => N_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
                               err_Local_req_X_L => N_err_Local_req_X_L, 
                               err_Local_credit_not_zero_req_X_L_grant_L => N_err_Local_credit_not_zero_req_X_L_grant_L, 
                               err_Local_credit_zero_or_not_req_X_L_not_grant_L => N_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 
 
                               err_IDLE_req_X_E => N_err_IDLE_req_X_E, 
                               err_North_req_X_E => N_err_North_req_X_E, 
                               err_East_req_X_W => N_err_East_req_X_W, 
                               err_West_req_X_S => N_err_West_req_X_S, 
                               err_South_req_X_L => N_err_South_req_X_L, 
                               err_Local_req_X_N => N_err_Local_req_X_N, 
                          
                               err_IDLE_req_X_W => N_err_IDLE_req_X_W, 
                               err_North_req_X_W => N_err_North_req_X_W, 
                               err_East_req_X_S => N_err_East_req_X_S, 
                               err_West_req_X_L => N_err_West_req_X_L, 
                               err_South_req_X_N => N_err_South_req_X_N, 
                               err_Local_req_X_E => N_err_Local_req_X_E, 
                          
                               err_IDLE_req_X_S => N_err_IDLE_req_X_S, 
                               err_North_req_X_S => N_err_North_req_X_S, 
                               err_East_req_X_L => N_err_East_req_X_L, 
                               err_West_req_X_N => N_err_West_req_X_N, 
                               err_South_req_X_E => N_err_South_req_X_E, 
                               err_Local_req_X_W => N_err_Local_req_X_W, 
                          
                               err_IDLE_req_X_L => N_err_IDLE_req_X_L, 
                               err_North_req_X_L => N_err_North_req_X_L, 
                               err_East_req_X_N => N_err_East_req_X_N, 
                               err_West_req_X_E => N_err_West_req_X_E, 
                               err_South_req_X_W => N_err_South_req_X_W, 
                               err_Local_req_X_S => N_err_Local_req_X_S, 
                          
                               err_state_in_onehot => N_arbiter_out_err_state_in_onehot, 
                               err_no_request_grants => N_arbiter_out_err_no_request_grants, 
                               err_request_IDLE_state => N_err_request_IDLE_state, 
 
                               err_request_IDLE_not_Grants   => N_err_request_IDLE_not_Grants, 
                               err_state_North_Invalid_Grant => N_err_state_North_Invalid_Grant,
                               err_state_East_Invalid_Grant  => N_err_state_East_Invalid_Grant, 
                               err_state_West_Invalid_Grant  => N_err_state_West_Invalid_Grant, 
                               err_state_South_Invalid_Grant => N_err_state_South_Invalid_Grant,
                               err_state_Local_Invalid_Grant => N_err_state_Local_Invalid_Grant,
                               err_Grants_onehot_or_all_zero => N_err_Grants_onehot_or_all_zero
                              );

-- Y is E now
-- East Arbiter_out with checkers integrated
arb_X_E: arbiter_out port map (reset => reset, clk => clk,
                               X_N_Y => X_N_E, X_E_Y => X_E_E, X_W_Y => X_W_E, X_S_Y => X_S_E, X_L_Y => X_L_E, 
                               credit => credit_counter_E_out,

                               grant_Y_N => grant_E_N_sig, 
                               grant_Y_E => grant_E_E_sig, 
                               grant_Y_W => grant_E_W_sig, 
                               grant_Y_S => grant_E_S_sig, 
                               grant_Y_L => grant_E_L_sig, 

                               shift=>shift, fault_clk=>fault_clk, data_in_serial=> fault_DO_serial_N_Arbiter_out_E_Arbiter_out, 
                               data_out_serial=>fault_DO_serial_E_Arbiter_out_W_Arbiter_out,

                               -- Checker outputs
                               err_Requests_state_in_state_not_equal => E_arbiter_out_err_Requests_state_in_state_not_equal, 
                          
                               err_IDLE_req_X_N => E_err_IDLE_req_X_N, 
                               err_North_req_X_N => E_err_North_req_X_N, 
                               err_North_credit_not_zero_req_X_N_grant_N => E_err_North_credit_not_zero_req_X_N_grant_N, 
                               err_North_credit_zero_or_not_req_X_N_not_grant_N => E_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
                               err_East_req_X_E => E_err_East_req_X_E, 
                               err_East_credit_not_zero_req_X_E_grant_E => E_err_East_credit_not_zero_req_X_E_grant_E, 
                               err_East_credit_zero_or_not_req_X_E_not_grant_E => E_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
                               err_West_req_X_W => E_err_West_req_X_W, 
                               err_West_credit_not_zero_req_X_W_grant_W => E_err_West_credit_not_zero_req_X_W_grant_W, 
                               err_West_credit_zero_or_not_req_X_W_not_grant_W => E_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
                               err_South_req_X_S => E_err_South_req_X_S, 
                               err_South_credit_not_zero_req_X_S_grant_S => E_err_South_credit_not_zero_req_X_S_grant_S, 
                               err_South_credit_zero_or_not_req_X_S_not_grant_S => E_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
                               err_Local_req_X_L => E_err_Local_req_X_L, 
                               err_Local_credit_not_zero_req_X_L_grant_L => E_err_Local_credit_not_zero_req_X_L_grant_L, 
                               err_Local_credit_zero_or_not_req_X_L_not_grant_L => E_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 
 
                               err_IDLE_req_X_E => E_err_IDLE_req_X_E, 
                               err_North_req_X_E => E_err_North_req_X_E, 
                               err_East_req_X_W => E_err_East_req_X_W, 
                               err_West_req_X_S => E_err_West_req_X_S, 
                               err_South_req_X_L => E_err_South_req_X_L, 
                               err_Local_req_X_N => E_err_Local_req_X_N, 
                          
                               err_IDLE_req_X_W => E_err_IDLE_req_X_W, 
                               err_North_req_X_W => E_err_North_req_X_W, 
                               err_East_req_X_S => E_err_East_req_X_S, 
                               err_West_req_X_L => E_err_West_req_X_L, 
                               err_South_req_X_N => E_err_South_req_X_N, 
                               err_Local_req_X_E => E_err_Local_req_X_E, 
                          
                               err_IDLE_req_X_S => E_err_IDLE_req_X_S, 
                               err_North_req_X_S => E_err_North_req_X_S, 
                               err_East_req_X_L => E_err_East_req_X_L, 
                               err_West_req_X_N => E_err_West_req_X_N, 
                               err_South_req_X_E => E_err_South_req_X_E, 
                               err_Local_req_X_W => E_err_Local_req_X_W, 
                          
                               err_IDLE_req_X_L => E_err_IDLE_req_X_L, 
                               err_North_req_X_L => E_err_North_req_X_L, 
                               err_East_req_X_N => E_err_East_req_X_N, 
                               err_West_req_X_E => E_err_West_req_X_E, 
                               err_South_req_X_W => E_err_South_req_X_W, 
                               err_Local_req_X_S => E_err_Local_req_X_S, 
                          
                               err_state_in_onehot => E_arbiter_out_err_state_in_onehot, 
                               err_no_request_grants => E_arbiter_out_err_no_request_grants, 
                               err_request_IDLE_state => E_err_request_IDLE_state, 
 
                               err_request_IDLE_not_Grants   => E_err_request_IDLE_not_Grants, 
                               err_state_North_Invalid_Grant => E_err_state_North_Invalid_Grant,
                               err_state_East_Invalid_Grant  => E_err_state_East_Invalid_Grant, 
                               err_state_West_Invalid_Grant  => E_err_state_West_Invalid_Grant, 
                               err_state_South_Invalid_Grant => E_err_state_South_Invalid_Grant,
                               err_state_Local_Invalid_Grant => E_err_state_Local_Invalid_Grant,
                               err_Grants_onehot_or_all_zero => E_err_Grants_onehot_or_all_zero
                              );

-- Y is W now
-- West Arbiter_out with checkers integrated
arb_X_W: arbiter_out port map (reset => reset, clk => clk,
                               X_N_Y => X_N_W, X_E_Y => X_E_W, X_W_Y => X_W_W, X_S_Y => X_S_W, X_L_Y => X_L_W, 
                               credit => credit_counter_W_out,

                               grant_Y_N => grant_W_N_sig, 
                               grant_Y_E => grant_W_E_sig, 
                               grant_Y_W => grant_W_W_sig, 
                               grant_Y_S => grant_W_S_sig, 
                               grant_Y_L => grant_W_L_sig, 

                               shift=>shift, fault_clk=>fault_clk, data_in_serial=> fault_DO_serial_E_Arbiter_out_W_Arbiter_out, 
                               data_out_serial=>fault_DO_serial_W_Arbiter_out_S_Arbiter_out,

                               -- Checker outputs
                               err_Requests_state_in_state_not_equal => W_arbiter_out_err_Requests_state_in_state_not_equal, 
                          
                               err_IDLE_req_X_N => W_err_IDLE_req_X_N, 
                               err_North_req_X_N => W_err_North_req_X_N, 
                               err_North_credit_not_zero_req_X_N_grant_N => W_err_North_credit_not_zero_req_X_N_grant_N, 
                               err_North_credit_zero_or_not_req_X_N_not_grant_N => W_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
                               err_East_req_X_E => W_err_East_req_X_E, 
                               err_East_credit_not_zero_req_X_E_grant_E => W_err_East_credit_not_zero_req_X_E_grant_E, 
                               err_East_credit_zero_or_not_req_X_E_not_grant_E => W_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
                               err_West_req_X_W => W_err_West_req_X_W, 
                               err_West_credit_not_zero_req_X_W_grant_W => W_err_West_credit_not_zero_req_X_W_grant_W, 
                               err_West_credit_zero_or_not_req_X_W_not_grant_W => W_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
                               err_South_req_X_S => W_err_South_req_X_S, 
                               err_South_credit_not_zero_req_X_S_grant_S => W_err_South_credit_not_zero_req_X_S_grant_S, 
                               err_South_credit_zero_or_not_req_X_S_not_grant_S => W_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
                               err_Local_req_X_L => W_err_Local_req_X_L, 
                               err_Local_credit_not_zero_req_X_L_grant_L => W_err_Local_credit_not_zero_req_X_L_grant_L, 
                               err_Local_credit_zero_or_not_req_X_L_not_grant_L => W_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 
 
                               err_IDLE_req_X_E => W_err_IDLE_req_X_E, 
                               err_North_req_X_E => W_err_North_req_X_E, 
                               err_East_req_X_W => W_err_East_req_X_W, 
                               err_West_req_X_S => W_err_West_req_X_S, 
                               err_South_req_X_L => W_err_South_req_X_L, 
                               err_Local_req_X_N => W_err_Local_req_X_N, 
                          
                               err_IDLE_req_X_W => W_err_IDLE_req_X_W, 
                               err_North_req_X_W => W_err_North_req_X_W, 
                               err_East_req_X_S => W_err_East_req_X_S, 
                               err_West_req_X_L => W_err_West_req_X_L, 
                               err_South_req_X_N => W_err_South_req_X_N, 
                               err_Local_req_X_E => W_err_Local_req_X_E, 
                          
                               err_IDLE_req_X_S => W_err_IDLE_req_X_S, 
                               err_North_req_X_S => W_err_North_req_X_S, 
                               err_East_req_X_L => W_err_East_req_X_L, 
                               err_West_req_X_N => W_err_West_req_X_N, 
                               err_South_req_X_E => W_err_South_req_X_E, 
                               err_Local_req_X_W => W_err_Local_req_X_W, 
                          
                               err_IDLE_req_X_L => W_err_IDLE_req_X_L, 
                               err_North_req_X_L => W_err_North_req_X_L, 
                               err_East_req_X_N => W_err_East_req_X_N, 
                               err_West_req_X_E => W_err_West_req_X_E, 
                               err_South_req_X_W => W_err_South_req_X_W, 
                               err_Local_req_X_S => W_err_Local_req_X_S, 
                          
                               err_state_in_onehot => W_arbiter_out_err_state_in_onehot, 
                               err_no_request_grants => W_arbiter_out_err_no_request_grants, 
                               err_request_IDLE_state => W_err_request_IDLE_state, 
 
                               err_request_IDLE_not_Grants   => W_err_request_IDLE_not_Grants, 
                               err_state_North_Invalid_Grant => W_err_state_North_Invalid_Grant,
                               err_state_East_Invalid_Grant  => W_err_state_East_Invalid_Grant, 
                               err_state_West_Invalid_Grant  => W_err_state_West_Invalid_Grant, 
                               err_state_South_Invalid_Grant => W_err_state_South_Invalid_Grant,
                               err_state_Local_Invalid_Grant => W_err_state_Local_Invalid_Grant,
                               err_Grants_onehot_or_all_zero => W_err_Grants_onehot_or_all_zero
                              );

-- Y is S now
-- South Arbiter_out with checkers integrated
arb_X_S: arbiter_out port map (reset => reset, clk => clk, 
                               X_N_Y => X_N_S, X_E_Y => X_E_S, X_W_Y => X_W_S, X_S_Y => X_S_S, X_L_Y => X_L_S, 
                               credit => credit_counter_S_out,

                               grant_Y_N => grant_S_N_sig, 
                               grant_Y_E => grant_S_E_sig, 
                               grant_Y_W => grant_S_W_sig, 
                               grant_Y_S => grant_S_S_sig, 
                               grant_Y_L => grant_S_L_sig,

                               shift=>shift, fault_clk=>fault_clk, data_in_serial=> fault_DO_serial_W_Arbiter_out_S_Arbiter_out, 
                               data_out_serial=>data_out_serial,

                               -- Checker outputs
                               err_Requests_state_in_state_not_equal => S_arbiter_out_err_Requests_state_in_state_not_equal, 
                          
                               err_IDLE_req_X_N => S_err_IDLE_req_X_N, 
                               err_North_req_X_N => S_err_North_req_X_N, 
                               err_North_credit_not_zero_req_X_N_grant_N => S_err_North_credit_not_zero_req_X_N_grant_N, 
                               err_North_credit_zero_or_not_req_X_N_not_grant_N => S_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
                               err_East_req_X_E => S_err_East_req_X_E, 
                               err_East_credit_not_zero_req_X_E_grant_E => S_err_East_credit_not_zero_req_X_E_grant_E, 
                               err_East_credit_zero_or_not_req_X_E_not_grant_E => S_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
                               err_West_req_X_W => S_err_West_req_X_W, 
                               err_West_credit_not_zero_req_X_W_grant_W => S_err_West_credit_not_zero_req_X_W_grant_W, 
                               err_West_credit_zero_or_not_req_X_W_not_grant_W => S_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
                               err_South_req_X_S => S_err_South_req_X_S, 
                               err_South_credit_not_zero_req_X_S_grant_S => S_err_South_credit_not_zero_req_X_S_grant_S, 
                               err_South_credit_zero_or_not_req_X_S_not_grant_S => S_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
                               err_Local_req_X_L => S_err_Local_req_X_L, 
                               err_Local_credit_not_zero_req_X_L_grant_L => S_err_Local_credit_not_zero_req_X_L_grant_L, 
                               err_Local_credit_zero_or_not_req_X_L_not_grant_L => S_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 
 
                               err_IDLE_req_X_E => S_err_IDLE_req_X_E, 
                               err_North_req_X_E => S_err_North_req_X_E, 
                               err_East_req_X_W => S_err_East_req_X_W, 
                               err_West_req_X_S => S_err_West_req_X_S, 
                               err_South_req_X_L => S_err_South_req_X_L, 
                               err_Local_req_X_N => S_err_Local_req_X_N, 
                          
                               err_IDLE_req_X_W => S_err_IDLE_req_X_W, 
                               err_North_req_X_W => S_err_North_req_X_W, 
                               err_East_req_X_S => S_err_East_req_X_S, 
                               err_West_req_X_L => S_err_West_req_X_L, 
                               err_South_req_X_N => S_err_South_req_X_N, 
                               err_Local_req_X_E => S_err_Local_req_X_E, 
                          
                               err_IDLE_req_X_S => S_err_IDLE_req_X_S, 
                               err_North_req_X_S => S_err_North_req_X_S, 
                               err_East_req_X_L => S_err_East_req_X_L, 
                               err_West_req_X_N => S_err_West_req_X_N, 
                               err_South_req_X_E => S_err_South_req_X_E, 
                               err_Local_req_X_W => S_err_Local_req_X_W, 
                          
                               err_IDLE_req_X_L => S_err_IDLE_req_X_L, 
                               err_North_req_X_L => S_err_North_req_X_L, 
                               err_East_req_X_N => S_err_East_req_X_N, 
                               err_West_req_X_E => S_err_West_req_X_E, 
                               err_South_req_X_W => S_err_South_req_X_W, 
                               err_Local_req_X_S => S_err_Local_req_X_S, 
                          
                               err_state_in_onehot => S_arbiter_out_err_state_in_onehot, 
                               err_no_request_grants => S_arbiter_out_err_no_request_grants, 
                               err_request_IDLE_state => S_err_request_IDLE_state, 
 
                               err_request_IDLE_not_Grants   => S_err_request_IDLE_not_Grants, 
                               err_state_North_Invalid_Grant => S_err_state_North_Invalid_Grant,
                               err_state_East_Invalid_Grant  => S_err_state_East_Invalid_Grant, 
                               err_state_West_Invalid_Grant  => S_err_state_West_Invalid_Grant, 
                               err_state_South_Invalid_Grant => S_err_state_South_Invalid_Grant,
                               err_state_Local_Invalid_Grant => S_err_state_Local_Invalid_Grant,
                               err_Grants_onehot_or_all_zero => S_err_Grants_onehot_or_all_zero
                              );

-- Y is L now
-- Local Arbiter_out with checkers integrated
arb_X_L: arbiter_out port map (reset => reset, clk => clk, 
                               X_N_Y => X_N_L, X_E_Y => X_E_L, X_W_Y => X_W_L, X_S_Y => X_S_L, X_L_Y => X_L_L, 
                               credit => credit_counter_L_out,

                               grant_Y_N => grant_L_N_sig, 
                               grant_Y_E => grant_L_E_sig, 
                               grant_Y_W => grant_L_W_sig, 
                               grant_Y_S => grant_L_S_sig, 
                               grant_Y_L => grant_L_L_sig,

                               shift=>shift, fault_clk=>fault_clk, data_in_serial=> fault_DO_serial_S_Arbiter_in_L_Arbiter_out, 
                               data_out_serial=>fault_DO_serial_L_Arbiter_out_N_Arbiter_out,

                               -- Checker outputs
                               err_Requests_state_in_state_not_equal => L_arbiter_out_err_Requests_state_in_state_not_equal, 
                          
                               err_IDLE_req_X_N => L_err_IDLE_req_X_N, 
                               err_North_req_X_N => L_err_North_req_X_N, 
                               err_North_credit_not_zero_req_X_N_grant_N => L_err_North_credit_not_zero_req_X_N_grant_N, 
                               err_North_credit_zero_or_not_req_X_N_not_grant_N => L_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
                               err_East_req_X_E => L_err_East_req_X_E, 
                               err_East_credit_not_zero_req_X_E_grant_E => L_err_East_credit_not_zero_req_X_E_grant_E, 
                               err_East_credit_zero_or_not_req_X_E_not_grant_E => L_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
                               err_West_req_X_W => L_err_West_req_X_W, 
                               err_West_credit_not_zero_req_X_W_grant_W => L_err_West_credit_not_zero_req_X_W_grant_W, 
                               err_West_credit_zero_or_not_req_X_W_not_grant_W => L_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
                               err_South_req_X_S => L_err_South_req_X_S, 
                               err_South_credit_not_zero_req_X_S_grant_S => L_err_South_credit_not_zero_req_X_S_grant_S, 
                               err_South_credit_zero_or_not_req_X_S_not_grant_S => L_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
                               err_Local_req_X_L => L_err_Local_req_X_L, 
                               err_Local_credit_not_zero_req_X_L_grant_L => L_err_Local_credit_not_zero_req_X_L_grant_L, 
                               err_Local_credit_zero_or_not_req_X_L_not_grant_L => L_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 
 
                               err_IDLE_req_X_E => L_err_IDLE_req_X_E, 
                               err_North_req_X_E => L_err_North_req_X_E, 
                               err_East_req_X_W => L_err_East_req_X_W, 
                               err_West_req_X_S => L_err_West_req_X_S, 
                               err_South_req_X_L => L_err_South_req_X_L, 
                               err_Local_req_X_N => L_err_Local_req_X_N, 
                          
                               err_IDLE_req_X_W => L_err_IDLE_req_X_W, 
                               err_North_req_X_W => L_err_North_req_X_W, 
                               err_East_req_X_S => L_err_East_req_X_S, 
                               err_West_req_X_L => L_err_West_req_X_L, 
                               err_South_req_X_N => L_err_South_req_X_N, 
                               err_Local_req_X_E => L_err_Local_req_X_E, 
                          
                               err_IDLE_req_X_S => L_err_IDLE_req_X_S, 
                               err_North_req_X_S => L_err_North_req_X_S, 
                               err_East_req_X_L => L_err_East_req_X_L, 
                               err_West_req_X_N => L_err_West_req_X_N, 
                               err_South_req_X_E => L_err_South_req_X_E, 
                               err_Local_req_X_W => L_err_Local_req_X_W, 
                          
                               err_IDLE_req_X_L => L_err_IDLE_req_X_L, 
                               err_North_req_X_L => L_err_North_req_X_L, 
                               err_East_req_X_N => L_err_East_req_X_N, 
                               err_West_req_X_E => L_err_West_req_X_E, 
                               err_South_req_X_W => L_err_South_req_X_W, 
                               err_Local_req_X_S => L_err_Local_req_X_S, 
                          
                               err_state_in_onehot => L_arbiter_out_err_state_in_onehot, 
                               err_no_request_grants => L_arbiter_out_err_no_request_grants, 
                               err_request_IDLE_state => L_err_request_IDLE_state, 
 
                               err_request_IDLE_not_Grants   => L_err_request_IDLE_not_Grants, 
                               err_state_North_Invalid_Grant => L_err_state_North_Invalid_Grant,
                               err_state_East_Invalid_Grant  => L_err_state_East_Invalid_Grant, 
                               err_state_West_Invalid_Grant  => L_err_state_West_Invalid_Grant, 
                               err_state_South_Invalid_Grant => L_err_state_South_Invalid_Grant,
                               err_state_Local_Invalid_Grant => L_err_state_Local_Invalid_Grant,
                               err_Grants_onehot_or_all_zero => L_err_Grants_onehot_or_all_zero
                              );

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

valid_N_sig <= grant_N;
valid_E_sig <= grant_E;
valid_W_sig <= grant_W;
valid_S_sig <= grant_S;
valid_L_sig <= grant_L;
 
END;





