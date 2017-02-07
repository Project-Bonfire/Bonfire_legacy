-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma CONTROL LOGIC
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
-- FILENAME:      plasma_control.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    switches input for computational units
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
-- 3.0     05/2015    AS         made port more generic, removed FPU and imm 
--                                mux
-- --------------------------------------------------------------------------
library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

library PLASMA;
  use PLASMA.mips_instruction_set.ALL;
  use PLASMA.plasma_pack.ALL;

entity plasma_control_MIPSI_FPU is
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
end entity plasma_control_MIPSI_FPU;
--
architecture structure_plasma_control_MIPSI_FPU of plasma_control_MIPSI_FPU is

 -- -----------------------------------------------------
  -- ___  ____ ____ ____ ___  ____ ____ 
  -- |  \ |___ |    |  | |  \ |___ |__/ 
  -- |__/ |___ |___ |__| |__/ |___ |  \ 
  -- -----------------------------------------------------
  -- ---------- 1. STAGE: FETCH AND DECODE ---------------
  signal instr_dec            : t_plasma_word;

  --
  -- operation decode
  --
  alias i_opcode_dec          : t_mips_opcode   is instr_dec(31 downto 26);
  alias i_format_dec          : t_mips_format   is instr_dec(20 downto 16);
  alias i_func_dec            : t_mips_function is instr_dec( 5 downto  0);

  --
  -- FPU operation code
  --
  alias i_fpu_fmt_dec         : t_mips_reg_addr is instr_dec(25 downto 21); -- i_rs_dec
  alias i_fpu_func_dec        : t_mips_function is i_func_dec;
  alias i_fpu_cc_dec          : t_mips_cc       is instr_dec(10 downto 8);
  alias i_fpu_tf_dec          : std_logic       is instr_dec(16);

  --
  -- register addresses
  --
  alias i_rs_dec              : t_mips_reg_addr is instr_dec(25 downto 21);
  alias i_rt_dec              : t_mips_reg_addr is instr_dec(20 downto 16);
  alias i_rd_dec              : t_mips_reg_addr is instr_dec(15 downto 11);

  alias i_fpu_rs_dec          : t_mips_reg_addr is i_rd_dec;
  alias i_fpu_rt_dec          : t_mips_reg_addr is i_rt_dec;
  alias i_fpu_rd_dec          : t_mips_reg_addr is instr_dec(10 downto 6);

  --
  -- operation units control
  --
  signal i_unit_ctrl          : t_plasma_subunits_ctrl;
  signal i_fpu_mode           : t_fpu_mode;
  signal i_mem_func           : t_mips_opcode;

  constant FUNC_INIT          : t_mips_opcode         := (others => '0');     -- do nothing
  constant SHIFT_INIT         : t_mips_opcode         := b"10_0000";
  constant COMP_INIT          : t_mips_opcode         := b"01_1000"; 

  --
  -- pipelined mux control
  --
  signal i_src_out_select     : t_src_out_select;
  signal i_wb_select          : t_wb_select;
  
  --
  -- register bank access
  --
  signal i_reg_addr           : t_reg_addr;
  signal i_fpu_reg_addr       : t_reg_addr;

  --
  -- intern flags
  --
  signal flag_pc_store        : std_logic;              -- store pc value
  signal flag_branch          : std_logic;              -- branch command
  signal flag_fpu_branch      : std_logic;              -- FPU branch command
  signal flag_fpu_mem         : std_logic;              -- FPU memory access command

  signal flag_mult_unit       : std_logic;              -- indicates mult operation
  signal flag_fpu_unit        : std_logic;              -- indicates fpu operation
  signal flag_fpu_stall       : std_logic;              -- FPU no memory command

  -- ---------- 2. STAGE: EXECUTE ------------------------
  --
  -- pipelined register bank access type
  --
  type t_reg_bank_access is
    record
      we                      : std_logic;
      rd                      : t_mips_reg_addr;
    end record;

  --
  -- unit control
  --
  signal ex_pc_func           : t_pc_function;          -- pc after branch evaluation
  signal i_ex_rd              : t_mips_reg_addr;        -- rd after branch evaluation

  signal reg_ex_unit_ctrl     : t_plasma_subunits_ctrl;
  signal reg_ex_mem_func      : t_mips_opcode;

  --
  -- mux control
  --
  signal reg_ex_src_out_sel   : t_src_out_select;
  signal reg_ex_wb_sel        : t_wb_select;

  --
  -- register bank access
  --
  signal reg_ex_rb            : t_reg_bank_access;
  signal reg_ex_fpu_rb        : t_reg_bank_access;
  
  --
  -- intern flags
  --
  signal reg_ex_pc_store      : std_logic;
  signal reg_flag_branch      : std_logic;
  signal reg_ex_fpu_branch    : std_logic;
  signal reg_ex_fpu_mem       : std_logic;

  -- ---------- 3. STAGE: MEMORY ACCESS ------------------
  --
  -- unit control
  --
  signal reg_mem_mem_func     : t_mips_opcode;

  --
  -- mux control
  --
  signal reg_mem_wb_sel       : t_wb_select;

  --
  -- register bank access
  --
  signal reg_mem_rb           : t_reg_bank_access;
  signal reg_mem_fpu_rb       : t_reg_bank_access;

  --
  -- intern flags
  --
  signal reg_mem_fpu_mem      : std_logic;

  -- ---------- 4. STAGE: WRITE BACK ---------------------
  --
  -- register bank access
  --
  signal reg_wb_rb            : t_reg_bank_access;
  
  -- ---------- FORWARDING -------------------------------
  type t_forward_stage_flag is 
    record
      rd_zero   : std_logic;
      rs        : std_logic;
      rt        : std_logic;
    end record;
    
  type t_forward_flag is
    record
      ex        : t_forward_stage_flag;
      mem       : t_forward_stage_flag;
      wb        : t_forward_stage_flag;
    end record;
    
  signal forward_flags        : t_forward_flag;
  
  -- ---------- STALL LOGIC ------------------------------
  signal stall_ex_possible    : std_logic;              -- memory access in the previous command
  signal stall_ex_detect      : std_logic;              -- stall detection
  signal stall_unit_detect    : std_logic;              -- a unit causes stall
  signal stall_fpu_detect     : std_logic;              -- fpu stall detection

  signal i_stall              : std_logic;              -- intern stall flag

  -- ---------- BRANCH -----------------------------------
  signal branch_true          : std_logic;              -- branch should be taken
  signal fpu_branch_true      : std_logic;              -- FPU branch is true

  -- ---------- DEBUGGING --------------------------------
  --
