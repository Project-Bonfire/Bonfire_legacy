--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity allocator_logic_pseudo_checkers is
    port (
            -- grant_X_Y means the grant for X output port towards Y input port
            -- this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
            empty_N, empty_E, empty_W, empty_S, empty_L: in std_logic;
            grant_N_N_sig, grant_N_E_sig, grant_N_W_sig, grant_N_S_sig, grant_N_L_sig: in std_logic;
            grant_E_N_sig, grant_E_E_sig, grant_E_W_sig, grant_E_S_sig, grant_E_L_sig: in std_logic;
            grant_W_N_sig, grant_W_E_sig, grant_W_W_sig, grant_W_S_sig, grant_W_L_sig: in std_logic;
            grant_S_N_sig, grant_S_E_sig, grant_S_W_sig, grant_S_S_sig, grant_S_L_sig: in std_logic;
            grant_L_N_sig, grant_L_E_sig, grant_L_W_sig, grant_L_S_sig, grant_L_L_sig: in std_logic;

            valid_N, valid_E, valid_W, valid_S, valid_L : in std_logic;
            grant_N_N, grant_N_E, grant_N_W, grant_N_S, grant_N_L: in std_logic;
            grant_E_N, grant_E_E, grant_E_W, grant_E_S, grant_E_L: in std_logic;
            grant_W_N, grant_W_E, grant_W_W, grant_W_S, grant_W_L: in std_logic;
            grant_S_N, grant_S_E, grant_S_W, grant_S_S, grant_S_L: in std_logic;
            grant_L_N, grant_L_E, grant_L_W, grant_L_S, grant_L_L: in std_logic;
            grant_N, grant_E, grant_W, grant_S, grant_L : in std_logic;

            -- Checker outputs
            err_grant_N_N_sig_not_empty_N_grant_N_N, err_not_grant_N_N_sig_or_empty_N_not_grant_N_N,
            err_grant_N_E_sig_not_empty_E_grant_N_E, err_not_grant_N_E_sig_or_empty_E_not_grant_N_E,
            err_grant_N_W_sig_not_empty_W_grant_N_W, err_not_grant_N_W_sig_or_empty_W_not_grant_N_W,
            err_grant_N_S_sig_not_empty_S_grant_N_S, err_not_grant_N_S_sig_or_empty_S_not_grant_N_S,
            err_grant_N_L_sig_not_empty_L_grant_N_L, err_not_grant_N_L_sig_or_empty_L_not_grant_N_L,

            err_grant_E_N_sig_not_empty_N_grant_E_N, err_not_grant_E_N_sig_or_empty_N_not_grant_E_N,
            err_grant_E_E_sig_not_empty_E_grant_E_E, err_not_grant_E_E_sig_or_empty_E_not_grant_E_E,
            err_grant_E_W_sig_not_empty_W_grant_E_W, err_not_grant_E_W_sig_or_empty_W_not_grant_E_W,
            err_grant_E_S_sig_not_empty_S_grant_E_S, err_not_grant_E_S_sig_or_empty_S_not_grant_E_S,
            err_grant_E_L_sig_not_empty_L_grant_E_L, err_not_grant_E_L_sig_or_empty_L_not_grant_E_L,

            err_grant_W_N_sig_not_empty_N_grant_W_N, err_not_grant_W_N_sig_or_empty_N_not_grant_W_N,
            err_grant_W_E_sig_not_empty_E_grant_W_E, err_not_grant_W_E_sig_or_empty_E_not_grant_W_E,
            err_grant_W_W_sig_not_empty_W_grant_W_W, err_not_grant_W_W_sig_or_empty_W_not_grant_W_W,
            err_grant_W_S_sig_not_empty_S_grant_W_S, err_not_grant_W_S_sig_or_empty_S_not_grant_W_S,
            err_grant_W_L_sig_not_empty_L_grant_W_L, err_not_grant_W_L_sig_or_empty_L_not_grant_W_L,

            err_grant_S_N_sig_not_empty_N_grant_S_N, err_not_grant_S_N_sig_or_empty_N_not_grant_S_N,
            err_grant_S_E_sig_not_empty_E_grant_S_E, err_not_grant_S_E_sig_or_empty_E_not_grant_S_E,
            err_grant_S_W_sig_not_empty_W_grant_S_W, err_not_grant_S_W_sig_or_empty_W_not_grant_S_W,
            err_grant_S_S_sig_not_empty_S_grant_S_S, err_not_grant_S_S_sig_or_empty_S_not_grant_S_S,
            err_grant_S_L_sig_not_empty_L_grant_S_L, err_not_grant_S_L_sig_or_empty_L_not_grant_S_L,

            err_grant_L_N_sig_not_empty_N_grant_L_N, err_not_grant_L_N_sig_or_empty_N_not_grant_L_N,
            err_grant_L_E_sig_not_empty_E_grant_L_E, err_not_grant_L_E_sig_or_empty_E_not_grant_L_E,
            err_grant_L_W_sig_not_empty_W_grant_L_W, err_not_grant_L_W_sig_or_empty_W_not_grant_L_W,
            err_grant_L_S_sig_not_empty_S_grant_L_S, err_not_grant_L_S_sig_or_empty_S_not_grant_L_S,
            err_grant_L_L_sig_not_empty_L_grant_L_L, err_not_grant_L_L_sig_or_empty_L_not_grant_L_L,

            err_grant_signals_not_empty_grant_N, err_not_grant_signals_empty_not_grant_N,
            err_grant_signals_not_empty_grant_E, err_not_grant_signals_empty_not_grant_E,
            err_grant_signals_not_empty_grant_W, err_not_grant_signals_empty_not_grant_W,
            err_grant_signals_not_empty_grant_S, err_not_grant_signals_empty_not_grant_S,
            err_grant_signals_not_empty_grant_L, err_not_grant_signals_empty_not_grant_L,

            err_grants_valid_not_match : out std_logic
         );
