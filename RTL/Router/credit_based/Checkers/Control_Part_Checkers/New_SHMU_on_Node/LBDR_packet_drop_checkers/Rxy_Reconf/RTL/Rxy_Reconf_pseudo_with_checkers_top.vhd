--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Rxy_Reconf_pseudo_with_checkers_top is
    port ( ReConf_FF_out: in std_logic;
           Rxy: in  std_logic_vector(7 downto 0);
           Rxy_tmp: in std_logic_vector(7 downto 0);
           Reconfig_command : in std_logic;
           flit_type: in std_logic_vector(2 downto 0);
           grants: in std_logic;
           empty: in  std_logic;
           Rxy_reconf_PE: in  std_logic_vector(7 downto 0);

           Rxy_in_out: out std_logic_vector(7 downto 0);
           Rxy_tmp_in_out: out std_logic_vector(7 downto 0);
           ReConf_FF_in_out: out std_logic;

           -- Checker outputs
            err_ReConf_FF_out_flit_type_Tail_not_empty_grants_Rxy_in_Rxy_tmp,
            err_ReConf_FF_out_flit_type_Tail_not_empty_grants_not_ReConf_FF_in,
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Rxy_in_Rxy_equal,
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_ReConf_FF_in,
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_Rxy_tmp_in_Rxy_reconf_PE_equal,
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_Rxy_tmp_in_Rxy_tmp_equal,
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_ReConf_FF_in_ReConf_FF_out_equal : out std_logic
         );
end Rxy_Reconf_pseudo_with_checkers_top;

architecture behavior of Rxy_Reconf_pseudo_with_checkers_top is

component Rxy_Reconf_pseudo is
    port (  ReConf_FF_out: in std_logic;
            Rxy: in  std_logic_vector(7 downto 0);
            Rxy_tmp: in std_logic_vector(7 downto 0);
            Reconfig_command : in std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            grants: in std_logic;
            empty: in  std_logic;
            Rxy_reconf_PE: in  std_logic_vector(7 downto 0);

            Rxy_in: out std_logic_vector(7 downto 0);
            Rxy_tmp_in: out std_logic_vector(7 downto 0);
            ReConf_FF_in: out std_logic
         );
end component;

component Rxy_Reconf_pseudo_checkers is
    port (  ReConf_FF_out: in std_logic;
            Rxy: in  std_logic_vector(7 downto 0);
            Rxy_tmp: in std_logic_vector(7 downto 0);
            Reconfig_command : in std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            grants: in std_logic;
            empty: in  std_logic;
            Rxy_reconf_PE: in  std_logic_vector(7 downto 0);
            Rxy_in: in std_logic_vector(7 downto 0);
            Rxy_tmp_in: in std_logic_vector(7 downto 0);
            ReConf_FF_in: in std_logic;

            err_ReConf_FF_out_flit_type_Tail_not_empty_grants_Rxy_in_Rxy_tmp,
            err_ReConf_FF_out_flit_type_Tail_not_empty_grants_not_ReConf_FF_in,
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Rxy_in_Rxy_equal,
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_ReConf_FF_in,
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_Rxy_tmp_in_Rxy_reconf_PE_equal,
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_Rxy_tmp_in_Rxy_tmp_equal,
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_ReConf_FF_in_ReConf_FF_out_equal : out std_logic
         );
end component;

signal Rxy_in_sig: std_logic_vector (7 downto 0);
signal Rxy_tmp_in_sig: std_logic_vector (7 downto 0);
signal ReConf_FF_in_sig: std_logic;

begin

Rxy_in_out <= Rxy_in_sig;
Rxy_tmp_in_out <= Rxy_tmp_in_sig;
ReConf_FF_in_out <= ReConf_FF_in_sig;

-- Rxy Reconfiguration (pseudo-combinational) module instantiation
Rxy_Reconf_pseudo0 : Rxy_Reconf_pseudo
                            port map (
                                        ReConf_FF_out => ReConf_FF_out,
                                        Rxy => Rxy,
                                        Rxy_tmp => Rxy_tmp,
                                        Reconfig_command => Reconfig_command,
                                        flit_type => flit_type,
                                        grants => grants,
                                        empty => empty,
                                        Rxy_reconf_PE => Rxy_reconf_PE,

                                        Rxy_in => Rxy_in_sig,
                                        Rxy_tmp_in => Rxy_tmp_in_sig,
                                        ReConf_FF_in => ReConf_FF_in_sig
                                     );

CHECKERS : Rxy_Reconf_pseudo_checkers
                            port map (
                                        ReConf_FF_out => ReConf_FF_out,
                                        Rxy => Rxy,
                                        Rxy_tmp => Rxy_tmp,
                                        Reconfig_command => Reconfig_command,
                                        flit_type => flit_type,
                                        grants => grants,
                                        empty => empty,
                                        Rxy_reconf_PE => Rxy_reconf_PE,
                                        Rxy_in => Rxy_in_sig,
                                        Rxy_tmp_in => Rxy_tmp_in_sig,
                                        ReConf_FF_in => ReConf_FF_in_sig,

                                        err_ReConf_FF_out_flit_type_Tail_not_empty_grants_Rxy_in_Rxy_tmp => err_ReConf_FF_out_flit_type_Tail_not_empty_grants_Rxy_in_Rxy_tmp,
                                        err_ReConf_FF_out_flit_type_Tail_not_empty_grants_not_ReConf_FF_in => err_ReConf_FF_out_flit_type_Tail_not_empty_grants_not_ReConf_FF_in,
                                        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Rxy_in_Rxy_equal => err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Rxy_in_Rxy_equal,
                                        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_ReConf_FF_in => err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_ReConf_FF_in,
                                        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_Rxy_tmp_in_Rxy_reconf_PE_equal => err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_Rxy_tmp_in_Rxy_reconf_PE_equal,
                                        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_Rxy_tmp_in_Rxy_tmp_equal => err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_Rxy_tmp_in_Rxy_tmp_equal,
                                        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_ReConf_FF_in_ReConf_FF_out_equal => err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_ReConf_FF_in_ReConf_FF_out_equal
                                      );

end;