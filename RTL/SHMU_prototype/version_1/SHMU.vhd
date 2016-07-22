--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity SHMU is
    generic (
        router_fault_info_width: integer := 5;
        network_size: integer := 2
     );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            Faulty_N_0, Faulty_E_0, Faulty_W_0, Faulty_S_0, Faulty_L_0: in std_logic;
            Faulty_N_1, Faulty_E_1, Faulty_W_1, Faulty_S_1, Faulty_L_1: in std_logic;
            Faulty_N_2, Faulty_E_2, Faulty_W_2, Faulty_S_2, Faulty_L_2: in std_logic;
            Faulty_N_3, Faulty_E_3, Faulty_W_3, Faulty_S_3, Faulty_L_3: in std_logic
            );
end SHMU;

architecture behavior of SHMU is

  type SHM_type is array (0 to network_size*network_size-1) of std_logic_vector(router_fault_info_width-1 downto 0);  --memory
  signal SHM : SHM_type ;

begin 


  process(clk, reset)begin
    if reset = '0' then 
      SHM <= (others => (others => '0'));
    elsif clk'event and clk = '1' then
       SHM(0) <= Faulty_N_0 & Faulty_E_0 & Faulty_W_0 & Faulty_S_0 & Faulty_L_0;
       SHM(1) <= Faulty_N_1 & Faulty_E_1 & Faulty_W_1 & Faulty_S_1 & Faulty_L_1;
       SHM(2) <= Faulty_N_2 & Faulty_E_2 & Faulty_W_2 & Faulty_S_2 & Faulty_L_2;
       SHM(3) <= Faulty_N_3 & Faulty_E_3 & Faulty_W_3 & Faulty_S_3 & Faulty_L_3;
    end if;
  end process;

END;