end allocator_logic_pseudo_checkers;

architecture behavior of allocator_logic_pseudo_checkers is

begin

-- The combionational part
-- Checkers

-- Grant_N checkers

process (grant_N_N_sig, empty_N, grant_N_N)
begin
  err_grant_N_N_sig_not_empty_N_grant_N_N <= '0';
  if (grant_N_N_sig = '1' and empty_N = '0' and grant_N_N = '0') then
      err_grant_N_N_sig_not_empty_N_grant_N_N <= '1';
  end if;
end process;

process (grant_N_N_sig, empty_N, grant_N_N)
begin
  err_not_grant_N_N_sig_or_empty_N_not_grant_N_N <= '0';
  if ( (grant_N_N_sig = '0' or empty_N = '1') and grant_N_N = '1') then
      err_not_grant_N_N_sig_or_empty_N_not_grant_N_N <= '1';
  end if;
end process;

process (grant_N_E_sig, empty_E, grant_N_E)
begin
  err_grant_N_E_sig_not_empty_E_grant_N_E <= '0';
  if (grant_N_E_sig = '1' and empty_E = '0' and grant_N_E = '0') then
      err_grant_N_E_sig_not_empty_E_grant_N_E <= '1';
  end if;
end process;

process (grant_N_E_sig, empty_E, grant_N_E)
begin
  err_not_grant_N_E_sig_or_empty_E_not_grant_N_E <= '0';
  if ( (grant_N_E_sig = '0' or empty_E = '1') and grant_N_E = '1') then
      err_not_grant_N_E_sig_or_empty_E_not_grant_N_E <= '1';
  end if;
end process;

process (grant_N_W_sig, empty_W, grant_N_W)
begin
  err_grant_N_W_sig_not_empty_W_grant_N_W <= '0';
  if (grant_N_W_sig = '1' and empty_W = '0' and grant_N_W = '0') then
      err_grant_N_W_sig_not_empty_W_grant_N_W <= '1';
  end if;
end process;

