--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity arbiter_out is
    port (
            reset: in  std_logic;
            clk: in  std_logic;
            X_N_Y, X_E_Y, X_W_Y, X_S_Y, X_L_Y :in std_logic; -- From LBDR modules
            credit: in std_logic_vector(1 downto 0);

            grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L : out std_logic; -- Grants given to LBDR requests (encoded as one-hot)

            -- Checker outputs
            err_Requests_state_in_state_not_equal,

            err_IDLE_req_X_N,
            err_North_req_X_N,
            err_North_credit_not_zero_req_X_N_grant_N,
            err_North_credit_zero_or_not_req_X_N_not_grant_N,
            err_East_req_X_E,
            err_East_credit_not_zero_req_X_E_grant_E,
            err_East_credit_zero_or_not_req_X_E_not_grant_E,
            err_West_req_X_W,
            err_West_credit_not_zero_req_X_E_grant_E,
            err_West_credit_zero_or_not_req_X_W_not_grant_W,
            err_South_req_X_S,
            err_South_credit_not_zero_req_X_S_grant_S,
            err_South_credit_zero_or_not_req_X_S_not_grant_S,
            err_Local_req_X_L,
            err_Local_credit_not_zero_req_X_L_grant_L,
            err_Local_credit_zero_or_not_req_X_L_not_grant_L,

            err_IDLE_req_X_E,
            err_North_req_X_E,
            err_East_req_X_W,
            err_West_req_X_S,
            err_South_req_X_L,
            err_Local_req_X_N,

            err_IDLE_req_X_W,
            err_North_req_X_W,
            err_East_req_X_S,
            err_West_req_X_L,
            err_South_req_X_N,
            err_Local_req_X_E,

            err_IDLE_req_X_S,
            err_North_req_X_S,
            err_East_req_X_L,
            err_West_req_X_N,
            err_South_req_X_E,
            err_Local_req_X_W,

            err_IDLE_req_X_L,
            err_North_req_X_L,
            err_East_req_X_N,
            err_West_req_X_E,
            err_South_req_X_W,
            err_Local_req_X_S,

            err_state_in_onehot,
            err_no_request_grants,
            err_request_IDLE_state,

            err_request_IDLE_not_Grants,
            err_state_North_Invalid_Grant,
            err_state_East_Invalid_Grant,
            err_state_West_Invalid_Grant,
            err_state_South_Invalid_Grant,
            err_state_Local_Invalid_Grant,
            err_Grants_onehot_or_all_zero : out std_logic
            );
end;

architecture behavior of arbiter_out is

component Arbiter_out_one_hot_pseudo_checkers is
    port (  credit: in std_logic_vector(1 downto 0);
            req_X_E, req_X_N, req_X_W, req_X_S, req_X_L :in std_logic; -- From LBDR modules
            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter_out's FSM

            grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L : in std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            state_in: in std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM

            -- Checker outputs
            err_Requests_state_in_state_not_equal,

            err_IDLE_req_X_N,
            err_North_req_X_N,
            err_North_credit_not_zero_req_X_N_grant_N,
            err_North_credit_zero_or_not_req_X_N_not_grant_N,
            err_East_req_X_E,
            err_East_credit_not_zero_req_X_E_grant_E,
            err_East_credit_zero_or_not_req_X_E_not_grant_E,
            err_West_req_X_W,
            err_West_credit_not_zero_req_X_E_grant_E,
            err_West_credit_zero_or_not_req_X_W_not_grant_W,
            err_South_req_X_S,
            err_South_credit_not_zero_req_X_S_grant_S,
            err_South_credit_zero_or_not_req_X_S_not_grant_S,
            err_Local_req_X_L,
            err_Local_credit_not_zero_req_X_L_grant_L,
            err_Local_credit_zero_or_not_req_X_L_not_grant_L,

            err_IDLE_req_X_E,
            err_North_req_X_E,
            err_East_req_X_W,
            err_West_req_X_S,
            err_South_req_X_L,
            err_Local_req_X_N,

            err_IDLE_req_X_W,
            err_North_req_X_W,
            err_East_req_X_S,
            err_West_req_X_L,
            err_South_req_X_N,
            err_Local_req_X_E,

            err_IDLE_req_X_S,
            err_North_req_X_S,
            err_East_req_X_L,
            err_West_req_X_N,
            err_South_req_X_E,
            err_Local_req_X_W,

            err_IDLE_req_X_L,
            err_North_req_X_L,
            err_East_req_X_N,
            err_West_req_X_E,
            err_South_req_X_W,
            err_Local_req_X_S,

            err_state_in_onehot,
            err_no_request_grants,
            err_request_IDLE_state,

            err_request_IDLE_not_Grants,
            err_state_North_Invalid_Grant,
            err_state_East_Invalid_Grant,
            err_state_West_Invalid_Grant,
            err_state_South_Invalid_Grant,
            err_state_Local_Invalid_Grant,
            err_Grants_onehot_or_all_zero : out std_logic
         );