begin

  -- --------------------------------------------------------------------------
  --  _____  ______ _____ ____  _____  ______ _____  
  -- |  __ \|  ____/ ____/ __ \|  __ \|  ____|  __ \ 
  -- | |  | | |__ | |   | |  | | |  | | |__  | |__) |
  -- | |  | |  __|| |   | |  | | |  | |  __| |  _  / 
  -- | |__| | |___| |___| |__| | |__| | |____| | \ \ 
  -- |_____/|______\_____\____/|_____/|______|_|  \_\
  -- --------------------------------------------------------------------------
  instr_dec                   <= instr_in;

  -- _     ____ ____ ___ ____ _  _    ____ _  _ ___     ___  ____ ____ ____ ___  ____ 
  -- | .   |___ |___  |  |    |__|    |__| |\ | |  \    |  \ |___ |    |  | |  \ |___ 
  -- | .   |    |___  |  |___ |  |    |  | | \| |__/    |__/ |___ |___ |__| |__/ |___ 
  -- --------------------------------------------------------------------------
  --
  -- UNIT and MUX control
  -- REGISTER BANK REGULAR ADDRESSES
  --
  -- ___  ____ ____ ____ ___  ____ 
  -- |  \ |___ |    |  | |  \ |___ 
  -- |__/ |___ |___ |__| |__/ |___ 
  decode_process: 
  process( instr_dec )
    variable    clear_rb_access     : boolean   := FALSE;
  begin
    -- -------------------------------------------------------------------
    -- ___  ____ ____ ____ _  _ _    ___    _  _ ____ _    _  _ ____ ____ 
    -- |  \ |___ |___ |__| |  | |     |     |  | |__| |    |  | |___ [__  
    -- |__/ |___ |    |  | |__| |___  |      \/  |  | |___ |__| |___ ___] 
    -- -------------------------------------------------------------------
    --
    -- SUBCOMPONENTS CONTROL
    --
    i_unit_ctrl                   <= (pc_func     => PLASMA_PC_INC, 
                                      alu_func    => i_opcode_dec, 
                                      shift_func  => SHIFT_INIT, 
                                      mult_func   => FUNC_INIT, 
                                      comp_func   => COMP_INIT);

    -- FPU :
    fpu_ctrl.operation            <= MIPS_FUNC_FMT_MOV;  -- do nothing
    fpu_ctrl.c_reg                <= '0';     -- no FPU control register access
    fpu_ctrl.fix                  <= '0';     -- no inter conversion
    fpu_ctrl.double               <= '0';     -- single precision

    -- memory control
    i_mem_func                    <= i_opcode_dec;        -- pass opcode

    --
    -- MUX CONTROL
    --
    -- source mux control: 
    mux_ctrl.src_imm     <= IMM_SIGN;    -- IMMEDIATE = SIGN EXTENDED
    mux_ctrl.src_b_imm   <= B_IMM_ON;    -- PASS IMMEDIATE VALUE FOR 2. source

    -- FPU intern muxes
    mux_fpu.fpu_id      <= FPU_DATA_INTERN;  -- intern FPU data

    -- coprocessor mux
    mux_fpu.cop         <= COP_SELECT_CORE;  -- MAIN CORE

    -- units mux control
    i_src_out_select     <= SRC_OUT_ALU;    -- ALU output

    -- write back control
    i_wb_select          <= WB_OP_UNIT;     -- unit output

    --
    -- REBULAR REGISTER BANK
    --
    i_reg_addr          <= (we => '1',        -- write access enable
                            rs => i_rs_dec,   -- 1. source
                            rt => i_rt_dec,   -- target
                            rd => i_rt_dec);  -- destination

    clear_rb_access     := FALSE;         -- access to regular register bank

    --
    -- FPU REGISTER BANK
    --
    i_fpu_mode          <= FPU_MODE_NONE; -- NO FPU register bank access
    i_fpu_reg_addr      <= ( we => '0',
                            rs => i_fpu_rs_dec,
                            rt => i_fpu_rt_dec,
                            rd => i_fpu_rd_dec);

    --
    -- INTERN FLAGS
    --
    flag_pc_store        <= '0';          -- store next pc value by linked jumps, disabled
    flag_branch          <= '0';          -- no branch command
    flag_fpu_branch      <= '0';          -- FPU branch command
    flag_fpu_mem         <= '0';          -- FPU memory access command

    flag_mult_unit       <= '0';          -- no mult operation
    flag_fpu_unit        <= '0';          -- no FPU operation
    flag_fpu_stall       <= '0';          -- FPU no memmory access command

    --
    -- DEBUGGING
    --