process (grant_N_W_sig, empty_W, grant_N_W)
begin
  err_not_grant_N_W_sig_or_empty_W_not_grant_N_W <= '0';
  if ( (grant_N_W_sig = '0' or empty_W = '1') and grant_N_W = '1') then
      err_not_grant_N_W_sig_or_empty_W_not_grant_N_W <= '1';
  end if;
end process;

process (grant_N_S_sig, empty_S, grant_N_S)
begin
  err_grant_N_S_sig_not_empty_S_grant_N_S <= '0';
  if (grant_N_S_sig = '1' and empty_S = '0' and grant_N_S = '0') then
      err_grant_N_S_sig_not_empty_S_grant_N_S <= '1';
  end if;
end process;

process (grant_N_S_sig, empty_S, grant_N_S)
begin
  err_not_grant_N_S_sig_or_empty_S_not_grant_N_S <= '0';
  if ( (grant_N_S_sig = '0' or empty_S = '1') and grant_N_S = '1') then
      err_not_grant_N_S_sig_or_empty_S_not_grant_N_S <= '1';
  end if;
end process;

process (grant_N_L_sig, empty_L, grant_N_L)
begin
  err_grant_N_L_sig_not_empty_L_grant_N_L <= '0';
  if (grant_N_L_sig = '1' and empty_L = '0' and grant_N_L = '0') then
      err_grant_N_L_sig_not_empty_L_grant_N_L <= '1';
  end if;
end process;

process (grant_N_L_sig, empty_L, grant_N_L)
begin
  err_not_grant_N_L_sig_or_empty_L_not_grant_N_L <= '0';
  if ( (grant_N_L_sig = '0' or empty_L = '1') and grant_N_L = '1') then
    err_not_grant_N_L_sig_or_empty_L_not_grant_N_L <= '1';
  end if;
end process;

----------------------------------------------------------------
-- Grant_E checkers

process (grant_E_N_sig, empty_N, grant_E_N)
begin
  err_grant_E_N_sig_not_empty_N_grant_E_N <= '0';
  if (grant_E_N_sig = '1' and empty_N = '0' and grant_E_N = '0') then
    err_grant_E_N_sig_not_empty_N_grant_E_N <= '1';
  end if;
end process;

process (grant_E_N_sig, empty_N, grant_E_N)
begin
  err_not_grant_E_N_sig_or_empty_N_not_grant_E_N <= '0';
  if ( (grant_E_N_sig = '0' or empty_N = '1') and grant_E_N = '1') then
    err_not_grant_E_N_sig_or_empty_N_not_grant_E_N <= '1';
  end if;
end process;

process (grant_E_E_sig, empty_E, grant_E_E)
begin
  err_grant_E_E_sig_not_empty_E_grant_E_E <= '0';
  if (grant_E_E_sig = '1' and empty_E = '0' and grant_E_E = '0') then
    err_grant_E_E_sig_not_empty_E_grant_E_E <= '1';
  end if;
end process;

process (grant_E_E_sig, empty_E, grant_E_E)
begin
  err_not_grant_E_E_sig_or_empty_E_not_grant_E_E <= '0';
  if ( (grant_E_E_sig = '0' or empty_E = '1') and grant_E_E = '1') then
    err_not_grant_E_E_sig_or_empty_E_not_grant_E_E <= '1';
  end if;
end process;

process (grant_E_W_sig, empty_W, grant_E_W)
begin
  err_grant_E_W_sig_not_empty_W_grant_E_W <= '0';
  if (grant_E_W_sig = '1' and empty_W = '0' and grant_E_W = '0') then
    err_grant_E_W_sig_not_empty_W_grant_E_W <= '1';
  end if;
end process;

process (grant_E_W_sig, empty_W, grant_E_W)
begin
  err_not_grant_E_W_sig_or_empty_W_not_grant_E_W <= '0';
  if ( (grant_E_W_sig = '0' or empty_W = '1') and grant_E_W = '1') then
    err_not_grant_E_W_sig_or_empty_W_not_grant_E_W <= '1';
  end if;
end process;

