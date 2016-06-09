library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity SArbiter_with_checkers_top is
    port (  Req_N, Req_E, Req_W, Req_L:in std_logic; -- From LBDR modules
            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the next router/NI (for hand-shaking)
            RTS_FF: in std_logic;
            state: in std_logic_vector (4 downto 0); -- 5 states for Arbiter's FSM
            
            -- Arbiter outputs
            Grant_N, Grant_E, Grant_W, Grant_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            Xbar_sel : out std_logic_vector(3 downto 0); -- select lines for XBAR
            RTS_FF_in: out std_logic; -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid
            state_in: out std_logic_vector (4 downto 0); -- 5 states for Arbiter's FSM
            next_state_out: out std_logic_vector (4 downto 0); -- 5 states for Arbiter's FSM

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
            Serr_switchgrantN, Serr_switchgrantE, Serr_switchgrantW, Serr_switchgrantL: out std_logic;
            err_Arbiter_state_update, err_Arbiter_state_RTS_FF_in: out std_logic; 
            Serr_switchgrantN_not_active, Serr_switchgrantE_not_active, Serr_switchgrantW_not_active, Serr_switchgrantL_not_active: out std_logic;
            Serr_switchgrantN_not_active1, Serr_switchgrantE_not_active1, Serr_switchgrantW_not_active1, Serr_switchgrantL_not_active1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_IDLE, err_Arbiter_Xbar_sel_invalid_North, err_Arbiter_Xbar_sel_invalid_East, err_Arbiter_Xbar_sel_invalid_West, err_Arbiter_Xbar_sel_invalid_Local: out std_logic; --, err_Arbiter_Xbar_sel_invalid_Local: out std_logic;
            err_Arbiter_Xbar_sel_invalid_North1, err_Arbiter_Xbar_sel_invalid_East1, err_Arbiter_Xbar_sel_invalid_West1, err_Arbiter_Xbar_sel_invalid_Local1: out std_logic;
            Serr_priorityIDLE3, Serr_priorityL3, Serr_priorityN3, Serr_priorityE3, Serr_priorityW3: out std_logic;
            Serr_switchgrantN1, Serr_switchgrantE1, Serr_switchgrantW1, Serr_switchgrantL1: out std_logic;
            err_Arbiter_state_not_update: out std_logic; 
            err_Arbiter_no_Grant: out std_logic
--            err_Arbiter_invalid_state: out std_logic -- , err_Arbiter_invalid_state1, err_Arbiter_invalid_state2, err_Arbiter_invalid_state3: out std_logic
            );
end SArbiter_with_checkers_top;

architecture behavior of SArbiter_with_checkers_top is

component SArbiter_pseudo is
    port (  Req_N, Req_E, Req_W, Req_L:in std_logic; -- From LBDR modules
            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the next router/NI (for hand-shaking)
            RTS_FF: in std_logic;
            state: in std_logic_vector (4 downto 0); -- 5 states for Arbiter's FSM

            Grant_N, Grant_E, Grant_W, Grant_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            Xbar_sel : out std_logic_vector(3 downto 0); -- select lines for XBAR
            RTS_FF_in: out std_logic; -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid
            state_in: out std_logic_vector (4 downto 0); -- 5 states for Arbiter's FSM
            next_state_out: out std_logic_vector (4 downto 0) -- 5 states for Arbiter's FSM
            );
end component;

