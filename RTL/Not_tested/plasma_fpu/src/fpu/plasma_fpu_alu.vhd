-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma FPU ALU
-- AUTHORS:     Maximilian Reuter (maximilian.reuter@fs-etit.de)
--              Alex Schoenberger (Alex.Schoenberger@ies.tu-darmstadt.de)
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
-- FILENAME:      plasma_fpu_alu.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION
--    implementation of FPU ALU operations using FLI interface of ModelSIM
--
--    NOT SYNTHESIZABLE
--
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0       4/2015    MR         initial
-- 2.0       5/2015    AS         changed to plasma coding style 
-- --------------------------------------------------------------------------
library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

library FLOATFIXLIB;
  use FLOATFIXLIB.fixed_float_types.all;
  use FLOATFIXLIB.float_pkg.all;

library PLASMA;
  use PLASMA.mips_instruction_set.ALL;
  use PLASMA.plasma_pack.ALL;

entity plasma_fpu_alu is
  port (
    control                   : in  t_main_control;
    -- INPUT
    alu_a_in                  : in  t_plasma_dword;
    alu_b_in                  : in  t_plasma_dword;

    -- CONTROL
    fpu_ctrl                  : in  t_fpu_ctrl;
    round_mode                : in  t_fpu_rm;

    -- STATUS
    cause_e                   : out std_logic;
    cause                     : out t_fpu_flags;

    -- OUTPUT
    alu_out                   : out t_plasma_dword
  );
end entity plasma_fpu_alu;


-- ____ _    ____ ____ ___ ____ _ _  _ _    _ ___     ____ _  _ _    _   _ 
-- |___ |    |  | |__|  |  |___ |  \/  |    | |__]    |  | |\ | |     \_/  
-- |    |___ |__| |  |  |  |    | _/\_ |___ | |__]    |__| | \| |___   |   
--
-- use only floatfixlibrary
--
architecture fphdl_plasma_fpu_alu of plasma_fpu_alu is
  --
  -- intern calculation result
  --
  signal i_result         : t_plasma_dword  := (others => '0');

  --
  -- single precision parts
  --
  alias alu_a_in_S        : t_plasma_word is alu_a_in(PLASMA_DATA_WIDTH - 1 downto 0);
  alias alu_b_in_S        : t_plasma_word is alu_b_in(PLASMA_DATA_WIDTH - 1 downto 0);

  alias i_result_S        : t_plasma_word is i_result(PLASMA_DATA_WIDTH - 1 downto 0);

  --
  -- rouund type
  --
  signal rm               : round_type;