process (grant_E_S_sig, empty_S, grant_E_S)
begin
  err_grant_E_S_sig_not_empty_S_grant_E_S <= '0';
  if (grant_E_S_sig = '1' and empty_S = '0' and grant_E_S = '0') then
    err_grant_E_S_sig_not_empty_S_grant_E_S <= '1';
  end if;
end process;

process (grant_E_S_sig, empty_S, grant_E_S)
begin
  err_not_grant_E_S_sig_or_empty_S_not_grant_E_S <= '0';
  if ( (grant_E_S_sig = '0' or empty_S = '1') and grant_E_S = '1') then
    err_not_grant_E_S_sig_or_empty_S_not_grant_E_S <= '1';
  end if;
end process;

process (grant_E_L_sig, empty_L, grant_E_L)
begin
  err_grant_E_L_sig_not_empty_L_grant_E_L <= '0';
  if (grant_E_L_sig = '1' and empty_L = '0' and grant_E_L = '0') then
    err_grant_E_L_sig_not_empty_L_grant_E_L <= '1';
  end if;
end process;

process (grant_E_L_sig, empty_L, grant_E_L)
begin
  err_not_grant_E_L_sig_or_empty_L_not_grant_E_L <= '0';
  if ( (grant_E_L_sig = '0' or empty_L = '1') and grant_E_L = '1') then
      err_not_grant_E_L_sig_or_empty_L_not_grant_E_L <= '1';
  end if;
end process;

----------------------------------------------------------------
-- Grant_W checkers

process (grant_W_N_sig, empty_N, grant_W_N)
begin
  err_grant_W_N_sig_not_empty_N_grant_W_N <= '0';
  if (grant_W_N_sig = '1' and empty_N = '0' and grant_W_N = '0') then
      err_grant_W_N_sig_not_empty_N_grant_W_N <= '1';
  end if;
end process;

process (grant_W_N_sig, empty_N, grant_W_N)
begin
  err_not_grant_W_N_sig_or_empty_N_not_grant_W_N <= '0';
  if ( (grant_W_N_sig = '0' or empty_N = '1') and grant_W_N = '1') then
      err_not_grant_W_N_sig_or_empty_N_not_grant_W_N <= '1';
  end if;
end process;

process (grant_W_E_sig, empty_E, grant_W_E)
begin
  err_grant_W_E_sig_not_empty_E_grant_W_E <= '0';
  if (grant_W_E_sig = '1' and empty_E = '0' and grant_W_E = '0') then
      err_grant_W_E_sig_not_empty_E_grant_W_E <= '1';
  end if;
end process;

process (grant_W_E_sig, empty_E, grant_W_E)
begin
  err_not_grant_W_E_sig_or_empty_E_not_grant_W_E <= '0';
  if ( (grant_W_E_sig = '0' or empty_E = '1') and grant_W_E = '1') then
      err_not_grant_W_E_sig_or_empty_E_not_grant_W_E <= '1';
  end if;
end process;

process (grant_W_W_sig, empty_W, grant_W_W)
begin
  err_grant_W_W_sig_not_empty_W_grant_W_W <= '0';
  if (grant_W_W_sig = '1' and empty_W = '0' and grant_W_W = '0') then
      err_grant_W_W_sig_not_empty_W_grant_W_W <= '1';
  end if;
end process;

process (grant_W_W_sig, empty_W, grant_W_W)
begin
  err_not_grant_W_W_sig_or_empty_W_not_grant_W_W <= '0';
  if ( (grant_W_W_sig = '0' or empty_W = '1') and grant_W_W = '1') then
      err_not_grant_W_W_sig_or_empty_W_not_grant_W_W <= '1';
  end if;
end process;

process (grant_W_S_sig, empty_S, grant_W_S)
begin
  err_grant_W_S_sig_not_empty_S_grant_W_S <= '0';
  if (grant_W_S_sig = '1' and empty_S = '0' and grant_W_S = '0') then
      err_grant_W_S_sig_not_empty_S_grant_W_S <= '1';
  end if;
end process;

