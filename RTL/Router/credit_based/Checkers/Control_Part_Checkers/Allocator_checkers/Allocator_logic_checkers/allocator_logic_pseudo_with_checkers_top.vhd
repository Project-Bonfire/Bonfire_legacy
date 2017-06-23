--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity allocator_logic_pseudo_with_checkers_top is
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
            grant_N_out, grant_E_out, grant_W_out, grant_S_out, grant_L_out : out std_logic;

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
end allocator_logic_pseudo_with_checkers_top;

architecture behavior of allocator_logic_pseudo_with_checkers_top is

component allocator_logic_pseudo is
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
end component;

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

-- Signal(s) definition(s) for checkers

signal valid_N_sig, valid_E_sig, valid_W_sig, valid_S_sig, valid_L_sig : std_logic;
signal grant_N_N_signal, grant_N_E_signal, grant_N_W_signal, grant_N_S_signal, grant_N_L_signal: std_logic;
signal grant_E_N_signal, grant_E_E_signal, grant_E_W_signal, grant_E_S_signal, grant_E_L_signal: std_logic;
signal grant_W_N_signal, grant_W_E_signal, grant_W_W_signal, grant_W_S_signal, grant_W_L_signal: std_logic;
signal grant_S_N_signal, grant_S_E_signal, grant_S_W_signal, grant_S_S_signal, grant_S_L_signal: std_logic;
signal grant_L_N_signal, grant_L_E_signal, grant_L_W_signal, grant_L_S_signal, grant_L_L_signal: std_logic;
signal grant_N_out_sig, grant_E_out_sig, grant_W_out_sig, grant_S_out_sig, grant_L_out_sig : std_logic;

begin

-- We did this because of the checkers

valid_N <= valid_N_sig;
valid_E <= valid_E_sig;
valid_W <= valid_W_sig;
valid_S <= valid_S_sig;
valid_L <= valid_L_sig;

grant_N_out <= grant_N_out_sig;
grant_E_out <= grant_E_out_sig;
grant_W_out <= grant_W_out_sig;
grant_S_out <= grant_S_out_sig;
grant_L_out <= grant_L_out_sig;

grant_N_N <= grant_N_N_signal;
grant_N_E <= grant_N_E_signal;
grant_N_W <= grant_N_W_signal;
grant_N_S <= grant_N_S_signal;
grant_N_L <= grant_N_L_signal;
grant_E_N <= grant_E_N_signal;
grant_E_E <= grant_E_E_signal;
grant_E_W <= grant_E_W_signal;
grant_E_S <= grant_E_S_signal;
grant_E_L <= grant_E_L_signal;
grant_W_N <= grant_W_N_signal;
grant_W_E <= grant_W_E_signal;
grant_W_W <= grant_W_W_signal;
grant_W_S <= grant_W_S_signal;
grant_W_L <= grant_W_L_signal;
grant_S_N <= grant_S_N_signal;
grant_S_E <= grant_S_E_signal;
grant_S_W <= grant_S_W_signal;
grant_S_S <= grant_S_S_signal;
grant_S_L <= grant_S_L_signal;
grant_L_N <= grant_L_N_signal;
grant_L_E <= grant_L_E_signal;
grant_L_W <= grant_L_W_signal;
grant_L_S <= grant_L_S_signal;
grant_L_L <= grant_L_L_signal;

-- Allocator logic (pseudo-combinational) module instantiation
ALLOCATOR_LOGIC_PSEUDO0: allocator_logic_pseudo
                                       PORT MAP (
                                                   empty_N => empty_N,
                                                   empty_E => empty_E,
                                                   empty_W => empty_W,
                                                   empty_S => empty_S,
                                                   empty_L => empty_L,
                                                   grant_N_N_sig => grant_N_N_sig, grant_N_E_sig => grant_N_E_sig, grant_N_W_sig => grant_N_W_sig, grant_N_S_sig => grant_N_S_sig, grant_N_L_sig => grant_N_L_sig,
                                                   grant_E_N_sig => grant_E_N_sig, grant_E_E_sig => grant_E_E_sig, grant_E_W_sig => grant_E_W_sig, grant_E_S_sig => grant_E_S_sig, grant_E_L_sig => grant_E_L_sig,
                                                   grant_W_N_sig => grant_W_N_sig, grant_W_E_sig => grant_W_E_sig, grant_W_W_sig => grant_W_W_sig, grant_W_S_sig => grant_W_S_sig, grant_W_L_sig => grant_W_L_sig,
                                                   grant_S_N_sig => grant_S_N_sig, grant_S_E_sig => grant_S_E_sig, grant_S_W_sig => grant_S_W_sig, grant_S_S_sig => grant_S_S_sig, grant_S_L_sig => grant_S_L_sig,
                                                   grant_L_N_sig => grant_L_N_sig, grant_L_E_sig => grant_L_E_sig, grant_L_W_sig => grant_L_W_sig, grant_L_S_sig => grant_L_S_sig, grant_L_L_sig => grant_L_L_sig,

                                                   valid_N => valid_N_sig,
                                                   valid_E => valid_E_sig,
                                                   valid_W => valid_W_sig,
                                                   valid_S => valid_S_sig,
                                                   valid_L => valid_L_sig,
                                                   grant_N_N => grant_N_N_signal,
                                                   grant_N_E => grant_N_E_signal,
                                                   grant_N_W => grant_N_W_signal,
                                                   grant_N_S => grant_N_S_signal,
                                                   grant_N_L => grant_N_L_signal,
                                                   grant_E_N => grant_E_N_signal,
                                                   grant_E_E => grant_E_E_signal,
                                                   grant_E_W => grant_E_W_signal,
                                                   grant_E_S => grant_E_S_signal,
                                                   grant_E_L => grant_E_L_signal,
                                                   grant_W_N => grant_W_N_signal,
                                                   grant_W_E => grant_W_E_signal,
                                                   grant_W_W => grant_W_W_signal,
                                                   grant_W_S => grant_W_S_signal,
                                                   grant_W_L => grant_W_L_signal,
                                                   grant_S_N => grant_S_N_signal,
                                                   grant_S_E => grant_S_E_signal,
                                                   grant_S_W => grant_S_W_signal,
                                                   grant_S_S => grant_S_S_signal,
                                                   grant_S_L => grant_S_L_signal,
                                                   grant_L_N => grant_L_N_signal,
                                                   grant_L_E => grant_L_E_signal,
                                                   grant_L_W => grant_L_W_signal,
                                                   grant_L_S => grant_L_S_signal,
                                                   grant_L_L => grant_L_L_signal,
                                                   grant_N_out => grant_N_out_sig,
                                                   grant_E_out => grant_E_out_sig,
                                                   grant_W_out => grant_W_out_sig,
                                                   grant_S_out => grant_S_out_sig,
                                                   grant_L_out => grant_L_out_sig
                                                );

