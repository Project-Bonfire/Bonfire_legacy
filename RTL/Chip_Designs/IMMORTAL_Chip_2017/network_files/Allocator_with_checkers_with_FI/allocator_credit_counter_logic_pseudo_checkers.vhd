--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity allocator_credit_counter_logic_pseudo_checkers is
    port (
            -- flow control
            credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L: in std_logic;
            credit_counter_N_out, credit_counter_E_out, credit_counter_W_out, credit_counter_S_out, credit_counter_L_out : in std_logic_vector(1 downto 0);
            valid_N, valid_E, valid_W, valid_S, valid_L: in std_logic; -- ?? Not sure yet ! grant or valid !

            credit_counter_N_in, credit_counter_E_in, credit_counter_W_in, credit_counter_S_in, credit_counter_L_in : in std_logic_vector(1 downto 0);

            -- Checker outputs
            err_credit_in_N_grant_N_credit_counter_N_in_credit_counter_N_out_equal,
            err_credit_in_N_credit_counter_N_out_increment,
            err_not_credit_in_N_credit_counter_N_out_max_credit_counter_N_in_not_change,
            err_grant_N_credit_counter_N_out_decrement,
            err_not_grant_N_or_credit_counter_N_out_zero_credit_counter_N_in_not_change,
            err_not_credit_in_N_not_grant_N_credit_counter_N_in_credit_counter_N_out_equal,

            err_credit_in_E_grant_E_credit_counter_E_in_credit_counter_E_out_equal,
            err_credit_in_E_credit_counter_E_out_increment,
            err_not_credit_in_E_credit_counter_E_out_max_credit_counter_E_in_not_change,
            err_grant_E_credit_counter_E_out_decrement,
            err_not_grant_E_or_credit_counter_E_out_zero_credit_counter_E_in_not_change,
            err_not_credit_in_E_not_grant_E_credit_counter_E_in_credit_counter_E_out_equal,

            err_credit_in_W_grant_W_credit_counter_W_in_credit_counter_W_out_equal,
            err_credit_in_W_credit_counter_W_out_increment,
            err_not_credit_in_W_credit_counter_W_out_max_credit_counter_W_in_not_change,
            err_grant_W_credit_counter_W_out_decrement,
            err_not_grant_W_or_credit_counter_W_out_zero_credit_counter_W_in_not_change,
            err_not_credit_in_W_not_grant_W_credit_counter_W_in_credit_counter_W_out_equal,

            err_credit_in_S_grant_S_credit_counter_S_in_credit_counter_S_out_equal,
            err_credit_in_S_credit_counter_S_out_increment,
            err_not_credit_in_S_credit_counter_S_out_max_credit_counter_S_in_not_change,
            err_grant_S_credit_counter_S_out_decrement,
            err_not_grant_S_or_credit_counter_S_out_zero_credit_counter_S_in_not_change,
            err_not_credit_in_S_not_grant_S_credit_counter_S_in_credit_counter_S_out_equal,

            err_credit_in_L_grant_L_credit_counter_L_in_credit_counter_L_out_equal,
            err_credit_in_L_credit_counter_L_out_increment,
            err_not_credit_in_L_credit_counter_L_out_max_credit_counter_L_in_not_change,
            err_grant_L_credit_counter_L_out_decrement,
            err_not_grant_L_or_credit_counter_L_out_zero_credit_counter_L_in_not_change,
            err_not_credit_in_L_not_grant_L_credit_counter_L_in_credit_counter_L_out_equal : out std_logic
         );
end allocator_credit_counter_logic_pseudo_checkers;

architecture behavior of allocator_credit_counter_logic_pseudo_checkers is

begin

-- The combionational part

----------------------------------------------------------------
-- Checkers for the process handling the credit counters

-- North credit counter

process (credit_in_N, valid_N, credit_counter_N_in, credit_counter_N_out)
begin
  err_credit_in_N_grant_N_credit_counter_N_in_credit_counter_N_out_equal <= '0';
  if (credit_in_N = '1' and valid_N = '1' and credit_counter_N_in /= credit_counter_N_out) then
      err_credit_in_N_grant_N_credit_counter_N_in_credit_counter_N_out_equal <= '1';
  end if;
end process;

