--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use work.component_pack.all;

entity arbiter_out is
    port (  
            reset: in  std_logic;
            clk: in  std_logic;
            X_N_Y, X_E_Y, X_W_Y, X_S_Y, X_L_Y :in std_logic; -- From LBDR modules
            credit: in std_logic_vector(1 downto 0);

            grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L : out std_logic; -- Grants given to LBDR requests (encoded as one-hot)

            -- fault injector shift register with serial input signals
            TCK: in std_logic;  
            SE: in std_logic;       -- shift enable 
            UE: in std_logic;       -- update enable
            SI: in std_logic;       -- serial Input
            SO: out std_logic;      -- serial output

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
            err_West_credit_not_zero_req_X_W_grant_W, 
            err_West_credit_zero_or_not_req_X_W_not_grant_W, 
            err_South_req_X_S, 
            err_South_credit_not_zero_req_X_S_grant_S, 
            err_South_credit_zero_or_not_req_X_S_not_grant_S, 
            err_Local_req_X_L, 
            err_Local_credit_not_zero_req_X_L_grant_L, 
            err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

            err_IDLE_req_X_E, err_North_req_X_E, err_East_req_X_W, err_West_req_X_S, err_South_req_X_L, err_Local_req_X_N, 
            err_IDLE_req_X_W, err_North_req_X_W, err_East_req_X_S, err_West_req_X_L, err_South_req_X_N, err_Local_req_X_E, 
            err_IDLE_req_X_S, err_North_req_X_S, err_East_req_X_L, err_West_req_X_N, err_South_req_X_E, err_Local_req_X_W, 
            err_IDLE_req_X_L, err_North_req_X_L, err_East_req_X_N, err_West_req_X_E, err_South_req_X_W, err_Local_req_X_S, 
       
            err_state_in_onehot, err_no_request_grants, err_request_IDLE_state, 

            err_request_IDLE_not_Grants, err_state_North_Invalid_Grant, err_state_East_Invalid_Grant, 
            err_state_West_Invalid_Grant, err_state_South_Invalid_Grant, err_state_Local_Invalid_Grant, 
            err_Grants_onehot_or_all_zero : out std_logic             
            );
end;

architecture behavior of arbiter_out is

 ----------------------------------------
 -- Signals related to fault injection --
 ----------------------------------------
 
 -- Total: 7 bits
 signal FI_add_sta: std_logic_vector (6 downto 0); -- 5 bits for fault injection location address (ceil of log2(17) = 5)
                                                   -- 2 bits for type of fault (SA0 or SA1)
 signal non_faulty_signals: std_logic_vector (16 downto 0); -- 17 bits for internal- and output-related signals (non-faulty)                                          
 signal faulty_signals: std_logic_vector(16 downto 0); -- 17 bits for internal- and output-related signals (with single stuck-at fault injected in one of them)
 
 ----------------------------------------
 ----------------------------------------


  --TYPE STATE_TYPE IS (IDLE, North, East, West, South, Local);
  

  SIGNAL state, state_in : std_logic_vector (5 downto 0) := IDLE; -- : STATE_TYPE := IDLE;
  
  SIGNAL grant_Y_N_sig, grant_Y_E_sig, grant_Y_W_sig, grant_Y_S_sig, grant_Y_L_sig : std_logic; -- needed for connecting output ports 
                                                                                                -- of Arbiter_out to checker inputs

   -- Signal(s) used for creating the chain of injected fault locations
   -- Total: 17 bits ??!!
   -- Arbiter_out internal-related signals
  signal state_faulty, state_in_faulty:  std_logic_vector(5 downto 0);

   -- Arbiter_out output-related signals
  signal grant_Y_N_sig_faulty, grant_Y_E_sig_faulty, grant_Y_W_sig_faulty, grant_Y_S_sig_faulty, grant_Y_L_sig_faulty: std_logic;


begin

-------------------------------------      
---- Related to fault injection -----
-------------------------------------      

-- Total: 17 bits
-- for grant_Y_N, ... , grant_Y_L output signals, not sure whether to include them or the signals with _sig suffix in their names ??!!
non_faulty_signals <= state & state_in & grant_Y_N_sig & grant_Y_E_sig & grant_Y_W_sig & grant_Y_S_sig & grant_Y_L_sig;

-- Fault injector module instantiation
FI: fault_injector generic map(DATA_WIDTH => 17, ADDRESS_WIDTH => 5) 
           port map (data_in=> non_faulty_signals , address => FI_add_sta(6 downto 2), sta_0=> FI_add_sta(1), sta_1=> FI_add_sta(0), data_out=> faulty_signals
            );

-- Extracting faulty values for internal- and output-related signals
-- Total: 17 bits

state_faulty            <= faulty_signals (16 downto 11);
state_in_faulty         <= faulty_signals (10 downto 5);
grant_Y_N_sig_faulty    <= faulty_signals (4);
grant_Y_E_sig_faulty    <= faulty_signals (3);
grant_Y_W_sig_faulty    <= faulty_signals (2);
grant_Y_S_sig_faulty    <= faulty_signals (1);
grant_Y_L_sig_faulty    <= faulty_signals (0);


-- Total: 7 bits
SR: shift_register_serial_in generic map(REG_WIDTH => 7)
          port map ( TCK=> TCK, reset=>reset, SE=> SE, UE=> UE, SI=> SI, SO=> SO, data_out_parallel=> FI_add_sta
                   );

-------------------------------------      
-------------------------------------      

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
ARBITER_OUT_ONE_HOT_CHECKERS: Arbiter_out_one_hot_pseudo_checkers 
                                                  port map (
                                                              credit => credit, 
                                                              req_X_N  => X_N_Y, 
                                                              req_X_E  => X_E_Y, 
                                                              req_X_W  => X_W_Y, 
                                                              req_X_S  => X_S_Y, 
                                                              req_X_L  => X_L_Y,
                                                              state    => state_faulty,
                                                                          
                                                              grant_Y_N => grant_Y_N_sig_faulty, 
                                                              grant_Y_E => grant_Y_E_sig_faulty, 
                                                              grant_Y_W => grant_Y_W_sig_faulty, 
                                                              grant_Y_S => grant_Y_S_sig_faulty, 
                                                              grant_Y_L => grant_Y_L_sig_faulty, 
                                                              state_in  => state_in_faulty, 

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
                                                              err_West_credit_not_zero_req_X_W_grant_W => err_West_credit_not_zero_req_X_W_grant_W, 
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
