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
            faulty_packet_N_0, healthy_packet_N_0, faulty_packet_E_0, healthy_packet_E_0, faulty_packet_W_0, healthy_packet_W_0, faulty_packet_S_0, healthy_packet_S_0, faulty_packet_L_0, healthy_packet_L_0: in  std_logic;
            faulty_packet_N_1, healthy_packet_N_1, faulty_packet_E_1, healthy_packet_E_1, faulty_packet_W_1, healthy_packet_W_1, faulty_packet_S_1, healthy_packet_S_1, faulty_packet_L_1, healthy_packet_L_1: in std_logic;
            faulty_packet_N_2, healthy_packet_N_2, faulty_packet_E_2, healthy_packet_E_2, faulty_packet_W_2, healthy_packet_W_2, faulty_packet_S_2, healthy_packet_S_2, faulty_packet_L_2, healthy_packet_L_2: in std_logic;
            faulty_packet_N_3, healthy_packet_N_3, faulty_packet_E_3, healthy_packet_E_3, faulty_packet_W_3, healthy_packet_W_3, faulty_packet_S_3, healthy_packet_S_3, faulty_packet_L_3, healthy_packet_L_3: in std_logic );

end SHMU;

architecture behavior of SHMU is

  type SHM_type is array (0 to network_size*network_size-1) of std_logic_vector(router_fault_info_width-1 downto 0);  --memory
  signal SHM : SHM_type ;

  signal Healthy_N_0, Healthy_E_0, Healthy_W_0, Healthy_S_0, Healthy_L_0: std_logic;
  signal Healthy_N_1, Healthy_E_1, Healthy_W_1, Healthy_S_1, Healthy_L_1: std_logic;
  signal Healthy_N_2, Healthy_E_2, Healthy_W_2, Healthy_S_2, Healthy_L_2: std_logic;
  signal Healthy_N_3, Healthy_E_3, Healthy_W_3, Healthy_S_3, Healthy_L_3: std_logic;


  signal Intermittent_N_0, Intermittent_E_0, Intermittent_W_0, Intermittent_S_0, Intermittent_L_0: std_logic;
  signal Intermittent_N_1, Intermittent_E_1, Intermittent_W_1, Intermittent_S_1, Intermittent_L_1: std_logic;
  signal Intermittent_N_2, Intermittent_E_2, Intermittent_W_2, Intermittent_S_2, Intermittent_L_2: std_logic;
  signal Intermittent_N_3, Intermittent_E_3, Intermittent_W_3, Intermittent_S_3, Intermittent_L_3: std_logic;
  
  signal Faulty_N_0, Faulty_E_0, Faulty_W_0, Faulty_S_0, Faulty_L_0: std_logic;
  signal Faulty_N_1, Faulty_E_1, Faulty_W_1, Faulty_S_1, Faulty_L_1: std_logic;
  signal Faulty_N_2, Faulty_E_2, Faulty_W_2, Faulty_S_2, Faulty_L_2: std_logic;
  signal Faulty_N_3, Faulty_E_3, Faulty_W_3, Faulty_S_3, Faulty_L_3: std_logic;

component counter_threshold_classifier is
    generic (
        counter_depth: integer := 8;
        healthy_counter_threshold: integer := 4;
        faulty_counter_threshold: integer := 4
     );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            faulty_packet, Healthy_packet: in  std_logic;
            Healthy, Intermittent, Faulty:out std_logic
            );
end component;

begin 
 
-- these are the signals that do not actually exist because of the topology
Faulty_N_0 <= '0';
Faulty_W_0 <= '0';
Faulty_N_1 <= '0';
Faulty_E_1 <= '0';
Faulty_S_2 <= '0';
Faulty_W_2 <= '0';
Faulty_S_3 <= '0';
Faulty_E_3 <= '0';

CT_0_E: counter_threshold_classifier   generic map(counter_depth => 8, healthy_counter_threshold => 20, faulty_counter_threshold => 1)
    port map(  reset => reset, 
            clk => clk,
            faulty_packet => faulty_packet_E_0, Healthy_packet => healthy_packet_E_0,
            Healthy => Healthy_E_0, Intermittent => Intermittent_E_0, Faulty => Faulty_E_0); 

CT_0_S: counter_threshold_classifier   generic map(counter_depth => 8, healthy_counter_threshold => 20, faulty_counter_threshold => 1)
    port map(  reset => reset, 
            clk => clk,
            faulty_packet => faulty_packet_S_0, Healthy_packet => healthy_packet_S_0,
            Healthy => Healthy_S_0, Intermittent => Intermittent_S_0, Faulty => Faulty_S_0);

