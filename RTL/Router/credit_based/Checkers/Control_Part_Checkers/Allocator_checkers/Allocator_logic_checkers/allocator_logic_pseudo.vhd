--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity allocator_logic_pseudo is           
    port (  
           	-- grant_X_Y means the grant for X output port towards Y input port
           	-- this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
            empty_N, empty_E, empty_W, empty_S, empty_L: in std_logic;
            grant_N_N_sig, grant_N_E_sig, grant_N_W_sig, grant_N_S_sig, grant_N_L_sig: in std_logic;
            grant_E_N_sig, grant_E_E_sig, grant_E_W_sig, grant_E_S_sig, grant_E_L_sig: in std_logic;
            grant_W_N_sig, grant_W_E_sig, grant_W_W_sig, grant_W_S_sig, grant_W_L_sig: in std_logic;
            grant_S_N_sig, grant_S_E_sig, grant_S_W_sig, grant_S_S_sig, grant_S_L_sig: in std_logic;
            grant_L_N_sig, grant_L_E_sig, grant_L_W_sig, grant_L_S_sig, grant_L_L_sig: in std_logic;

            valid_N, valid_E, valid_W, valid_S, valid_L : out std_logic;
           	grant_N_N, grant_N_E, grant_N_W, grant_N_S, grant_N_L: out std_logic;
           	grant_E_N, grant_E_E, grant_E_W, grant_E_S, grant_E_L: out std_logic;
           	grant_W_N, grant_W_E, grant_W_W, grant_W_S, grant_W_L: out std_logic;
           	grant_S_N, grant_S_E, grant_S_W, grant_S_S, grant_S_L: out std_logic;
           	grant_L_N, grant_L_E, grant_L_W, grant_L_S, grant_L_L: out std_logic; 
            grant_N_out, grant_E_out, grant_W_out, grant_S_out, grant_L_out : out std_logic
            );
end allocator_logic_pseudo;

architecture behavior of allocator_logic_pseudo is

signal grant_N, grant_E, grant_W, grant_S, grant_L: std_logic;

begin 

-- The combionational part

-- We did this because of the checkers

grant_N_out <= grant_N; 
grant_E_out <= grant_E; 
grant_W_out <= grant_W; 
grant_S_out <= grant_S; 
grant_L_out <= grant_L; 

---------------------------------------------

grant_N_N <= grant_N_N_sig and not empty_N;
grant_N_E <= grant_N_E_sig and not empty_E;
grant_N_W <= grant_N_W_sig and not empty_W;
grant_N_S <= grant_N_S_sig and not empty_S;
grant_N_L <= grant_N_L_sig and not empty_L;

grant_E_N <= grant_E_N_sig and not empty_N;
grant_E_E <= grant_E_E_sig and not empty_E;
grant_E_W <= grant_E_W_sig and not empty_W;
grant_E_S <= grant_E_S_sig and not empty_S;
grant_E_L <= grant_E_L_sig and not empty_L;

grant_W_N <= grant_W_N_sig and not empty_N;
grant_W_E <= grant_W_E_sig and not empty_E;
grant_W_W <= grant_W_W_sig and not empty_W;
grant_W_S <= grant_W_S_sig and not empty_S;
grant_W_L <= grant_W_L_sig and not empty_L;

grant_S_N <= grant_S_N_sig and not empty_N;
grant_S_E <= grant_S_E_sig and not empty_E;
grant_S_W <= grant_S_W_sig and not empty_W;
grant_S_S <= grant_S_S_sig and not empty_S;
grant_S_L <= grant_S_L_sig and not empty_L;

grant_L_N <= grant_L_N_sig and not empty_N;
grant_L_E <= grant_L_E_sig and not empty_E;
grant_L_W <= grant_L_W_sig and not empty_W;
grant_L_S <= grant_L_S_sig and not empty_S;
grant_L_L <= grant_L_L_sig and not empty_L;
    
grant_N <=  (grant_N_N_sig and not empty_N )or (grant_N_E_sig and not empty_E) or (grant_N_W_sig and not empty_W) or (grant_N_S_sig and not empty_S) or (grant_N_L_sig and not empty_L);
grant_E <=  (grant_E_N_sig and not empty_N )or (grant_E_E_sig and not empty_E) or (grant_E_W_sig and not empty_W) or (grant_E_S_sig and not empty_S) or (grant_E_L_sig and not empty_L);
grant_W <=  (grant_W_N_sig and not empty_N )or (grant_W_E_sig and not empty_E) or (grant_W_W_sig and not empty_W) or (grant_W_S_sig and not empty_S) or (grant_W_L_sig and not empty_L);
grant_S <=  (grant_S_N_sig and not empty_N )or (grant_S_E_sig and not empty_E) or (grant_S_W_sig and not empty_W) or (grant_S_S_sig and not empty_S) or (grant_S_L_sig and not empty_L);
grant_L <=  (grant_L_N_sig and not empty_N )or (grant_L_E_sig and not empty_E) or (grant_L_W_sig and not empty_W) or (grant_L_S_sig and not empty_S) or (grant_L_L_sig and not empty_L);

valid_N <= grant_N;
valid_E <= grant_E;
valid_W <= grant_W;
valid_S <= grant_S;
valid_L <= grant_L;

END;