end component;


  --TYPE STATE_TYPE IS (IDLE, North, East, West, South, Local);

  CONSTANT IDLE:  std_logic_vector (5 downto 0) := "000001";
  CONSTANT Local: std_logic_vector (5 downto 0) := "000010";
  CONSTANT North: std_logic_vector (5 downto 0) := "000100";
  CONSTANT East:  std_logic_vector (5 downto 0) := "001000";
  CONSTANT West:  std_logic_vector (5 downto 0) := "010000";
  CONSTANT South: std_logic_vector (5 downto 0) := "100000";

  SIGNAL state, state_in : std_logic_vector (5 downto 0) := IDLE; -- : STATE_TYPE := IDLE;
  SIGNAL grant_Y_N_sig, grant_Y_E_sig, grant_Y_W_sig, grant_Y_S_sig, grant_Y_L_sig : std_logic;

begin

-- We did this because of the checker outputs!

grant_Y_N <= grant_Y_N_sig;
grant_Y_E <= grant_Y_E_sig;
grant_Y_W <= grant_Y_W_sig;
grant_Y_S <= grant_Y_S_sig;
grant_Y_L <= grant_Y_L_sig;

-- Sequential part

process (clk, reset)begin
  if reset = '0' then
      state <= IDLE;
  elsif clk'event and clk ='1' then
      state <= state_in;
  end if;
end process;

-- Arbiter_out checkers module instantiation
CHECKERS: Arbiter_out_one_hot_pseudo_checkers
                                    port map (
                                                credit => credit,
                                                req_X_E  => X_N_Y,
                                                req_X_N  => X_E_Y,
                                                req_X_W  => X_W_Y,
                                                req_X_S  => X_S_Y,
                                                req_X_L  => X_L_Y,
                                                state    => state,

                                                grant_Y_N => grant_Y_N_sig,
                                                grant_Y_E => grant_Y_E_sig,
                                                grant_Y_W => grant_Y_W_sig,
                                                grant_Y_S => grant_Y_S_sig,
                                                grant_Y_L => grant_Y_L_sig,
                                                state_in  => state_in,

                                                -- Checker outputs
                                                err_Requests_state_in_state_not_equal => err_Requests_state_in_state_not_equal,

                                                err_IDLE_req_X_N => err_IDLE_req_X_N,
                                                err_North_req_X_N => err_North_req_X_N,
                                                err_North_credit_not_zero_req_X_N_grant_N => err_North_credit_not_zero_req_X_N_grant_N,
                                                err_North_credit_zero_or_not_req_X_N_not_grant_N => err_North_credit_zero_or_not_req_X_N_not_grant_N,
                                                err_East_req_X_E => err_East_req_X_E,
                                                err_East_credit_not_zero_req_X_E_grant_E => err_East_credit_not_zero_req_X_E_grant_E,
                                                err_East_credit_zero_or_not_req_X_E_not_grant_E => err_East_credit_zero_or_not_req_X_E_not_grant_E,
                                                err_West_req_X_W => err_West_req_X_W,
                                                err_West_credit_not_zero_req_X_E_grant_E => err_West_credit_not_zero_req_X_E_grant_E,
                                                err_West_credit_zero_or_not_req_X_W_not_grant_W => err_West_credit_zero_or_not_req_X_W_not_grant_W,
                                                err_South_req_X_S => err_South_req_X_S,
                                                err_South_credit_not_zero_req_X_S_grant_S => err_South_credit_not_zero_req_X_S_grant_S,
                                                err_South_credit_zero_or_not_req_X_S_not_grant_S => err_South_credit_zero_or_not_req_X_S_not_grant_S,
                                                err_Local_req_X_L => err_Local_req_X_L,
                                                err_Local_credit_not_zero_req_X_L_grant_L => err_Local_credit_not_zero_req_X_L_grant_L,
                                                err_Local_credit_zero_or_not_req_X_L_not_grant_L => err_Local_credit_zero_or_not_req_X_L_not_grant_L,

                                                err_IDLE_req_X_E => err_IDLE_req_X_E,
                                                err_North_req_X_E => err_North_req_X_E,
                                                err_East_req_X_W => err_East_req_X_W,
                                                err_West_req_X_S => err_West_req_X_S,
                                                err_South_req_X_L => err_South_req_X_L,
                                                err_Local_req_X_N => err_Local_req_X_N,

                                                err_IDLE_req_X_W => err_IDLE_req_X_W,
                                                err_North_req_X_W => err_North_req_X_W,
                                                err_East_req_X_S => err_East_req_X_S,
                                                err_West_req_X_L => err_West_req_X_L,
                                                err_South_req_X_N => err_South_req_X_N,
                                                err_Local_req_X_E => err_Local_req_X_E,

                                                err_IDLE_req_X_S => err_IDLE_req_X_S,
                                                err_North_req_X_S => err_North_req_X_S,
                                                err_East_req_X_L => err_East_req_X_L,
                                                err_West_req_X_N => err_West_req_X_N,
                                                err_South_req_X_E => err_South_req_X_E,
                                                err_Local_req_X_W => err_Local_req_X_W,

                                                err_IDLE_req_X_L => err_IDLE_req_X_L,
                                                err_North_req_X_L => err_North_req_X_L,
                                                err_East_req_X_N => err_East_req_X_N,
                                                err_West_req_X_E => err_West_req_X_E,
                                                err_South_req_X_W => err_South_req_X_W,
                                                err_Local_req_X_S => err_Local_req_X_S,

                                                err_state_in_onehot => err_state_in_onehot,
                                                err_no_request_grants => err_no_request_grants,
                                                err_request_IDLE_state => err_request_IDLE_state,

                                                err_request_IDLE_not_Grants => err_request_IDLE_not_Grants,
                                                err_state_North_Invalid_Grant => err_state_North_Invalid_Grant,
                                                err_state_East_Invalid_Grant => err_state_East_Invalid_Grant,
                                                err_state_West_Invalid_Grant => err_state_West_Invalid_Grant,
                                                err_state_South_Invalid_Grant => err_state_South_Invalid_Grant,
                                                err_state_Local_Invalid_Grant => err_state_Local_Invalid_Grant,
                                                err_Grants_onehot_or_all_zero => err_Grants_onehot_or_all_zero
                                            );


