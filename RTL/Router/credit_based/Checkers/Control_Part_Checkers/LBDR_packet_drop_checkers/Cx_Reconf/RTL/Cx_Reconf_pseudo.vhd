--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Cx_Reconf_pseudo is
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

            Cx_in: out std_logic_vector(3 downto 0);
            reconfig_cx_in: out std_logic;
            Temp_Cx_in: out std_logic_vector(3 downto 0)
            );
end Cx_Reconf_pseudo;

architecture behavior of Cx_Reconf_pseudo is
begin

process(Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S, Cx, Temp_Cx, flit_type, reconfig_cx, empty, grants) 
begin

  Temp_Cx_in <= Temp_Cx;

  if reconfig_cx = '1' and flit_type = "100" and empty = '0' and grants = '1' then
    Cx_in <= Temp_Cx;
    reconfig_cx_in <= '0';
  else
    Cx_in <= Cx;
    if (Faulty_C_N or Faulty_C_E or Faulty_C_W or Faulty_C_S) = '1' then 
      reconfig_cx_in <= '1';
      Temp_Cx_in <= not(Faulty_C_S & Faulty_C_W & Faulty_C_E & Faulty_C_N) and Cx;
    else
      reconfig_cx_in <= reconfig_cx;
    end if;
  end if;

end process;

end;