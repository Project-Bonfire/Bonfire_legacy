library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Arbiter_with_checkers_top is
    port  ( Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic; -- From LBDR modules
            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the next router/NI (for hand-shaking)
            RTS_FF: in std_logic;
            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM
            
            -- Arbiter outputs
            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            Xbar_sel : out std_logic_vector(4 downto 0); -- select lines for XBAR
            RTS_FF_in: out std_logic; -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid
            state_in: out std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM
            next_state_out: out std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM

            -- Checker outputs
            err_Arbiter_Xbar_sel_onehot: out std_logic;
            err_Arbiter_no_req_Grant: out std_logic;
            err_Arbiter_DCTS_RTS: out std_logic; 
            err_Arbiter_DCTS_RTS1: out std_logic; 
            err_Arbiter_DCTS_RTS2: out std_logic; 
            err_Arbiter_DCTS_RTS3: out std_logic; 
            err_Arbiter_state_and_grants_onehot: out std_logic; 
            err_Arbiter_state_and_grants_onehot1: out std_logic; 
            err_Arbiter_no_req_state_change: out std_logic; 
            err_Arbiter_valid_state: out std_logic;
            err_Arbiter_switchgrantN: out std_logic;
            err_Arbiter_switchgrantE: out std_logic;
            err_Arbiter_switchgrantW: out std_logic;
            err_Arbiter_switchgrantS: out std_logic;
            err_Arbiter_switchgrantL: out std_logic;
            err_Arbiter_state_update: out std_logic;
            err_Arbiter_state_RTS_FF_in: out std_logic; 
            err_Arbiter_switchgrantN_not_active: out std_logic;
            err_Arbiter_switchgrantE_not_active: out std_logic;
            err_Arbiter_switchgrantW_not_active: out std_logic;
            err_Arbiter_switchgrantS_not_active: out std_logic;
            err_Arbiter_switchgrantL_not_active: out std_logic;
            err_Arbiter_switchgrantN_not_active1: out std_logic;
            err_Arbiter_switchgrantE_not_active1: out std_logic;
            err_Arbiter_switchgrantW_not_active1: out std_logic;
            err_Arbiter_switchgrantS_not_active1: out std_logic;
            err_Arbiter_switchgrantL_not_active1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_IDLE: out std_logic;
            err_Arbiter_Xbar_sel_invalid_North: out std_logic;
            err_Arbiter_Xbar_sel_invalid_East: out std_logic;
            err_Arbiter_Xbar_sel_invalid_West: out std_logic;
            err_Arbiter_Xbar_sel_invalid_South: out std_logic;
            err_Arbiter_Xbar_sel_invalid_Local: out std_logic;
            err_Arbiter_Xbar_sel_invalid_North1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_East1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_West1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_South1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_Local1: out std_logic;
            err_Arbiter_priorityIDLE3: out std_logic;
            err_Arbiter_priorityL3: out std_logic;
            err_Arbiter_priorityN3: out std_logic;
            err_Arbiter_priorityE3: out std_logic;
            err_Arbiter_priorityW3: out std_logic;
            err_Arbiter_priorityS3: out std_logic;
            err_Arbiter_switchgrantN1: out std_logic;
            err_Arbiter_switchgrantE1: out std_logic;
            err_Arbiter_switchgrantW1: out std_logic;
            err_Arbiter_switchgrantS1: out std_logic;
            err_Arbiter_switchgrantL1: out std_logic;
            err_Arbiter_state_not_update: out std_logic;
            err_Arbiter_no_Grant: out std_logic
            --err_Arbiter_invalid_state: out std_logic;
            --err_Arbiter_invalid_state1: out std_logic
            --err_Arbiter_invalid_state2: out std_logic;
            --err_Arbiter_invalid_state3: out std_logic
          );
end Arbiter_with_checkers_top;

architecture behavior of Arbiter_with_checkers_top is

