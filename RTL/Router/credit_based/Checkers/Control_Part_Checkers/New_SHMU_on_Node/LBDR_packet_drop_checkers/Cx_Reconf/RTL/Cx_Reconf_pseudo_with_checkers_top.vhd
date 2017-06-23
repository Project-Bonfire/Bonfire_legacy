library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Cx_Reconf_pseudo_with_checkers_top is
    port (  reconfig_cx: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            empty: in std_logic;
            grants: in std_logic;
            Temp_Cx: in std_logic_vector(3 downto 0);
            Faulty_C_N: in std_logic;
            Faulty_C_E: in std_logic;
            Faulty_C_W: in std_logic;
            Faulty_C_S: in std_logic;
            Cx: in std_logic_vector(3 downto 0);
            Cx_reconf_PE: in  std_logic_vector(3 downto 0);
            Reconfig_command : in std_logic;

            Cx_in_out: out std_logic_vector(3 downto 0);
            reconfig_cx_in_out: out std_logic;
            Temp_Cx_in_out: out std_logic_vector(3 downto 0);

            -- Checker Outputs
            err_reconfig_cx_flit_type_Tail_not_empty_grants_Cx_in_Temp_Cx_equal,
            err_reconfig_cx_flit_type_Tail_not_empty_grants_not_reconfig_cx_in,
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Cx_in_Cx_equal,
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_reconfig_cx_in,
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_Temp_Cx_in,
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Reconfig_command_reconfig_cx_in,
            err_reconfig_cx_flit_type_Tail_not_empty_grants_Temp_Cx_in_Temp_Cx_equal,
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Temp_Cx_in_Cx_reconf_PE_equal,
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_reconfig_cx_in_reconfig_cx_equal, -- Added
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_Temp_Cx_in_Temp_Cx_equal : out std_logic -- Added
            );
end Cx_Reconf_pseudo_with_checkers_top;

architecture behavior of Cx_Reconf_pseudo_with_checkers_top is

component Cx_Reconf_pseudo is
    port (  reconfig_cx: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            empty: in std_logic;
            grants: in std_logic;
            Temp_Cx: in std_logic_vector(3 downto 0);
            Faulty_C_N: in std_logic;
            Faulty_C_E: in std_logic;
            Faulty_C_W: in std_logic;
            Faulty_C_S: in std_logic;
            Cx: in std_logic_vector(3 downto 0);
            Cx_reconf_PE: in  std_logic_vector(3 downto 0);
            Reconfig_command : in std_logic;

            Cx_in: out std_logic_vector(3 downto 0);
            reconfig_cx_in: out std_logic;
            Temp_Cx_in: out std_logic_vector(3 downto 0)
            );
end component;

component Cx_Reconf_pseudo_checkers is
    port (  reconfig_cx: in  std_logic; -- *
            flit_type: in std_logic_vector(2 downto 0); -- *
            empty: in std_logic; -- *
            grants: in std_logic;  -- *
            Cx_in: out std_logic_vector(3 downto 0); -- *
            Temp_Cx: in std_logic_vector(3 downto 0); -- *
            reconfig_cx_in: in std_logic; -- *
            Cx: in std_logic_vector(3 downto 0); -- *
            Cx_reconf_PE: in  std_logic_vector(3 downto 0); -- newly added
            Reconfig_command : in std_logic; -- newly added
            Faulty_C_N: in std_logic; -- *
            Faulty_C_E: in std_logic; -- *
            Faulty_C_W: in std_logic; -- *
            Faulty_C_S: in std_logic; -- *
            Temp_Cx_in: in std_logic_vector(3 downto 0); -- *

            -- Checker Outputs
            err_reconfig_cx_flit_type_Tail_not_empty_grants_Cx_in_Temp_Cx_equal,
            err_reconfig_cx_flit_type_Tail_not_empty_grants_not_reconfig_cx_in,
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Cx_in_Cx_equal,
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_reconfig_cx_in,
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_Temp_Cx_in,
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Reconfig_command_reconfig_cx_in,
            err_reconfig_cx_flit_type_Tail_not_empty_grants_Temp_Cx_in_Temp_Cx_equal,
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Temp_Cx_in_Cx_reconf_PE_equal,
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_reconfig_cx_in_reconfig_cx_equal, -- Added
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_Temp_Cx_in_Temp_Cx_equal : out std_logic -- Added
            );
