-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma MAIN
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
-- FILENAME:      plasma.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    top of plasma design
--
--    SYNTHESIZABLE
--
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0      4/2014    AS         initial
-- 2.0      5/2015    AS         added branches: MIPS I or MIPS32r2
--                                 with and without FPU
-- --------------------------------------------------------------------------
library IEEE;
  use IEEE.std_logic_1164.ALL;

entity plasma is
    generic(
      core_idx                : natural := 0;
      FPU_FLAG                : string  := "OF";
      SIM_FLAG                : string  := "ON";
      DEBUG_FLAG              : string  := "OF"
    );
    port(
      clk                     : in  std_logic;
      rst                     : in  std_logic;
      instr_addr              : out std_logic_vector(31 downto 0);
      data_addr               : out std_logic_vector(31 downto 0);
      rd_mask                 : out std_logic_vector(3  downto 0);
      wr_mask                 : out std_logic_vector(3  downto 0);
      instr_stall             : in  std_logic;
      data_stall              : in  std_logic;
      instr_in                : in  std_logic_vector(31 downto 0);
      data_to_cpu             : in  std_logic_vector(31 downto 0);
      data_from_cpu           : out std_logic_vector(31 downto 0)
    );
end entity plasma;


library PLASMA;
  use PLASMA.mips_instruction_set.t_mips_opcode;
  use PLASMA.plasma_pack.ALL;

architecture structure_plasma of plasma is


  signal reg_addr           : t_reg_addr;
  signal stall_src          : t_stall_source;

  signal unit_busy          : t_unit_busy;
  signal comp_out           : std_logic;

  -- ############ MEMORY CONTROL INTERN #####
  signal mem_func           : t_mips_opcode;

  signal i_prog_addr        : t_plasma_word;
  signal i_data_addr        : t_plasma_word;
  signal instr              : t_plasma_word;

  signal prog_stall_in      : std_logic;
  signal data_stall_in      : std_logic;

  signal data_w             : t_plasma_word;
  signal data_r             : t_plasma_word;

begin

  
    SOFT_FPU: if FPU_FLAG = "OF" generate

      signal unit_ctrl          : t_plasma_subunits_ctrl;
      signal mux_ctrl           : t_plasma_mux_ctrl;

      for u1_control:   plasma_control_MIPSI  use entity PLASMA.plasma_control_MIPSI(structure_plasma_control_MIPSI);
      for u2_datapath:  plasma_datapath_MIPSI use entity PLASMA.plasma_datapath_MIPSI(structure_plasma_datapath_MIPSI);
    begin

    u1_control: plasma_control_MIPSI
      GENERIC MAP( core_idx   => core_idx )
      PORT MAP(
        control.clk => clk,                 control.rst   => rst,
        instr_in    => instr,

        prog_stall  => prog_stall_in,       data_stall    => data_stall_in,

        comp_out    => comp_out,            unit_busy     => unit_busy,

        reg_addr    => reg_addr,            mux_ctrl      => mux_ctrl,
        stall_src   => stall_src,           unit_ctrl     => unit_ctrl,

        mem_func   => mem_func
      );

    u2_datapath: plasma_datapath_MIPSI
      GENERIC MAP( core_idx     => core_idx,
                   SIM_FLAG     => SIM_FLAG, DEBUG_FLAG => DEBUG_FLAG)
      PORT MAP(
        control.clk => clk,                 control.rst   => rst,

        reg_addr    => reg_addr,            mux_ctrl      => mux_ctrl,
        stall_src   => stall_src,

        comp_out    => comp_out,            unit_busy     => unit_busy,

        unit_ctrl   => unit_ctrl,

        instr_addr  => i_prog_addr,         data_addr     => i_data_addr,
        instr_in    => instr,
        data_from_mem => data_r,            data_to_mem   => data_w
      );

    end generate;

    HARD_FPU: if FPU_FLAG = "ON" generate

      signal unit_ctrl          : t_plasma_subunits_ctrl;
      signal fpu_ctrl           : t_fpu_ctrl;

      signal mux_ctrl           : t_plasma_mux_ctrl;
      signal mux_fpu            : t_plasma_mux_fpu;

      signal fpu_reg_addr       : t_reg_addr;
      signal fpu_cc             : std_logic;

      for u1_control:   plasma_control_MIPSI_FPU  use entity PLASMA.plasma_control_MIPSI_FPU(structure_plasma_control_MIPSI_FPU);
      for u2_datapath:  plasma_datapath_MIPSI_FPU use entity PLASMA.plasma_datapath_MIPSI_FPU(structure_plasma_datapath_MIPSI_FPU);

    begin

    u1_control: plasma_control_MIPSI_FPU
      GENERIC MAP( core_idx   => core_idx )
      PORT MAP(
        control.clk => clk,                 control.rst   => rst,
        instr_in    => instr,

        prog_stall  => prog_stall_in,       data_stall    => data_stall_in,

        comp_out    => comp_out,            fpu_cc        => fpu_cc,         unit_busy     => unit_busy,

        reg_addr    => reg_addr,            fpu_reg_addr  => fpu_reg_addr,

        mux_ctrl    => mux_ctrl,            mux_fpu       => mux_fpu,
        stall_src   => stall_src,           unit_ctrl     => unit_ctrl,      fpu_ctrl      => fpu_ctrl,

        mem_func   => mem_func
      );

    u2_datapath: plasma_datapath_MIPSI_FPU
      GENERIC MAP( core_idx     => core_idx,
                   SIM_FLAG     => SIM_FLAG, DEBUG_FLAG => DEBUG_FLAG)
      PORT MAP(
        control.clk => clk,                 control.rst   => rst,

        reg_addr    => reg_addr,            fpu_reg_addr  => fpu_reg_addr,
        mux_ctrl    => mux_ctrl,            mux_fpu       => mux_fpu,
        stall_src   => stall_src,

        comp_out    => comp_out,            fpu_cc        => fpu_cc,        unit_busy     => unit_busy,

        unit_ctrl   => unit_ctrl,           fpu_ctrl      => fpu_ctrl,

        instr_addr  => i_prog_addr,         data_addr     => i_data_addr,
        instr_in    => instr,
        data_from_mem => data_r,            data_to_mem   => data_w
      );

    end generate; -- FPU

  -- _  _ ____ _  _ ____ ____ _   _    ____ ____ _  _ ___ ____ ____ _    
  -- |\/| |___ |\/| |  | |__/  \_/     |    |  | |\ |  |  |__/ |  | |    
  -- |  | |___ |  | |__| |  \   |      |___ |__| | \|  |  |  \ |__| |___ 
  u3_mem_ctrl: plasma_mem_ctrl
    PORT MAP(
      clk             => clk,             reset           => rst,

      mem_func        => mem_func,
      prog_addr_in    => i_prog_addr,     data_addr_in    => i_data_addr,
      data_w_in       => data_w,

      prog_stall_in   => instr_stall,     data_stall_in   => data_stall,
      prog_in         => instr_in,        data_r_in       => data_to_cpu,

      prog_stall_out  => prog_stall_in,   data_stall_out  => data_stall_in,
      prog_out        => instr,           data_r_out      => data_r,

      prog_addr_out   => instr_addr,      data_addr_out   => data_addr,
      wr_mask_out     => wr_mask,         rd_mask_out     => rd_mask,
      data_w_out      => data_from_cpu
    );

end architecture structure_plasma;