--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity deroute_logic is
    port (  
            LBDR_Req_N, LBDR_Req_E, LBDR_Req_W, LBDR_Req_S, LBDR_Req_L: in std_logic;
            deroute: in std_logic_vector (1 downto 0);
            flit_type: in std_logic_vector (2 downto 0);
            empty: in std_logic;

            Req_N, Req_E, Req_W, Req_S: out std_logic
         );
end deroute_logic;

architecture behavior of deroute_logic is

  signal enable: std_logic; -- Used for deroute, it gets activated when all LBDR output signals are zero
begin 

-- The combionational part

process (LBDR_Req_N, LBDR_Req_E, LBDR_Req_W, LBDR_Req_S) begin
    if LBDR_Req_N = '0' and LBDR_Req_E = '0' and LBDR_Req_W = '0' and LBDR_Req_S = '0' and LBDR_Req_L = '0' and empty = '0' and flit_type = "001" then
        enable <= '1';
    else 
        enable <= '0';
    end if;
end process;

-- Process for enable signal
process (enable, LBDR_Req_N, LBDR_Req_E, LBDR_Req_W, LBDR_Req_S, deroute) begin
    -- No deroute needed, use LBDR's output signal values (No fault)
    if enable = '0' then
        Req_N <= LBDR_Req_N;     
        Req_E <= LBDR_Req_E;     
        Req_W <= LBDR_Req_W;     
        Req_S <= LBDR_Req_S;

    -- deroute needed (there is a fault)
    else    
        if deroute = "00" then -- deroute to North (the values for deroute register should be set offline beforehand)
            Req_N <= '1';
            Req_E <= '0';
            Req_W <= '0';
            Req_S <= '0';

        elsif deroute = "01" then -- deroute to East
            Req_N <= '0';
            Req_E <= '1';
            Req_W <= '0';
            Req_S <= '0';

        elsif deroute = "10" then -- deroute to West
            Req_N <= '0';
            Req_E <= '0';
            Req_W <= '1';
            Req_S <= '0';

        else  -- If deroute = "11" -- deroute to South
            Req_N <= '0';
            Req_E <= '0';
            Req_W <= '0';
            Req_S <= '1';

        end if;

    end if;
         
end process;


   
END;