--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Rxy_Reconf_pseudo_checkers is
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
end Rxy_Reconf_pseudo_checkers;

architecture behavior of Rxy_Reconf_pseudo_checkers is
begin

process(ReConf_FF_out, flit_type, empty, grants, Rxy_in, Rxy_tmp)
begin
    if (ReConf_FF_out = '1' and flit_type = "100" and empty = '0' and grants = '1' and Rxy_in /= Rxy_tmp) then
        err_ReConf_FF_out_flit_type_Tail_not_empty_grants_Rxy_in_Rxy_tmp <= '1';
    else
        err_ReConf_FF_out_flit_type_Tail_not_empty_grants_Rxy_in_Rxy_tmp <= '0';
    end if;
end process;

-- Checked (changed)!

process(ReConf_FF_out, flit_type, empty, grants, ReConf_FF_in)
begin
    if (ReConf_FF_out = '1' and flit_type = "100" and empty = '0' and grants = '1' and ReConf_FF_in /= '0') then
        err_ReConf_FF_out_flit_type_Tail_not_empty_grants_not_ReConf_FF_in <= '1';
    else
        err_ReConf_FF_out_flit_type_Tail_not_empty_grants_not_ReConf_FF_in <= '0';
    end if;
end process;

-- Checked (not changed)!

process(ReConf_FF_out, flit_type, empty, grants, Rxy_in, Rxy)
begin
    if ( (ReConf_FF_out = '0' or flit_type /= "100" or empty = '1' or grants = '0') and Rxy_in /= Rxy) then
        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Rxy_in_Rxy_equal <= '1';
    else
        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Rxy_in_Rxy_equal <= '0';
    end if;
end process;

-- Checked (not changed)!

process(ReConf_FF_out, flit_type, empty, grants, Reconfig_command, ReConf_FF_in)
begin
    if ( (ReConf_FF_out = '0' or flit_type /= "100" or empty = '1' or grants = '0') and Reconfig_command = '1' and ReConf_FF_in /= '1') then
        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_ReConf_FF_in <= '1';
    else
        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_ReConf_FF_in <= '0';
    end if;
end process;

-- Checked (changed)!

process(ReConf_FF_out, flit_type, empty, grants, Reconfig_command, Rxy_tmp_in, Rxy_reconf_PE)
begin
    if ( (ReConf_FF_out = '0' or flit_type /= "100" or empty = '1' or grants = '0') and Reconfig_command = '1' and Rxy_tmp_in /= Rxy_reconf_PE) then
        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_Rxy_tmp_in_Rxy_reconf_PE_equal <= '1';
    else
        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_Rxy_tmp_in_Rxy_reconf_PE_equal <= '0';
    end if;
end process;

-- Checked (Added)!

process(ReConf_FF_out, flit_type, empty, grants, Reconfig_command, Rxy_tmp_in, Rxy_tmp)
begin
    if ( (((ReConf_FF_out = '0' or flit_type /= "100" or empty = '1' or grants = '0') and Reconfig_command = '0') or
         (ReConf_FF_out = '1' and flit_type = "100" and empty = '0' and grants = '1')) and Rxy_tmp_in /= Rxy_tmp) then
        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_Rxy_tmp_in_Rxy_tmp_equal <= '1';
    else
        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_Rxy_tmp_in_Rxy_tmp_equal <= '0';
    end if;
end process;

-- Checked (Added)!

process(ReConf_FF_out, flit_type, empty, grants, Reconfig_command, ReConf_FF_in, ReConf_FF_out)
begin
    if ( (ReConf_FF_out = '0' or flit_type /= "100" or empty = '1' or grants = '0') and Reconfig_command = '0' and ReConf_FF_in /= ReConf_FF_out) then
        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_ReConf_FF_in_ReConf_FF_out_equal <= '1';
    else
        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_ReConf_FF_in_ReConf_FF_out_equal <= '0';
    end if;
end process;

-- Checked (updated)!

end;