process (credit_in_N, valid_N, credit_counter_N_in, credit_counter_N_out)
begin
  err_credit_in_N_credit_counter_N_out_increment <= '0';
  if (credit_in_N = '1' and valid_N = '0' and credit_counter_N_out < 3 and credit_counter_N_in /= credit_counter_N_out + 1) then
      err_credit_in_N_credit_counter_N_out_increment <= '1';
  end if;
end process;

process (credit_in_N, valid_N, credit_counter_N_in, credit_counter_N_out)
begin
  err_not_credit_in_N_credit_counter_N_out_max_credit_counter_N_in_not_change <= '0';
  if (credit_in_N = '1' and valid_N = '0' and credit_counter_N_out = 3 and credit_counter_N_in /= credit_counter_N_out) then
      err_not_credit_in_N_credit_counter_N_out_max_credit_counter_N_in_not_change <= '1';
  end if;
end process;

process (valid_N, credit_in_N, credit_counter_N_in, credit_counter_N_out)
begin
  err_grant_N_credit_counter_N_out_decrement <= '0';
  if (valid_N = '1' and credit_in_N = '0' and credit_counter_N_out > 0 and credit_counter_N_in /= credit_counter_N_out - 1) then
      err_grant_N_credit_counter_N_out_decrement <= '1';
  end if;
end process;

process (valid_N, credit_in_N, credit_counter_N_in, credit_counter_N_out)
begin
  err_not_grant_N_or_credit_counter_N_out_zero_credit_counter_N_in_not_change <= '0';
  if (valid_N = '1' and credit_in_N = '0' and credit_counter_N_out = 0 and credit_counter_N_in /= credit_counter_N_out) then
      err_not_grant_N_or_credit_counter_N_out_zero_credit_counter_N_in_not_change <= '1';
  end if;
end process;

process (credit_in_N, valid_N, credit_counter_N_in, credit_counter_N_out)
begin
  err_not_credit_in_N_not_grant_N_credit_counter_N_in_credit_counter_N_out_equal <= '0';
  if (credit_in_N = '0' and valid_N = '0' and credit_counter_N_in /= credit_counter_N_out) then
      err_not_credit_in_N_not_grant_N_credit_counter_N_in_credit_counter_N_out_equal <= '1';
  end if;
end process;

-- East credit counter

process (credit_in_E, valid_E, credit_counter_E_in, credit_counter_E_out)
begin
  err_credit_in_E_grant_E_credit_counter_E_in_credit_counter_E_out_equal <= '0';
  if (credit_in_E = '1' and valid_E = '1' and credit_counter_E_in /= credit_counter_E_out) then
    err_credit_in_E_grant_E_credit_counter_E_in_credit_counter_E_out_equal <= '1';
  end if;
end process;

process (credit_in_E, valid_E, credit_counter_E_in, credit_counter_E_out)
begin
  err_credit_in_E_credit_counter_E_out_increment <= '0';
  if (credit_in_E = '1' and valid_E = '0' and credit_counter_E_out < 3 and credit_counter_E_in /= credit_counter_E_out + 1) then
    err_credit_in_E_credit_counter_E_out_increment <= '1';
  end if;
end process;

process (credit_in_E, valid_E, credit_counter_E_in, credit_counter_E_out)
begin
  err_not_credit_in_E_credit_counter_E_out_max_credit_counter_E_in_not_change <= '0';
  if (credit_in_E = '1' and valid_E = '0' and  credit_counter_E_out = 3 and credit_counter_E_in /= credit_counter_E_out) then
    err_not_credit_in_E_credit_counter_E_out_max_credit_counter_E_in_not_change <= '1';
  end if;
end process;

process (valid_E, credit_in_E, credit_counter_E_in, credit_counter_E_out)
begin
  err_grant_E_credit_counter_E_out_decrement <= '0';
  if (valid_E = '1' and credit_in_E = '0' and credit_counter_E_out > 0 and credit_counter_E_in /= credit_counter_E_out - 1) then
    err_grant_E_credit_counter_E_out_decrement <= '1';
  end if;
end process;

process (valid_E, credit_in_E, credit_counter_E_in, credit_counter_E_out)
begin
  err_not_grant_E_or_credit_counter_E_out_zero_credit_counter_E_in_not_change <= '0';
  if (valid_E = '1' and credit_in_E = '0' and credit_counter_E_out = 0 and credit_counter_E_in /= credit_counter_E_out) then
      err_not_grant_E_or_credit_counter_E_out_zero_credit_counter_E_in_not_change <= '1';
  end if;
