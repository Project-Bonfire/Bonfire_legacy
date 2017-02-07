-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Divider core
-- AUTHOR:      Steve Rhoads (rhoadss@yahoo.com)  
--              Alex Schoenberger (Alex.Schoenberger@ies.tu-darmstadt.de)
-- COMMENT:
--
-- www.ies.tu-darmstadt.de
-- TU Darmstadt
-- Institute for Integrated Systems
-- Merckstr. 25
-- 
-- 64283 Darmstadt - GERMANY
-- --------------------------------------------------------------------------
-- PROJECT:       Plasma CPU core with FPU
-- FILENAME:      mult_core.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--        long upper=a, lower=0;
--        a = b << 31;
--        for(i = 0; i < 32; ++i)
--        {
--          lower = lower << 1;
--          if(upper >= a && a && b < 2)
--          {
--            upper = upper - a;
--            lower |= 1;
--          }
--          a = ((b&2) << 30) | (a >> 1);
--          b = b >> 1;
--        }
--
--    SYNTHESIZABLE
--
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0      7/2014    AS         initial
-- --------------------------------------------------------------------------
library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

entity div_core is
  port(
    clk               : in  std_logic;
    rst               : in  std_logic;

    start             : in  std_logic;
    busy              : out std_logic;
    rdy               : out std_logic;

    sign_flag         : in  std_logic;

    a                 : in  std_logic_vector(31 downto 0);
    b                 : in  std_logic_vector(31 downto 0);

    c                 : out std_logic_vector(31 downto 0);
    r                 : out std_logic_vector(31 downto 0)
  );
end entity div_core;

--           _____   _____ _    _ _____ _______ ______ _____ _______ _    _ _____  ______ 
--     /\   |  __ \ / ____| |  | |_   _|__   __|  ____/ ____|__   __| |  | |  __ \|  ____|
--    /  \  | |__) | |    | |__| | | |    | |  | |__ | |       | |  | |  | | |__) | |__   
--   / /\ \ |  _  /| |    |  __  | | |    | |  |  __|| |       | |  | |  | |  _  /|  __|  
--  / ____ \| | \ \| |____| |  | |_| |_   | |  | |___| |____   | |  | |__| | | \ \| |____ 
-- /_/    \_\_|  \_\\_____|_|  |_|_____|  |_|  |______\_____|  |_|   \____/|_|  \_\______|
architecture structure_div_core of div_core is
  -- _ _  _ ___  _  _ ___ 
  -- | |\ | |__] |  |  |  
  -- | | \| |    |__|  |  
  alias flag_a_neg              : std_logic is a(31);               -- operand A is negative
  alias flag_b_neg              : std_logic is b(31);               -- operand B is negative

  signal a_convert              : std_logic_vector(31 downto 0);    -- twoscomplement of operand A
  signal b_convert              : std_logic_vector(31 downto 0);    -- twoscomplement of operand B  

  signal a_input                : std_logic_vector(31 downto 0);
  signal b_input                : std_logic_vector(31 downto 0);

  -- ____ ____ ____ _ ____ ___ ____ ____ ____ 
  -- |__/ |___ | __ | [__   |  |___ |__/ [__  
  -- |  \ |___ |__] | ___]  |  |___ |  \ ___]
  signal i_rem, reg_rem         : std_logic_vector(31 downto 0);
  signal i_qot, reg_qot         : std_logic_vector(31 downto 0);

  signal reg_divisor            : std_logic_vector(31 downto 0);

  signal reg_sign_a             : std_logic;
  signal reg_xor_sign           : std_logic;

  -- ___  ____ ___ ____ ___  ____ ___ _  _ 
  -- |  \ |__|  |  |__| |__] |__|  |  |__| 
  -- |__/ |  |  |  |  | |    |  |  |  |  | 
  signal i_sub                  : std_logic_vector(32 downto 0);
  alias  flag_sub_neg           : std_logic is i_sub(32);

  -- ____ ____ _  _ ___ ____ ____ _    ___  ____ ___ _  _ 
  -- |    |  | |\ |  |  |__/ |  | |    |__] |__|  |  |__| 
  -- |___ |__| | \|  |  |  \ |__| |___ |    |  |  |  |  | 
  type t_div_state              is ( s_IDLE, s_INPUT, s_WORK );

  signal i_state, state         : t_div_state;

  type t_div_flags is
    record
      input_en                  : std_logic;
      work_en                   : std_logic;
      cnt_en                    : std_logic;
      cnt_done                  : std_logic;
    end record;

  signal flags                  : t_div_flags;                      -- internal flags

  -- ____ ____ _  _ _  _ ___ ____ ____ 
  -- |    |  | |  | |\ |  |  |___ |__/ 
  -- |___ |__| |__| | \|  |  |___ |  \   
  signal div_counter            : std_logic_vector(4 downto 0);     -- 2**5 = 32 clock cycles for division

  -- ____ _  _ ___ ___  _  _ ___ 
  -- |  | |  |  |  |__] |  |  |  
  -- |__| |__|  |  |    |__|  |  
  signal qot_convert            : std_logic_vector(31 downto 0);    -- twoscomplement of quotient
  signal rem_convert            : std_logic_vector(31 downto 0);    -- twoscomplement of remainder

