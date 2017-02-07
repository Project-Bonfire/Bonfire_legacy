-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma Coprocessor 1
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
-- FILENAME:      plasma_fpu.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    top of MIPS Coprocessor I - FPU
--
--    SYNTHESIZABLE
--
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0      9/2014    AS         initial
-- --------------------------------------------------------------------------
library IEEE;
  use IEEE.std_logic_1164.ALL;

library PLASMA;
  use PLASMA.mips_instruction_set.ALL;
  use PLASMA.plasma_pack.ALL;

entity plasma_fpu is
    generic(
      DEBUG_FLAG              : string  := "OF"
    );
    port(
      -- general
      control                 : in  t_main_control;
      -- operation and regbank
      fpu_reg_addr            : in  t_reg_addr;
      fpu_ctrl                : in  t_fpu_ctrl;
      -- status
      busy                    : out std_logic;
      cc_out                  : out std_logic;
      -- data muxes
      fpu_id_sel              : in  t_fpu_select;
      fpu_mem_sel             : in  t_fpu_select;
      -- data
      -- IF/ID stage
      data_to_fpu             : in  t_plasma_word;
      data_from_fpu           : out t_plasma_word;
      -- MEM stage
      data_to_fpu_mem         : in  t_plasma_word
    );
end entity plasma_fpu;



architecture behav_plasma_fpu of plasma_fpu is

  --
  -- ALU flags
  --
  signal alu_cause      : t_fpu_flags;

  --
  -- comparator output
  --
  signal comp_out       : std_logic;

  --
  -- data from/to register bank
  --
  signal reg_rs_out     : t_plasma_dword;
  signal reg_rt_out     : t_plasma_dword;
  signal reg_data_in    : t_plasma_dword;

  --
  -- alu input/output
  --
  signal fpu_alu_a_in   : t_plasma_dword;
  signal fpu_alu_out    : t_plasma_dword;

  --
  -- architecture choice
  --
  for u1_fpu_reg_bank: plasma_fpu_reg_bank    use entity PLASMA.plasma_fpu_reg_bank(structure_plasma_fpu_reg_bank);
  for u2_fpu_alu:      plasma_fpu_alu         use entity PLASMA.plasma_fpu_alu(fphdl_plasma_fpu_alu);
  for u3_fpu_comp:     plasma_fpu_comparator  use entity PLASMA.plasma_fpu_comparator(behav_plasma_fpu_comparator);

begin
  -- ___  ____ ___ ____    _  _ _  _ _  _ ____ ____ 
  -- |  \ |__|  |  |__|    |\/| |  |  \/  |___ [__  
  -- |__/ |  |  |  |  |    |  | |__| _/\_ |___ ___] 
  --
  -- IF/ID stage mux
  --
  with fpu_id_sel select 
    fpu_alu_a_in      <=  PLASMA_ZERO_WORD & data_to_fpu      when FPU_DATA_CORE,
                          reg_rs_out                          when others;

  --
  -- MEM stage mux
  --
  with fpu_mem_sel select 
    reg_data_in      <=   PLASMA_ZERO_WORD & data_to_fpu_mem  when FPU_DATA_CORE,
                          fpu_alu_out                         when others;

  -- ____ ____ _  _ ___  ____ _  _ ____ _  _ ___ ____ 
  -- |    |  | |\/| |__] |  | |\ | |___ |\ |  |  [__  
  -- |___ |__| |  | |    |__| | \| |___ | \|  |  ___] 
  --
  -- REGISTER BANK
  --
  u1_fpu_reg_bank: plasma_fpu_reg_bank
    GENERIC MAP( DEBUG_FLAG => DEBUG_FLAG )
    PORT MAP(
      control         => control,

      reg_addr        => fpu_reg_addr,  fpu_ctrl  => fpu_ctrl,

      alu_cause       => alu_cause,     comp_out  => comp_out,
      cc_out          => cc_out,

      reg_dest_new    => reg_data_in,
      reg_source_out  => reg_rs_out,    reg_target_out  => reg_rt_out
    );

  --
  -- ALU
  --
  u2_fpu_alu: plasma_fpu_alu
    PORT MAP(
      control         => control,

      alu_a_in        => fpu_alu_a_in,  alu_b_in    => reg_rt_out,

      fpu_ctrl        => fpu_ctrl,      round_mode  => "00",

      cause_e         => open,          cause       => alu_cause,

      alu_out         => fpu_alu_out
    );

  --
  -- COMPARATOR
  --
  u3_fpu_comp: plasma_fpu_comparator
    PORT MAP(
      comp_a_in       => fpu_alu_a_in,  comp_b_in   => reg_rt_out,

      fpu_ctrl        => fpu_ctrl,

      comp_out        => comp_out
    );

  -- ____ _  _ ___ ___  _  _ ___ 
  -- |  | |  |  |  |__] |  |  |  
  -- |__| |__|  |  |    |__|  |  
  --
  -- data to main core
  --
  data_from_fpu       <= reg_rs_out(PLASMA_DATA_WIDTH - 1 downto 0);

  --
  -- DELAY emulation
  --
  busy                <= '0';         -- no DELAY emulation

end architecture behav_plasma_fpu;