--synthesis translate_off
    i_sim_control.sim_message(core_idx) <= '0';
    i_sim_control.sim_stop              <= '0';
    i_sim_control.print_message         <= '0';
    i_sim_control.sim_finish            <= '0';
    i_sim_control.track_en(core_idx)    <= '0';
    i_sim_control.track_mark            <= '0';
--synthesis translate_on

    -- ------------ OPERATION DECODE -------------------------------------------------------------------
    case i_opcode_dec is
      -- ----------- REGISTER FORMAT -------------------------------------------------------------------
      when MIPS_OPCODE_REG    =>

        mux_ctrl.src_b_imm        <= B_IMM_OF;                                                        -- DEFAULT: cut immediate value passing
        i_reg_addr.rd             <= i_rd_dec;                                                        -- DEFAULT: destination is on rd field

        case i_func_dec is
          -- ------------------------------------ SHIFTER ----------------------------------------------
          when MIPS_FUNC_SLL    |
               MIPS_FUNC_SRL    |
               MIPS_FUNC_SRA      => i_unit_ctrl.shift_func <= i_func_dec;                            -- pass function

                                     mux_ctrl.src_imm       <= IMM_SHAMT;                             -- shift amount for immediate mux
                                     mux_ctrl.src_b_imm     <= B_IMM_ON;                              -- pass immediate value

                                     i_src_out_select       <= SRC_OUT_SHIFT;                         -- output from shifter

                                     i_reg_addr.rs          <= i_rt_dec;                              -- source is on rt field

          when MIPS_FUNC_SLLV   |
               MIPS_FUNC_SRLV   |
               MIPS_FUNC_SRAV     => i_unit_ctrl.shift_func <= i_func_dec;                            -- pass function

                                     i_src_out_select       <= SRC_OUT_SHIFT;                         -- output from shifter

                                     i_reg_addr.rs          <= i_rt_dec;                              -- 1. and 2. source are switched
                                     i_reg_addr.rt          <= i_rs_dec; 

          -- ------------------------------------ JUMP REGISTER ----------------------------------------
          when MIPS_FUNC_JR       => i_unit_ctrl.pc_func    <= PLASMA_PC_REG;                         -- pc operation code

                                     clear_rb_access        := TRUE;                                  -- no register bank access
                                     
          when MIPS_FUNC_JALR     => i_unit_ctrl.pc_func    <= PLASMA_PC_REG;                         -- pc operation code
                                     i_src_out_select       <= SRC_OUT_PC;                            -- output source select

                                     i_reg_addr.rd          <= MIPS_R_RA;                             -- return address

          -- ------------------------------------ INTERRUPTS -------------------------------------------
--synthesis translate_off     
          when MIPS_FUNC_SYSCALL  => 
              case( instr_dec(10 downto 6) ) is
                when b"00000"   => i_sim_control.sim_message(core_idx)  <= '1';
                when b"00001"   => i_sim_control.sim_stop               <= '1';
                when b"00010"   => i_sim_control.print_message          <= '1';
                when b"00011"   => i_sim_control.sim_finish             <= '1';
                when b"00100"   => i_sim_control.track_en(core_idx)     <= '1';
                when b"00101"   => i_sim_control.track_mark             <= '1';
                when others     =>           
              end case;