process (grant_W_S_sig, empty_S, grant_W_S)
begin
  err_not_grant_W_S_sig_or_empty_S_not_grant_W_S <= '0';
  if ( (grant_W_S_sig = '0' or empty_S = '1') and grant_W_S = '1') then
      err_not_grant_W_S_sig_or_empty_S_not_grant_W_S <= '1';
  end if;
end process;

process (grant_W_L_sig, empty_L, grant_W_L)
begin
  err_grant_W_L_sig_not_empty_L_grant_W_L <= '0';
  if (grant_W_L_sig = '1' and empty_L = '0' and grant_W_L = '0') then
      err_grant_W_L_sig_not_empty_L_grant_W_L <= '1';
  end if;
end process;

process (grant_W_L_sig, empty_L, grant_W_L)
begin
  err_not_grant_W_L_sig_or_empty_L_not_grant_W_L <= '0';
  if ( (grant_W_L_sig = '0' or empty_L = '1') and grant_W_L = '1') then
      err_not_grant_W_L_sig_or_empty_L_not_grant_W_L <= '1';
  end if;
end process;

----------------------------------------------------------------
-- Grant_S checkers

process (grant_S_N_sig, empty_N, grant_S_N)
begin
  err_grant_S_N_sig_not_empty_N_grant_S_N <= '0';
  if (grant_S_N_sig = '1' and empty_N = '0' and grant_S_N = '0') then
      err_grant_S_N_sig_not_empty_N_grant_S_N <= '1';
  end if;
end process;

process (grant_S_N_sig, empty_N, grant_S_N)
begin
  err_not_grant_S_N_sig_or_empty_N_not_grant_S_N <= '0';
  if ( (grant_S_N_sig = '0' or empty_N = '1') and grant_S_N = '1') then
      err_not_grant_S_N_sig_or_empty_N_not_grant_S_N <= '1';
  end if;
end process;

process (grant_S_E_sig, empty_E, grant_S_E)
begin
  err_grant_S_E_sig_not_empty_E_grant_S_E <= '0';
  if (grant_S_E_sig = '1' and empty_E = '0' and grant_S_E = '0') then
      err_grant_S_E_sig_not_empty_E_grant_S_E <= '1';
  end if;
end process;

process (grant_S_E_sig, empty_E, grant_S_E)
begin
  err_not_grant_S_E_sig_or_empty_E_not_grant_S_E <= '0';
  if ( (grant_S_E_sig = '0' or empty_E = '1') and grant_S_E = '1') then
      err_not_grant_S_E_sig_or_empty_E_not_grant_S_E <= '1';
  end if;
end process;

process (grant_S_W_sig, empty_W, grant_S_W)
begin
  err_grant_S_W_sig_not_empty_W_grant_S_W <= '0';
  if (grant_S_W_sig = '1' and empty_W = '0' and grant_S_W = '0') then
      err_grant_S_W_sig_not_empty_W_grant_S_W <= '1';
  end if;
end process;

process (grant_S_W_sig, empty_W, grant_S_W)
begin
  err_not_grant_S_W_sig_or_empty_W_not_grant_S_W <= '0';
  if ( (grant_S_W_sig = '0' or empty_W = '1') and grant_S_W = '1') then
      err_not_grant_S_W_sig_or_empty_W_not_grant_S_W <= '1';
  end if;
end process;

process (grant_S_S_sig, empty_S, grant_S_S)
begin
  err_grant_S_S_sig_not_empty_S_grant_S_S <= '0';
  if (grant_S_S_sig = '1' and empty_S = '0' and grant_S_S = '0') then
      err_grant_S_S_sig_not_empty_S_grant_S_S <= '1';
  end if;
end process;

process (grant_S_S_sig, empty_S, grant_S_S)
begin
  err_not_grant_S_S_sig_or_empty_S_not_grant_S_S <= '0';
  if ( (grant_S_S_sig = '0' or empty_S = '1') and grant_S_S = '1') then
      err_not_grant_S_S_sig_or_empty_S_not_grant_S_S <= '1';
  end if;
end process;