begin
-- synthesis translate_off
  -- ____ ____ _  _ _ ___ _   _    ____ _  _ ____ ____ _  _ 
  -- [__  |__| |\ | |  |   \_/     |    |__| |___ |    |_/  
  -- ___] |  | | \| |  |    |      |___ |  | |___ |___ | \_ 
  sanity_process:process( a, b )
  begin
    assert (not((a = x"8000_0000") and (sign_flag = '1'))) report "WARNING: operand A of DIV-CORE is 0x8000_0000, result will be erroneous!" severity warning;
    assert (not((b = x"8000_0000") and (sign_flag = '1'))) report "WARNING: operand B of DIV-CORE is 0x8000_0000, result will be erroneous!" severity warning;
  end process;
-- synthesis translate_on

  -- _ _  _ ___  _  _ ___ 
  -- | |\ | |__] |  |  |  
  -- | | \| |    |__|  |  
  --
  -- calculate twoscomplement
  --
  a_convert <= std_logic_vector( unsigned(not a) + to_unsigned(1, 32) );
  b_convert <= std_logic_vector( unsigned(not b) + to_unsigned(1, 32) );

  --
  -- for signed multiplication and negative operand B take twoscomplements
  --
  a_input   <= a_convert when (flag_a_neg and sign_flag) = '1' else a;
  b_input   <= b_convert when (flag_b_neg and sign_flag) = '1' else b;

  -- ____ ____ ____ _ ____ ___ ____ ____ ____ 
  -- |__/ |___ | __ | [__   |  |___ |__/ [__  
  -- |  \ |___ |__] | ___]  |  |___ |  \ ___]
  --
  -- reg_qot : quotient register
  -- reg_rem : remainder register
  -- reg_divisor : divisor register
  --
  -- reg_sign_a : detect negative dividend -> remainder should have the same sign 
  -- reg_xor_sign : detect different signs of operands -> result should be negative
  --
  -- counter value and state variable
  --
  mul_registers:
  process( clk )
  begin
    if rising_edge( clk ) then
      if rst = '1' then                                   -- << RESET ACTIVE
        reg_qot         <= (others => '0');
        reg_rem         <= (others => '0');
        reg_divisor     <= (others => '0');

        reg_sign_a      <= '0';
        reg_xor_sign    <= '0';

        div_counter     <= (others => '0');
        state           <= s_IDLE;
      else                                                -- << RISING EDGE OF CLK
        -- ############ FIRST INPUT ################
        if flags.input_en = '1' then

          reg_qot       <= a_input;
          reg_rem       <= (others => '0');
          reg_divisor   <= b_input;

          reg_sign_a    <= flag_a_neg and sign_flag;
          reg_xor_sign  <= (flag_a_neg xor flag_b_neg) and sign_flag;

        else
          -- ########## CALCULATION ################
          if flags.work_en = '1' then
            reg_qot     <= i_qot;
            reg_rem     <= i_rem;
          end if;
        end if;

        if flags.cnt_en = '1' then
          div_counter <= std_logic_vector(unsigned(div_counter) + to_unsigned(1, 5));
        else
          div_counter <= (others => '0');
        end if;

        state         <= i_state;                       -- always active
      end if;
    end if;
  end process;

  -- ___  ____ ___ ____ ___  ____ ___ _  _ 
  -- |  \ |__|  |  |__| |__] |__|  |  |__| 
  -- |__/ |  |  |  |  | |    |  |  |  |  | 

  i_sub <= std_logic_vector(unsigned('0' & reg_rem(30 downto 0) & reg_qot(31))        -- '0' for sign and shift dividend
                            - 
                            unsigned('0' & reg_divisor));                             -- substract divisor

  i_qot <= reg_qot(30 downto 0) & (not i_sub(32));
  i_rem <= reg_rem(30 downto 0) & reg_qot(31) when i_sub(32) = '1' else i_sub(31 downto 0);

  -- ____ ____ _  _ ___ ____ ____ _    ___  ____ ___ _  _ 
  -- |    |  | |\ |  |  |__/ |  | |    |__] |__|  |  |__| 
  -- |___ |__| | \|  |  |  \ |__| |___ |    |  |  |  |  | 
  div_control:
  process( start, state, flags.cnt_done )
  begin
    -- ######## DEFAULT VALUES
    --
    -- intern flags
    --
    flags.input_en          <= '0';           -- no input
    flags.work_en           <= '0';           -- no calculation
    flags.cnt_en            <= '0';           -- no counting

    --
    -- state variable
    --
    i_state                 <= s_IDLE;        -- waiting for commands

    --
    -- outputs
    --
    busy                    <= '0';           -- no calculation indication
    rdy                     <= '0';           -- no result indication

    -- ######### CONTROL LOGIC
    case state is
      when s_IDLE   =>

        if start = '1' then
          busy              <= '1';
          flags.input_en    <= '1';

          i_state           <= s_INPUT;
        end if;

      when s_INPUT  =>                        -- write initial values

        busy                <= '1';

        flags.work_en       <= '1';           -- and start calculation
        flags.cnt_en        <= '1';

        i_state             <= s_WORK;

      when s_WORK   =>

        busy                <= '1';

        if flags.cnt_done = '1' then          -- finish calculation
          rdy               <= '1';
        else
          flags.work_en     <= '1';
          flags.cnt_en      <= '1';

          i_state           <= s_WORK;
        end if;

      when others   =>
    end case;
  end process;

  -- ____ ____ _  _ _  _ ___ ____ ____ 
  -- |    |  | |  | |\ |  |  |___ |__/ 
  -- |___ |__| |__| | \|  |  |___ |  \ 
  --
  -- get counter flag
  --
  flags.cnt_done  <= '1' when div_counter = "00000" else '0';

  -- ____ _  _ ___ ___  _  _ ___ 
  -- |  | |  |  |  |__] |  |  |  
  -- |__| |__|  |  |    |__|  |  
  --
  -- calculate twoscomplement of results
  --
  qot_convert     <= std_logic_vector(unsigned(not reg_qot) + to_unsigned(1, 32) );
  rem_convert     <= std_logic_vector(unsigned(not reg_rem) + to_unsigned(1, 32) );

  --
  -- result is negative for signed division and different signs of operands 
  -- remainder has the same sign as dividend
  --
  c               <= qot_convert when reg_xor_sign = '1' else reg_qot;
  r               <= rem_convert when reg_sign_a   = '1' else reg_rem;


end architecture structure_div_core;