component SArbiter_checkers is
    port (  
            Req_N, Req_E, Req_W, Req_L:in std_logic;
            DCTS: in std_logic; 
            Grant_N, Grant_E, Grant_W, Grant_L: in  std_logic;
            Xbar_sel : in std_logic_vector(3 downto 0);
            state: in std_logic_vector (4 downto 0);
            state_in: in std_logic_vector (4 downto 0);
            next_state_out: in std_logic_vector (4 downto 0);
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
            Serr_switchgrantN, Serr_switchgrantE, Serr_switchgrantW, Serr_switchgrantL: out std_logic;
            err_Arbiter_state_update, err_Arbiter_state_RTS_FF_in: out std_logic; 
            Serr_switchgrantN_not_active, Serr_switchgrantE_not_active, Serr_switchgrantW_not_active, Serr_switchgrantL_not_active: out std_logic;
            Serr_switchgrantN_not_active1, Serr_switchgrantE_not_active1, Serr_switchgrantW_not_active1, Serr_switchgrantL_not_active1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_IDLE, err_Arbiter_Xbar_sel_invalid_North, err_Arbiter_Xbar_sel_invalid_East, err_Arbiter_Xbar_sel_invalid_West, err_Arbiter_Xbar_sel_invalid_Local: out std_logic; --, err_Arbiter_Xbar_sel_invalid_Local: out std_logic;
            err_Arbiter_Xbar_sel_invalid_North1, err_Arbiter_Xbar_sel_invalid_East1, err_Arbiter_Xbar_sel_invalid_West1, err_Arbiter_Xbar_sel_invalid_Local1: out std_logic;
            Serr_priorityIDLE3, Serr_priorityL3, Serr_priorityN3, Serr_priorityE3, Serr_priorityW3: out std_logic;
            Serr_switchgrantN1, Serr_switchgrantE1, Serr_switchgrantW1, Serr_switchgrantL1: out std_logic;
            err_Arbiter_state_not_update: out std_logic; 
            err_Arbiter_no_Grant: out std_logic
--            err_Arbiter_invalid_state: out std_logic -- , err_Arbiter_invalid_state1, err_Arbiter_invalid_state2, err_Arbiter_invalid_state3: out std_logic
            );
end component;

signal Grant_N_sig, Grant_E_sig, Grant_W_sig, Grant_L_sig: std_logic;
signal Xbar_sel_sig: std_logic_vector(3 downto 0);
signal state_in_sig: std_logic_vector (4 downto 0);
signal next_state_out_sig: std_logic_vector (4 downto 0);
signal RTS_FF_in_sig: std_logic;

begin 

Grant_N <= Grant_N_sig;
Grant_E <= Grant_E_sig;
Grant_W <= Grant_W_sig;
Grant_L <= Grant_L_sig;
Xbar_sel <= Xbar_sel_sig;
state_in <= state_in_sig;
RTS_FF_in <= RTS_FF_in_sig;
next_state_out <= next_state_out_sig;

-- Arbiter instantiation
SARBITER: SArbiter_pseudo port map (Req_N=>Req_N, Req_E=>Req_E, Req_W=>Req_W, Req_L=>Req_L,
						                        DCTS => DCTS, RTS_FF => RTS_FF,
 						                        state=>state,
                                    Grant_N => Grant_N, Grant_E => Grant_E, Grant_W => Grant_W, Grant_L => Grant_L,
                                    Xbar_sel => Xbar_sel_sig, RTS_FF_in => RTS_FF_in_sig, 
                                    state_in => state_in, 
                                    next_state_out => next_state_out_sig);