process (grant_S_L_sig, empty_L, grant_S_L)
begin
  err_grant_S_L_sig_not_empty_L_grant_S_L <= '0';
  if (grant_S_L_sig = '1' and empty_L = '0' and grant_S_L = '0') then
      err_grant_S_L_sig_not_empty_L_grant_S_L <= '1';
  end if;
end process;

process (grant_S_L_sig, empty_L, grant_S_L)
begin
  err_not_grant_S_L_sig_or_empty_L_not_grant_S_L <= '0';
  if ( (grant_S_L_sig = '0' or empty_L = '1') and grant_S_L = '1') then
      err_not_grant_S_L_sig_or_empty_L_not_grant_S_L <= '1';
  end if;
end process;

----------------------------------------------------------------
-- Grant_L checkers

process (grant_L_N_sig, empty_N, grant_L_N)
begin
  err_grant_L_N_sig_not_empty_N_grant_L_N <= '0';
  if (grant_L_N_sig = '1' and empty_N = '0' and grant_L_N = '0') then
      err_grant_L_N_sig_not_empty_N_grant_L_N <= '1';
  end if;
end process;

process (grant_L_N_sig, empty_N, grant_L_N)
begin
  err_not_grant_L_N_sig_or_empty_N_not_grant_L_N <= '0';
  if ( (grant_L_N_sig = '0' or empty_N = '1') and grant_L_N = '1') then
      err_not_grant_L_N_sig_or_empty_N_not_grant_L_N <= '1';
  end if;
end process;

process (grant_L_E_sig, empty_E, grant_L_E)
begin
  err_grant_L_E_sig_not_empty_E_grant_L_E <= '0';
  if (grant_L_E_sig = '1' and empty_E = '0' and grant_L_E = '0') then
      err_grant_L_E_sig_not_empty_E_grant_L_E <= '1';
  end if;
end process;

process (grant_L_E_sig, empty_E, grant_L_E)
begin
  err_not_grant_L_E_sig_or_empty_E_not_grant_L_E <= '0';
  if ( (grant_L_E_sig = '0' or empty_E = '1') and grant_L_E = '1') then
      err_not_grant_L_E_sig_or_empty_E_not_grant_L_E <= '1';
  end if;
end process;

process (grant_L_W_sig, empty_W, grant_L_W)
begin
  err_grant_L_W_sig_not_empty_W_grant_L_W <= '0';
  if (grant_L_W_sig = '1' and empty_W = '0' and grant_L_W = '0') then
      err_grant_L_W_sig_not_empty_W_grant_L_W <= '1';
  end if;
end process;

process (grant_L_W_sig, empty_W, grant_L_W)
begin
  err_not_grant_L_W_sig_or_empty_W_not_grant_L_W <= '0';
  if ( (grant_L_W_sig = '0' or empty_W = '1') and grant_L_W = '1') then
      err_not_grant_L_W_sig_or_empty_W_not_grant_L_W <= '1';
  end if;
end process;

process (grant_L_S_sig, empty_S, grant_L_S)
begin
  err_grant_L_S_sig_not_empty_S_grant_L_S <= '0';
  if (grant_L_S_sig = '1' and empty_S = '0' and grant_L_S = '0') then
      err_grant_L_S_sig_not_empty_S_grant_L_S <= '1';
  end if;
end process;

process (grant_L_S_sig, empty_S, grant_L_S)
begin
  err_not_grant_L_S_sig_or_empty_S_not_grant_L_S <= '0';
  if ( (grant_L_S_sig = '0' or empty_S = '1') and grant_L_S = '1') then
      err_not_grant_L_S_sig_or_empty_S_not_grant_L_S <= '1';
  end if;
end process;

process (grant_L_L_sig, empty_L, grant_L_L)
begin
  err_grant_L_L_sig_not_empty_L_grant_L_L <= '0';
  if (grant_L_L_sig = '1' and empty_L = '0' and grant_L_L = '0') then
      err_grant_L_L_sig_not_empty_L_grant_L_L <= '1';
  end if;
end process;

