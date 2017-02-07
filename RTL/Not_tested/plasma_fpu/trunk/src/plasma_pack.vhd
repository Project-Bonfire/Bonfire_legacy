-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma Misc. Package
-- AUTHOR:      Alex Schoenberger (Alex.Schoenberger@ies.tu-darmstadt.de)
--
-- www.ies.tu-darmstadt.de
-- TU Darmstadt
-- Institute for Integrated Systems
-- Merckstr. 25
-- 
-- 64283 Darmstadt - GERMANY
-- --------------------------------------------------------------------------
-- PROJECT:       Plasma CPU core with FPU
-- FILENAME:      plasma_pack.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    constants, file types, ports and debugging signals for main core
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0      4/2014    AS         initial
-- --------------------------------------------------------------------------
library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

--pragma translate_off
   use IEEE.std_logic_textIO.ALL;

library STD;
  use STD.textio.ALL;
--pragma translate_on

library PLASMA;
  use PLASMA.mips_instruction_set.ALL;

package plasma_pack is
  -- ------------------------------------------------------------------------------------------------------------------
  --   _____ ______ _   _ ______ _____            _         _____ ____  _   _  _____ _______       _   _ _______ _____ 
  --  / ____|  ____| \ | |  ____|  __ \     /\   | |       / ____/ __ \| \ | |/ ____|__   __|/\   | \ | |__   __/ ____|
  -- | |  __| |__  |  \| | |__  | |__) |   /  \  | |      | |   | |  | |  \| | (___    | |  /  \  |  \| |  | | | (___  
  -- | | |_ |  __| | . ` |  __| |  _  /   / /\ \ | |      | |   | |  | | . ` |\___ \   | | / /\ \ | . ` |  | |  \___ \ 
  -- | |__| | |____| |\  | |____| | \ \  / ____ \| |____  | |___| |__| | |\  |____) |  | |/ ____ \| |\  |  | |  ____) |
  --  \_____|______|_| \_|______|_|  \_\/_/    \_\______|  \_____\____/|_| \_|_____/   |_/_/    \_\_| \_|  |_| |_____/ 
  -- ------------------------------------------------------------------------------------------------------------------
  --
  -- DATA AND ADDRESS WIDTH 
  --
  constant PLASMA_DATA_WIDTH              : natural         := 32;                    -- data width
  constant PLASMA_ADDR_WIDTH              : natural         := PLASMA_DATA_WIDTH;     -- address width equal data width

  --
  -- REGISTERS 
  --
  constant PLASMA_REG_ADDR_WIDTH          : natural         := 5;                     -- 2**5 = 32 registers

  --
  -- MEMORY
  --
  constant PLASMA_MEM_CELL_WIDTH          : natural         := 8;                     -- width of memory cell

  -- ------------------------------------------------------------------------------------------------------------------
  --  __  __ _____ _____   _____       _____ ____  _   _  _____ _______       _   _ _______ _____ 
  -- |  \/  |_   _|  __ \ / ____|     / ____/ __ \| \ | |/ ____|__   __|/\   | \ | |__   __/ ____|
  -- | \  / | | | | |__) | (___      | |   | |  | |  \| | (___    | |  /  \  |  \| |  | | | (___  
  -- | |\/| | | | |  ___/ \___ \     | |   | |  | | . ` |\___ \   | | / /\ \ | . ` |  | |  \___ \ 
  -- | |  | |_| |_| |     ____) |    | |___| |__| | |\  |____) |  | |/ ____ \| |\  |  | |  ____) |
  -- |_|  |_|_____|_|    |_____/      \_____\____/|_| \_|_____/   |_/_/    \_\_| \_|  |_| |_____/ 
  -- ------------------------------------------------------------------------------------------------------------------
  --
  -- SHIFTER WIDTH
  --
  constant PLASMA_SHIFTER_WIDTH           : natural         := 5;                     -- 2**5 = 32 is maximal number of possible shifts

  --
  -- READ/WRITE MASK
  --
  constant PLASMA_MASK_WIDTH              : natural         := 4;                     -- maks for byte, short und int

  -- ------------------------------------------------------------------------------------------------------------------
  ---  _____ ______ _   _ ______ _____            _        _________     _______  ______  _____ 
  --  / ____|  ____| \ | |  ____|  __ \     /\   | |      |__   __\ \   / /  __ \|  ____|/ ____|
  -- | |  __| |__  |  \| | |__  | |__) |   /  \  | |         | |   \ \_/ /| |__) | |__  | (___  
  -- | | |_ |  __| | . ` |  __| |  _  /   / /\ \ | |         | |    \   / |  ___/|  __|  \___ \ 
  -- | |__| | |____| |\  | |____| | \ \  / ____ \| |____     | |     | |  | |    | |____ ____) |
  --  \_____|______|_| \_|______|_|  \_\/_/    \_\______|    |_|     |_|  |_|    |______|_____/ 
  -- ------------------------------------------------------------------------------------------------------------------
  --
  -- MAIN DATA TYPE
  --
  subtype t_plasma_word                   is  std_logic_vector(PLASMA_DATA_WIDTH  - 1 downto 0);
  subtype t_plasma_dword                  is  std_logic_vector(2*PLASMA_DATA_WIDTH- 1 downto 0);

  --
  -- REGISTER BANK
  --
  type t_reg_bank                         is  array(2**PLASMA_REG_ADDR_WIDTH      - 1 downto 0)  of  t_plasma_word;
  type t_reg_addr is
    record
      we                                  : std_logic;                -- write enable
      rs                                  : t_mips_reg_addr;          -- 1. operand address
      rt                                  : t_mips_reg_addr;          -- 2. operand address
      rd                                  : t_mips_reg_addr;          -- destinationa address
    end record;

  --
  -- memory
  --
  subtype t_plasma_mem_word               is std_logic_vector(PLASMA_MEM_CELL_WIDTH    - 1 downto 0);

  --
  -- MASK FOR BYTE, SHORT AND INT
  --
  subtype t_plasma_mask                   is std_logic_vector(PLASMA_MASK_WIDTH   - 1 downto 0);

  -- ____ ___ ____ _    _       _    ____ ____ _ ____ 
  -- [__   |  |__| |    |       |    |  | | __ | |    
  -- ___]  |  |  | |___ |___    |___ |__| |__] | |___ 
  --
  -- STALL SOURCES
  --
  type t_stall_source is
    record
      pc                                  : std_logic;                  -- programm counter should be stalled
      data                                : std_logic;                  -- data access is stalled
      unit                                : std_logic;                  -- calulation unit is busy
    end record;

  --
  -- SUBUNITS STALLS
  --
  type t_unit_busy is
    record
      mult                                : std_logic;
      fpu                                 : std_logic;
    end record;

  -- ____ ___  _  _    ____ ____ ____ ____ 
  -- |___ |__] |  |    |___ |    [__  |__/ 
  -- |    |    |__|    |    |___ ___] |  \ 
  --
  -- control and status register of the FPU
  --
  --
  -- FPU FLAGS
  --
  type t_fpu_flags is
    record
      v                                   : std_logic;                  -- invalid operation
      z                                   : std_logic;                  -- devide by zero
      o                                   : std_logic;                  -- overflow
      u                                   : std_logic;                  -- underflow
      i                                   : std_logic;                  -- inexact
    end record;

  --
  -- FPU ROUND MODE
  --
  subtype t_fpu_rm                        is std_logic_vector(1 downto 0); 

  --
  -- REGISTER FIELDS
  --
  type t_fpu_fcsr is
    record
      fcc                                 : std_logic_vector(7 downto 0);
      fs                                  : std_logic;
      unused                              : std_logic_vector(4 downto 0);
      cause_e                             : std_logic;
      cause                               : t_fpu_flags;
      enables                             : t_fpu_flags;
      flags                               : t_fpu_flags;
      rm                                  : std_logic_vector(1 downto 0);
    end record;

  -- --------------------------------------------------------------------
  -- _  _ _  _ _  _    ____ ____ _  _ ___  _ _  _ ____ 
  -- |\/| |  |  \/     |    |  | |\ | |  \ | |\ | | __ 
  -- |  | |__| _/\_    |___ |__| | \| |__/ | | \| |__] 
  --
  -- SOURCE MUXES
  --
  type t_src_select is (
      SRC_REG,                                -- register bank
      SRC_OP_OUT,                             -- operation unit output -> from ex-stage
      SRC_MEM_OUT,                            -- memory access output -> from memory
      SRC_WB_OUT                              -- register write store -> directly from register input
  );

  --
  -- IMMEDIATE VALUE
  --
  type t_imm_select is (
      IMM_SIGN,                               -- default value, signed extended
      IMM_UNSIGN,                             -- unsigned extended
      IMM_HIGH,                               -- for high load
      IMM_SHAMT,                              -- shifter amount value
      IMM_BRANCH,                             -- branch value
      IMM_JUMP                                -- absolute jump value
  );

  --
  -- MEMORY DATA VALUE
  --
  type t_b_imm_select is (
      B_IMM_ON,                               -- enable immediate value for source B
      B_IMM_OF                                -- disable immediate value for source B
  );

  --
  -- COPROCESSOR  MUX 
  --
  type t_cop_select is(
      COP_SELECT_CORE,                        -- regular core
      COP_SELECT_COP0,                        -- interrupt handler
      COP_SELECT_COP1                         -- FPU
  );

  --
  -- COPROCESSOR 1 (FPU) MUX
  --
  type t_fpu_select is (
      FPU_DATA_INTERN,                        -- intern data
      FPU_DATA_CORE                           -- data from main core
  );

  --
  -- RESULT MUX
  --
  type t_src_out_select is (
      SRC_OUT_ALU,                            -- ALU output
      SRC_OUT_MULT,                           -- MUL/DIV modul output
      SRC_OUT_SHIFT,                          -- SHIFTER output
      SRC_OUT_PC,                             -- PC value
      SRC_OUT_MEM_DATA                        -- data from MEMORY DATA path (for FPU)
  );

  --
  -- REGISTER DATA MUX
  --
  type t_wb_select is (
      WB_OP_UNIT,                             -- data from operation units
      WB_MEMORY                               -- data from memory
  );

  -- --------------------------------------------------------------------
  -- ____ ____ _  _ ___ ____ ____ _       ____ ____ ___  _ _  _ ____ 
  -- |    |  | |\ |  |  |__/ |  | |       |    |  | |  \ | |\ | | __ 
  -- |___ |__| | \|  |  |  \ |__| |___    |___ |__| |__/ | | \| |__] 
  --
  -- PROGRAM COUNTER
  --
  type t_pc_function is (
      PLASMA_PC_INC,                          -- increment PC value (default)
      PLASMA_PC_IMM,                          -- set PC to immediate value
      PLASMA_PC_REG,                          -- set PC to register value
      PLASMA_PC_BRANCH                        -- set PC to branch immediate value
  );

  --
  -- FPU OPERATION MODES
  --
  type t_fpu_mode is (
      FPU_MODE_NONE,                          -- nothing to do
      FPU_MODE_ALU,                           -- FPU alu operation
      FPU_MODE_FGR,                           -- access to FPU registers
      FPU_MODE_CTC,                           -- access to FPU control register
      FPU_MODE_C                              -- access to CC bit
    );

  -- --------------------------------------------------------------------
  -- _  _ ____ _  _ ____ ____ _   _    ____ ____ ___  _ _  _ ____ 
  -- |\/| |___ |\/| |  | |__/  \_/     |    |  | |  \ | |\ | | __ 
  -- |  | |___ |  | |__| |  \   |      |___ |__| |__/ | | \| |__] 
  --
  -- READ
  --
  constant PLASMA_MASK_READ32             : t_plasma_mask         := b"1111";
  constant PLASMA_MASK_READ32L            : t_plasma_mask         := b"1110";
  constant PLASMA_MASK_READ32R            : t_plasma_mask         := b"0111";
  constant PLASMA_MASK_READ16             : t_plasma_mask         := b"0011";
  constant PLASMA_MASK_READ8              : t_plasma_mask         := b"0001";
  constant PLASMA_MASK_ZERO               : t_plasma_mask         := b"0000";
  
  --
  -- WRITE
  --                                                           
  constant PLASMA_MASK_WRITE32            : t_plasma_mask         := b"1111";
  constant PLASMA_MASK_WRITE32L           : t_plasma_mask         := b"1110";
  constant PLASMA_MASK_WRITE32R           : t_plasma_mask         := b"0111";
  constant PLASMA_MASK_WRITE16            : t_plasma_mask         := b"0011";
  constant PLASMA_MASK_WRITE8             : t_plasma_mask         := b"0001";

  -- ____ ___  _  _    ____ ____ _  _ _  _ ___     _  _ ____ ___  ____ 
  -- |___ |__] |  |    |__/ |  | |  | |\ | |  \    |\/| |  | |  \ |___ 
  -- |    |    |__|    |  \ |__| |__| | \| |__/    |  | |__| |__/ |___ 
  constant PLASMA_FPU_RM_RN               : t_fpu_rm              := b"00";             -- round to nearest
  constant PLASMA_FPU_RM_RZ               : t_fpu_rm              := b"01";             -- round toward zero
  constant PLASMA_FPU_RM_RP               : t_fpu_rm              := b"10";             -- round towards plus infinity
  constant PLASMA_FPU_RM_RM               : t_fpu_rm              := b"11";             -- round towards minus infinity

  -- _  _ ____ _    ___     ____ ____ _  _ ____ ___ ____ _  _ ___ ____ 
  -- |__| |___ |    |__]    |    |  | |\ | [__   |  |__| |\ |  |  [__  
  -- |  | |___ |___ |       |___ |__| | \| ___]  |  |  | | \|  |  ___] 
  constant PLASMA_ZERO_WORD               : t_plasma_word     := (others => '0');
  constant PLASMA_ONES_WORD               : t_plasma_word     := (others => '1');
  constant PLASMA_SET_WORD                : t_plasma_word     := PLASMA_ZERO_WORD(PLASMA_DATA_WIDTH - 1 downto 1) & '1';
  constant PLASMA_INC_WORD                : t_plasma_word     := PLASMA_ZERO_WORD(PLASMA_DATA_WIDTH - 1 downto 3) & b"100";

  -- ------------------------------------------------------------------------------------------------------------------
  --  _____ _   _ _______ ______ _____  ______      _____ ______  _____ 
  -- |_   _| \ | |__   __|  ____|  __ \|  ____/\   / ____|  ____|/ ____|
  --   | | |  \| |  | |  | |__  | |__) | |__ /  \ | |    | |__  | (___  
  --   | | | . ` |  | |  |  __| |  _  /|  __/ /\ \| |    |  __|  \___ \ 
  --  _| |_| |\  |  | |  | |____| | \ \| | / ____ \ |____| |____ ____) |
  -- |_____|_| \_|  |_|  |______|_|  \_\_|/_/    \_\_____|______|_____/ 
  -- ------------------------------------------------------------------------------------------------------------------
  --
  -- GENERAL CONTROL INTERFACE
  --
  type t_main_control is
    record
      clk                                 : std_logic;                  -- clock signal
      rst                                 : std_logic;                  -- reset signal
    end record;

  --
  -- FPU CONTROL
  --
  type t_fpu_ctrl is
    record
      c_reg                               : std_logic;                  -- control register access
      fix                                 : std_logic;                  -- fixpoint flag
      double                              : std_logic;                  -- double flag
      mode                                : t_fpu_mode;                 -- write mode
      operation                           : t_mips_function;            -- operation mode
    end record;

  --
  -- operation units control (no FPU)
  --
  type t_plasma_subunits_ctrl is
    record
      pc_func                             : t_pc_function;              -- program counter
      alu_func                            : t_mips_function;            -- ALU
      shift_func                          : t_mips_function;            -- shifter
      mult_func                           : t_mips_function;            -- multiplier
      comp_func                           : t_mips_opcode;              -- comparator
    end record;

  --
  -- basic multiplexer control
  --
  type t_plasma_mux_ctrl is
    record
      src_a                               : t_src_select;               -- source mux
      src_b                               : t_src_select;               -- target mux
      src_imm                             : t_imm_select;               -- immediate value
      src_b_imm                           : t_b_imm_select;             -- immediate pass
      src_out                             : t_src_out_select;           -- memory stage input
      wb                                  : t_wb_select;                -- write back stage input
    end record;

  --
  -- additional muxes with FPU
  --  
  type t_plasma_mux_fpu is
    record
      cop                                 : t_cop_select;               -- data from coprocessor
      fpu_id                              : t_fpu_select;               -- ID stage of FPU
      fpu_mem                             : t_fpu_select;               -- MEM stage of FPU
    end record;

  --
  -- program counter output
  --
  type t_plasma_pc_out is
    record
      pc_out_inc                          : t_plasma_word;              -- incremented value -> next instr address
      pc_out_branch                       : t_plasma_word;              -- pc + immediate value -> branch taken address
      pc_out                              : t_plasma_word;              -- current address
    end record;

  -- ------------------------------------------------------------------------------------------------------------------
  --   _____ ____  __  __ _____   ____  _   _ ______ _   _ _______ _____ 
  --  / ____/ __ \|  \/  |  __ \ / __ \| \ | |  ____| \ | |__   __/ ____|
  -- | |   | |  | | \  / | |__) | |  | |  \| | |__  |  \| |  | | | (___  
  -- | |   | |  | | |\/| |  ___/| |  | | . ` |  __| | . ` |  | |  \___ \ 
  -- | |___| |__| | |  | | |    | |__| | |\  | |____| |\  |  | |  ____) |
  --  \_____\____/|_|  |_|_|     \____/|_| \_|______|_| \_|  |_| |_____/ 
  -- ------------------------------------------------------------------------------------------------------------------
  -- ___  ____ ____ _ ____ 
  -- |__] |__| [__  | |    
  -- |__] |  | ___] | |___ 
  --
  -- REGISTER BANK
  --
  component plasma_reg_bank is
    generic(
      core_idx                : natural := 0;
      DEBUG_FLAG              : string := "OF"
    );
    port(
      control                 : in  t_main_control;
      reg_addr                : in  t_reg_addr;
      reg_dest_new            : in  t_plasma_word;
      reg_source_out          : out t_plasma_word;
      reg_target_out          : out t_plasma_word
    );
  end component plasma_reg_bank;

  --
  -- ALU
  --
  component plasma_alu is
    port(
      alu_a_in                : in  t_plasma_word;
      alu_b_in                : in  t_plasma_word;
      alu_func                : in  t_mips_function;
      alu_out                 : out t_plasma_word
    );
  end component plasma_alu;

  --
  -- SHIFTER
  --
  component plasma_shifter is
    port(
      shift_in                : in  t_plasma_word;
      shift_amount            : in  t_mips_shamt;
      shift_func              : in  t_mips_function;
      shift_out               : out t_plasma_word
    );
  end component plasma_shifter;

  --
  -- MULTIPLICATOR
  --
  component plasma_mult is
    port(
      control                 : in  t_main_control;
      mult_a_in               : in  t_plasma_word;
      mult_b_in               : in  t_plasma_word;
      mult_func               : in  t_mips_function;
      mult_busy               : out std_logic;
      mult_out                : out t_plasma_word
    );
  end component plasma_mult;
  
  --
  -- COMPARATOR
  --
  component plasma_comparator is
    port(
      comp_a_in               : in  t_plasma_word;
      comp_b_in               : in  t_plasma_word;
      comp_func               : in  t_mips_opcode;
      comp_out                : out std_logic
    );
  end component plasma_comparator;
  
  -- ___  ____ ____ ____ ____ ____ _  _    ____ ____ _  _ _  _ ___ ____ ____ 
  -- |__] |__/ |  | | __ |__/ |__| |\/|    |    |  | |  | |\ |  |  |___ |__/ 
  -- |    |  \ |__| |__] |  \ |  | |  |    |___ |__| |__| | \|  |  |___ |  \ 
  --
  -- PROGRAM COUNTER
  --                
  component plasma_pc is
    port(
      control                 : in  t_main_control;
      stall                   : in  std_logic;
      pc_new_value            : in  t_plasma_word;
      pc_imm_in               : in  t_plasma_word;
      pc_out                  : out t_plasma_pc_out
    );
  end component plasma_pc;

  -- ____ ___  _  _ 
  -- |___ |__] |  | 
  -- |    |    |__| 
  --
  -- FPU REGISTER BANK
  --
  component plasma_fpu_reg_bank is
    generic(
      DEBUG_FLAG              : string := "OF"
    );
    port(
      control                 : in  t_main_control;
      reg_addr                : in  t_reg_addr;
      fpu_ctrl                : in  t_fpu_ctrl;
      alu_cause               : in  t_fpu_flags;
      comp_out                : in  std_logic;
      cc_out                  : out std_logic;
      reg_dest_new            : in  t_plasma_dword;
      reg_source_out          : out t_plasma_dword;
      reg_target_out          : out t_plasma_dword
    );
  end component plasma_fpu_reg_bank;

  --
  -- FPU ALU
  --
  component plasma_fpu_alu is
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
  end component plasma_fpu_alu;

  --
  -- FPU COMPARATOR
  --
  component plasma_fpu_comparator is
  port (
    comp_a_in                 : in  t_plasma_dword;
    comp_b_in                 : in  t_plasma_dword;
    fpu_ctrl                  : in  t_fpu_ctrl;
    comp_out                  : out std_logic
  );
  end component plasma_fpu_comparator;

  --
  -- PLASMA FPU TOP
  --
  component plasma_fpu is
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
  end component plasma_fpu;
  
  -- ____ ____ _  _ ___ ____ ____ _    
  -- |    |  | |\ |  |  |__/ |  | |    
  -- |___ |__| | \|  |  |  \ |__| |___ 
  --
  -- MIPS-I without FPU
  --
  component plasma_control_MIPSI is
    generic(
      core_idx                : natural := 0
    );
    port(
      control                 : in  t_main_control;
      instr_in                : in  t_plasma_word;       -- input instruction
      -- memory stalls
      prog_stall              : in  std_logic;
      data_stall              : in  std_logic;
      -- control flags
      comp_out                : in  std_logic;          -- comparator output
      unit_busy               : in  t_unit_busy;        -- busy flags of units      
      -- register bank control
      reg_addr                : out t_reg_addr;         -- register bank
      mux_ctrl                : out t_plasma_mux_ctrl;  -- datapath muxes
      stall_src               : out t_stall_source;     -- control registers of datapath
      unit_ctrl               : out t_plasma_subunits_ctrl; 
      -- memory access control
      mem_func                : out t_mips_opcode
    );
  end component plasma_control_MIPSI;

  --
  -- MIPS-I with FPU
  --
  component plasma_control_MIPSI_FPU is
    generic(
      core_idx                : natural := 0
    );
    port(
      control                 : in  t_main_control;
      instr_in                : in  t_plasma_word;       -- input instruction
      -- memory stalls
      prog_stall              : in  std_logic;
      data_stall              : in  std_logic;
      -- control flags
      comp_out                : in  std_logic;          -- comparator output
      fpu_cc                  : in  std_logic;          -- FPU comparator output
      unit_busy               : in  t_unit_busy;        -- busy flags of units      
      -- register bank control
      reg_addr                : out t_reg_addr;         -- register bank
      fpu_reg_addr            : out t_reg_addr;         -- FPU register bank
      mux_ctrl                : out t_plasma_mux_ctrl;  -- datapath muxes
      mux_fpu                 : out t_plasma_mux_fpu;   -- additional FPU muxes
      stall_src               : out t_stall_source;     -- control registers of datapath
      unit_ctrl               : out t_plasma_subunits_ctrl; 
      fpu_ctrl                : out t_fpu_ctrl;
      -- memory access control
      mem_func                : out t_mips_opcode
    );
  end component plasma_control_MIPSI_FPU;

  -- ___  ____ ___ ____ ___  ____ ___ _  _ 
  -- |  \ |__|  |  |__| |__] |__|  |  |__| 
  -- |__/ |  |  |  |  | |    |  |  |  |  | 
  --
  -- MIPS-I without FPU
  --
  component plasma_datapath_MIPSI is
    generic(
      core_idx                : natural := 0;
      SIM_FLAG                : string  := "ON";
      DEBUG_FLAG              : string  := "OF"
      );
    port(
      control                 : in  t_main_control;      
      -- input control mux and registers
      reg_addr                : in  t_reg_addr;
      mux_ctrl                : in  t_plasma_mux_ctrl;
      stall_src               : in  t_stall_source;
      -- output feedback signals
      comp_out                : out std_logic;
      unit_busy               : out t_unit_busy;
      -- operation units control
      unit_ctrl               : in  t_plasma_subunits_ctrl;
      -- data
      instr_addr              : out t_plasma_word;
      data_addr               : out t_plasma_word;

      instr_in                : in  t_plasma_word;
      data_from_mem           : in  t_plasma_word;
      data_to_mem             : out t_plasma_word
    );
  end component plasma_datapath_MIPSI;

  --
  -- MIPS-I with FPU
  --
  component plasma_datapath_MIPSI_FPU is
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
  end component plasma_datapath_MIPSI_FPU;

  -- _  _ ____ _  _ ____ ____ _   _    ____ ____ _  _ ___ ____ ____ _    
  -- |\/| |___ |\/| |  | |__/  \_/     |    |  | |\ |  |  |__/ |  | |    
  -- |  | |___ |  | |__| |  \   |      |___ |__| | \|  |  |  \ |__| |___ 
  component plasma_mem_ctrl is
    port(
      clk                     : in  std_logic;
      reset                   : in  std_logic;

      -- INPUT FROM PLASMA
      mem_func                : in  t_mips_opcode;
      prog_addr_in            : in  t_plasma_word;
      data_addr_in            : in  t_plasma_word;
      data_w_in               : in  t_plasma_word;

      -- INPUT FROM MEMORY
      prog_stall_in           : in  std_logic;
      data_stall_In           : in  std_logic;
      prog_in                 : in t_plasma_word;
      data_r_in               : in t_plasma_word;

      -- OUTPUT TO PLASMA
      prog_stall_out          : out std_logic;
      data_stall_out          : out std_logic;
      prog_out                : out t_plasma_word;
      data_r_out              : out t_plasma_word;

      -- OUTPUT TO MEMORY
      prog_addr_out           : out t_plasma_word;
      data_addr_out           : out t_plasma_word;
      wr_mask_out             : out t_plasma_mask;
      rd_mask_out             : out t_plasma_mask;
      data_w_out              : out t_plasma_word
    );
  end component plasma_mem_ctrl;

  -- ___  _    ____ ____ _  _ ____ 
  -- |__] |    |__| [__  |\/| |__| 
  -- |    |___ |  | ___] |  | |  | 
  component plasma is
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
  end component plasma;
                              
  -- ------------------------------------------------------------------------------------------------------------------
  --  _____  ______ ____  _    _  _____  _____ _____ _   _  _____ 
  -- |  __ \|  ____|  _ \| |  | |/ ____|/ ____|_   _| \ | |/ ____|
  -- | |  | | |__  | |_) | |  | | |  __| |  __  | | |  \| | |  __ 
  -- | |  | |  __| |  _ <| |  | | | |_ | | |_ | | | | . ` | | |_ |
  -- | |__| | |____| |_) | |__| | |__| | |__| |_| |_| |\  | |__| |
  -- |_____/|______|____/ \____/ \_____|\_____|_____|_| \_|\_____|
  -- ------------------------------------------------------------------------------------------------------------------  