begin
  --
  -- define round mode
  --
  with round_mode select
    rm         <= round_zero      when "01",
                  round_inf       when "10",
                  round_neginf    when "11",
                  round_nearest   when others;

  -- ____ ____ _    ____ _  _ _    ____ ___ ____ 
  -- |    |__| |    |    |  | |    |__|  |  |___ 
  -- |___ |  | |___ |___ |__| |___ |  |  |  |___ 
  --
  -- decode operation and call extern function
  --
  cacl_proc:process( fpu_ctrl, alu_a_in, alu_b_in, rm )
  --cacl_proc:process( control.clk )
    --
    -- FLI INTERFACE
    --
    variable func               : integer;
    variable double             : integer;

    variable real_a_in          : real;
    variable real_b_in          : real;
    variable real_out           : real;

    --
    -- special values
    --
    variable    class_a         : valid_fpstate;
    variable    class_b         : valid_fpstate;
    variable    class_out       : valid_fpstate;

  begin
    -- if rising_edge( control.clk ) then
    --
    -- DEFAULT VALUES
    --
    -- result
    i_result(63 downto 32)      <= PLASMA_ZERO_WORD;
    i_result_S                  <= alu_a_in_S;

    --
    -- unimplemented instruction flag
    --
    cause_e                     <= '0';       -- not active

    --
    -- DECODE
    --
    case fpu_ctrl.operation is

      -- ############# PASS INPUT ############
      when MIPS_FUNC_FMT_MOV    =>

      -- ############# CONVERT TO SINGLE #####
      when MIPS_FUNC_FMT_CVTS   =>
        
        if fpu_ctrl.fix = '1' then                                                            -- integer -> single
          i_result_S  <= to_slv( to_Float( arg            => signed( alu_a_in_S ),
                                           exponent_width => 8,
                                           fraction_width => 23) );
        else                                                                                  -- double -> single
          i_result_S  <= to_slv( to_Float32( Float64(alu_a_in) ) );
        end if;


      -- ############# CONVERT TO DOUBLE #####
      when MIPS_FUNC_FMT_CVTD   =>

        if fpu_ctrl.fix = '1' then                                                            -- integer -> double
          i_result    <= to_slv( to_Float( arg            => signed( alu_a_in_S ),
                                           exponent_width => 11,
                                           fraction_width => 52) );
        else                                                                                  -- single -> double
          i_result    <= to_slv( to_Float64( Float32(alu_a_in_S) ) );
        end if;

      -- ############# CONVERT TO WORD #######
      when MIPS_FUNC_FMT_CVTW   =>

        if fpu_ctrl.double = '1' then                                                         -- double -> integer
          i_result_S  <= std_logic_vector( to_signed( to_integer(Float64(alu_a_in)), 
                                                      PLASMA_DATA_WIDTH) );
        else                                                                                  -- single -> integer
          i_result_S  <= std_logic_vector( to_signed( to_integer(Float32(alu_a_in_S)), 
                                                      PLASMA_DATA_WIDTH) );
        end if;            

      -- ############# CACLUATION ############
      when MIPS_FUNC_FMT_ADD    =>

        if fpu_ctrl.double = '1' then
          i_result    <= to_slv( add(       l => Float64(alu_a_in),   r => Float64(alu_b_in),   round_style => rm ));
        else
          i_result_S  <= to_slv( add(       l => Float32(alu_a_in_S), r => Float32(alu_b_in_S), round_style => rm ));
        end if;

      when MIPS_FUNC_FMT_SUB    =>

        if fpu_ctrl.double = '1' then
          i_result    <= to_slv( subtract(  l => Float64(alu_a_in),   r => Float64(alu_b_in),   round_style => rm ));
        else
          i_result_S  <= to_slv( subtract(  l => Float32(alu_a_in_S), r => Float32(alu_b_in_S), round_style => rm ));
        end if;

      when MIPS_FUNC_FMT_MUL    =>

        if fpu_ctrl.double = '1' then
          i_result    <= to_slv( multiply(  l => Float64(alu_a_in),   r => Float64(alu_b_in),   round_style => rm ));
        else
          i_result_S  <= to_slv( multiply(  l => Float32(alu_a_in_S), r => Float32(alu_b_in_S), round_style => rm ));
        end if;

      when MIPS_FUNC_FMT_DIV    =>

        if fpu_ctrl.double = '1' then
          i_result    <= to_slv( divide(    l => Float64(alu_a_in),   r => Float64(alu_b_in),   round_style => rm ));
        else
          i_result_S  <= to_slv( divide(    l => Float32(alu_a_in_S), r => Float32(alu_b_in_S), round_style => rm ));
        end if;

      when MIPS_FUNC_FMT_SQRT   =>

        if fpu_ctrl.double = '1' then
          i_result    <= to_slv( sqrt(      arg => Float64(alu_a_in),                           round_style => rm ));
        else
          i_result_S  <= to_slv( sqrt(      arg => Float32(alu_a_in_S),                         round_style => rm ));
        end if;

      when MIPS_FUNC_FMT_ABS    =>

        if fpu_ctrl.double = '1' then
          i_result    <= to_slv( abs(              Float64(alu_a_in)   ));
        else
          i_result_S  <= to_slv( abs(              Float32(alu_a_in_S) ));
        end if;

      when MIPS_FUNC_FMT_NEG    =>

        if fpu_ctrl.double = '1' then
          i_result    <= to_slv( -(                Float64(alu_a_in)   ));
        else
          i_result_S  <= to_slv( -(                Float32(alu_a_in_S) ));
        end if;

      when others               =>

        if not std_match( fpu_ctrl.operation, MIPS_FUNC_FMT_COND ) then                       -- check for comparator instruction
          cause_e        <= '1';                                                              -- if not -> unimplemented instruction
        end if;

    end case;

    -- ALU Status Bits
    --e: Unimplemented -> set before
    --v: Invalid
    --z: Divide by zero
    --o: Overflow
    --u: Underflow
    --i: Inexact result (denormalized)
    --
    -- default values
    --
    cause         <= ('0', '0', '0', '0', '0');

    if fpu_ctrl.double = '1' then
      class_a   := classFP( Float64( alu_a_in ) );
      class_b   := classFP( Float64( alu_b_in ) );
      class_out := classFP( to_Float( arg   => real_out, exponent_width => 11, fraction_width => 52) );
    else
      class_a   := classFP( Float32( alu_a_in_S ) );
      class_b   := classFP( Float32( alu_b_in_S ) );
      class_out := classFP( to_Float( arg   => real_out, exponent_width => 8,  fraction_width => 23) );
    end if;

    --
    -- CLASS OF 1. INPUT
    --
    case class_a is
      when neg_zero | pos_zero   => if fpu_ctrl.operation = MIPS_FUNC_FMT_DIV then cause.z <= '1'; end if;
      when nan      | quiet_nan  => cause.v  <= '1';
                                    if fpu_ctrl.double = '1' then i_result    <= to_slv(nanfp(11,52));
                                                             else i_result_S  <= to_slv(nanfp( 8,23)); end if;
      when others => 
    end case;

    --
    -- CLASS OF 2. INPUT
    --
    case class_b is
      when neg_zero | pos_zero   => if fpu_ctrl.operation = MIPS_FUNC_FMT_DIV then cause.z <= '1'; end if;
      when nan      | quiet_nan  => cause.v  <= '1';
                                    if fpu_ctrl.double = '1' then i_result    <= to_slv(nanfp(11,52));
                                                             else i_result_S  <= to_slv(nanfp( 8,23)); end if;
      when others => 
    end case;

    --
    -- CLASS OF OUTPUT
    --
    case class_out is
      when pos_inf      | neg_inf       =>  cause.o <= '1'; cause.i <= '1';
      when pos_denormal | neg_denormal  =>  cause.u <= '1'; cause.i <= '1';
      when others   =>
    end case;

    -- end if;
  end process;

  --
  -- OUTPUT
  --
  alu_out       <= i_result;

end architecture fphdl_plasma_fpu_alu;