-- anything below here is pure combinational

process(state, X_N_Y, X_E_Y, X_W_Y, X_S_Y, X_L_Y, credit)
begin

    grant_Y_N_sig <= '0';
    grant_Y_E_sig <= '0';
    grant_Y_W_sig <= '0';
    grant_Y_S_sig <= '0';
    grant_Y_L_sig <= '0';

    case state is

      when IDLE =>
          if X_N_Y ='1'  then
              state_in <= North;
          elsif X_E_Y = '1' then
              state_in <= East;
          elsif X_W_Y = '1' then
              state_in <= West;
          elsif X_S_Y = '1' then
              state_in <= South;
          elsif X_L_Y = '1' then
              state_in <= Local;
          else
              state_in <= IDLE;
          end if;

      when North =>
          if credit /= "00" and X_N_Y = '1' then
            grant_Y_N_sig <= '1';
          end if;
          if X_N_Y ='1'  then
              state_in <= North;
          elsif X_E_Y = '1' then
              state_in <= East;
          elsif X_W_Y = '1' then
              state_in <= West;
          elsif X_S_Y = '1' then
              state_in <= South;
          elsif X_L_Y = '1' then
              state_in <= Local;
          else
              state_in <= IDLE;
          end if;

      when East =>
          if credit /= "00" and X_E_Y = '1' then
            grant_Y_E_sig <= '1';
          end if;
          if X_E_Y = '1' then
              state_in <= East;
          elsif X_W_Y = '1' then
              state_in <= West;
          elsif X_S_Y = '1' then
              state_in <= South;
          elsif X_L_Y = '1' then
              state_in <= Local;
          elsif X_N_Y ='1'  then
              state_in <= North;
          else
              state_in <= IDLE;
          end if;

      when West =>
          if credit /= "00" and X_W_Y = '1' then
            grant_Y_W_sig <= '1';
          end if;
          if X_W_Y = '1' then
              state_in <= West;
          elsif X_S_Y = '1' then
              state_in <= South;
          elsif X_L_Y = '1' then
              state_in <= Local;
          elsif X_N_Y ='1'  then
              state_in <= North;
          elsif X_E_Y = '1' then
              state_in <= East;
          else
              state_in <= IDLE;
          end if;

      when South =>
          if credit /= "00" and X_S_Y = '1' then
            grant_Y_S_sig <= '1';
          end if;
          if X_S_Y = '1' then
              state_in <= South;
          elsif X_L_Y = '1' then
              state_in <= Local;
          elsif X_N_Y ='1'  then
              state_in <= North;
          elsif X_E_Y = '1' then
              state_in <= East;
          elsif X_W_Y = '1' then
              state_in <= West;
          else
              state_in <= IDLE;
          end if;

      when others =>
          if credit /= "00" and X_L_Y = '1' then
            grant_Y_L_sig <= '1';
          end if;
          if X_L_Y = '1' then
              state_in <= Local;
          elsif X_N_Y ='1'  then
              state_in <= North;
          elsif X_E_Y = '1' then
              state_in <= East;
          elsif X_W_Y = '1' then
              state_in <= West;
          elsif X_S_Y = '1' then
              state_in <= South;
          else
              state_in <= IDLE;
          end if;

    end case;

end process;
end;