-- synthesis translate_off
  function sv2string( input : std_logic_vector ) return string;
  function sv2reg(    input : t_mips_reg_addr  ) return string;

  -- ____ ____ ____    ___  ____ _  _ _  _ 
  -- |__/ |___ | __    |__] |__| |\ | |_/  
  -- |  \ |___ |__]    |__] |  | | \| | \_ 
  type t_v is array(0 to 1) of t_plasma_word;
  type t_a is array(0 to 3) of t_plasma_word;
  type t_t is array(0 to 9) of t_plasma_word;
  type t_s is array(0 to 8) of t_plasma_word;
  type t_k is array(0 to 1) of t_plasma_word;

  type t_plasma_rf is
    record
      we    : std_logic;
      zero  : t_plasma_word;
      at    : t_plasma_word;
      v     : t_v;
      a     : t_a;
      t     : t_t;
      s     : t_s;
      k     : t_k;
      gp    : t_plasma_word;
      sp    : t_plasma_word;
      ra    : t_plasma_word;
    end record;

  type t_noc_bank is array(0 to 2) of t_plasma_rf;
  signal plasma_rbank       : t_noc_bank;

  signal plasma_fpu_bank    : t_reg_bank;
  signal debug_prog_addr    : t_plasma_word;

  -- ____ _ _  _    ____ ____ _  _ ___ ____ ____ _    
  -- [__  | |\/|    |    |  | |\ |  |  |__/ |  | |    
  -- ___] | |  |    |___ |__| | \|  |  |  \ |__| |___ 
  type t_sim_control is
    record
      sim_message           : std_logic_vector(3 downto 0);
      sim_stop              : std_logic;
      print_message         : std_logic;
      sim_finish            : std_logic;
      track_en              : std_logic_vector(3 downto 0);
      track_mark            : std_logic;
  end record;

  signal i_sim_control      : t_sim_control;
