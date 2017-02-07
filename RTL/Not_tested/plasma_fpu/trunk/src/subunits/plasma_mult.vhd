-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma MULTIPLICATOR
-- AUTHOR:      Alex Schoenberger (Alex.Schoenberger@ies.tu-darmstadt.de)
-- COMMENT:     This project is based on Plasma CPU core by Steve Rhoads
--
-- www.ies.tu-darmstadt.de
-- TU Darmstadt
-- Institute for Integrated Systems
-- Merckstr. 25
-- 
-- 64283 Darmstadt - GERMANY
-- --------------------------------------------------------------------------
-- PROJECT:       Plasma CPU core with FPU
-- FILENAME:      plasma_mult.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    implements multiplication operations depending on instruction code:
--    MULT, DIV, MULTU, DIVU, MTLO, MFLO, MTHI, MFHI
--
--    SYNTHESIZABLE
--
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0      4/2014    AS         initial
-- --------------------------------------------------------------------------
library IEEE;
   use IEEE.std_logic_1164.ALL;
   use IEEE.numeric_std.ALL;

library PLASMA;
  use PLASMA.mips_instruction_set.ALL;
  use PLASMA.plasma_pack.ALL;

entity plasma_mult is
    port(
      control                 : in  t_main_control;
      mult_a_in               : in  t_plasma_word;
      mult_b_in               : in  t_plasma_word;
      mult_func               : in  t_mips_function;
      mult_busy               : out std_logic;
      mult_out                : out t_plasma_word
    );
end entity plasma_mult;

-- synthesis translate_off
-- ____ _ _  _ _  _ _    ____ ___ _ ____ _  _ 
-- [__  | |\/| |  | |    |__|  |  | |  | |\ | 
-- ___] | |  | |__| |___ |  |  |  | |__| | \| 
architecture sim_mult of plasma_mult is

   signal reg_mult      : t_plasma_dword;
   signal i_reg_mult    : t_plasma_dword;

begin

  process( control.clk )

    variable a_in_sig     :   signed(PLASMA_DATA_WIDTH - 1 downto 0);
    variable b_in_sig     :   signed(PLASMA_DATA_WIDTH - 1 downto 0);   

    variable a_in_uns     : unsigned(PLASMA_DATA_WIDTH - 1 downto 0);
    variable b_in_uns     : unsigned(PLASMA_DATA_WIDTH - 1 downto 0);

  begin

    if falling_edge( control.clk ) then                         -- avoid spurious division by zero

    -- default values
    i_reg_mult <= reg_mult;
    mult_out      <= PLASMA_ZERO_WORD;

    -- operation mux
    case mult_func is
        when MIPS_FUNC_MFLO       => 
              mult_out      <= reg_mult(  PLASMA_DATA_WIDTH  - 1 downto                 0);
        when MIPS_FUNC_MFHI       => 
              mult_out      <= reg_mult(2*PLASMA_DATA_WIDTH  - 1 downto PLASMA_DATA_WIDTH);
        when MIPS_FUNC_MTLO      => 
              i_reg_mult <= reg_mult(2*PLASMA_DATA_WIDTH  - 1 downto PLASMA_DATA_WIDTH) & mult_a_in;
        when MIPS_FUNC_MTHI      => 
              i_reg_mult <= mult_a_in & reg_mult(PLASMA_DATA_WIDTH - 1 downto 0);

        when MIPS_FUNC_MULTU => 

              a_in_uns := unsigned(mult_a_in);
              b_in_uns := unsigned(mult_b_in);

              i_reg_mult <= std_logic_vector(a_in_uns * b_in_uns);

        when MIPS_FUNC_MULT   => 
              a_in_sig :=   signed(mult_a_in);
              b_in_sig :=   signed(mult_b_in);

              i_reg_mult <= std_logic_vector(a_in_sig * b_in_sig);

        when MIPS_FUNC_DIVU  => 

              a_in_uns := unsigned(mult_a_in);
              b_in_uns := unsigned(mult_b_in);

              assert ( b_in_uns /= 0) report "ERROR:Division by zero!" severity failure;

              i_reg_mult(  PLASMA_DATA_WIDTH - 1 downto                 0) <= std_logic_vector(a_in_uns  /  b_in_uns);
              i_reg_mult(2*PLASMA_DATA_WIDTH - 1 downto PLASMA_DATA_WIDTH) <= std_logic_vector(a_in_uns mod b_in_uns);
          
        when MIPS_FUNC_DIV    => 

              a_in_sig :=   signed(mult_a_in);
              b_in_sig :=   signed(mult_b_in);

              assert ( b_in_sig /= 0) report "ERROR:Division by zero!" severity failure;

              i_reg_mult(  PLASMA_DATA_WIDTH - 1 downto                 0) <= std_logic_vector(a_in_sig  /  b_in_sig);
              i_reg_mult(2*PLASMA_DATA_WIDTH - 1 downto PLASMA_DATA_WIDTH) <= std_logic_vector(a_in_sig mod b_in_sig);

        when others                    =>
      end case;
      end if;
   end process;


   process( control.clk )
   begin
      if rising_edge( control.clk ) then
         if control.rst = '1' then
            reg_mult <= (others => '0');
         else
            reg_mult <= i_reg_mult;
         end if;
      end if;
   end process;

   mult_busy <= '0';
    