end process;

process (credit_in_E, valid_E, credit_counter_E_in, credit_counter_E_out)
begin
  err_not_credit_in_E_not_grant_E_credit_counter_E_in_credit_counter_E_out_equal <= '0';
  if (credit_in_E = '0' and valid_E = '0' and credit_counter_E_in /= credit_counter_E_out) then
      err_not_credit_in_E_not_grant_E_credit_counter_E_in_credit_counter_E_out_equal <= '1';
  end if;
end process;

-- West credit counter

process (credit_in_W, valid_W, credit_counter_W_in, credit_counter_W_out)
begin
  err_credit_in_W_grant_W_credit_counter_W_in_credit_counter_W_out_equal <= '0';
  if (credit_in_W = '1' and valid_W = '1' and credit_counter_W_in /= credit_counter_W_out) then
      err_credit_in_W_grant_W_credit_counter_W_in_credit_counter_W_out_equal <= '1';
  end if;
end process;

process (credit_in_W, valid_W, credit_counter_W_in, credit_counter_W_out)
begin
  err_credit_in_W_credit_counter_W_out_increment <= '0';
  if (credit_in_W = '1' and valid_W = '0' and credit_counter_W_out < 3 and credit_counter_W_in /= credit_counter_W_out + 1) then
      err_credit_in_W_credit_counter_W_out_increment <= '1';
  end if;
end process;

process (credit_in_W, valid_W, credit_counter_W_in, credit_counter_W_out)
begin
  err_not_credit_in_W_credit_counter_W_out_max_credit_counter_W_in_not_change <= '0';
  if ( (credit_in_W = '1' and valid_W = '0' and credit_counter_W_out = 3) and credit_counter_W_in /= credit_counter_W_out) then
      err_not_credit_in_W_credit_counter_W_out_max_credit_counter_W_in_not_change <= '1';
  end if;
end process;

process (valid_W, credit_in_W, credit_counter_W_in, credit_counter_W_out)
begin
  err_grant_W_credit_counter_W_out_decrement <= '0';
  if (valid_W = '1' and credit_in_W = '0' and credit_counter_W_out > 0 and credit_counter_W_in /= credit_counter_W_out - 1) then
      err_grant_W_credit_counter_W_out_decrement <= '1';
  end if;
end process;

process (valid_W, credit_in_W, credit_counter_W_in, credit_counter_W_out)
begin
  err_not_grant_W_or_credit_counter_W_out_zero_credit_counter_W_in_not_change <= '0';
  if ( valid_W = '1' and credit_in_W = '0' and credit_counter_W_out = 0 and credit_counter_W_in /= credit_counter_W_out) then
      err_not_grant_W_or_credit_counter_W_out_zero_credit_counter_W_in_not_change <= '1';
  end if;
end process;

process (credit_in_W, valid_W, credit_counter_W_in, credit_counter_W_out)
begin
  err_not_credit_in_W_not_grant_W_credit_counter_W_in_credit_counter_W_out_equal <= '0';
  if (credit_in_W = '0' and valid_W = '0' and credit_counter_W_in /= credit_counter_W_out) then
      err_not_credit_in_W_not_grant_W_credit_counter_W_in_credit_counter_W_out_equal <= '1';
  end if;
end process;

-- South credit counter

process (credit_in_S, valid_S, credit_counter_S_in, credit_counter_S_out)
begin
  err_credit_in_S_grant_S_credit_counter_S_in_credit_counter_S_out_equal <= '0';
  if (credit_in_S = '1' and valid_S = '1' and credit_counter_S_in /= credit_counter_S_out) then
      err_credit_in_S_grant_S_credit_counter_S_in_credit_counter_S_out_equal <= '1';
  end if;
end process;

process (credit_in_S, valid_S, credit_counter_S_in, credit_counter_S_out)
begin
  err_credit_in_S_credit_counter_S_out_increment <= '0';
  if (credit_in_S = '1' and valid_S = '0' and credit_counter_S_out < 3 and credit_counter_S_in /= credit_counter_S_out + 1) then
      err_credit_in_S_credit_counter_S_out_increment <= '1';
  end if;
end process;

process (credit_in_S, valid_S, credit_counter_S_in, credit_counter_S_out)
begin
  err_not_credit_in_S_credit_counter_S_out_max_credit_counter_S_in_not_change <= '0';
  if ( credit_in_S = '1' and valid_S = '0' and credit_counter_S_out = 3 and credit_counter_S_in /= credit_counter_S_out) then
      err_not_credit_in_S_credit_counter_S_out_max_credit_counter_S_in_not_change <= '1';
  end if;