--synthesis translate_on
          -- when MIPS_FUNC_BREAK    =>

          -- ------------------------------------ MULTIPLICATOR ----------------------------------------
          when MIPS_FUNC_MFHI   |
               MIPS_FUNC_MFLO     => i_unit_ctrl.mult_func  <= i_func_dec;                            -- pass function

                                     i_src_out_select       <= SRC_OUT_MULT;                          -- output from mult

                                     flag_mult_unit         <= '1';                                   -- possible unit stall

          when MIPS_FUNC_MTHI   |
               MIPS_FUNC_MTLO   |
               MIPS_FUNC_MULT   |
               MIPS_FUNC_MULTU  |
               MIPS_FUNC_DIV    |
               MIPS_FUNC_DIVU     => i_unit_ctrl.mult_func  <= i_func_dec;                            -- pass function

                                     clear_rb_access        := TRUE;                                  -- no register bank access

                                     flag_mult_unit         <= '1';                                   -- possible unit stall
                                     
          -- ------------------------------------ ALU --------------------------------------------------
          when MIPS_FUNC_ADD    |
               MIPS_FUNC_ADDU   |
               MIPS_FUNC_SUB    |
               MIPS_FUNC_SUBU   |
               MIPS_FUNC_AND    |
               MIPS_FUNC_OR     |
               MIPS_FUNC_XOR    |
               MIPS_FUNC_NOR    |
               MIPS_FUNC_SLT    |
               MIPS_FUNC_SLTU     =>   i_unit_ctrl.alu_func      <= i_func_dec;                      -- pass function to ALU                                                               -- pass command to ALU

          when others             => 
--synthesis translate_off
                                      report "WARNING:Unknown function code " & sv2string( i_func_dec );
--synthesis translate_on
        end case;

      -- ----------------------------------- COPROCESSOR 1 (FPU)----------------------------------------------
      when MIPS_OPCODE_COP1    =>

        clear_rb_access               := TRUE;                                                              -- no register bank access

        flag_fpu_unit                 <= '1';                                                               -- possible unit stall 
        flag_fpu_stall                <= '1';                                                               -- FPU no memory command

        case i_fpu_fmt_dec is
          -- ------------------------------------ FPU ALU OPERATION ------------------------------------
          when  MIPS_FMT_FLOAT_SINGLE | 
                MIPS_FMT_FLOAT_DOUBLE | 
                MIPS_FMT_FIXED_WORD =>

            fpu_ctrl.operation            <= i_fpu_func_dec;                                          -- pass FPU operation

            if i_fpu_fmt_dec = MIPS_FMT_FLOAT_DOUBLE then fpu_ctrl.double <= '1'; end if;             -- double precision operation
            if i_fpu_fmt_dec = MIPS_FMT_FIXED_WORD   then fpu_ctrl.fix    <= '1'; end if;             -- integer (fix point) operation

            i_fpu_reg_addr.we        <= '1';                                                          -- write to FPU register bank

            if std_match(i_fpu_func_dec, MIPS_FUNC_FMT_COND) then
              i_fpu_mode                <= FPU_MODE_C;                                                -- COMPARATOR operation
            else
              i_fpu_mode                <= FPU_MODE_ALU;                                              -- ALU operation
            end if;            

          -- ------------------------------------ FPU BRANCH -------------------------------------------
          when MIPS_FMT_BRANCH    => mux_ctrl.src_imm         <= IMM_BRANCH;                          -- immediate mux control

                                     flag_branch              <= '1';                                 -- set branch flag
                                     flag_fpu_branch          <= '1';                                 -- set FPU branch flag 

          -- ------------------------------------ EXCHANGE DATA ----------------------------------------
          when MIPS_FMT_MTC       => mux_fpu.fpu_id           <= FPU_DATA_CORE;                       -- data from core

                                     i_fpu_mode               <= FPU_MODE_FGR;                        -- access to FPU register bank
                                     i_fpu_reg_addr.we        <= '1';                                 -- write enable
                                     i_fpu_reg_addr.rd        <= i_rd_dec;                            -- destination is on rd field

          when MIPS_FMT_CTC       => mux_fpu.fpu_id           <= FPU_DATA_CORE;                       -- data from core

                                     i_fpu_mode               <= FPU_MODE_CTC;                        -- access to FPU control register
                                     i_fpu_reg_addr.we        <= '1';                                 -- write enable

          when MIPS_FMT_MFC       => mux_fpu.cop              <= COP_SELECT_COP1;                     -- input data from FPU
                                     i_src_out_select         <= SRC_OUT_MEM_DATA;                    -- inject data from memory path

                                     i_reg_addr.we            <= '1';                                 -- write to regular register bank
                                     i_reg_addr.rd            <= i_rt_dec;                            -- destination is on rt field
                                     clear_rb_access          := FALSE;

          when MIPS_FMT_CFC       => mux_fpu.cop              <= COP_SELECT_COP1;                     -- input data from FPU
                                     i_src_out_select         <= SRC_OUT_MEM_DATA;                    -- inject data from memory path

                                     i_reg_addr.we            <= '1';                                 -- write to regular register bank
                                     i_reg_addr.rd            <= i_rt_dec;                            -- destination is on rt field
                                     clear_rb_access          := FALSE;


                                     fpu_ctrl.c_reg <= '1';                                           -- access to control register of FPU

          when others             =>
--synthesis translate_off
                                      report "WARNING:Unknown FPU function code " & sv2string( i_fpu_fmt_dec );
