--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity allocator_credit_counter_logic_pseudo_with_checkers_top is      
    port (  
            -- flow control
            credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L: in std_logic;
            credit_counter_N_out, credit_counter_E_out, credit_counter_W_out, credit_counter_S_out, credit_counter_L_out : in std_logic_vector(1 downto 0);            
            grant_N, grant_E, grant_W, grant_S, grant_L: in std_logic;

            credit_counter_N_in, credit_counter_E_in, credit_counter_W_in, credit_counter_S_in, credit_counter_L_in : out std_logic_vector(1 downto 0);

            -- Checker outputs
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
end allocator_credit_counter_logic_pseudo_with_checkers_top;

architecture behavior of allocator_credit_counter_logic_pseudo_with_checkers_top is

component allocator_credit_counter_logic_pseudo is           
    port (  
            -- flow control
            credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L: in std_logic;
            credit_counter_N_out, credit_counter_E_out, credit_counter_W_out, credit_counter_S_out, credit_counter_L_out : in std_logic_vector(1 downto 0);            
            grant_N, grant_E, grant_W, grant_S, grant_L: in std_logic;

            credit_counter_N_in, credit_counter_E_in, credit_counter_W_in, credit_counter_S_in, credit_counter_L_in : out std_logic_vector(1 downto 0)
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

-- Signal(s) definition(s) for checkers

signal credit_counter_N_in_sig, credit_counter_E_in_sig, credit_counter_W_in_sig, credit_counter_S_in_sig, credit_counter_L_in_sig : std_logic_vector (1 downto 0);

begin 
  
-- We did this because of the checkers

credit_counter_N_in <= credit_counter_N_in_sig; 
credit_counter_E_in <= credit_counter_E_in_sig; 
credit_counter_W_in <= credit_counter_W_in_sig; 
credit_counter_S_in <= credit_counter_S_in_sig; 
credit_counter_L_in <= credit_counter_L_in_sig; 

-- Allocator logic (pseudo-combinational) module instantiation
ALLOCATOR_CREDIT_COUNTER_LOGIC_PSEUDO0: allocator_credit_counter_logic_pseudo  
                                                        PORT MAP (
                                                                   credit_in_N => credit_in_N, 
                                                                   credit_in_E => credit_in_E, 
                                                                   credit_in_W => credit_in_W, 
                                                                   credit_in_S => credit_in_S, 
                                                                   credit_in_L => credit_in_L, 
                                                                   credit_counter_N_out => credit_counter_N_out, credit_counter_E_out => credit_counter_E_out, credit_counter_W_out => credit_counter_W_out, credit_counter_S_out => credit_counter_S_out, credit_counter_L_out => credit_counter_L_out,
                                                                   grant_N => grant_N, 
                                                                   grant_E => grant_E, 
                                                                   grant_W => grant_W, 
                                                                   grant_S => grant_S, 
                                                                   grant_L => grant_L,

                                                                   credit_counter_N_in => credit_counter_N_in_sig, 
                                                                   credit_counter_E_in => credit_counter_E_in_sig, 
                                                                   credit_counter_W_in => credit_counter_W_in_sig, 
                                                                   credit_counter_S_in => credit_counter_S_in_sig, 
                                                                   credit_counter_L_in => credit_counter_L_in_sig
                                                                );

-- Allocator logic (pseudo-combinational) checkers instantiation
CHECKERS: allocator_credit_counter_logic_pseudo_checkers  PORT MAP (
                                                                       credit_in_N => credit_in_N, 
                                                                       credit_in_E => credit_in_E, 
                                                                       credit_in_W => credit_in_W, 
                                                                       credit_in_S => credit_in_S, 
                                                                       credit_in_L => credit_in_L, 
                                                                       credit_counter_N_out => credit_counter_N_out, credit_counter_E_out => credit_counter_E_out, credit_counter_W_out => credit_counter_W_out, credit_counter_S_out => credit_counter_S_out, credit_counter_L_out => credit_counter_L_out,
                                                                       valid_N => grant_N, -- ?? Valid or grant ??
                                                                       valid_E => grant_E, -- ?? Valid or grant ??
                                                                       valid_W => grant_W, -- ?? Valid or grant ??
                                                                       valid_S => grant_S, -- ?? Valid or grant ??
                                                                       valid_L => grant_L, -- ?? Valid or grant ??

                                                                       credit_counter_N_in => credit_counter_N_in_sig, 
                                                                       credit_counter_E_in => credit_counter_E_in_sig, 
                                                                       credit_counter_W_in => credit_counter_W_in_sig, 
                                                                       credit_counter_S_in => credit_counter_S_in_sig, 
                                                                       credit_counter_L_in => credit_counter_L_in_sig, 

                                                                       -- Checker Outputs
                                                                       -- Not complete yet !
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


END;