end process;

process (valid_S, credit_in_S, credit_counter_S_in, credit_counter_S_out)
begin
  err_grant_S_credit_counter_S_out_decrement <= '0';
  if (valid_S = '1' and credit_in_S = '0' and credit_counter_S_out > 0 and credit_counter_S_in /= credit_counter_S_out - 1) then
      err_grant_S_credit_counter_S_out_decrement <= '1';
  end if;
end process;

process (valid_S, credit_in_S, credit_counter_S_in, credit_counter_S_out)
begin
  err_not_grant_S_or_credit_counter_S_out_zero_credit_counter_S_in_not_change <= '0';
  if (valid_S = '1' and credit_in_S = '0' and credit_counter_S_out = 0 and credit_counter_S_in /= credit_counter_S_out) then
      err_not_grant_S_or_credit_counter_S_out_zero_credit_counter_S_in_not_change <= '1';
  end if;
end process;

process (credit_in_S, valid_S, credit_counter_S_in, credit_counter_S_out)
begin
  err_not_credit_in_S_not_grant_S_credit_counter_S_in_credit_counter_S_out_equal <= '0';
  if (credit_in_S = '0' and valid_S = '0' and credit_counter_S_in /= credit_counter_S_out) then
      err_not_credit_in_S_not_grant_S_credit_counter_S_in_credit_counter_S_out_equal <= '1';
  end if;
end process;

-- Local credit counter

process (credit_in_L, valid_L, credit_counter_L_in, credit_counter_L_out)
begin
  err_credit_in_L_grant_L_credit_counter_L_in_credit_counter_L_out_equal <= '0';
  if (credit_in_L = '1' and valid_L = '1' and credit_counter_L_in /= credit_counter_L_out) then
      err_credit_in_L_grant_L_credit_counter_L_in_credit_counter_L_out_equal <= '1';
  end if;
end process;

process (credit_in_L, valid_L, credit_counter_L_in, credit_counter_L_out)
begin
  err_credit_in_L_credit_counter_L_out_increment <= '0';
  if (credit_in_L = '1' and valid_L = '0' and credit_counter_L_out < 3 and credit_counter_L_in /= credit_counter_L_out + 1) then
      err_credit_in_L_credit_counter_L_out_increment <= '1';
  end if;
end process;

process (credit_in_L, valid_L, credit_counter_L_in, credit_counter_L_out)
begin
  err_not_credit_in_L_credit_counter_L_out_max_credit_counter_L_in_not_change <= '0';
  if (credit_in_L = '1' and valid_L = '0' and credit_counter_L_out = 3 and credit_counter_L_in /= credit_counter_L_out) then
      err_not_credit_in_L_credit_counter_L_out_max_credit_counter_L_in_not_change <= '1';
  end if;
end process;

process (valid_L, credit_in_L, credit_counter_L_in, credit_counter_L_out)
begin
  err_grant_L_credit_counter_L_out_decrement <= '0';
  if (valid_L = '1' and credit_in_L = '0' and credit_counter_L_out > 0 and credit_counter_L_in /= credit_counter_L_out - 1) then
      err_grant_L_credit_counter_L_out_decrement <= '1';
  end if;
end process;

process (valid_L, credit_in_L, credit_counter_L_in, credit_counter_L_out)
begin
  err_not_grant_L_or_credit_counter_L_out_zero_credit_counter_L_in_not_change <= '0';
  if (valid_L = '1' and credit_in_L = '0' and credit_counter_L_out = 0 and credit_counter_L_in /= credit_counter_L_out) then
      err_not_grant_L_or_credit_counter_L_out_zero_credit_counter_L_in_not_change <= '1';
  end if;
end process;

process (credit_in_L, valid_L, credit_counter_L_in, credit_counter_L_out)
begin
  err_not_credit_in_L_not_grant_L_credit_counter_L_in_credit_counter_L_out_equal <= '0';
  if (credit_in_L = '0' and valid_L = '0' and credit_counter_L_in /= credit_counter_L_out) then
      err_not_credit_in_L_not_grant_L_credit_counter_L_in_credit_counter_L_out_equal <= '1';
  end if;
end process;


END;