--synthesis translate_on
        end case;

      -- ------------------------------------ REGIMM ---------------------------------------------------
      when MIPS_OPCODE_REGIMM  =>

        i_unit_ctrl.comp_func      <= '0' & i_format_dec;                                             -- pass format

        mux_ctrl.src_imm           <= IMM_BRANCH;                                                     -- pass branch immediate value

        clear_rb_access            := TRUE;                                                           -- no register bank access

        flag_branch                <= '1';                                                            -- set branch command

        case i_format_dec is
          when MIPS_OPCODE_BLTZ |
               MIPS_OPCODE_BGEZ   =>                                                                  -- pass opcode
                                     
          when MIPS_OPCODE_BLTZAL  |
               MIPS_OPCODE_BGEZAL => i_src_out_select           <= SRC_OUT_PC;                        -- pc value as output source
                                     
                                     flag_pc_store              <= '1';                               -- set pc store flag 
          
          when others             => 
-- synthesis translate_off
                                     report "WARNING:Unknown format code " & sv2string( i_format_dec );
-- synthesis translate_on
        end case;

      when MIPS_OPCODE_BEQ    |
           MIPS_OPCODE_BNE    => i_unit_ctrl.comp_func      <= i_opcode_dec;                          -- pass function

                                 mux_ctrl.src_b_imm         <= B_IMM_OF;                              -- disable immediate pass
                                 mux_ctrl.src_imm           <= IMM_BRANCH;                            -- pass branch immediate

                                 clear_rb_access            := TRUE;                                  -- no register bank access

                                 flag_branch                <= '1';                                   -- set branch command
                                
      when MIPS_OPCODE_BLEZ   |
           MIPS_OPCODE_BGTZ   => i_unit_ctrl.comp_func      <= i_opcode_dec;                          -- pass function

                                 mux_ctrl.src_imm           <= IMM_BRANCH;                            -- pass branch immediate

                                 clear_rb_access            := TRUE;                                  -- no register bank access

                                 flag_branch                <= '1';                                   -- set branch command

      -- ------------------------------------ ALU ------------------------------------------------------
      when MIPS_OPCODE_ADDI   |
           MIPS_OPCODE_ADDIU  |
           MIPS_OPCODE_SLTI   | 
           MIPS_OPCODE_SLTIU  =>                                                                      -- pass operation code
                                 
      when MIPS_OPCODE_ANDI   |
           MIPS_OPCODE_ORI    |
           MIPS_OPCODE_XORI   => mux_ctrl.src_imm           <= IMM_UNSIGN;                            -- pass unsigned immediate

      when MIPS_OPCODE_LUI    => mux_ctrl.src_imm           <= IMM_HIGH;                              -- pass shifted immediate
                                 
      -- ------------------------------------ LOAD MEMORY ----------------------------------------------
      when MIPS_OPCODE_LB     |
           MIPS_OPCODE_LH     |
           MIPS_OPCODE_LWL    |
           MIPS_OPCODE_LW     |
           -- MIPS_OPCODE_LWR    |                                                                       -- COMPILER BUG !!
           MIPS_OPCODE_LBU    |
           MIPS_OPCODE_LHU    => i_unit_ctrl.alu_func       <= MIPS_FUNC_ADD;                         -- switch ALU to addition -> address calcultion

                                 i_wb_select                <= WB_MEMORY;                             -- pass memory data

      when MIPS_OPCODE_LWR    =>                                                                      -- DO NOTHING !!
                                 
                                 clear_rb_access            := TRUE;                                  -- no register bank access

      when MIPS_OPCODE_LWC1   => i_unit_ctrl.alu_func       <= MIPS_FUNC_ADD;                         -- switch ALU to addition -> address calcultion

                                 clear_rb_access            := TRUE;                                  -- no register bank access
                                 i_fpu_reg_addr.rd          <= i_rt_dec;                              -- destination is on rt field

                                 flag_fpu_mem               <= '1';                                   -- set FPU memory access flag

      -- ------------------------------------ STORE MEMORY ---------------------------------------------
      when MIPS_OPCODE_SB     |
           MIPS_OPCODE_SH     |
           MIPS_OPCODE_SWL    |
           MIPS_OPCODE_SW     |
           MIPS_OPCODE_SWR    => i_unit_ctrl.alu_func       <= MIPS_FUNC_ADD;                         -- switch ALU to addition -> address calcultion

                                 clear_rb_access            := TRUE;                                  -- no register bank access

      when MIPS_OPCODE_SWC1   => i_unit_ctrl.alu_func       <= MIPS_FUNC_ADD;                         -- switch ALU to addition -> address calcultion

                                 mux_fpu.cop                <= COP_SELECT_COP1;                       -- data from FPU

                                 clear_rb_access            := TRUE;                                  -- no register bank access
                                 i_fpu_reg_addr.rs          <= i_fpu_rt_dec;                          -- source is on rt field

      -- ------------------------------------ JUMP -----------------------------------------------------
      when MIPS_OPCODE_J      => i_unit_ctrl.pc_func        <= PLASMA_PC_IMM;                         -- pc = long immedate

                                 mux_ctrl.src_imm           <= IMM_JUMP;                              -- pass long immediate

                                 clear_rb_access            := TRUE;                                  -- no register bank access

      when MIPS_OPCODE_JAL    => i_unit_ctrl.pc_func        <= PLASMA_PC_IMM;                         -- pc = long immedate

                                 mux_ctrl.src_imm           <= IMM_JUMP;                              -- pass long immediate
                                 i_src_out_select           <= SRC_OUT_PC;                            -- pass pc value

                                 i_reg_addr.rd              <= MIPS_R_RA;                             -- return address

      when others             => 
