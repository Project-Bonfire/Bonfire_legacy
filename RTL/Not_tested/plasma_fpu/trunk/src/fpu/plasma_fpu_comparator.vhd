-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma FPU comparator
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
-- FILENAME:      plasma_fpu_comparator.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION
--    
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

entity plasma_fpu_comparator is
  port (
    comp_a_in                 : in  t_plasma_dword;
    comp_b_in                 : in  t_plasma_dword;
    fpu_ctrl                  : in  t_fpu_ctrl;
    comp_out                  : out std_logic
  );
end entity plasma_fpu_comparator;


architecture behav_plasma_fpu_comparator of plasma_fpu_comparator is

begin

  process( comp_a_in, comp_b_in, fpu_ctrl )
    variable a_in     : float64;
    variable b_in     : float64;

    variable bool_cc  : Boolean;
  begin
    --
    -- convert input
    --
    if fpu_ctrl.double = '1' then
      a_in := Float64( comp_a_in );
      b_in := Float64( comp_b_in );
    else
      a_in := to_Float64( Float32( comp_a_in(31 downto 0)));
      b_in := to_Float64( Float32( comp_b_in(31 downto 0)));
    end if;

    --
    -- default values
    --
    bool_cc   := False;
    comp_out  <= '0';

    --
    -- partially implemented comparator functions
    --
    if fpu_ctrl.operation(5 downto 4) = "11" then
    case fpu_ctrl.operation is

      when MIPS_FUNC_FMT_C_F    => 
      when MIPS_FUNC_FMT_C_UN   => 
      when MIPS_FUNC_FMT_C_EQ   => bool_cc := a_in = b_in;
      when MIPS_FUNC_FMT_C_UEQ  =>
      when MIPS_FUNC_FMT_C_OLT  => bool_cc := a_in < b_in;
      when MIPS_FUNC_FMT_C_ULT  =>
      when MIPS_FUNC_FMT_C_OLE  =>
      when MIPS_FUNC_FMT_C_ULE  => bool_cc := not (a_in > b_in);
      when MIPS_FUNC_FMT_C_SF   => bool_cc := (a_in < b_in) or (a_in = b_in);
      when MIPS_FUNC_FMT_C_NGLE =>
      when MIPS_FUNC_FMT_C_SEQ  => bool_cc := a_in = b_in;
      when MIPS_FUNC_FMT_C_NGL  =>
      when MIPS_FUNC_FMT_C_LT   => bool_cc := a_in < b_in;
      when MIPS_FUNC_FMT_C_NGE  => bool_cc := (a_in > b_in) or (a_in = b_in);
      when MIPS_FUNC_FMT_C_LE   => bool_cc := (a_in < b_in) or (a_in = b_in);
      when MIPS_FUNC_FMT_C_NGT  => bool_cc := not (a_in > b_in);

      when others               => report "WARNING: Unknown FPU comparator command" & sv2string( fpu_ctrl.operation);

    end case;
    end if;

    --
    -- comparator output
    --
    if bool_cc then comp_out <= '1'; end if;

  end process;

end architecture behav_plasma_fpu_comparator;