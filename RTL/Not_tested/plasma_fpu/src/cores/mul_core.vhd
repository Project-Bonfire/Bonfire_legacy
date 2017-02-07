-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Multiplier core
-- AUTHOR:      Steve Rhoads (rhoadss@yahoo.com)
--              Alex Schoenberger (Alex.Schoenberger@ies.tu-darmstadt.de)
-- COMMENT:     bit-pair algorithm for multiplication
--
-- www.ies.tu-darmstadt.de
-- TU Darmstadt
-- Institute for Integrated Systems
-- Merckstr. 25
-- 
-- 64283 Darmstadt - GERMANY
-- --------------------------------------------------------------------------
-- PROJECT:       Plasma CPU core with FPU
-- FILENAME:      mul_core.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--        long64 answer = 0;
--        for(i = 0; i < 32; ++i)
--        {
--          answer = (answer >> 1) + (((b&1)?a:0) << 31);
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

entity mul_core is
  port(
    clk               : in  std_logic;
    rst               : in  std_logic;

    start             : in  std_logic;
    busy              : out std_logic;
    rdy               : out std_logic;

    sign_flag         : in  std_logic;

    a                 : in  std_logic_vector(31 downto 0);
    b                 : in  std_logic_vector(31 downto 0);

    c                 : out std_logic_vector(63 downto 0)
  );
end entity mul_core;


--           _____   _____ _    _ _____ _______ ______ _____ _______ _    _ _____  ______ 
--     /\   |  __ \ / ____| |  | |_   _|__   __|  ____/ ____|__   __| |  | |  __ \|  ____|
--    /  \  | |__) | |    | |__| | | |    | |  | |__ | |       | |  | |  | | |__) | |__   
--   / /\ \ |  _  /| |    |  __  | | |    | |  |  __|| |       | |  | |  | |  _  /|  __|  
--  / ____ \| | \ \| |____| |  | |_| |_   | |  | |___| |____   | |  | |__| | | \ \| |____ 
-- /_/    \_\_|  \_\\_____|_|  |_|_____|  |_|  |______\_____|  |_|   \____/|_|  \_\______|
architecture mul_core_structure of mul_core is
  -- _ _  _ ___  _  _ ___ 
  -- | |\ | |__] |  |  |  
  -- | | \| |    |__|  |  
  alias flag_b_neg              : std_logic is b(31);              -- operand B is negative

  signal a_convert              : std_logic_vector(31 downto 0);   -- twoscomplement of operand A
  signal b_convert              : std_logic_vector(31 downto 0);   -- twoscomplement of operand B  

  signal a_input                : std_logic_vector(31 downto 0);   -- final input of operand A
  signal b_input                : std_logic_vector(31 downto 0);   -- final input of operand B
  signal i_input                : std_logic_vector(31 downto 0);   -- first intermediate result

  -- ____ ____ ____ _ ____ ___ ____ ____ ____ 
  -- |__/ |___ | __ | [__   |  |___ |__/ [__  
  -- |  \ |___ |__] | ___]  |  |___ |  \ ___]
  signal i_lower, reg_lower     : std_logic_vector(31 downto 0);
  signal i_upper, reg_upper     : std_logic_vector(31 downto 0);
  signal reg_adder              : std_logic_vector(31 downto 0);

  signal reg_sign               : std_logic;

  -- ___  ____ ___ ____ ___  ____ ___ _  _ 
  -- |  \ |__|  |  |__| |__] |__|  |  |__| 
  -- |__/ |  |  |  |  | |    |  |  |  |  | 
  signal i_sum_in               : std_logic_vector(31 downto 0);   -- input of summary
  signal i_sum                  : std_logic_vector(32 downto 0);   -- intermediate sum, extended with carry

  alias  sum_en                 : std_logic is reg_lower(0);       -- enable summary if current LSB is '1'
  alias  a_msb                  : std_logic is reg_upper(31);      -- for signed multiplication detect leading ones
  alias  b_msb                  : std_logic is i_sum_in(31);       -- for signed multiplication

  -- ____ ____ _  _ ___ ____ ____ _    ___  ____ ___ _  _ 
  -- |    |  | |\ |  |  |__/ |  | |    |__] |__|  |  |__| 
  -- |___ |__| | \|  |  |  \ |__| |___ |    |  |  |  |  | 
  type t_mul_state               is ( s_IDLE, s_WORK );

  signal i_state, state         : t_mul_state;                     -- state variable

  type t_mul_flags is
    record
      input_en                  : std_logic;
      work_en                   : std_logic;
      cnt_en                    : std_logic;
      cnt_done                  : std_logic;
    end record;
  
  signal flags                  : t_mul_flags;                     -- internal flags

  -- ____ ____ _  _ _  _ ___ ____ ____ 
  -- |    |  | |  | |\ |  |  |___ |__/ 
  -- |___ |__| |__| | \|  |  |___ |  \   
  signal mul_counter            : std_logic_vector(4 downto 0);      -- 2**5 = 32 clock cycles for multiplication