process (grant_L_L_sig, empty_L, grant_L_L)
begin
  err_not_grant_L_L_sig_or_empty_L_not_grant_L_L <= '0';
  if ( (grant_L_L_sig = '0' or empty_L = '1') and grant_L_L = '1') then
      err_not_grant_L_L_sig_or_empty_L_not_grant_L_L <= '1';
  end if;
end process;

----------------------------------------------------------------
-- Final Grant output checkers

-- North
process (grant_N_N_sig, empty_N, grant_N_E_sig, empty_E, grant_N_W_sig, empty_W, grant_N_S_sig, empty_S, grant_N_L_sig, empty_L, grant_N)
begin
  err_grant_signals_not_empty_grant_N <= '0';
  if ( ( (grant_N_N_sig = '1' and empty_N = '0' ) or (grant_N_E_sig = '1' and empty_E = '0') or (grant_N_W_sig = '1' and empty_W = '0') or
       (grant_N_S_sig = '1' and empty_S = '0') or (grant_N_L_sig = '1' and empty_L = '0') ) and grant_N = '0' ) then
      err_grant_signals_not_empty_grant_N <= '1';
  end if;
end process;

process (grant_N_N_sig, empty_N, grant_N_E_sig, empty_E, grant_N_W_sig, empty_W, grant_N_S_sig, empty_S, grant_N_L_sig, empty_L, grant_N)
begin
  err_not_grant_signals_empty_not_grant_N <= '0';
  if ( ( (grant_N_N_sig = '0' or empty_N = '1' ) and (grant_N_E_sig = '0' and empty_E = '1') and (grant_N_W_sig = '0' or empty_W = '1') and
       (grant_N_S_sig = '0' or empty_S = '1') and (grant_N_L_sig = '0' or empty_L = '1') ) and grant_N /= '0' ) then
      err_not_grant_signals_empty_not_grant_N <= '1';
  end if;
end process;

-- East
process (grant_E_N_sig, empty_N, grant_E_E_sig, empty_E, grant_E_W_sig, empty_W, grant_E_S_sig, empty_S, grant_E_L_sig, empty_L, grant_E)
begin
  err_grant_signals_not_empty_grant_E <= '0';
  if ( ( (grant_E_N_sig = '1' and empty_N = '0' ) or (grant_E_E_sig = '1' and empty_E = '0') or (grant_E_W_sig = '1' and empty_W = '0') or
       (grant_E_S_sig = '1' and empty_S = '0') or (grant_E_L_sig = '1' and empty_L = '0') ) and grant_E = '0' ) then
      err_grant_signals_not_empty_grant_E <= '1';
  end if;
end process;

process (grant_E_N_sig, empty_N, grant_E_E_sig, empty_E, grant_E_W_sig, empty_W, grant_E_S_sig, empty_S, grant_E_L_sig, empty_L, grant_E)
begin
  err_not_grant_signals_empty_not_grant_E <= '0';
  if ( ( (grant_E_N_sig = '0' or empty_N = '1' ) and (grant_E_E_sig = '0' and empty_E = '1') and (grant_E_W_sig = '0' or empty_W = '1') and
       (grant_E_S_sig = '0' or empty_S = '1') and (grant_E_L_sig = '0' or empty_L = '1') ) and grant_E /= '0' ) then
      err_not_grant_signals_empty_not_grant_E <= '1';
  end if;
end process;

-- West
process (grant_W_N_sig, empty_N, grant_W_E_sig, empty_E, grant_W_W_sig, empty_W, grant_W_S_sig, empty_S, grant_W_L_sig, empty_L, grant_W)
begin
  err_grant_signals_not_empty_grant_W <= '0';
  if ( ( (grant_W_N_sig = '1' and empty_N = '0' ) or (grant_W_E_sig = '1' and empty_E = '0') or (grant_W_W_sig = '1' and empty_W = '0') or
       (grant_W_S_sig = '1' and empty_S = '0') or (grant_W_L_sig = '1' and empty_L = '0') ) and grant_W = '0' ) then
      err_grant_signals_not_empty_grant_W <= '1';
  end if;
end process;