-- synthesis translate_on
   
end package plasma_pack;


package body plasma_pack is

-- synthesis translate_off
  function sv2string( input : std_logic_vector ) return string 
  is
    variable l : line;
  begin
    hwrite( l, input, RIGHT, 6 );
    return l.all;
  end sv2string;

  function sv2reg( input : t_mips_reg_addr ) return string
  is
  begin
    case input is
      when "00000"  => return "zero";
      when "00001"  => return "at";
      when "00010"  => return "v0";
      when "00011"  => return "v1";
      when "00100"  => return "a0";
      when "00101"  => return "a1";
      when "00110"  => return "a2";
      when "00111"  => return "a3";
      when "01000"  => return "t0";
      when "01001"  => return "t1";
      when "01010"  => return "t2";
      when "01011"  => return "t3";
      when "01100"  => return "t4";
      when "01101"  => return "t5";
      when "01110"  => return "t6";
      when "01111"  => return "t7";
      when "10000"  => return "s0";
      when "10001"  => return "s1";
      when "10010"  => return "s2";
      when "10011"  => return "s3";
      when "10100"  => return "s4";
      when "10101"  => return "s5";
      when "10110"  => return "s6";
      when "10111"  => return "s7";
      when "11000"  => return "t8";
      when "11001"  => return "t9";
      when "11010"  => return "k0";
      when "11011"  => return "k1";
      when "11100"  => return "gp";
      when "11101"  => return "sp";
      when "11110"  => return "s8";
      when "11111"  => return "ra";
      when others   => return "unknown";
    end case;
  end sv2reg;
-- synthesis translate_on

end package body plasma_pack;