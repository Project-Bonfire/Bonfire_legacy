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
 
err_Arbiter_Xbar_sel_onehot : out std_logic
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
 
err_Arbiter_Xbar_sel_onehot : out std_logic 
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
 
err_Arbiter_Xbar_sel_onehot => err_Arbiter_Xbar_sel_onehot);
	
end behavior; 
 
