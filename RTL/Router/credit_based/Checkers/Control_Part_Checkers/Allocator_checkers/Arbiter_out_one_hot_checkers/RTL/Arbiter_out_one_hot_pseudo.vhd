--Copyright (C) 2016 Siavoosh Payandeh Azad and Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;

entity Arbiter_out_one_hot_pseudo is
    port (  credit: in std_logic_vector(1 downto 0);
            req_X_N, req_X_E, req_X_W, req_X_S, req_X_L :in std_logic; -- From LBDR modules
            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter_out's FSM

            grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L : out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            state_in: out std_logic_vector (5 downto 0) -- 6 states for Arbiter's FSM
         );
end Arbiter_out_one_hot_pseudo;

architecture behavior of Arbiter_out_one_hot_pseudo is

 CONSTANT IDLE: std_logic_vector (5 downto 0) := "000001";
 CONSTANT Local: std_logic_vector (5 downto 0) := "000010";
 CONSTANT North: std_logic_vector (5 downto 0) := "000100";
 CONSTANT East: std_logic_vector (5 downto 0) := "001000";
 CONSTANT West: std_logic_vector (5 downto 0) := "010000";
 CONSTANT South: std_logic_vector (5 downto 0) := "100000";

begin

--process (clk, reset)begin
--  if reset = '0' then
--      state <= IDLE;
--  elsif clk'event and clk ='1'then
--      state <= state_in;
--  end if;
--end process;

-- anything below here is pure combinational

process(state, req_X_N, req_X_E, req_X_W, req_X_S, req_X_L, credit)
begin

    grant_Y_N <= '0';
    grant_Y_E <= '0';
    grant_Y_W <= '0';
    grant_Y_S <= '0';
    grant_Y_L <= '0';

    -- Arbiter_out's prioritization is N,E,W,S and L (N: highest priority)
    case state is

      when IDLE =>
          if req_X_N ='1'  then
              state_in <= North;
          elsif req_X_E = '1' then
              state_in <= East;
          elsif req_X_W = '1' then
              state_in <= West;
          elsif req_X_S = '1' then
              state_in <= South;
          elsif req_X_L = '1' then
              state_in <= Local;
          else
              state_in <= IDLE;
          end if;

      when North =>
          if credit /= "00" and req_X_N = '1' then
            grant_Y_N <= '1';
          end if;
          if req_X_N ='1'  then
              state_in <= North;
          elsif req_X_E = '1' then
              state_in <= East;
          elsif req_X_W = '1' then
              state_in <= West;
          elsif req_X_S = '1' then
              state_in <= South;
          elsif req_X_L = '1' then
              state_in <= Local;
          else
              state_in <= IDLE;
          end if;

      when East =>
          if credit /= "00" and req_X_E = '1' then
            grant_Y_E <= '1';
          end if;
          if req_X_E = '1' then
              state_in <= East;
          elsif req_X_W = '1' then
              state_in <= West;
          elsif req_X_S = '1' then
              state_in <= South;
          elsif req_X_L = '1' then
              state_in <= Local;
          elsif req_X_N ='1'  then
              state_in <= North;
          else
              state_in <= IDLE;
          end if;

      when West =>
          if credit /= "00" and req_X_W = '1' then
            grant_Y_W <= '1';
          end if;
          if req_X_W = '1' then
              state_in <= West;
          elsif req_X_S = '1' then
              state_in <= South;
          elsif req_X_L = '1' then
              state_in <= Local;
          elsif req_X_N ='1'  then
              state_in <= North;
          elsif req_X_E = '1' then
              state_in <= East;
          else
              state_in <= IDLE;
          end if;

      when South =>
          if credit /= "00" and req_X_S = '1' then
            grant_Y_S <= '1';
          end if;
          if req_X_S = '1' then
              state_in <= South;
          elsif req_X_L = '1' then
              state_in <= Local;
          elsif req_X_N ='1'  then
              state_in <= North;
          elsif req_X_E = '1' then
              state_in <= East;
          elsif req_X_W = '1' then
              state_in <= West;
          else
              state_in <= IDLE;
          end if;

      when others => -- Includes Local state and invalid state(s)
          if credit /= "00" and req_X_L = '1' then
            grant_Y_L <= '1';
          end if;
          if req_X_L = '1' then
              state_in <= Local;
          elsif req_X_N ='1'  then
              state_in <= North;
          elsif req_X_E = '1' then
              state_in <= East;
          elsif req_X_W = '1' then
              state_in <= West;
          elsif req_X_S = '1' then
              state_in <= South;
          else
              state_in <= IDLE;
          end if;

    end case;

end process;

end;