end architecture sim_mult;
-- synthesis translate_on


library MUL;

-- ____ ___  ____ ____ 
-- |___ |__] | __ |__| 
-- |    |    |__] |  | 
architecture FPGA_mult of plasma_mult is

  -- ____ ___  ____ ____ ____ ___ _ ____ _  _    ____ ____ ____ ____ ____ 
  -- |  | |__] |___ |__/ |__|  |  | |  | |\ |    |    |  | |__/ |___ [__  
  -- |__| |    |___ |  \ |  |  |  | |__| | \|    |___ |__| |  \ |___ ___] 
  --
  -- multiplication
  --
  component mul_core is
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
  end component mul_core;

  --
  -- division
  --
  component div_core is
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
  end component div_core;

  --
  -- control
  --
  type t_core_ctrl is
    record
      -- start             : std_logic;       -- ModelSIM cannot handle different directions in a record
      busy              : std_logic;
      rdy               : std_logic;
    end record;

  signal c_mul          : t_core_ctrl;
  signal c_div          : t_core_ctrl;

  signal mul_start      : std_logic;
  signal div_start      : std_logic;

  signal sign_flag      : std_logic;

  --
  -- calculated data
  --
  signal mul_data       : t_plasma_dword;
  signal div_data       : t_plasma_dword;

  -- ____ ___ ____ ___ ____    _  _ ____ ____ _  _ _ _  _ ____ 
  -- [__   |  |__|  |  |___    |\/| |__| |    |__| | |\ | |___ 
  -- ___]  |  |  |  |  |___    |  | |  | |___ |  | | | \| |___ 
  type t_mult_state is ( s_IDLE, s_BUSY );

  signal i_state, state : t_mult_state;

  signal i_start        : std_logic;
  signal flag_div       : std_logic;


  -- _  _ ____ _ _  _    ____ ____ ____ _ ____ ___ ____ ____ 
  -- |\/| |__| | |\ |    |__/ |___ | __ | [__   |  |___ |__/ 
  -- |  | |  | | | \|    |  \ |___ |__] | ___]  |  |___ |  \ 
  type t_mul_reg_sel is (
      MUL_REG_STORE,                            -- stored value
      MUL_REG_LO,                               -- LO data from PLASMA
      MUL_REG_HI,                               -- HI data from PLASMA
      MUL_REG_MUL,                              -- data from multiplier core
      MUL_REG_DIV                               -- data from divisor core
    );

  signal mul_reg_sel    : t_mul_reg_sel;

  --
  -- main register
  --
  signal reg_en         : std_logic;
  signal reg_mult       : t_plasma_dword;
  signal i_reg_mult     : t_plasma_dword;

  --
  -- function
  --
  signal i_busy         : std_logic;
  signal func_en        : std_logic;
  signal i_mult_func    : t_mips_function;
  signal reg_mult_func  : t_mips_function;

  -- ____ _  _ ___ ___  _  _ ___ 
  -- |  | |  |  |  |__] |  |  |  
  -- |__| |__|  |  |    |__|  |  
  --
  -- output mux
  --
  type t_mul_out_sel is (
      MUL_OUT_HI,                               -- HI word
      MUL_OUT_LO,                               -- LO word
      MUL_OUT_MUL,                              -- from MUL core
      MUL_OUT_DIV                               -- from DIV core
    );

  signal mul_out_sel    : t_mul_out_sel;

