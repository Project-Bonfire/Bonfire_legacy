--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Cx_Reconf_pseudo_checkers is
    port (  reconfig_cx: in  std_logic; -- *
            flit_type: in std_logic_vector(2 downto 0); -- *
            empty: in std_logic; -- *
            grants: in std_logic;  -- *
            Cx_in: in std_logic_vector(3 downto 0); -- * 
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
end Cx_Reconf_pseudo_checkers;

architecture behavior of Cx_Reconf_pseudo_checkers is

signal Faulty_C_signals: std_logic_vector(3 downto 0);

begin

Faulty_C_signals <= not (Faulty_C_S & Faulty_C_W & Faulty_C_E & Faulty_C_N); 

process(reconfig_cx, flit_type, empty, grants, Cx_in, Temp_Cx) 
begin
  err_reconfig_cx_flit_type_Tail_not_empty_grants_Cx_in_Temp_Cx_equal <= '0';
  if (reconfig_cx = '1' and flit_type = "100" and empty = '0' and grants = '1' and Cx_in /= Temp_Cx) then
    err_reconfig_cx_flit_type_Tail_not_empty_grants_Cx_in_Temp_Cx_equal <= '1';
  end if;
end process;


process(reconfig_cx, flit_type, empty, grants, reconfig_cx_in) 
begin
  err_reconfig_cx_flit_type_Tail_not_empty_grants_not_reconfig_cx_in <= '0';
  if (reconfig_cx = '1' and flit_type = "100" and empty = '0' and grants = '1' and reconfig_cx_in /= '0') then
    err_reconfig_cx_flit_type_Tail_not_empty_grants_not_reconfig_cx_in <= '1';
  end if;
end process;


process(reconfig_cx, flit_type, empty, grants, Cx_in, Cx) 
begin
  err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Cx_in_Cx_equal <= '0';
  if ( (reconfig_cx = '0' or flit_type /= "100" or empty = '1' or grants = '0') and Cx_in /= Cx) then
    err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Cx_in_Cx_equal <= '1';
  end if;
end process;


process(reconfig_cx, flit_type, empty, grants, Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S, reconfig_cx_in) 
begin
  err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_reconfig_cx_in <= '0';
  if ( (reconfig_cx = '0' or flit_type /= "100" or empty = '1' or grants = '0') and 
       ((Faulty_C_N or Faulty_C_E or Faulty_C_W or Faulty_C_S) = '1') and (reconfig_cx_in = '0') ) then
    err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_reconfig_cx_in <= '1';
  end if;
end process;


process(reconfig_cx, flit_type, empty, grants, Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S, Temp_Cx_in, Faulty_C_signals, Cx) 
begin
  err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_Temp_Cx_in <= '0';
  if ( (reconfig_cx = '0' or flit_type /= "100" or empty = '1' or grants = '0') and 
       ((Faulty_C_N or Faulty_C_E or Faulty_C_W or Faulty_C_S) = '1') and (Temp_Cx_in /= (Faulty_C_signals and Cx) ) ) then
    err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_Temp_Cx_in <= '1';
  end if;
end process;


process(reconfig_cx, flit_type, empty, grants, Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S, Reconfig_command, reconfig_cx_in) 
begin
  err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Reconfig_command_reconfig_cx_in <= '0';
  if ( (reconfig_cx = '0' or flit_type /= "100" or empty = '1' or grants = '0') and 
       ((Faulty_C_N or Faulty_C_E or Faulty_C_W or Faulty_C_S) = '0') and (Reconfig_command = '1') and (reconfig_cx_in /= '1') ) then
    err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Reconfig_command_reconfig_cx_in <= '1';
  end if;
end process;


process(reconfig_cx, flit_type, empty, grants, Temp_Cx_in, Temp_Cx) 
begin
  err_reconfig_cx_flit_type_Tail_not_empty_grants_Temp_Cx_in_Temp_Cx_equal <= '0';
  if (reconfig_cx = '1' and flit_type = "100" and empty = '0' and grants = '1' and Temp_Cx_in /= Temp_Cx) then
    err_reconfig_cx_flit_type_Tail_not_empty_grants_Temp_Cx_in_Temp_Cx_equal <= '1';
  end if;
end process;


process(reconfig_cx, flit_type, empty, grants, Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S, Reconfig_command, Temp_Cx_in, Cx_reconf_PE) 
begin
  err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Temp_Cx_in_Cx_reconf_PE_equal <= '0';
  if ( (reconfig_cx = '0' or flit_type /= "100" or empty = '1' or grants = '0') and 
       ((Faulty_C_N or Faulty_C_E or Faulty_C_W or Faulty_C_S) = '0') and (Reconfig_command = '1') and (Temp_Cx_in /= Cx_reconf_PE) ) then
    err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Temp_Cx_in_Cx_reconf_PE_equal <= '1';
  end if;
end process;


process(reconfig_cx, flit_type, empty, grants, Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S, Reconfig_command, reconfig_cx_in, reconfig_cx) 
begin
  err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_reconfig_cx_in_reconfig_cx_equal <= '0';
  if ( (reconfig_cx = '0' or flit_type /= "100" or empty = '1' or grants = '0') and 
       ((Faulty_C_N or Faulty_C_E or Faulty_C_W or Faulty_C_S) = '0') and (Reconfig_command = '0') and (reconfig_cx_in /= reconfig_cx) ) then
      err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_reconfig_cx_in_reconfig_cx_equal <= '1';
  end if;
end process;


process(reconfig_cx, flit_type, empty, grants, Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S, Reconfig_command, Temp_Cx_in, Temp_Cx) 
begin
  err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_Temp_Cx_in_Temp_Cx_equal <= '0';
  if ( (reconfig_cx = '0' or flit_type /= "100" or empty = '1' or grants = '0') and 
       ((Faulty_C_N or Faulty_C_E or Faulty_C_W or Faulty_C_S) = '0') and (Reconfig_command = '0') and (Temp_Cx_in /= Temp_Cx) ) then
      err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_Temp_Cx_in_Temp_Cx_equal <= '1';
  end if;
end process;


end;