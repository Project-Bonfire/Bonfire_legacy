--Copyright (C) 2016 Siavoosh Payandeh Azad, Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity counter_threshold_classifier is
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
end counter_threshold_classifier;

architecture behavior of counter_threshold_classifier is
 signal faulty_counter_in, faulty_counter_out: std_logic_vector(counter_depth-1 downto 0);
 signal healthy_counter_in, healthy_counter_out: std_logic_vector(counter_depth-1 downto 0);
 signal NET: std_logic; --no error threshold
 signal DET: std_logic; --detected error threshold
 signal reset_counters: std_logic;

 TYPE STATE_TYPE IS (Healthy_state, Intermittent_state, Faulty_state);
SIGNAL state, next_state   : STATE_TYPE := Healthy_state;

begin 


 process(clk, reset)begin
  if reset = '0' then
    faulty_counter_out <=  (others => '0');
    healthy_counter_out <=  (others => '0');
    state <= Healthy_state;
  elsif clk'event and clk = '1' then 
    faulty_counter_out <= faulty_counter_in;
    healthy_counter_out <= healthy_counter_in;
    state <= next_state;
  end if;
 end process;


process(faulty_packet, reset_counters, faulty_counter_out)begin
  if reset_counters  = '1' then 
      faulty_counter_in <=  (others => '0');
  elsif faulty_packet = '1' then 
      faulty_counter_in <= faulty_counter_out + 1;
  else
      faulty_counter_in <= faulty_counter_out;
  end if;
end process;


process(Healthy_packet, reset_counters, healthy_counter_out)begin
  if reset_counters  = '1' then 
      healthy_counter_in <=  (others => '0');
  elsif Healthy_packet = '1' then 
      healthy_counter_in <= healthy_counter_out + 1;
  else
      healthy_counter_in <= healthy_counter_out;
  end if;
 
end process;

process(healthy_counter_out, faulty_counter_out) begin
  reset_counters <= '0';
  DET <= '0';
  NET <= '0';
  
  if healthy_counter_out = std_logic_vector(to_unsigned(healthy_counter_threshold, healthy_counter_out'length)) then 
      NET <= '1';
      reset_counters <= '1';
  end if;

 if faulty_counter_out = std_logic_vector(to_unsigned(faulty_counter_threshold, faulty_counter_out'length)) then 
      DET <= '1';
      reset_counters <= '1';
  end if;
end process;  


process (NET, DET, state)begin
  Healthy <= '0'; 
  Intermittent <= '0'; 
  Faulty <= '0';
  case state is 
      when Healthy_state => 
            if NET = '1' then 
              next_state <= Healthy_state;
            elsif DET = '1' then
              next_state <= Intermittent_state;
              Intermittent <= '1'; 
            else
              next_state <= Healthy_state;
            end if;
      when Intermittent_state => 
            if NET = '1' then 
              next_state <= Healthy_state;
              Healthy <= '1'; 
            elsif DET = '1' then
              next_state <= Faulty_state;
              Faulty <= '1';
            else
              next_state <= Intermittent_state; 
            end if;
      when Faulty_state => 
            next_state <= Faulty_state;
      when others => 
            next_state <= Healthy_state;
            Healthy <= '1'; 
  end case;

end process;

END;