begin
  -- ____ ___  ____ ____ ____ ___ _ ____ _  _    ____ ____ ____ ____ ____ 
  -- |  | |__] |___ |__/ |__|  |  | |  | |\ |    |    |  | |__/ |___ [__  
  -- |__| |    |___ |  \ |  |  |  | |__| | \|    |___ |__| |  \ |___ ___] 
  mult_core_unit: entity MUL.mul_core
  PORT MAP( 
    clk       => control.clk,     rst => control.rst,
    start     => mul_start,
    busy      => c_mul.busy,      rdy => c_mul.rdy,
    sign_flag => sign_flag,

    a         => mult_a_in,       b   => mult_b_in,
    c         => mul_data
  );

  div_core_unit: entity MUL.div_core
  PORT MAP(
    clk       => control.clk,     rst => control.rst,
    start     => div_start,
    busy      => c_div.busy,      rdy => c_div.rdy,
    sign_flag => sign_flag,

    a         => mult_a_in,       b   => mult_b_in,
    c         => div_data(31 downto 0),
    r         => div_data(63 downto 32)
  );

  -- ___  ____ ____ ____ ___  ____ ____ 
  -- |  \ |___ |    |  | |  \ |___ |__/ 
  -- |__/ |___ |___ |__| |__/ |___ |  \ 
  --
  -- intern busy indicates calculation till ready is set
  --
  i_busy                <= (c_mul.busy or c_div.busy) and (not c_mul.rdy) and (not c_div.rdy);

  --
  -- store function till calculation is finished
  --
  i_mult_func           <= reg_mult_func when state = s_BUSY else mult_func;

  --
  -- signed calculation
  --
  sign_flag             <= '1' when (i_mult_func = MIPS_FUNC_MULT) or
                                    (i_mult_func = MIPS_FUNC_DIV)       
                                                                      else '0';

  --
  -- decode command
  --
  mult_decode:
  process( i_mult_func, c_mul.rdy, c_div.rdy )
  begin
    -- ############## DEFAULT VALUES
    reg_en              <= '0';             -- no register store
    mul_reg_sel         <= MUL_REG_STORE;   -- stored value remains

    mul_out_sel         <= MUL_OUT_LO;      -- LO word

    --
    -- state machine control
    --
    i_start             <= '0';             -- no calculation
    flag_div            <= '0';             -- multiplication is default

    -- operation mux
    case i_mult_func is
        when MIPS_FUNC_MFLO   => 
              
        when MIPS_FUNC_MFHI   =>               
              mul_out_sel       <= MUL_OUT_HI;

        when MIPS_FUNC_MTLO   => 
              mul_reg_sel       <= MUL_REG_LO;
              reg_en            <= '1';

        when MIPS_FUNC_MTHI   => 
              mul_reg_sel       <= MUL_REG_HI;
              reg_en            <= '1';

        when MIPS_FUNC_MULTU |
             MIPS_FUNC_MULT   => 
              i_start           <= '1';

              reg_en            <= c_mul.rdy;
              mul_reg_sel       <= MUL_REG_MUL;

        when MIPS_FUNC_DIVU  |
             MIPS_FUNC_DIV    => 
              i_start           <= '1';
              flag_div          <= '1';

              reg_en            <= c_div.rdy;
              mul_reg_sel       <= MUL_REG_DIV;

        when others            =>
      end case;
   end process;  

  -- ____ ___ ____ ___ ____    _  _ ____ ____ _  _ _ _  _ ____ 
  -- [__   |  |__|  |  |___    |\/| |__| |    |__| | |\ | |___ 
  -- ___]  |  |  |  |  |___    |  | |  | |___ |  | | | \| |___ 
  --
  -- start calculation units and store function
  --
  mult_state:
  process( state, i_start, flag_div, i_busy )
  begin
    -- ############ DEFAULT VALUES
    --
    -- calculations units control
    --
    mul_start           <= '0';             -- mul core inactive
    div_start           <= '0';             -- div core inactive

    --
    -- function store
    --
    func_en             <= '0';             -- no function store

    --
    -- next state
    --
    i_state             <= s_IDLE;          -- remain in IDLE

    -- ############ STATE LOGIC
    case state is
      when s_IDLE   => if i_start = '1' then

                        mul_start   <= not flag_div;
                        div_start   <= flag_div;

                        func_en     <= '1';   -- store function

                        i_state     <= s_BUSY;
                       end if;

      when s_BUSY   => if i_busy = '1' then
                        i_state     <= s_BUSY;
                       end if;
      when others   =>
    end case;
  end process;

  -- _  _ ____ _ _  _    ____ ____ ____ _ ____ ___ ____ ____ 
  -- |\/| |__| | |\ |    |__/ |___ | __ | [__   |  |___ |__/ 
  -- |  | |  | | | \|    |  \ |___ |__] | ___]  |  |___ |  \ 
  --
  -- select next input
  --
  with mul_reg_sel select
    i_reg_mult        <= reg_mult(2*PLASMA_DATA_WIDTH  - 1 downto PLASMA_DATA_WIDTH) & mult_a_in  when MUL_REG_LO,
                         mult_a_in & reg_mult(PLASMA_DATA_WIDTH - 1 downto 0)                     when MUL_REG_HI,
                         mul_data                                                                 when MUL_REG_MUL,
                         div_data                                                                 when MUL_REG_DIV,
                         reg_mult                                                                 when others;

  mult_register:
  process( control.clk )
  begin
    if rising_edge( control.clk ) then
      if control.rst = '1' then
        reg_mult          <= (others => '0');

        reg_mult_func     <= MIPS_FUNC_MFLO;

        state             <= s_IDLE;
      else
        if reg_en = '1' then
          reg_mult        <= i_reg_mult;
        end if;

        if func_en = '1' then
          reg_mult_func   <= mult_func;
        end if;

        state             <= i_state;           -- always active
      end if;
    end if;
  end process;

  -- ____ _  _ ___ ___  _  _ ___ 
  -- |  | |  |  |  |__] |  |  |  
  -- |__| |__|  |  |    |__|  | 
  --
  -- busy indication
  --
  -- mult_busy           <= c_mul.busy or c_div.busy;
  mult_busy           <= i_busy;      -- 1 clock cycle is necessary for change from ID to EX stage

  --
  -- data output
  --
  with mul_out_sel select
    mult_out          <= reg_mult(  PLASMA_DATA_WIDTH - 1 downto                 0) when MUL_OUT_LO,
                         reg_mult(2*PLASMA_DATA_WIDTH - 1 downto PLASMA_DATA_WIDTH) when others;
    
end architecture FPGA_mult;