component Arbiter_pseudo is
    port (  
            Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic; -- From LBDR modules
            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the next router/NI (for hand-shaking)
            RTS_FF: in std_logic;
            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM

            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            Xbar_sel : out std_logic_vector (4 downto 0); -- select lines for XBAR
            RTS_FF_in: out std_logic; -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid
            state_in: out std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM
            next_state_out: out std_logic_vector (5 downto 0) -- 6 states for Arbiter's FSM
            );
end component;

component Arbiter_checkers is
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
            err_Arbiter_no_req_Grant: out std_logic;
            err_Arbiter_DCTS_RTS: out std_logic; 
            err_Arbiter_DCTS_RTS1: out std_logic; 
            err_Arbiter_DCTS_RTS2: out std_logic; 
            err_Arbiter_DCTS_RTS3: out std_logic; 
            err_Arbiter_state_and_grants_onehot: out std_logic; 
            err_Arbiter_state_and_grants_onehot1: out std_logic; 
            err_Arbiter_no_req_state_change: out std_logic; 
            err_Arbiter_valid_state: out std_logic;
            err_Arbiter_switchgrantN: out std_logic;
            err_Arbiter_switchgrantE: out std_logic;
            err_Arbiter_switchgrantW: out std_logic;
            err_Arbiter_switchgrantS: out std_logic;
            err_Arbiter_switchgrantL: out std_logic;
            err_Arbiter_state_update: out std_logic;
            err_Arbiter_state_RTS_FF_in: out std_logic; 
            err_Arbiter_switchgrantN_not_active: out std_logic;
            err_Arbiter_switchgrantE_not_active: out std_logic;
            err_Arbiter_switchgrantW_not_active: out std_logic;
            err_Arbiter_switchgrantS_not_active: out std_logic;
            err_Arbiter_switchgrantL_not_active: out std_logic;
            err_Arbiter_switchgrantN_not_active1: out std_logic;
            err_Arbiter_switchgrantE_not_active1: out std_logic;
            err_Arbiter_switchgrantW_not_active1: out std_logic;
            err_Arbiter_switchgrantS_not_active1: out std_logic;
            err_Arbiter_switchgrantL_not_active1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_IDLE: out std_logic;
            err_Arbiter_Xbar_sel_invalid_North: out std_logic;
            err_Arbiter_Xbar_sel_invalid_East: out std_logic;
            err_Arbiter_Xbar_sel_invalid_West: out std_logic;
            err_Arbiter_Xbar_sel_invalid_South: out std_logic;
            err_Arbiter_Xbar_sel_invalid_Local: out std_logic;
            err_Arbiter_Xbar_sel_invalid_North1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_East1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_West1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_South1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_Local1: out std_logic;
            err_Arbiter_priorityIDLE3: out std_logic;
            err_Arbiter_priorityL3: out std_logic;
            err_Arbiter_priorityN3: out std_logic;
            err_Arbiter_priorityE3: out std_logic;
            err_Arbiter_priorityW3: out std_logic;
            err_Arbiter_priorityS3: out std_logic;
            err_Arbiter_switchgrantN1: out std_logic;
            err_Arbiter_switchgrantE1: out std_logic;
            err_Arbiter_switchgrantW1: out std_logic;
            err_Arbiter_switchgrantS1: out std_logic;
            err_Arbiter_switchgrantL1: out std_logic;
            err_Arbiter_state_not_update: out std_logic;
            err_Arbiter_no_Grant: out std_logic
            --err_Arbiter_invalid_state: out std_logic;
            --err_Arbiter_invalid_state1: out std_logic
            --err_Arbiter_invalid_state2: out std_logic;
            --err_Arbiter_invalid_state3: out std_logic
            );
end component;

signal Grant_N_sig, Grant_E_sig, Grant_W_sig, Grant_S_sig, Grant_L_sig: std_logic;
signal Xbar_sel_sig: std_logic_vector(4 downto 0);
signal state_in_sig: std_logic_vector (5 downto 0);
signal next_state_out_sig: std_logic_vector (5 downto 0);
signal RTS_FF_in_sig: std_logic;

