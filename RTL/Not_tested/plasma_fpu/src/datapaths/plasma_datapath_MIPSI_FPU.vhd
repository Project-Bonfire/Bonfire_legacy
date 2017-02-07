-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma DATAPATH
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
-- FILENAME:      plasma_datapath.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    datapath of plasma core
--
--    SYNTHESIZABLE
--
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0      4/2014    AS         initial
-- 2.0     12/2014    AS         separated into MIPS1 simple architecture
--                               and with FPU included
-- 3.0     05/2015    AS         made generic port, included immediate mux
-- --------------------------------------------------------------------------
library IEEE;
  use IEEE.std_logic_1164.ALL;

library PLASMA;
  use PLASMA.mips_instruction_set.ALL;
  use PLASMA.plasma_pack.ALL;


entity plasma_datapath_MIPSI_FPU is
    generic(
      core_idx                : natural := 0;
      SIM_FLAG                : string  := "ON";
      DEBUG_FLAG              : string  := "OF"
      );
    port(
      control                 : in  t_main_control;      
      -- input control mux and registers
      reg_addr                : in  t_reg_addr;
      fpu_reg_addr            : in  t_reg_addr;
      mux_ctrl                : in  t_plasma_mux_ctrl;
      mux_fpu                 : in  t_plasma_mux_fpu;
      stall_src               : in  t_stall_source;
      -- output feedback signals
      comp_out                : out std_logic;
      fpu_cc                  : out std_logic;
      unit_busy               : out t_unit_busy;
      -- operation units control
      unit_ctrl               : in  t_plasma_subunits_ctrl;
      fpu_ctrl                : in  t_fpu_ctrl;
      -- data
      instr_addr              : out t_plasma_word;
      data_addr               : out t_plasma_word;

      instr_in                : in  t_plasma_word;
      data_from_mem           : in  t_plasma_word;
      data_to_mem             : out t_plasma_word
    );
end entity plasma_datapath_MIPSI_FPU;