--synthesis translate_off
                                report "Unknown opcode " & sv2string( i_opcode_dec );
--synthesis translate_on
    end case;

    --
    -- clear register bank access
    --
    if clear_rb_access then
      i_reg_addr.we     <= '0';                                               -- no write enable
      i_reg_addr.rd     <= MIPS_R_ZERO;                                       -- for forward logic
    end if;
  end process;
  -- --------------------------------------------------------------------------

  -- ____ ____ ____ _ _ _ ____ ____ ___  _ _  _ ____ 
  -- |___ |  | |__/ | | | |__| |__/ |  \ | |\ | | __ 
  -- |    |__| |  \ |_|_| |  | |  \ |__/ | | \| |__]
  --
  -- detect equal addresses
  --
  -- execution stage
  forward_flags.ex.rd_zero    <= '1'  when reg_ex_rb.rd = MIPS_R_ZERO  else '0';
  forward_flags.ex.rs         <= not forward_flags.ex.rd_zero   when i_reg_addr.rs = reg_ex_rb.rd   else '0';
  forward_flags.ex.rt         <= not forward_flags.ex.rd_zero   when i_reg_addr.rt = reg_ex_rb.rd   else '0';
  
  -- memory stage
  forward_flags.mem.rd_zero   <= '1'  when reg_mem_rb.rd = MIPS_R_ZERO  else '0';
  forward_flags.mem.rs        <= not forward_flags.mem.rd_zero  when i_reg_addr.rs = reg_mem_rb.rd  else '0';
  forward_flags.mem.rt        <= not forward_flags.mem.rd_zero  when i_reg_addr.rt = reg_mem_rb.rd  else '0';
  
  -- write back stage
  forward_flags.wb.rd_zero    <= '1'  when reg_wb_rb.rd = MIPS_R_ZERO  else '0';
  forward_flags.wb.rs         <= not forward_flags.wb.rd_zero   when i_reg_addr.rs = reg_wb_rb.rd   else '0';
  forward_flags.wb.rt         <= not forward_flags.wb.rd_zero   when i_reg_addr.rt = reg_wb_rb.rd   else '0';

  --
  -- set forwarded register bank addresses
  --
  forward_process:
  process( forward_flags )
  begin
    --
    -- -------- A SOURCE FORWARDING -----------------
    --
       if forward_flags.ex.rs   = '1' then  mux_ctrl.src_a  <=   SRC_OP_OUT;
    elsif forward_flags.mem.rs  = '1' then  mux_ctrl.src_a  <=   SRC_MEM_OUT;
    elsif forward_flags.wb.rs   = '1' then  mux_ctrl.src_a  <=   SRC_WB_OUT;
    else                                    mux_ctrl.src_a  <=   SRC_REG;
    end if;

    --
    -- -------- B SOURCE FORWARDING ------------------
    --
       if forward_flags.ex.rt   = '1' then  mux_ctrl.src_b  <=   SRC_OP_OUT;
    elsif forward_flags.mem.rt  = '1' then  mux_ctrl.src_b  <=   SRC_MEM_OUT;
    elsif forward_flags.wb.rt   = '1' then  mux_ctrl.src_b  <=   SRC_WB_OUT;
    else                                    mux_ctrl.src_b  <=   SRC_REG;
    end if;
  end process;
  
  -- ____ ___ ____ _    _       _    ____ ____ _ ____ 
  -- [__   |  |__| |    |       |    |  | | __ | |    
  -- ___]  |  |  | |___ |___    |___ |__| |__] | |___ 
  --
  -- 4. ID  EX  MEM  WB
  -- 3.     ID  EX   MEM  WB
  -- 2.         ID   EX   MEM  WB
  -- 1.              ID   EX   MEM  WB
  --                 /\
  --                 ||
  --
  -- data_stall: 1 + 2 + 3 remain in the corresponding stages 
  -- unit_stall: 1 + 2     remain in the corresponding stages
  -- ex_stall:   1         remain for 1 clock cycle in the ID stage
  -- prog_stall: 1         remain in the ID stage
  -- fpu_stall:  1         remain for 1 or 2 clock cycles in the ID stage
  --
  -- DETECTION:
  --
  -- prog_stall, data_stall: from memory
  -- unit_stall            : from subunits
  -- ex_stall              : destination address evaluation
  -- fpu_stall             : LWC1 command
  --
  stall_ex_possible           <= '1' when reg_ex_wb_sel   = WB_MEMORY else '0';                         -- previous command with memory access in execute stage
  stall_ex_detect             <= stall_ex_possible  and (forward_flags.ex.rs  or forward_flags.ex.rt);  -- fire only if stall possible

  stall_unit_detect           <= (flag_mult_unit and unit_busy.mult) or (flag_fpu_unit and unit_busy.fpu);-- current command accesses to busy unit

  stall_fpu_detect            <= flag_fpu_stall  and (reg_ex_fpu_mem or reg_mem_fpu_mem);               -- current command is FPU command and FPU to mem came previously

  --
  -- INTERN STALL
  --
  i_stall     <=    data_stall                      -- data cache stalls
                or  prog_stall                      -- instruction cache stalls
                or  stall_ex_detect                 -- data conflict with previous command
                or  stall_unit_detect               -- a unit is busy
                or  stall_fpu_detect;               -- fpu memory command

  --
  -- for DATAPATH stage registers control
  --
  stall_src.pc           <= i_stall;
  stall_src.data         <= data_stall;
  stall_src.unit         <= stall_unit_detect;

  -- --------------------------------------------------------------------------
  --  ____  _____            _   _  _____ _    _ 
  -- |  _ \|  __ \     /\   | \ | |/ ____| |  | |
  -- | |_) | |__) |   /  \  |  \| | |    | |__| |
  -- |  _ <|  _  /   / /\ \ | . ` | |    |  __  |
  -- | |_) | | \ \  / ____ \| |\  | |____| |  | |
  -- |____/|_|  \_\/_/    \_\_| \_|\_____|_|  |_|
  -- --------------------------------------------------------------------------
  --
  -- PROVIDE PC FUNCTION AND REGISTER BANK WRITE ADDRESS
  --
  --
  -- FPU branch evaluation
  --
  -- tf field indicates branch reference (true or false)
  -- this field should be equal with FPU flag cc (xor)
  -- if yes branch should be taken for appropriate command
  --
  fpu_branch_true             <= flag_fpu_branch and (not (fpu_cc xor i_fpu_tf_dec));

  --
  -- overall branch evaluation
  --
  branch_true                 <= reg_flag_branch and ( comp_out or reg_ex_fpu_branch );

  --
  -- branch process
  --
jump_branch_process:
  process( reg_ex_unit_ctrl.pc_func, reg_ex_rb.rd,
           branch_true,
           reg_ex_pc_store)
  begin
  
    ex_pc_func      <= reg_ex_unit_ctrl.pc_func;                             -- DEFAULT: decoded pc function
    i_ex_rd         <= reg_ex_rb.rd;                                         -- DEFAULT: decoded register bank address
  
  -- ---------- COMPARATOR OUTPUT -----------------
    if branch_true = '1' then                                                -- if branch should be taken
      ex_pc_func  <= PLASMA_PC_BRANCH;                                       -- PC should take calculated/immediate value
  -- ---------- PC STORE COMMAND ------------------
      if reg_ex_pc_store = '1' then                                          -- if pc value should be stored
        i_ex_rd   <= MIPS_R_RA;                                              -- set register bank write address to MIPS_RA
      end if;

    end if;
  end process;

  -- --------------------------------------------------------------------------
  --  _____ _____ _____  ______ _      _____ _   _ ______ 
  -- |  __ \_   _|  __ \|  ____| |    |_   _| \ | |  ____|
  -- | |__) || | | |__) | |__  | |      | | |  \| | |__   
  -- |  ___/ | | |  ___/|  __| | |      | | | . ` |  __|  
  -- | |    _| |_| |    | |____| |____ _| |_| |\  | |____ 
  -- |_|   |_____|_|    |______|______|_____|_| \_|______|
  -- --------------------------------------------------------------------------
  --
  -- PROVIDE PIPELINE REGISTERS
  --
