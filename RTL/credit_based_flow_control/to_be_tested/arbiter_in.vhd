--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;


entity arbiter_in is
    port (   
            Req_X_N, Req_X_E, Req_X_W, Req_X_S, Req_X_L:in std_logic; -- From LBDR modules
            X_N, X_E, X_W, X_S, X_L:out std_logic -- Grants given to LBDR requests (encoded as one-hot)
            );
end;

architecture behavior of arbiter_in is

begin

-- anything below here is pure combinational

process(req_X_N, req_X_E, req_X_W, req_X_S, req_X_L)
begin
    X_N <= '0';
    X_E <= '0';
    X_W <= '0';
    X_S <= '0';
    X_L <= '0';
    if req_X_N ='1'  then
        X_N <= '1';
    elsif req_X_E = '1' then
        X_E <= '1';
    elsif req_X_W = '1' then
        X_W <= '1';
    elsif req_X_S = '1' then
        X_S <= '1';
    elsif req_X_L = '1' then
        X_L <= '1';
    end if;
end process;
end;