architecture structure_plasma_datapath_MIPSI_FPU of plasma_datapath_MIPSI_FPU is

  -- ___  ____ ____ ____ ____ ____ _  _    ____ ____ _  _ _  _ ___ ____ ____ 
  -- |__] |__/ |  | | __ |__/ |__| |\/|    |    |  | |  | |\ |  |  |___ |__/ 
  -- |    |  \ |__| |__] |  \ |  | |  |    |___ |__| |__| | \|  |  |___ |  \ 
  signal pc_new_value         : t_plasma_word;                            -- next pc value
  signal pc_out_inc           : t_plasma_word;                            -- pc + 4
  signal pc_out_branch        : t_plasma_word;                            -- pc + 4 + (imm16 << 2)

  -- ____ ____ ____ _ ____ ___ ____ ____          ___  ____ _  _ _  _ 
  -- |__/ |___ | __ | [__   |  |___ |__/          |__] |__| |\ | |_/  
  -- |  \ |___ |__] | ___]  |  |___ |  \          |__] |  | | \| | \_ 
  signal regular_rd           : t_mips_reg_addr;
  signal reg_bank_a           : t_plasma_word;                            -- rs
  signal reg_bank_b           : t_plasma_word;                            -- rt

  -- _ _  _ _  _    _  _ _  _ _  _ 
  -- | |\/| |\/|    |\/| |  |  \/  
  -- | |  | |  |    |  | |__| _/\_ 
  alias i_shamt               : t_mips_shamt    is instr_in(10 downto  6);
  alias i_imm                 : t_mips_imm16    is instr_in(15 downto  0);
  alias i_imm_long            : t_mips_imm26    is instr_in(25 downto  0);

  signal i_imm_sign           : t_mips_imm16;
  signal i_imm_branch         : std_logic_vector(31 downto 18);

  constant ZERO_SHAMT         : std_logic_vector(31 downto  5) := (others => '0');
  constant ZERO_IMM16         : std_logic_vector(15 downto  0) := (others => '0');
  constant ZERO_IMM26         : std_logic_vector(31 downto 28) := (others => '0');

  -- _ _  _ ___  _  _ ___    _  _ _  _ _  _ ____ ____ 
  -- | |\ | |__] |  |  |     |\/| |  |  \/  |___ [__  
  -- | | \| |    |__|  |     |  | |__| _/\_ |___ ___] 
  signal src_a_in             : t_plasma_word;
  signal i_src_b_in           : t_plasma_word;
  signal src_b_in             : t_plasma_word;
  signal imm_in               : t_plasma_word;
  signal mem_data_in          : t_plasma_word;
  signal data_from_fpu        : t_plasma_word;

  -- ____ _  _    ____ ___ ____ ____ ____    ____ ____ ____ ____ 
  -- |___  \/     [__   |  |__| | __ |___    |__/ |___ | __ [__  
  -- |___ _/\_    ___]  |  |  | |__] |___    |  \ |___ |__] ___] 
  signal reg_src_a_in         : t_plasma_word;
  signal reg_src_b_in         : t_plasma_word;
  signal reg_imm_in           : t_plasma_word;
  signal reg_mem_data_in      : t_plasma_word;

  -- ____ _  _ ___ ___  _  _ ___    _  _ _  _ _  _ 
  -- |  | |  |  |  |__] |  |  |     |\/| |  |  \/  
  -- |__| |__|  |  |    |__|  |     |  | |__| _/\_ 
  signal alu_out              : t_plasma_word;
  signal shift_out            : t_plasma_word;
  signal mult_out             : t_plasma_word;

  signal op_data_out          : t_plasma_word;

  -- _  _ ____ _  _    ____ ___ ____ ____ ____    ____ ____ ____ 
  -- |\/| |___ |\/|    [__   |  |__| | __ |___    |__/ |___ | __ 
  -- |  | |___ |  |    ___]  |  |  | |__] |___    |  \ |___ |__] 
  signal reg_mem_result       : t_plasma_word;
  signal reg_mem_to_memory    : t_plasma_word;
  
  signal mem_data_out         : t_plasma_word;

  -- _ _ _ ___     ____ ___ ____ ____ ____    ____ ____ ____ 
  -- | | | |__]    [__   |  |__| | __ |___    |__/ |___ | __ 
  -- |_|_| |__]    ___]  |  |  | |__] |___    |  \ |___ |__] 
  signal reg_bank_in          : t_plasma_word;