pipeline_regs:
  process( control.clk )
  begin
    if rising_edge( control.clk ) then
      if control.rst = '1' then                                                   --  << RESET
        -- ############ << EXECUTION STAGE >> #################################
        reg_ex_unit_ctrl    <= (PLASMA_PC_INC, FUNC_INIT, SHIFT_INIT, FUNC_INIT, COMP_INIT );
        reg_ex_mem_func     <= FUNC_INIT;

        reg_ex_src_out_sel  <= SRC_OUT_ALU;
        reg_ex_wb_sel       <= WB_OP_UNIT;

        reg_ex_rb           <= ('0', MIPS_R_ZERO);
        reg_ex_fpu_rb       <= ('0', MIPS_R_ZERO);

        reg_ex_pc_store     <= '0';
        reg_flag_branch     <= '0';
        reg_ex_fpu_branch   <= '0';
        reg_ex_fpu_mem      <= '0';

        -- ############ << MEMORY STAGE >> ####################################
        reg_mem_mem_func    <= FUNC_INIT;

        reg_mem_wb_sel      <= WB_OP_UNIT;

        reg_mem_rb          <= ('0', MIPS_R_ZERO);
        reg_mem_fpu_rb      <= ('0', MIPS_R_ZERO);

        reg_mem_fpu_mem     <= '0';

        -- ############ << WRITE BACK STAGE >> ################################
        reg_wb_rb           <= ('0', MIPS_R_ZERO);

      else                                                                   -- << RISING_EDGE( CLK )
        -- ############ << EXECUTION STAGE >> #################################
        if i_stall = '0' then
          reg_ex_unit_ctrl    <= i_unit_ctrl;
          reg_ex_mem_func     <= i_mem_func;

          reg_ex_src_out_sel  <= i_src_out_select;
          reg_ex_wb_sel       <= i_wb_select;

          reg_ex_rb           <= (i_reg_addr.we, i_reg_addr.rd);
          reg_ex_fpu_rb       <= (i_fpu_reg_addr.we, i_fpu_reg_addr.rd);

          reg_ex_pc_store     <= flag_pc_store;
          reg_flag_branch     <= flag_branch;
          reg_ex_fpu_branch   <= fpu_branch_true;
        end if;

        if data_stall = '0' then                                            -- FPU stall should not stop this
          reg_ex_fpu_mem      <= flag_fpu_mem;
        end if;

        -- ############ << MEMORY STAGE >> ####################################
        if (data_stall = '0') and
           (stall_unit_detect = '0') then
          reg_mem_mem_func    <= reg_ex_mem_func;
          reg_mem_wb_sel      <= reg_ex_wb_sel;

          reg_mem_rb          <= (reg_ex_rb.we, i_ex_rd);
          reg_mem_fpu_rb      <= reg_ex_fpu_rb;
          reg_mem_fpu_mem     <= reg_ex_fpu_mem;
        end if;

        -- ############ << WRITE BACK STAGE >> ################################
        if data_stall = '0' then
          reg_wb_rb           <= reg_mem_rb;          
        end if;

      end if;
    end if;
  end process;

  -- --------------------------------------------------------------------------
  --   ____  _    _ _______ _____  _    _ _______ _____ 
  --  / __ \| |  | |__   __|  __ \| |  | |__   __/ ____|
  -- | |  | | |  | |  | |  | |__) | |  | |  | | | (___  
  -- | |  | | |  | |  | |  |  ___/| |  | |  | |  \___ \ 
  -- | |__| | |__| |  | |  | |    | |__| |  | |  ____) |
  --  \____/ \____/   |_|  |_|     \____/   |_| |_____/ 
  -- --------------------------------------------------------------------------
  -- _     ___  ____ ____ ____ ___  ____ 
  -- | .   |  \ |___ |    |  | |  \ |___ 
  -- | .   |__/ |___ |___ |__| |__/ |___ 
  --
  -- DECODE STAGE OUTPUTS
  --
  reg_addr.rs                 <= i_reg_addr.rs;
  reg_addr.rt                 <= i_reg_addr.rt;

  fpu_reg_addr.rs             <= i_fpu_reg_addr.rs;
  fpu_reg_addr.rt             <= i_fpu_reg_addr.rt;

  fpu_reg_addr.we             <= i_fpu_reg_addr.we and (not i_stall)
                                                    when reg_mem_fpu_mem = '0' else '1';
  fpu_reg_addr.rd             <= i_fpu_reg_addr.rd  when reg_mem_fpu_mem = '0' else reg_mem_fpu_rb.rd;

  fpu_ctrl.mode               <= i_fpu_mode         when reg_mem_fpu_mem = '0' else FPU_MODE_FGR;
  mux_fpu.fpu_mem             <= FPU_DATA_INTERN    when reg_mem_fpu_mem = '0' else FPU_DATA_CORE;

  -- _ _     ____ _  _ ____ ____ _  _ ___ ____ 
  -- | | .   |___  \/  |___ |    |  |  |  |___ 
  -- | | .   |___ _/\_ |___ |___ |__|  |  |___ 
  --
  -- EXECUTE STAGE OUTPUTS
  --
  unit_ctrl                   <= (ex_pc_func, reg_ex_unit_ctrl.alu_func, reg_ex_unit_ctrl.shift_func,
                                  reg_ex_unit_ctrl.mult_func, reg_ex_unit_ctrl.comp_func);

  --
  -- MUX CONTROL
  --
  mux_ctrl.src_out            <= reg_ex_src_out_sel;                                   -- operation unit output mux control

  
  -- _ _ _     _  _ ____ _  _ ____ ____ _   _ 
  -- | | | .   |\/| |___ |\/| |  | |__/  \_/  
  -- | | | .   |  | |___ |  | |__| |  \   |   
  --
  -- MEMORY STAGE OUTPUTS
  --
  mem_func                    <= reg_mem_mem_func;                                     -- memory access function
  
  mux_ctrl.wb                 <= reg_mem_wb_sel;                                       -- memory output mux control

  -- _ _  _     _ _ _ ____ _ ___ ____    ___  ____ ____ _  _ 
  -- | |  | .   | | | |__/ |  |  |___    |__] |__| |    |_/  
  -- |  \/  .   |_|_| |  \ |  |  |___    |__] |  | |___ | \_ 
  --
  -- WRITE BACK STAGE OUTPUTS
  --
  reg_addr.rd                 <= reg_wb_rb.rd;                                         -- register bank write address
  reg_addr.we                 <= reg_wb_rb.we;                                         -- register bank write enable

end architecture structure_plasma_control_MIPSI_FPU;
