--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity allocator_credit_counter_logic_pseudo is           
    port (  
            -- flow control
            credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L: in std_logic;
            credit_counter_N_out, credit_counter_E_out, credit_counter_W_out, credit_counter_S_out, credit_counter_L_out : in std_logic_vector(1 downto 0);            
            grant_N, grant_E, grant_W, grant_S, grant_L: in std_logic;

            credit_counter_N_in, credit_counter_E_in, credit_counter_W_in, credit_counter_S_in, credit_counter_L_in : out std_logic_vector(1 downto 0)
            );
end allocator_credit_counter_logic_pseudo;

architecture behavior of allocator_credit_counter_logic_pseudo is

begin 

-- The combionational part

-- this process handels the credit counters!
process(credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L, grant_N, grant_E, grant_W, grant_S, grant_L,
		credit_counter_N_out, credit_counter_E_out, credit_counter_W_out, credit_counter_S_out, credit_counter_L_out)

 begin
 	credit_counter_N_in <= credit_counter_N_out;
 	credit_counter_E_in <= credit_counter_E_out;
 	credit_counter_W_in <= credit_counter_W_out;
 	credit_counter_S_in <= credit_counter_S_out;
 	credit_counter_L_in <= credit_counter_L_out;

 	if credit_in_N = '1' and grant_N = '1' then 
       credit_counter_N_in <= credit_counter_N_out; 
  elsif credit_in_N = '1'  and credit_counter_N_out < 3 then 
 		   credit_counter_N_in <= credit_counter_N_out + 1;
 	elsif grant_N = '1' and credit_counter_N_out > 0 then
 		   credit_counter_N_in <= credit_counter_N_out - 1;
 	end if;
 	

  if credit_in_E = '1' and grant_E = '1' then 
       credit_counter_E_in <= credit_counter_E_out; 
 	elsif credit_in_E = '1' and credit_counter_E_out < 3 then 
 		credit_counter_E_in <= credit_counter_E_out + 1;
 	elsif grant_E = '1' and credit_counter_E_out > 0 then
 		credit_counter_E_in <= credit_counter_E_out - 1;
 	end if;

 	if credit_in_W = '1' and grant_W = '1' then 
       credit_counter_W_in <= credit_counter_W_out; 
  elsif credit_in_W = '1' and credit_counter_W_out < 3 then 
    credit_counter_W_in <= credit_counter_W_out + 1;
  elsif grant_W = '1' and credit_counter_W_out > 0 then
    credit_counter_W_in <= credit_counter_W_out - 1;
  end if;

 	if credit_in_S = '1' and grant_S = '1' then 
       credit_counter_S_in <= credit_counter_S_out; 
  elsif credit_in_S = '1' and credit_counter_S_out < 3 then 
    credit_counter_S_in <= credit_counter_S_out + 1;
  elsif grant_S = '1' and credit_counter_S_out > 0 then
    credit_counter_S_in <= credit_counter_S_out - 1;
  end if;

 	
 	if credit_in_L = '1' and grant_L = '1' then 
       credit_counter_L_in <= credit_counter_L_out; 
  elsif credit_in_L = '1' and credit_counter_L_out < 3 then 
    credit_counter_L_in <= credit_counter_L_out + 1;
  elsif grant_L = '1' and credit_counter_L_out > 0 then
    credit_counter_L_in <= credit_counter_L_out - 1;
  end if;

 end process; 

END;