begin   ---------- BEGIN -------------------- BEGIN --------------------- BEGIN -------------------
  -- ----------------------------------------------------------------------------------------------
  --  _____  _____   ____   _____ _____            __  __      _____ ____  _    _ _   _ _______ ______ _____  
  -- |  __ \|  __ \ / __ \ / ____|  __ \     /\   |  \/  |    / ____/ __ \| |  | | \ | |__   __|  ____|  __ \ 
  -- | |__) | |__) | |  | | |  __| |__) |   /  \  | \  / |   | |   | |  | | |  | |  \| |  | |  | |__  | |__) |
  -- |  ___/|  _  /| |  | | | |_ |  _  /   / /\ \ | |\/| |   | |   | |  | | |  | | . ` |  | |  |  __| |  _  / 
  -- | |    | | \ \| |__| | |__| | | \ \  / ____ \| |  | |   | |___| |__| | |__| | |\  |  | |  | |____| | \ \ 
  -- |_|    |_|  \_\\____/ \_____|_|  \_\/_/    \_\_|  |_|    \_____\____/ \____/|_| \_|  |_|  |______|_|  \_\
  -- ----------------------------------------------------------------------------------------------                                                                                                         
  --
  -- PC UNIT
  --
  u1_pc: plasma_pc
    PORT MAP(
      control       => control,
      stall         => stall_src.pc,
      pc_imm_in     => reg_imm_in,   
      pc_new_value  => pc_new_value,
      pc_out.pc_out_inc     => pc_out_inc,
      pc_out.pc_out_branch  => pc_out_branch,
      pc_out.pc_out         => instr_addr
    );

  -- ----------------------------------------------------------------------------------------------
  --  _____  ______ _____ _____  _____ _______ ______ _____      ____          _   _ _  __
  -- |  __ \|  ____/ ____|_   _|/ ____|__   __|  ____|  __ \    |  _ \   /\   | \ | | |/ /
  -- | |__) | |__ | |  __  | | | (___    | |  | |__  | |__) |   | |_) | /  \  |  \| | ' / 
  -- |  _  /|  __|| | |_ | | |  \___ \   | |  |  __| |  _  /    |  _ < / /\ \ | . ` |  <  
  -- | | \ \| |___| |__| |_| |_ ____) |  | |  | |____| | \ \    | |_) / ____ \| |\  | . \ 
  -- |_|  \_\______\_____|_____|_____/   |_|  |______|_|  \_\   |____/_/    \_\_| \_|_|\_\
  -- ----------------------------------------------------------------------------------------------
  --
  -- REGISTER BANK UNIT
  --
  u2_reg_bank: plasma_reg_bank
    GENERIC MAP(
      core_idx        => core_idx,
      DEBUG_FLAG      => DEBUG_FLAG
    )
    PORT MAP(
      control         => control,
      reg_addr        => reg_addr,
      reg_dest_new    => reg_bank_in,       
      reg_source_out  => reg_bank_a,      
      reg_target_out  => reg_bank_b
    );

  -- ----------------------------------------------------------------------------------------------
  -- ----------------------------------------------------------------------------------------------
  -- ######  #######  #####  ####### ######  #######     #####  #######    #     #####  ####### 
  -- #     # #       #     # #     # #     # #          #     #    #      # #   #     # #       
  -- #     # #       #       #     # #     # #          #          #     #   #  #       #       
  -- #     # #####   #       #     # #     # #####       #####     #    #     # #  #### #####   
  -- #     # #       #       #     # #     # #                #    #    ####### #     # #       
  -- #     # #       #     # #     # #     # #          #     #    #    #     # #     # #       
  -- ######  #######  #####  ####### ######  #######     #####     #    #     #  #####  ####### 
  -- ----------------------------------------------------------------------------------------------

  -- ----------------------------------------------------------------------------------------------
  --  _____ _   _ _____  _    _ _______     __  __ _    ___   ________  _____ 
  -- |_   _| \ | |  __ \| |  | |__   __|   |  \/  | |  | \ \ / /  ____|/ ____|
  --   | | |  \| | |__) | |  | |  | |      | \  / | |  | |\ V /| |__  | (___  
  --   | | | . ` |  ___/| |  | |  | |      | |\/| | |  | | > < |  __|  \___ \ 
  --  _| |_| |\  | |    | |__| |  | |      | |  | | |__| |/ . \| |____ ____) |
  -- |_____|_| \_|_|     \____/   |_|      |_|  |_|\____//_/ \_\______|_____/ 
  -- ----------------------------------------------------------------------------------------------
  --
  -- IMMEDIATE VALUE MUX
  --
  i_imm_sign        <= (others => i_imm(15));
  i_imm_branch      <= (others => i_imm(15));


  with mux_ctrl.src_imm select
    imm_in          <=  ZERO_IMM16   & i_imm                when IMM_UNSIGN,
                        i_imm & ZERO_IMM16                  when IMM_HIGH,
                        ZERO_SHAMT   & i_shamt              when IMM_SHAMT,
                        i_imm_branch & i_imm      & b"00"   when IMM_BRANCH,
                        ZERO_IMM26   & i_imm_long & b"00"   when IMM_JUMP,
                        i_imm_sign   & i_imm                when others;

  --
  -- SOURCE A MUX
  -- 
  with mux_ctrl.src_a select 
    src_a_in        <=  op_data_out       when SRC_OP_OUT,
                        mem_data_out      when SRC_MEM_OUT,
                        reg_bank_in       when SRC_WB_OUT,
                        reg_bank_a        when others;

  --
  -- SOURCE B MUX
  --             
  with mux_ctrl.src_b select 
    i_src_b_in      <=  op_data_out       when SRC_OP_OUT,
                        mem_data_out      when SRC_MEM_OUT,
                        reg_bank_in       when SRC_WB_OUT,
                        reg_bank_b        when others;

  --
  -- IMMEDIATE SWITCH
  --
  with mux_ctrl.src_b_imm select
    src_b_in        <= imm_in             when B_IMM_ON,
                       i_src_b_in         when others;

  --
  -- MEMORY INPUT
  --
  with mux_fpu.cop select
    mem_data_in     <=  data_from_fpu     when COP_SELECT_COP1,
                        i_src_b_in        when others;
  
  -- ----------------------------------------------------------------------------------------------
  -- ----------------------------------------------------------------------------------------------
  -- ####### #     # #######  #####  #     # ####### #######     #####  #######    #     #####  ####### 
  -- #        #   #  #       #     # #     #    #    #          #     #    #      # #   #     # #       
  -- #         # #   #       #       #     #    #    #          #          #     #   #  #       #       
  -- #####      #    #####   #       #     #    #    #####       #####     #    #     # #  #### #####   
  -- #         # #   #       #       #     #    #    #                #    #    ####### #     # #       
  -- #        #   #  #       #     # #     #    #    #          #     #    #    #     # #     # #       
  -- ####### #     # #######  #####   #####     #    #######     #####     #    #     #  #####  ####### 
  -- ----------------------------------------------------------------------------------------------

  -- ----------------------------------------------------------------------------------------------
  --  ________   __    _____ _______       _____ ______    _____  ______ _____  _____ 
  -- |  ____\ \ / /   / ____|__   __|/\   / ____|  ____|  |  __ \|  ____/ ____|/ ____|
  -- | |__   \ V /   | (___    | |  /  \ | |  __| |__     | |__) | |__ | |  __| (___  
  -- |  __|   > <     \___ \   | | / /\ \| | |_ |  __|    |  _  /|  __|| | |_ |\___ \ 
  -- | |____ / . \    ____) |  | |/ ____ \ |__| | |____   | | \ \| |___| |__| |____) |
  -- |______/_/ \_\  |_____/   |_/_/    \_\_____|______|  |_|  \_\______\_____|_____/ 
  -- ----------------------------------------------------------------------------------------------
ex_stage_registers:
  process( control.clk )  
  begin
    if rising_edge( control.clk ) then
      if control.rst = '1' then
        reg_src_a_in      <= PLASMA_ZERO_WORD;
        reg_src_b_in      <= PLASMA_ZERO_WORD;
        reg_imm_in        <= PLASMA_ZERO_WORD;

        reg_mem_data_in   <= PLASMA_ZERO_WORD;
      else
        if stall_src.pc = '0' then
          reg_src_a_in    <= src_a_in;
          reg_src_b_in    <= src_b_in;
          reg_imm_in      <= imm_in;

          reg_mem_data_in <= mem_data_in;
        end if;
      end if;
    end if;
  end process;

  -- ----------------------------------------------------------------------------------------------
  --   ____  _____  ______ _____         _______ _____ ____  _   _     _    _ _   _ _____ _______ _____ 
  --  / __ \|  __ \|  ____|  __ \     /\|__   __|_   _/ __ \| \ | |   | |  | | \ | |_   _|__   __/ ____|
  -- | |  | | |__) | |__  | |__) |   /  \  | |    | || |  | |  \| |   | |  | |  \| | | |    | | | (___  
  -- | |  | |  ___/|  __| |  _  /   / /\ \ | |    | || |  | | . ` |   | |  | | . ` | | |    | |  \___ \ 
  -- | |__| | |    | |____| | \ \  / ____ \| |   _| || |__| | |\  |   | |__| | |\  |_| |_   | |  ____) |
  --  \____/|_|    |______|_|  \_\/_/    \_\_|  |_____\____/|_| \_|    \____/|_| \_|_____|  |_| |_____/ 
  -- ----------------------------------------------------------------------------------------------
  -- ____ _ _  _ _  _ _    ____ ___ _ ____ _  _ 
  -- [__  | |\/| |  | |    |__|  |  | |  | |\ | 
  -- ___] | |  | |__| |___ |  |  |  | |__| | \| 
--synthesis translate_off
  SIM: if SIM_FLAG = "ON" generate
  --
  -- ALU
  --
  u3_alu: entity PLASMA.plasma_alu(sim_alu)
    PORT MAP(
      alu_a_in      => reg_src_a_in,        alu_b_in      => reg_src_b_in,
      alu_func      => unit_ctrl.alu_func, 
      alu_out       => alu_out
    );

  --
  -- SHIFTER
  --
  u4_shifter: entity PLASMA.plasma_shifter(sim_shifter)
    PORT MAP(
      shift_in      => reg_src_a_in,          shift_amount  => reg_src_b_in(4 downto 0),
      shift_func    => unit_ctrl.shift_func,
      shift_out     => shift_out
    );

  --
  -- MULTIPLICATOR
  --
  u5_mult: entity PLASMA.plasma_mult(sim_mult)
    PORT MAP(
      control       => control,
      mult_a_in     => reg_src_a_in,        mult_b_in     => reg_src_b_in,
      mult_func     => unit_ctrl.mult_func, mult_busy     => unit_busy.mult,
      mult_out      => mult_out
    );

  --
  -- COMPARATOR
  --
  u6_comp: entity PLASMA.plasma_comparator(structure_comparator)
    PORT MAP(
      comp_a_in     => reg_src_a_in,        comp_b_in     => reg_src_b_in,
      comp_func     => unit_ctrl.comp_func,
      comp_out      => comp_out
    );
  end generate;

  --
  -- FPU
  --
  u7_fpu: entity PLASMA.plasma_fpu(behav_plasma_fpu)
    GENERIC MAP( DEBUG_FLAG => DEBUG_FLAG)
    PORT MAP(
      control       => control,

      fpu_reg_addr  => fpu_reg_addr,    fpu_ctrl      => fpu_ctrl,

      busy          => unit_busy.fpu,   cc_out        => fpu_cc,

      fpu_id_sel    => mux_fpu.fpu_id,  fpu_mem_sel   => mux_fpu.fpu_mem,

      data_to_fpu     => i_src_b_in,
      data_from_fpu   => data_from_fpu,
      data_to_fpu_mem => data_from_mem
    );
--synthesis translate_on


  -- ____ ___  ____ ____ 
  -- |___ |__] | __ |__| 
  -- |    |    |__] |  | 
  FPGA: if SIM_FLAG = "OF" generate
  --
  -- ALU
  --
  u3_alu: entity PLASMA.plasma_alu(FPGA_alu)
    PORT MAP(
      alu_a_in      => reg_src_a_in,        alu_b_in      => reg_src_b_in,
      alu_func      => unit_ctrl.alu_func,
      alu_out       => alu_out
    );

  --
  -- SHIFTER
  --
  u4_shifter: entity PLASMA.plasma_shifter(FPGA_shifter)
    PORT MAP(
      shift_in      => reg_src_a_in,          shift_amount  => reg_src_b_in(4 downto 0),
      shift_func    => unit_ctrl.shift_func,
      shift_out     => shift_out
    );

  --
  -- MULTIPLICATOR
  --  
  u5_mult: entity PLASMA.plasma_mult(FPGA_mult)
    PORT MAP(
      control       => control,
      mult_a_in     => reg_src_a_in,              mult_b_in     => reg_src_b_in,
      mult_func     => unit_ctrl.mult_func,       mult_busy     => unit_busy.mult,
      mult_out      => mult_out
    );

  --
  -- COMPARATOR
  --
  u6_comp: entity PLASMA.plasma_comparator(structure_comparator)
    PORT MAP(
      comp_a_in     => reg_src_a_in,        comp_b_in     => reg_src_b_in,
      comp_func     => unit_ctrl.comp_func,
      comp_out      => comp_out
    );
  end generate;



  --   ____  _    _ _______ _____  _    _ _______   __  __ _    ___   __
  --  / __ \| |  | |__   __|  __ \| |  | |__   __| |  \/  | |  | \ \ / /
  -- | |  | | |  | |  | |  | |__) | |  | |  | |    | \  / | |  | |\ V / 
  -- | |  | | |  | |  | |  |  ___/| |  | |  | |    | |\/| | |  | | > <  
  -- | |__| | |__| |  | |  | |    | |__| |  | |    | |  | | |__| |/ . \ 
  --  \____/ \____/   |_|  |_|     \____/   |_|    |_|  |_|\____//_/ \_\
  --
  -- OUTPUT MUX
  --
  with mux_ctrl.src_out select 
    op_data_out      <= pc_out_inc        when SRC_OUT_PC,
                        shift_out         when SRC_OUT_SHIFT,
                        mult_out          when SRC_OUT_MULT,
                        reg_mem_data_in   when SRC_OUT_MEM_DATA,
                        alu_out           when others;

  --
  -- PC VALUE MUX
  --
  with unit_ctrl.pc_func select
    pc_new_value      <=  reg_imm_in      when PLASMA_PC_IMM,
                          reg_src_a_in    when PLASMA_PC_REG,
                          pc_out_branch   when PLASMA_PC_BRANCH,
                          pc_out_inc      when others;

  -- ----------------------------------------------------------------------------------------------
  -- ----------------------------------------------------------------------------------------------
  -- #     # ####### #     # ####### ######  #     #     #####  #######    #     #####  ####### 
  -- ##   ## #       ##   ## #     # #     #  #   #     #     #    #      # #   #     # #       
  -- # # # # #       # # # # #     # #     #   # #      #          #     #   #  #       #       
  -- #  #  # #####   #  #  # #     # ######     #        #####     #    #     # #  #### #####   
  -- #     # #       #     # #     # #   #      #             #    #    ####### #     # #       
  -- #     # #       #     # #     # #    #     #       #     #    #    #     # #     # #       
  -- #     # ####### #     # ####### #     #    #        #####     #    #     #  #####  ####### 
  -- ----------------------------------------------------------------------------------------------
  --
  -- MEMORY STAGE RESTIERS
  --
mem_stage_register:
  process( control.clk )  
  begin
    if rising_edge( control.clk ) then
      if control.rst = '1' then
        reg_mem_result      <= PLASMA_ZERO_WORD;
        reg_mem_to_memory   <= PLASMA_ZERO_WORD;
      else
        if (stall_src.data = '0') and
           (stall_src.unit = '0')      then
          reg_mem_result    <= op_data_out;
          reg_mem_to_memory <= reg_mem_data_in;
        end if;
      end if;
    end if;
  end process;

  --
  -- MEMORY ACCESS OUTPUT
  --
  data_addr          <= reg_mem_result;                                                -- memory access address
  data_to_mem        <= reg_mem_to_memory;                                             -- memory access data

  --
  -- MEMORY STAGE MUX
  --
  with mux_ctrl.wb select
    mem_data_out        <=  data_from_mem   when WB_MEMORY,
                            reg_mem_result  when others;

  -- ----------------------------------------------------------------------------------------------
  -- ----------------------------------------------------------------------------------------------
  -- #     # ######  ### ####### #######    ######     #     #####  #    #     #####  #######    #     #####  ####### 
  -- #  #  # #     #  #     #    #          #     #   # #   #     # #   #     #     #    #      # #   #     # #       
  -- #  #  # #     #  #     #    #          #     #  #   #  #       #  #      #          #     #   #  #       #       
  -- #  #  # ######   #     #    #####      ######  #     # #       ###        #####     #    #     # #  #### #####   
  -- #  #  # #   #    #     #    #          #     # ####### #       #  #            #    #    ####### #     # #       
  -- #  #  # #    #   #     #    #          #     # #     # #     # #   #     #     #    #    #     # #     # #       
  --  ## ##  #     # ###    #    #######    ######  #     #  #####  #    #     #####     #    #     #  #####  ####### 
  -- ----------------------------------------------------------------------------------------------
  --
  -- WRITE BACK STAGE REGISTER
  --
wb_stage_register:
  process( control.clk )  
  begin
    if rising_edge( control.clk ) then
      if control.rst = '1' then
        reg_bank_in   <= PLASMA_ZERO_WORD;
      else
        if (stall_src.data = '0') then
          reg_bank_in <= mem_data_out;
        end if;
      end if;
    end if;
  end process;

end architecture structure_plasma_datapath_MIPSI_FPU;