end component;

signal Cx_in_sig: std_logic_vector (3 downto 0);
signal reconfig_cx_in_sig: std_logic;
signal Temp_Cx_in_sig: std_logic_vector(3 downto 0);

begin

Cx_in_out <= Cx_in_sig;
reconfig_cx_in_out <= reconfig_cx_in_sig;
Temp_Cx_in_out <= Temp_Cx_in_sig;

-- Cx Reconfiguration module instantiation
Cx_Reconf: Cx_Reconf_pseudo port map (
                                       reconfig_cx => reconfig_cx,
                                       flit_type => flit_type,
                                       empty => empty,
                                       grants => grants,
                                       Temp_Cx => Temp_Cx,
                                       Faulty_C_N => Faulty_C_N,
                                       Faulty_C_E => Faulty_C_E,
                                       Faulty_C_W => Faulty_C_W,
                                       Faulty_C_S => Faulty_C_S,
                                       Cx => Cx,
                                       Cx_reconf_PE => Cx_reconf_PE,
                                       Reconfig_command => Reconfig_command,

                                       Cx_in => Cx_in_sig,
                                       reconfig_cx_in => reconfig_cx_in_sig,
                                       Temp_Cx_in => Temp_Cx_in_sig
                                     );

-- Cx Reconfiguration module checkers instantiation
CHECKERS: Cx_Reconf_pseudo_checkers port map (
                                               reconfig_cx => reconfig_cx,
                                               flit_type => flit_type,
                                               empty => empty,
                                               grants => grants,
                                               Cx_in => Cx_in_sig,
                                               Temp_Cx => Temp_Cx,
                                               reconfig_cx_in => reconfig_cx_in_sig,
                                               Cx => Cx,
                                               Cx_reconf_PE => Cx_reconf_PE,
                                               Reconfig_command => Reconfig_command,
                                               Faulty_C_N => Faulty_C_N,
                                               Faulty_C_E => Faulty_C_E,
                                               Faulty_C_W => Faulty_C_W,
                                               Faulty_C_S => Faulty_C_S,
                                               Temp_Cx_in => Temp_Cx_in_sig,

                                               -- Checker Outputs
                                               err_reconfig_cx_flit_type_Tail_not_empty_grants_Cx_in_Temp_Cx_equal => err_reconfig_cx_flit_type_Tail_not_empty_grants_Cx_in_Temp_Cx_equal,
                                               err_reconfig_cx_flit_type_Tail_not_empty_grants_not_reconfig_cx_in => err_reconfig_cx_flit_type_Tail_not_empty_grants_not_reconfig_cx_in,
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Cx_in_Cx_equal => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Cx_in_Cx_equal,
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_reconfig_cx_in => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_reconfig_cx_in,
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_Temp_Cx_in => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_Temp_Cx_in,
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Reconfig_command_reconfig_cx_in => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Reconfig_command_reconfig_cx_in,
                                               err_reconfig_cx_flit_type_Tail_not_empty_grants_Temp_Cx_in_Temp_Cx_equal => err_reconfig_cx_flit_type_Tail_not_empty_grants_Temp_Cx_in_Temp_Cx_equal,
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Temp_Cx_in_Cx_reconf_PE_equal => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Temp_Cx_in_Cx_reconf_PE_equal,
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_reconfig_cx_in_reconfig_cx_equal => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_reconfig_cx_in_reconfig_cx_equal,
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_Temp_Cx_in_Temp_Cx_equal => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_Temp_Cx_in_Temp_Cx_equal
                                             );

end behavior;