--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity arbiter_out_LV is
    port (
            reset: in  std_logic;
            clk: in  std_logic;
            X_E_Y, X_W_Y, X_L_Y :in std_logic; -- From LBDR modules
            credit: in std_logic;
            grant_Y_E, grant_Y_W, grant_Y_L : out std_logic -- Grants given to LBDR requests (encoded as one-hot)
            );
end;

architecture behavior of arbiter_out_LV is
  TYPE STATE_TYPE IS (IDLE, East, West, Local);
  SIGNAL state, state_in   : STATE_TYPE := IDLE;

begin
process (clk, reset)begin
  if reset = '0' then
      state <= IDLE;
  elsif clk'event and clk ='1'then
      state <= state_in;
  end if;
end process;

-- anything below here is pure combinational
process(state, X_E_Y, X_W_Y, X_L_Y, credit) begin
    grant_Y_E <= '0';
    grant_Y_W <= '0';
    grant_Y_L <= '0';
    case state is
      when IDLE =>
          if X_E_Y = '1' then
              state_in <= East;
          elsif X_W_Y = '1' then
              state_in <= West;
          elsif X_L_Y = '1' then
              state_in <= Local;
          else
              state_in <= IDLE;
          end if;
      when East =>
          if credit = '1' then
            grant_Y_E <= '1';
          end if;
          if X_E_Y = '1' then
              state_in <= East;
          elsif X_W_Y = '1' then
              state_in <= West;
          elsif X_L_Y = '1' then
              state_in <= Local;
          else
              state_in <= IDLE;
          end if;
      when West =>
          if credit = '1' then
            grant_Y_W <= '1';
          end if;
          if X_W_Y = '1' then
              state_in <= West;
          elsif X_L_Y = '1' then
              state_in <= Local;
          elsif X_E_Y = '1' then
              state_in <= East;
          else
              state_in <= IDLE;
          end if;
      when others =>
          if credit = '1' then
            grant_Y_L <= '1';
          end if;
          if X_L_Y = '1' then
              state_in <= Local;
          elsif X_E_Y = '1' then
              state_in <= East;
          elsif X_W_Y = '1' then
              state_in <= West;
          else
              state_in <= IDLE;
          end if;
    end case;

end process;
end;
