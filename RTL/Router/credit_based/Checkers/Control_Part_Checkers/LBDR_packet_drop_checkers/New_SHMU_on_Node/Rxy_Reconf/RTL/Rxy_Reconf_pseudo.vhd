--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Rxy_Reconf_pseudo is
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
end Rxy_Reconf_pseudo;

architecture behavior of Rxy_Reconf_pseudo is
begin

process(Reconfig_command, Rxy_reconf_PE, Rxy_tmp, ReConf_FF_out, Rxy, flit_type, grants, empty) 
begin

Rxy_tmp_in <= Rxy_tmp;

  if ReConf_FF_out= '1' and flit_type = "100" and empty = '0' and grants = '1' then
        Rxy_in <= Rxy_tmp;
        ReConf_FF_in <= '0';
  else
    Rxy_in <= Rxy;

    if Reconfig_command = '1' then 
      Rxy_tmp_in <= Rxy_reconf_PE;
      ReConf_FF_in <= '1';

    else
      Rxy_tmp_in <= Rxy_tmp;
      ReConf_FF_in <= ReConf_FF_out;

    end if;
  end if; 

end process;

end;