process (grant_W_N_sig, empty_N, grant_W_E_sig, empty_E, grant_W_W_sig, empty_W, grant_W_S_sig, empty_S, grant_W_L_sig, empty_L, grant_W)
begin
  err_not_grant_signals_empty_not_grant_W <= '0';
  if ( ( (grant_W_N_sig = '0' or empty_N = '1' ) and (grant_W_E_sig = '0' and empty_E = '1') and (grant_W_W_sig = '0' or empty_W = '1') and
       (grant_W_S_sig = '0' or empty_S = '1') and (grant_W_L_sig = '0' or empty_L = '1') ) and grant_W /= '0' ) then
      err_not_grant_signals_empty_not_grant_W <= '1';
  end if;
end process;

-- South
process (grant_S_N_sig, empty_N, grant_S_E_sig, empty_E, grant_S_W_sig, empty_W, grant_S_S_sig, empty_S, grant_S_L_sig, empty_L, grant_S)
begin
  err_grant_signals_not_empty_grant_S <= '0';
  if ( ( (grant_S_N_sig = '1' and empty_N = '0' ) or (grant_S_E_sig = '1' and empty_E = '0') or (grant_S_W_sig = '1' and empty_W = '0') or
       (grant_S_S_sig = '1' and empty_S = '0') or (grant_S_L_sig = '1' and empty_L = '0') ) and grant_S = '0' ) then
      err_grant_signals_not_empty_grant_S <= '1';
  end if;
end process;

process (grant_S_N_sig, empty_N, grant_S_E_sig, empty_E, grant_S_W_sig, empty_W, grant_S_S_sig, empty_S, grant_S_L_sig, empty_L, grant_S)
begin
  err_not_grant_signals_empty_not_grant_S <= '0';
  if ( ( (grant_S_N_sig = '0' or empty_N = '1' ) and (grant_S_E_sig = '0' and empty_E = '1') and (grant_S_W_sig = '0' or empty_W = '1') and
       (grant_S_S_sig = '0' or empty_S = '1') and (grant_S_L_sig = '0' or empty_L = '1') ) and grant_S /= '0' ) then
      err_not_grant_signals_empty_not_grant_S <= '1';
  end if;
end process;

-- Local
process (grant_L_N_sig, empty_N, grant_L_E_sig, empty_E, grant_L_W_sig, empty_W, grant_L_S_sig, empty_S, grant_L_L_sig, empty_L, grant_L)
begin
  err_grant_signals_not_empty_grant_L <= '0';
  if ( ( (grant_L_N_sig = '1' and empty_N = '0' ) or (grant_L_E_sig = '1' and empty_E = '0') or (grant_L_W_sig = '1' and empty_W = '0') or
       (grant_L_S_sig = '1' and empty_S = '0') or (grant_L_L_sig = '1' and empty_L = '0') ) and grant_L = '0' ) then
      err_grant_signals_not_empty_grant_L <= '1';
  end if;
end process;

process (grant_L_N_sig, empty_N, grant_L_E_sig, empty_E, grant_L_W_sig, empty_W, grant_L_S_sig, empty_S, grant_L_L_sig, empty_L, grant_L)
begin
  err_not_grant_signals_empty_not_grant_L <= '0';
  if ( ( (grant_L_N_sig = '0' or empty_N = '1' ) and (grant_L_E_sig = '0' and empty_E = '1') and (grant_L_W_sig = '0' or empty_W = '1') and
       (grant_L_S_sig = '0' or empty_S = '1') and (grant_L_L_sig = '0' or empty_L = '1') ) and grant_L /= '0' ) then
      err_not_grant_signals_empty_not_grant_L <= '1';
  end if;
end process;

----------------------------------------------------------------
-- Valid output checkers

process (valid_N, valid_E, valid_W, valid_S, valid_L, grant_N, grant_E, grant_W, grant_S, grant_L)
begin
  err_grants_valid_not_match <= '0';
  if (valid_N /= grant_N or valid_E /= grant_E or valid_W /= grant_W or valid_S /= grant_S or valid_L /= grant_L) then
      err_grants_valid_not_match <= '1';
  end if;
end process;

END;