CT_0_L: counter_threshold_classifier   generic map(counter_depth => 8, healthy_counter_threshold => 20, faulty_counter_threshold => 1)
    port map(  reset => reset, 
            clk => clk,
            faulty_packet => faulty_packet_L_0, Healthy_packet => healthy_packet_L_0,
            Healthy => Healthy_L_0, Intermittent => Intermittent_L_0, Faulty => Faulty_L_0);
------------------------------------------------------------------------------------------------------------
  
CT_1_W: counter_threshold_classifier   generic map(counter_depth => 8, healthy_counter_threshold => 20, faulty_counter_threshold => 1)
    port map (  reset => reset, 
            clk => clk,
            faulty_packet => faulty_packet_W_1, Healthy_packet => healthy_packet_W_1,
            Healthy => Healthy_W_1, Intermittent => Intermittent_W_1, Faulty => Faulty_W_1);
    
CT_1_S: counter_threshold_classifier   generic map(counter_depth => 8, healthy_counter_threshold => 20, faulty_counter_threshold => 1)
    port map (  reset => reset, 
            clk => clk,
            faulty_packet => faulty_packet_S_1, Healthy_packet => healthy_packet_S_1,
            Healthy => Healthy_S_1, Intermittent => Intermittent_S_1, Faulty => Faulty_S_1);

CT_1_L: counter_threshold_classifier   generic map(counter_depth => 8, healthy_counter_threshold => 20, faulty_counter_threshold => 1)
    port map (  reset => reset, 
            clk => clk,
            faulty_packet => faulty_packet_L_1, Healthy_packet => healthy_packet_L_1,
            Healthy => Healthy_L_1, Intermittent => Intermittent_L_1, Faulty => Faulty_L_1);
------------------------------------------------------------------------------------------------------------
 
CT_2_N: counter_threshold_classifier   generic map(counter_depth => 8, healthy_counter_threshold => 20, faulty_counter_threshold => 1)
    port map (  reset => reset, 
            clk => clk,
            faulty_packet => faulty_packet_N_2, Healthy_packet => healthy_packet_N_2,
            Healthy => Healthy_N_2, Intermittent => Intermittent_N_2, Faulty => Faulty_N_2);

CT_2_E: counter_threshold_classifier   generic map(counter_depth => 8, healthy_counter_threshold => 20, faulty_counter_threshold => 1)
    port map (  reset => reset, 
            clk => clk,
            faulty_packet => faulty_packet_E_2, Healthy_packet => healthy_packet_E_2,
            Healthy => Healthy_E_2, Intermittent => Intermittent_E_2, Faulty => Faulty_E_2);

 

CT_2_L: counter_threshold_classifier   generic map(counter_depth => 8, healthy_counter_threshold => 20, faulty_counter_threshold => 1)
    port map (  reset => reset, 
            clk => clk,
            faulty_packet => faulty_packet_L_2, Healthy_packet => healthy_packet_L_2,
            Healthy => Healthy_L_2, Intermittent => Intermittent_L_2, Faulty => Faulty_L_2);
------------------------------------------------------------------------------------------------------------
CT_3_N: counter_threshold_classifier   generic map(counter_depth => 8, healthy_counter_threshold => 20, faulty_counter_threshold => 1)
    port map (  reset => reset, 
            clk => clk,
            faulty_packet => faulty_packet_N_3, Healthy_packet => healthy_packet_N_3,
            Healthy => Healthy_N_3, Intermittent => Intermittent_N_3, Faulty => Faulty_N_3);

 

CT_3_W: counter_threshold_classifier   generic map(counter_depth => 8, healthy_counter_threshold => 20, faulty_counter_threshold => 1)
    port map (  reset => reset, 
            clk => clk,
            faulty_packet => faulty_packet_W_3, Healthy_packet => healthy_packet_W_3,
            Healthy => Healthy_W_3, Intermittent => Intermittent_W_3, Faulty => Faulty_W_3);
    
 

CT_3_L: counter_threshold_classifier   generic map(counter_depth => 8, healthy_counter_threshold => 20, faulty_counter_threshold => 1)
    port map (  reset => reset, 
            clk => clk,
            faulty_packet => faulty_packet_L_3, Healthy_packet => healthy_packet_L_3,
            Healthy => Healthy_L_3, Intermittent => Intermittent_L_3, Faulty => Faulty_L_3);


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