--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arbiter_out is
    port (  
            X_N_Y, X_E_Y, X_W_Y, X_S_Y, X_L_Y:in std_logic; -- From LBDR modules
            credit: in std_logic_vector(1 downto 0);
            grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L :out std_logic -- Grants given to LBDR requests (encoded as one-hot)
            );
end;

architecture behavior of arbiter_in is

begin

-- anything below here is pure combinational

process(X_N_Y, X_E_Y, X_W_Y, X_S_Y, X_L_Y, credit)begin
    grant_Y_N <= '0';
    grant_Y_E <= '0';
    grant_Y_W <= '0';
    grant_Y_S <= '0';
    grant_Y_L <= '0';
    if credit > 0 then
        if X_N_Y ='1' and  then
              grant_Y_N <= '1';
        elsif X_E_Y = '1' then
              grant_Y_E <= '1';
        elsif X_W_Y = '1' then
              grant_Y_W <= '1';
        elsif X_S_Y = '1' then
              grant_Y_S <= '1';
        elsif X_L_Y = '1' then
              grant_Y_L <= '1';
        end if;
    end if;
end process;
end;
