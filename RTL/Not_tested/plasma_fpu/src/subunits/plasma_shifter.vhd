-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma SHIFTER
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
-- FILENAME:      plasma_shifter.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    shifts input depending on amount value
--
--    SYNTHESIZABLE
--
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0      4/2014    AS         initial
-- 2.0      5/2015    AS         works with MIPS commands directly
-- --------------------------------------------------------------------------
library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

library PLASMA;
  use PLASMA.mips_instruction_set.ALL;
  use PLASMA.plasma_pack.ALL;

entity plasma_shifter is
    port(
      shift_in                : in  t_plasma_word;
      shift_amount            : in  t_mips_shamt;
      shift_func              : in  t_mips_function;
      shift_out               : out t_plasma_word
    );
end entity plasma_shifter;

-- synthesis translate_off
-- ____ _ _  _ _  _ _    ____ ___ _ ____ _  _ 
-- [__  | |\/| |  | |    |__|  |  | |  | |\ | 
-- ___] | |  | |__| |___ |  |  |  | |__| | \| 
architecture sim_shifter of plasma_shifter is

begin

  with shift_func select
    shift_out  <=  
        std_logic_vector(shift_left(unsigned(shift_in), to_integer(unsigned(shift_amount))))  when MIPS_FUNC_SLL | MIPS_FUNC_SLLV,
        std_logic_vector(shift_right(unsigned(shift_in),to_integer(unsigned(shift_amount))))  when MIPS_FUNC_SRL | MIPS_FUNC_SRLV,
        std_logic_vector(shift_right(signed(shift_in),  to_integer(unsigned(shift_amount))))  when MIPS_FUNC_SRA | MIPS_FUNC_SRAV,
        shift_in                                                                              when others;

end architecture sim_shifter;
-- synthesis translate_on

-- ____ ___  ____ ____ 
-- |___ |__] | __ |__| 
-- |    |    |__] |  | 
architecture FPGA_shifter of plasma_shifter is

    -- wire paths for generation
  type t_plasma_shifter_prop    is array(PLASMA_SHIFTER_WIDTH     downto 0) of t_plasma_word;   -- propagation path
  type t_plasma_shifter_comp    is array(PLASMA_SHIFTER_WIDTH - 1 downto 0) of t_plasma_word;   -- composition path
  
  -- control signals
  signal shifter_left           : std_logic;
  signal shifter_right          : std_logic;

  -- path signals
  signal shifter_fill           : t_plasma_word;
  signal shifter_prop           : t_plasma_shifter_prop;
  signal shifter_comp           : t_plasma_shifter_comp;

begin
  -- decode shifting command
  shifter_left        <= '1' when (shift_func = MIPS_FUNC_SLL) or (shift_func = MIPS_FUNC_SLLV)      else '0';
  shifter_right       <= '1' when (shift_func = MIPS_FUNC_SRL) or (shift_func = MIPS_FUNC_SRLV) 
                                  or (shift_func = MIPS_FUNC_SRA) or (shift_func = MIPS_FUNC_SRAV)   else '0';

  -- fill value
  shifter_fill        <= (others => shift_in(PLASMA_DATA_WIDTH - 1)) when (shift_func = MIPS_FUNC_SRA) or (shift_func = MIPS_FUNC_SRAV) else PLASMA_ZERO_WORD;

  -- injure first propagation vector
  shifter_prop(0)     <= shift_in;

shifter_structure: for i in 0 to PLASMA_SHIFTER_WIDTH - 1 generate
  shifter_mux_input:  
    shifter_comp(i)     <=  shifter_prop(i)(PLASMA_DATA_WIDTH - 2**i - 1 downto 0) & PLASMA_ZERO_WORD(2**i             - 1 downto    0) when shifter_left  = '1' else
                            shifter_fill(                       2**i - 1 downto 0) & shifter_prop(i)(PLASMA_DATA_WIDTH - 1 downto 2**i) when shifter_right = '1' else
                            shifter_prop(i);

  shifter_mux_step:   
    shifter_prop(i + 1) <=  shifter_comp(i) when shift_amount(i) = '1' else shifter_prop(i);
end generate;

  shift_out   <= shifter_prop(PLASMA_SHIFTER_WIDTH);

end architecture FPGA_shifter;