begin 

Grant_N <= Grant_N_sig;
Grant_E <= Grant_E_sig;
Grant_W <= Grant_W_sig;
Grant_S <= Grant_S_sig;
Grant_L <= Grant_L_sig;
Xbar_sel <= Xbar_sel_sig;
state_in <= state_in_sig;
RTS_FF_in <= RTS_FF_in_sig;
next_state_out <= next_state_out_sig;

-- Arbiter instantiation
ARBITER: Arbiter_pseudo port map   (
                                    Req_N=>Req_N, 
                                    Req_E=>Req_E, 
                                    Req_W=>Req_W, 
                                    Req_S=>Req_S, 
                                    Req_L=>Req_L,
						                        DCTS => DCTS, 
                                    RTS_FF => RTS_FF,
 						                        state=>state,

                                    Grant_N => Grant_N, 
                                    Grant_E => Grant_E, 
                                    Grant_W => Grant_W, 
                                    Grant_S => Grant_S, 
                                    Grant_L => Grant_L,
                                    Xbar_sel => Xbar_sel_sig, 
                                    RTS_FF_in => RTS_FF_in, 
                                    state_in => state_in_sig, 
                                    next_state_out => next_state_out_sig
                                    );

-- Checkers instantiation
CHECKERS: Arbiter_checkers port map (
                                      Req_N => Req_N, 
                                      Req_E => Req_E, 
                                      Req_W => Req_W, 
                                      Req_S=>Req_S, 
                                      Req_L => Req_L,
                                      DCTS => DCTS, 
                                      RTS_FF => RTS_FF,
                                      state => state, 

                                      Grant_N => Grant_N_sig, 
                                      Grant_E => Grant_E_sig, 
                                      Grant_W => Grant_W_sig, 
                                      Grant_S => Grant_S_sig, 
                                      Grant_L => Grant_L_sig, 
								                      Xbar_sel=>Xbar_sel_sig,
								                      state_in => state_in_sig,
                                      next_state_out => next_state_out_sig,
                                      RTS_FF_in => RTS_FF_in_sig, 

                                      err_Arbiter_Xbar_sel_onehot => err_Arbiter_Xbar_sel_onehot, 
                                      err_Arbiter_no_req_Grant => err_Arbiter_no_req_Grant, 
                                      err_Arbiter_DCTS_RTS => err_Arbiter_DCTS_RTS, 
                                      err_Arbiter_DCTS_RTS1 => err_Arbiter_DCTS_RTS1,
                                      err_Arbiter_DCTS_RTS2 => err_Arbiter_DCTS_RTS2,
                                      err_Arbiter_DCTS_RTS3 => err_Arbiter_DCTS_RTS3,
                                      err_Arbiter_state_and_grants_onehot => err_Arbiter_state_and_grants_onehot, 
                                      err_Arbiter_state_and_grants_onehot1 => err_Arbiter_state_and_grants_onehot1, 
                                      err_Arbiter_no_req_state_change => err_Arbiter_no_req_state_change, 
                                      err_Arbiter_valid_state => err_Arbiter_valid_state, 
                                      err_Arbiter_switchgrantN => err_Arbiter_switchgrantN, 
                                      err_Arbiter_switchgrantE => err_Arbiter_switchgrantE,
                                      err_Arbiter_switchgrantW => err_Arbiter_switchgrantW, 
                                      err_Arbiter_switchgrantS => err_Arbiter_switchgrantS, 
                                      err_Arbiter_switchgrantL => err_Arbiter_switchgrantL, 
                                      err_Arbiter_state_update => err_Arbiter_state_update, 
                                      err_Arbiter_state_RTS_FF_in => err_Arbiter_state_RTS_FF_in, 
                                      err_Arbiter_switchgrantN_not_active =>  err_Arbiter_switchgrantN_not_active,
                                      err_Arbiter_switchgrantN_not_active1 => err_Arbiter_switchgrantN_not_active1,
                                      err_Arbiter_switchgrantE_not_active =>  err_Arbiter_switchgrantE_not_active, 
                                      err_Arbiter_switchgrantE_not_active1 => err_Arbiter_switchgrantE_not_active1, 
                                      err_Arbiter_switchgrantW_not_active =>  err_Arbiter_switchgrantW_not_active, 
                                      err_Arbiter_switchgrantW_not_active1 => err_Arbiter_switchgrantW_not_active1, 
                                      err_Arbiter_switchgrantS_not_active =>  err_Arbiter_switchgrantS_not_active, 
                                      err_Arbiter_switchgrantS_not_active1 => err_Arbiter_switchgrantS_not_active1, 
                                      err_Arbiter_switchgrantL_not_active =>  err_Arbiter_switchgrantL_not_active, 
                                      err_Arbiter_switchgrantL_not_active1 => err_Arbiter_switchgrantL_not_active1, 
                                      err_Arbiter_Xbar_sel_invalid_IDLE => err_Arbiter_Xbar_sel_invalid_IDLE,
                                      err_Arbiter_Xbar_sel_invalid_North => err_Arbiter_Xbar_sel_invalid_North, 
                                      err_Arbiter_Xbar_sel_invalid_North1 => err_Arbiter_Xbar_sel_invalid_North1,
                                      err_Arbiter_Xbar_sel_invalid_East => err_Arbiter_Xbar_sel_invalid_East,
                                      err_Arbiter_Xbar_sel_invalid_East1 => err_Arbiter_Xbar_sel_invalid_East1,                                       
                                      err_Arbiter_Xbar_sel_invalid_West => err_Arbiter_Xbar_sel_invalid_West, 
                                      err_Arbiter_Xbar_sel_invalid_West1 => err_Arbiter_Xbar_sel_invalid_West1,
                                      err_Arbiter_Xbar_sel_invalid_South => err_Arbiter_Xbar_sel_invalid_South, 
                                      err_Arbiter_Xbar_sel_invalid_South1 => err_Arbiter_Xbar_sel_invalid_South1, 
                                      err_Arbiter_Xbar_sel_invalid_Local => err_Arbiter_Xbar_sel_invalid_Local, 
                                      err_Arbiter_Xbar_sel_invalid_Local1 => err_Arbiter_Xbar_sel_invalid_Local1, 
                                      err_Arbiter_priorityIDLE3 => err_Arbiter_priorityIDLE3, 
                                      err_Arbiter_priorityL3 => err_Arbiter_priorityL3, 
                                      err_Arbiter_priorityN3 => err_Arbiter_priorityN3, 
                                      err_Arbiter_priorityE3 => err_Arbiter_priorityE3, 
                                      err_Arbiter_priorityW3 => err_Arbiter_priorityW3, 
                                      err_Arbiter_priorityS3 => err_Arbiter_priorityS3, 
                                      err_Arbiter_switchgrantN1 => err_Arbiter_switchgrantN1,
                                      err_Arbiter_switchgrantE1 => err_Arbiter_switchgrantE1,
                                      err_Arbiter_switchgrantW1 => err_Arbiter_switchgrantW1,
                                      err_Arbiter_switchgrantS1 => err_Arbiter_switchgrantS1,
                                      err_Arbiter_switchgrantL1 => err_Arbiter_switchgrantL1,
                                      err_Arbiter_state_not_update => err_Arbiter_state_not_update,
                                      err_Arbiter_no_Grant => err_Arbiter_no_Grant
                                      --err_Arbiter_invalid_state => err_Arbiter_invalid_state, 
                                      --err_Arbiter_invalid_state1 => err_Arbiter_invalid_state1
                                      --err_Arbiter_invalid_state2 => err_Arbiter_invalid_state2, 
                                      --err_Arbiter_invalid_state3 => err_Arbiter_invalid_state3
                                     );

end behavior;