-- Allocator logic (pseudo-combinational) checkers instantiation
CHECKERS: allocator_logic_pseudo_checkers  PORT MAP (
                                                       empty_N => empty_N,
                                                       empty_E => empty_E,
                                                       empty_W => empty_W,
                                                       empty_S => empty_S,
                                                       empty_L => empty_L,
                                                       grant_N_N_sig => grant_N_N_sig, grant_N_E_sig => grant_N_E_sig, grant_N_W_sig => grant_N_W_sig, grant_N_S_sig => grant_N_S_sig, grant_N_L_sig => grant_N_L_sig,
                                                       grant_E_N_sig => grant_E_N_sig, grant_E_E_sig => grant_E_E_sig, grant_E_W_sig => grant_E_W_sig, grant_E_S_sig => grant_E_S_sig, grant_E_L_sig => grant_E_L_sig,
                                                       grant_W_N_sig => grant_W_N_sig, grant_W_E_sig => grant_W_E_sig, grant_W_W_sig => grant_W_W_sig, grant_W_S_sig => grant_W_S_sig, grant_W_L_sig => grant_W_L_sig,
                                                       grant_S_N_sig => grant_S_N_sig, grant_S_E_sig => grant_S_E_sig, grant_S_W_sig => grant_S_W_sig, grant_S_S_sig => grant_S_S_sig, grant_S_L_sig => grant_S_L_sig,
                                                       grant_L_N_sig => grant_L_N_sig, grant_L_E_sig => grant_L_E_sig, grant_L_W_sig => grant_L_W_sig, grant_L_S_sig => grant_L_S_sig, grant_L_L_sig => grant_L_L_sig,

                                                       valid_N => valid_N_sig,
                                                       valid_E => valid_E_sig,
                                                       valid_W => valid_W_sig,
                                                       valid_S => valid_S_sig,
                                                       valid_L => valid_L_sig,
                                                       grant_N_N => grant_N_N_signal,
                                                       grant_N_E => grant_N_E_signal,
                                                       grant_N_W => grant_N_W_signal,
                                                       grant_N_S => grant_N_S_signal,
                                                       grant_N_L => grant_N_L_signal,
                                                       grant_E_N => grant_E_N_signal,
                                                       grant_E_E => grant_E_E_signal,
                                                       grant_E_W => grant_E_W_signal,
                                                       grant_E_S => grant_E_S_signal,
                                                       grant_E_L => grant_E_L_signal,
                                                       grant_W_N => grant_W_N_signal,
                                                       grant_W_E => grant_W_E_signal,
                                                       grant_W_W => grant_W_W_signal,
                                                       grant_W_S => grant_W_S_signal,
                                                       grant_W_L => grant_W_L_signal,
                                                       grant_S_N => grant_S_N_signal,
                                                       grant_S_E => grant_S_E_signal,
                                                       grant_S_W => grant_S_W_signal,
                                                       grant_S_S => grant_S_S_signal,
                                                       grant_S_L => grant_S_L_signal,
                                                       grant_L_N => grant_L_N_signal,
                                                       grant_L_E => grant_L_E_signal,
                                                       grant_L_W => grant_L_W_signal,
                                                       grant_L_S => grant_L_S_signal,
                                                       grant_L_L => grant_L_L_signal,
                                                       grant_N   => grant_N_out_sig,
                                                       grant_E   => grant_E_out_sig,
                                                       grant_W   => grant_W_out_sig,
                                                       grant_S   => grant_S_out_sig,
                                                       grant_L   => grant_L_out_sig,

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


END;