begin
-- synthesis translate_off
  -- ____ ____ _  _ _ ___ _   _    ____ _  _ ____ ____ _  _ 
  -- [__  |__| |\ | |  |   \_/     |    |__| |___ |    |_/  
  -- ___] |  | | \| |  |    |      |___ |  | |___ |___ | \_ 
  sanity_process:process( a, b )
  begin
    assert (not((a = x"8000_0000") and (sign_flag = '1'))) report "WARNING: operand A of MUL-CORE is 0x8000_0000, result will be erroneous!" severity warning;
    assert (not((b = x"8000_0000") and (sign_flag = '1'))) report "WARNING: operand B of MUL-CORE is 0x8000_0000, result will be erroneous!" severity warning;
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
  a_input   <= a_convert when (flag_b_neg and sign_flag) = '1' else a;
  b_input   <= b_convert when (flag_b_neg and sign_flag) = '1' else b;

  --
  -- if LSB of operand B is '1' the first intermediate result is operand A
  --
  i_input <= a_input      when b_input(0) = '1' else (others => '0');

  -- ____ ____ ____ _ ____ ___ ____ ____ ____ 
  -- |__/ |___ | __ | [__   |  |___ |__/ [__  
  -- |  \ |___ |__] | ___]  |  |___ |  \ ___]
  --
  -- reg_upper & reg_lower compose result
  -- reg_adder contain (to shift) adder constant
  -- reg_sign indicates signed multiplication
  --
  -- counter value and state variable
  --
  mul_registers:
  process( clk )
  begin
    if rising_edge( clk ) then
      if rst = '1' then                                   -- << RESET ACTIVE
        reg_lower     <= (others => '0');
        reg_upper     <= (others => '0');
        reg_adder     <= (others => '0');

        reg_sign      <= '0';

        mul_counter   <= (others => '0');
        state         <= s_IDLE;
      else                                                -- << RISING EDGE OF CLK
        -- ############ FIRST INPUT ################
        if flags.input_en = '1' then
          reg_sign    <= sign_flag;

          reg_adder   <= a_input;
          reg_lower   <= i_input(0) & b_input(31 downto 1);                   -- shift first intermediate result
          reg_upper   <= (sign_flag and i_input(31)) & i_input(31 downto 1);

        else
          -- ########## CALCULATION ################
          if flags.work_en = '1' then
            reg_lower <= i_lower;
            reg_upper <= i_upper;
          end if;
        end if;

        if flags.cnt_en = '1' then
          mul_counter <= std_logic_vector(unsigned(mul_counter) + to_unsigned(1, 5));
        else
          mul_counter <= (others => '0');
        end if;

        state         <= i_state;                       -- always active
      end if;
    end if;
  end process;

  -- ___  ____ ___ ____ ___  ____ ___ _  _ 
  -- |  \ |__|  |  |__| |__] |__|  |  |__| 
  -- |__/ |  |  |  |  | |    |  |  |  |  | 
  --
  -- get intermediate summand
  --
  i_sum_in <= reg_adder when sum_en = '1' else (others => '0');

  --
  --  calculate intermediate sum
  --
  i_sum <= std_logic_vector( unsigned((reg_sign and a_msb) & reg_upper)      -- for signed multiplication extend with MSB of reg upper
                              + 
                             unsigned((reg_sign and b_msb) & i_sum_in) );    -- for signed multiplication extend with MSB of i_sum_in

  --
  -- shift intermediate result
  --
  i_upper <= i_sum(32 downto 1);                                              -- get upper bits
  i_lower <= i_sum(0) & reg_lower(31 downto 1);                               -- get LSB and shift lower bits

  -- ____ ____ _  _ ___ ____ ____ _    ___  ____ ___ _  _ 
  -- |    |  | |\ |  |  |__/ |  | |    |__] |__|  |  |__| 
  -- |___ |__| | \|  |  |  \ |__| |___ |    |  |  |  |  | 
  mul_control:
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
          flags.cnt_en      <= '1';

          i_state           <= s_WORK;
        end if;

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
  flags.cnt_done  <= '1' when mul_counter = "00000" else '0';

  -- ____ _  _ ___ ___  _  _ ___ 
  -- |  | |  |  |  |__] |  |  |  
  -- |__| |__|  |  |    |__|  |  
  c               <= reg_upper & reg_lower;

end architecture mul_core_structure;