-- Checkers instantiation
CHECKERS: SArbiter_checkers port map (
                                      Req_N => Req_N, Req_E => Req_E, Req_W => Req_W, Req_L => Req_L,
                                      DCTS => DCTS, RTS_FF => RTS_FF,
                                      Grant_N => Grant_N_sig, Grant_E => Grant_E_sig, Grant_W => Grant_W_sig, Grant_L => Grant_L_sig, 
								                      Xbar_sel=>Xbar_sel_sig,
                                      state => state, 
								                      state_in => state_in_sig,
                                      next_state_out => next_state_out_sig,
                                      RTS_FF_in => RTS_FF_in_sig, 

                                      err_Arbiter_Xbar_sel_onehot => err_Arbiter_Xbar_sel_onehot, 
                                      -- err_Arbiter_no_req_Grant => err_Arbiter_no_req_Grant, 
                                      err_Arbiter_DCTS_RTS => err_Arbiter_DCTS_RTS, 
                                      err_Arbiter_DCTS_RTS1 => err_Arbiter_DCTS_RTS1,
                                      err_Arbiter_DCTS_RTS2 => err_Arbiter_DCTS_RTS2,
                                      err_Arbiter_DCTS_RTS3 => err_Arbiter_DCTS_RTS3,
                                      err_Arbiter_state_and_grants_onehot => err_Arbiter_state_and_grants_onehot, 
                                      err_Arbiter_no_req_state_change => err_Arbiter_no_req_state_change, 
                                      err_Arbiter_valid_state => err_Arbiter_valid_state, 
                                      Serr_switchgrantN => Serr_switchgrantN, Serr_switchgrantE => Serr_switchgrantE,
                                      Serr_switchgrantW => Serr_switchgrantW, Serr_switchgrantL => Serr_switchgrantL, 
                                      err_Arbiter_state_update => err_Arbiter_state_update, 
                                      err_Arbiter_state_RTS_FF_in => err_Arbiter_state_RTS_FF_in, 
                                      Serr_switchgrantN_not_active => Serr_switchgrantN_not_active,
                                      Serr_switchgrantN_not_active1 => Serr_switchgrantN_not_active1,
                                      Serr_switchgrantE_not_active => Serr_switchgrantE_not_active, 
                                      Serr_switchgrantE_not_active1 => Serr_switchgrantE_not_active1, 
                                      Serr_switchgrantW_not_active => Serr_switchgrantW_not_active, 
                                      Serr_switchgrantW_not_active1 => Serr_switchgrantW_not_active1, 
                                      Serr_switchgrantL_not_active => Serr_switchgrantL_not_active, 
                                      Serr_switchgrantL_not_active1 => Serr_switchgrantL_not_active1, 
                                      err_Arbiter_Xbar_sel_invalid_IDLE => err_Arbiter_Xbar_sel_invalid_IDLE,
                                      err_Arbiter_Xbar_sel_invalid_North => err_Arbiter_Xbar_sel_invalid_North, 
                                      err_Arbiter_Xbar_sel_invalid_North1 => err_Arbiter_Xbar_sel_invalid_North1,
                                      err_Arbiter_Xbar_sel_invalid_East => err_Arbiter_Xbar_sel_invalid_East,
                                      err_Arbiter_Xbar_sel_invalid_East1 => err_Arbiter_Xbar_sel_invalid_East1,                                       
                                      err_Arbiter_Xbar_sel_invalid_West => err_Arbiter_Xbar_sel_invalid_West, 
                                      err_Arbiter_Xbar_sel_invalid_West1 => err_Arbiter_Xbar_sel_invalid_West1,
                                      err_Arbiter_Xbar_sel_invalid_Local => err_Arbiter_Xbar_sel_invalid_Local, 
                                      err_Arbiter_Xbar_sel_invalid_Local1 => err_Arbiter_Xbar_sel_invalid_Local1, 
                                      Serr_priorityIDLE3 => Serr_priorityIDLE3, 
                                      Serr_priorityL3 => Serr_priorityL3, 
                                      Serr_priorityN3 => Serr_priorityN3, 
                                      Serr_priorityE3 => Serr_priorityE3, 
                                      Serr_priorityW3 => Serr_priorityW3, 
                                      Serr_switchgrantN1 => Serr_switchgrantN1,
                                      Serr_switchgrantE1 => Serr_switchgrantE1,
                                      Serr_switchgrantW1 => Serr_switchgrantW1,
                                      Serr_switchgrantL1 => Serr_switchgrantL1,
                                      err_Arbiter_state_not_update => err_Arbiter_state_not_update, 
                                      err_Arbiter_no_Grant => err_Arbiter_no_Grant
                                      --err_Arbiter_invalid_state => err_Arbiter_invalid_state, 
                                      --err_Arbiter_invalid_state1 => err_Arbiter_invalid_state1,
                                      --err_Arbiter_invalid_state2 => err_Arbiter_invalid_state2, 
                                      --err_Arbiter_invalid_state3 => err_Arbiter_invalid_state3
                                     );

end behavior;