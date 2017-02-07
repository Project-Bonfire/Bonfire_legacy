-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       MIPS Instruction Set Binary
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
-- FILENAME:      mips_instruction_set.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    selected subset of MIPS instruction set binary
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0      4/2014    AS         initial
-- --------------------------------------------------------------------------
library IEEE;
  use IEEE.std_logic_1164.ALL;

package mips_instruction_set is 
  -- --------------------------------------------------------------------------------------------------------
  --  _____ _   _  _____ _______ _____  _    _  _____ _______ _____ ____  _   _     _____ ______ _______ 
  -- |_   _| \ | |/ ____|__   __|  __ \| |  | |/ ____|__   __|_   _/ __ \| \ | |   / ____|  ____|__   __|
  --   | | |  \| | (___    | |  | |__) | |  | | |       | |    | || |  | |  \| |  | (___ | |__     | |   
  --   | | | . ` |\___ \   | |  |  _  /| |  | | |       | |    | || |  | | . ` |   \___ \|  __|    | |   
  --  _| |_| |\  |____) |  | |  | | \ \| |__| | |____   | |   _| || |__| | |\  |   ____) | |____   | |   
  -- |_____|_| \_|_____/   |_|  |_|  \_\\____/ \_____|  |_|  |_____\____/|_| \_|  |_____/|______|  |_|   
  -- -------------------------------------------------------------------------------------------------------- 
  -- _ _  _ ____ ___ ____ _  _ ____ ___ _ ____ _  _    ____ ____ _  _ ___  ____ _  _ ____ _  _ ___ ____ 
  -- | |\ | [__   |  |__/ |  | |     |  | |  | |\ |    |    |  | |\/| |__] |  | |\ | |___ |\ |  |  [__  
  -- | | \| ___]  |  |  \ |__| |___  |  | |__| | \|    |___ |__| |  | |    |__| | \| |___ | \|  |  ___] 
  --
  subtype t_mips_opcode         is std_logic_vector( 5 downto 0);                    -- operation code
  subtype t_mips_format         is std_logic_vector( 4 downto 0);                    -- format code
  subtype t_mips_function       is std_logic_vector( 5 downto 0);                    -- function code
  subtype t_mips_reg_addr       is std_logic_vector( 4 downto 0);                    -- register address
  subtype t_mips_shamt          is std_logic_vector( 4 downto 0);                    -- shift amount value
  subtype t_mips_imm11          is std_logic_vector(10 downto 0);                    -- immediate value for coprocessor
  subtype t_mips_imm16          is std_logic_vector(15 downto 0);                    -- immediate value for calculation/memory
  subtype t_mips_imm26          is std_logic_vector(25 downto 0);                    -- immmediate value for jumps

  subtype t_mips_fmt            is std_logic_vector( 4 downto 0);                    -- format for coprocessor
  subtype t_mips_cond           is std_logic_vector( 3 downto 0);                    -- FPU compare condition
  subtype t_mips_cc             is std_logic_vector( 2 downto 0);                    -- FPU condition code address
  subtype t_mips_z_branch       is std_logic_vector( 1 downto 0);                    -- FPU branch coding
  subtype t_mips_i_ctrl_bit     is std_logic; 


  -- --------------------------------------------------------------------------------------
  -- ____ ____ _  _ ____ ___ ____ ___ _  _ ___ ____ 
  -- |    |  | |\ | [__   |  |__|  |  |\ |  |  [__  
  -- |___ |__| | \| ___]  |  |  |  |  | \|  |  ___] 
  --
  -- SPECIAL REGISTER
  --        
  constant MIPS_R_ZERO          : t_mips_reg_addr           := b"0_0000";             -- zero value register        
  constant MIPS_R_RA            : t_mips_reg_addr           := b"1_1111";             -- return value register address                              

  -- --------------------------------------------------------------------------------------
  -- ____ _  _ _  _ ____ ___ _ ____ _  _ ____ _       ____ _  _ ____ ____ ___  _ _  _ ____ 
  -- |___ |  | |\ | |     |  | |  | |\ | |__| |       |___ |\ | |    |  | |  \ | |\ | | __ 
  -- |    |__| | \| |___  |  | |__| | \| |  | |___    |___ | \| |___ |__| |__/ | | \| |__] 
  -- -------------------------------------------------------------------------------------- 
  -- ____ ____ ____    ____ ____ ____ _ ____ ___ ____ ____    ____ ____ ____ _  _ ____ ___ 
  -- |___ |  | |__/    |__/ |___ | __ | [__   |  |___ |__/    |___ |  | |__/ |\/| |__|  |  
  -- |    |__| |  \    |  \ |___ |__] | ___]  |  |___ |  \    |    |__| |  \ |  | |  |  |  
  --
  --  opcode(6) & rs(5) & rt(5) & rd(5) & shamt(5) & funct(6)
  --
  constant MIPS_OPCODE_REG      : t_mips_opcode             := b"00_0000"; 
    --
    -- shifter operations
    constant MIPS_FUNC_SLL        : t_mips_function           := b"00_0000";      -- rd = rt << sa
    constant MIPS_FUNC_SRL        : t_mips_function           := b"00_0010";      -- rd = rt >> sa
    constant MIPS_FUNC_SRA        : t_mips_function           := b"00_0011";      -- rd = signed(rt) >> sa
    constant MIPS_FUNC_SLLV       : t_mips_function           := b"00_0100";      -- rd = rt << rs
    constant MIPS_FUNC_SRLV       : t_mips_function           := b"00_0110";      -- rd = rt >> rs
    constant MIPS_FUNC_SRAV       : t_mips_function           := b"00_0111";      -- rd = signed(rt) >> rs

    -- jump register
    constant MIPS_FUNC_JR         : t_mips_function           := b"00_1000";      -- pc = rs
    constant MIPS_FUNC_JALR       : t_mips_function           := b"00_1001";      -- pc = rs; rd = pc

    -- conditional move
    constant MIPS_FUNC_MOVZ       : t_mips_function           := b"00_1010";      -- if (rt = 0) rd = rs
    constant MIPS_FUNC_MOVN       : t_mips_function           := b"00_1011";      -- if (rt != 0) rd = rs

    -- syscall and break
    constant MIPS_FUNC_SYSCALL    : t_mips_function           := b"00_1100";      -- epc = pc; pc = 0x3c
    constant MIPS_FUNC_BREAK      : t_mips_function           := b"00_1101";      -- epc = pc; pc = 0x3c

    -- multiplication register moving
    constant MIPS_FUNC_MFHI       : t_mips_function           := b"01_0000";      -- rd = HI
    constant MIPS_FUNC_MTHI       : t_mips_function           := b"01_0001";      -- HI = rs
    constant MIPS_FUNC_MFLO       : t_mips_function           := b"01_0010";      -- rd = LO
    constant MIPS_FUNC_MTLO       : t_mips_function           := b"01_0011";      -- LO = rs

    -- multiplication/division
    constant MIPS_FUNC_MULT       : t_mips_function           := b"01_1000";      -- HI,LO = rs * rt
    constant MIPS_FUNC_MULTU      : t_mips_function           := b"01_1001";      -- HI,LO = signed(rs) * signed(rt)
    constant MIPS_FUNC_DIV        : t_mips_function           := b"01_1010";      -- HI = rs % rt; LO = rs / rt
    constant MIPS_FUNC_DIVU       : t_mips_function           := b"01_1011";      -- HI = rs % rt; LO = signed(rs) / sigend(rt)

    -- addition/substraction
    constant MIPS_FUNC_ADD        : t_mips_function           := b"10_0000";      -- rd = rs + rt
    constant MIPS_FUNC_ADDU       : t_mips_function           := b"10_0001";      -- rd = unsigned(rs) + unsigned(rt)
    constant MIPS_FUNC_SUB        : t_mips_function           := b"10_0010";      -- rd = rs - rt
    constant MIPS_FUNC_SUBU       : t_mips_function           := b"10_0011";      -- rd = unsigned(rs) - unsigned(rt)

    -- logic manipulation
    constant MIPS_FUNC_AND        : t_mips_function           := b"10_0100";      -- rd = rs and rt
    constant MIPS_FUNC_OR         : t_mips_function           := b"10_0101";      -- rd = rs or rt
    constant MIPS_FUNC_XOR        : t_mips_function           := b"10_0110";      -- rd = rs xor rt
    constant MIPS_FUNC_NOR        : t_mips_function           := b"10_0111";      -- rd = rs nor rt

    -- comparison
    constant MIPS_FUNC_SLT        : t_mips_function           := b"10_1010";      -- rd = rs < rt
    constant MIPS_FUNC_SLTU       : t_mips_function           := b"10_1011";      -- rd = unsigned(rs) < unsigend(rt)

  -- ____ ___  ____ ____ _ ____ _       _ _ 
  -- [__  |__] |___ |    | |__| |       | | 
  -- ___] |    |___ |___ | |  | |___    | | 
  --
  --  opcode(6) & rs(5) & rt(5) & rd(5) & shamt(5) & funct(6)
  --
  constant MIPS_OPCODE_SPECIAL2 : t_mips_opcode             := b"01_1100";     -- special2 insructions

    constant MIPS_FUNC_MADD       : t_mips_function           := b"00_0000";      --(HI,LO) = (HI,LO) + (rs*rt)
    constant MIPS_FUNC_MADDU      : t_mips_function           := b"00_0001";      --(HI,LO) = (HI,LO) + unsigned(rs*rt)

    constant MIPS_FUNC_MUL        : t_mips_function           := b"00_0010";      -- rd = rs * rt;

    constant MIPS_FUNC_MSUB       : t_mips_function           := b"00_0100";      -- (HI,LO) = (HI,LO) - (rs*rt)
    constant MIPS_FUNC_MSUBU      : t_mips_function           := b"00_0101";      -- (HI,LO) = (HI,LO) - unsigned(rs*rt)

  -- ____ ___  ____ ____ _ ____ _       _ _ _ 
  -- [__  |__] |___ |    | |__| |       | | | 
  -- ___] |    |___ |___ | |  | |___    | | | 
  --
  --  opcode(6) & rs(5) & rt(5) & rd(5) & shamt(5) & funct(6)
  --
  constant MIPS_OPCODE_SPECIAL3 : t_mips_opcode             := b"01_1111";      -- special3 instructions

    constant MIPS_FUNC_INS        : t_mips_function           := b"00_0100";      -- insert bit field
    constant MIPS_FUNC_EXT        : t_mips_function           := b"00_0000";      -- extract bit field

    constant MIPS_FUNC_BSHFL      : t_mips_function           := b"10_0000";

      constant MIPS_FUNC_BSHFL_SEB  : t_mips_shamt              := b"1_0000";       -- sign-extend byte
      constant MIPS_FUNC_BSHFL_SEH  : t_mips_shamt              := b"1_1000";       -- sign-extend halfword
      constant MIPS_FUNC_BSHFL_WSBH : t_mips_shamt              := b"1_0010";       -- Word Swap bytes Within Halfwords

  -- ____ ____ ____ _  _ ____ 
  -- |    |__| |    |__| |___ 
  -- |___ |  | |___ |  | |___ 
  constant MIPS_OPCODE_PREF     : t_mips_opcode             := b"11_0011";      -- prefetch data
  constant MIPS_OPCODE_CACHE    : t_mips_opcode             := b"10_1111";      -- update cache

  -- ____ ____ ____ _ _  _ _  _ 
  -- |__/ |___ | __ | |\/| |\/| 
  -- |  \ |___ |__] | |  | |  | 
  --
  -- 00_0001 & rs(5) & func & imm16
  --
  constant MIPS_OPCODE_REGIMM   : t_mips_opcode             := b"00_0001";      -- REGIMM instruction class

    constant MIPS_OPCODE_BLTZ     : t_mips_reg_addr           := b"0_0000";       -- if(rs <   0) pc = imm16 << 2
    constant MIPS_OPCODE_BGEZ     : t_mips_reg_addr           := b"0_0001";       -- if(rs >=  0) pc = imm16 << 2
    constant MIPS_OPCODE_BLTZAL   : t_mips_reg_addr           := b"1_0000";       -- if(rs <   0) pc = imm16 << 2; r31 = pc
    constant MIPS_OPCODE_BGEZAL   : t_mips_reg_addr           := b"1_0001";       -- if(rs >=  0) pc = imm16 << 2; r31 = pc


  -- --------------------------------------------------------------------------------------
  --  _ _  _ _  _ ___     ____ ____ ____ _  _ ____ ___ 
  --  | |  | |\/| |__]    |___ |  | |__/ |\/| |__|  |  
  -- _| |__| |  | |       |    |__| |  \ |  | |  |  |  
  -- --------------------------------------------------------------------------------------
  --
  -- opcode(6) & immediate(26)
  --
  constant MIPS_OPCODE_J        : t_mips_opcode             := b"00_0010";       -- pc = imm26 << 2
  constant MIPS_OPCODE_JAL      : t_mips_opcode             := b"00_0011";       -- pc = imm26 << 2; r31 = pc

  -- --------------------------------------------------------------------------------------
  -- _ _  _ _  _ ____ ___  _ ____ ___ ____    ____ ____ ____ _  _ ____ ___ 
  -- | |\/| |\/| |___ |  \ | |__|  |  |___    |___ |  | |__/ |\/| |__|  |  
  -- | |  | |  | |___ |__/ | |  |  |  |___    |    |__| |  \ |  | |  |  |  
  -- --------------------------------------------------------------------------------------
  --
  -- opcode(6) & rs(5) & rt(5) & immediate(16)
  --
  -- ___  ____ ____ _  _ ____ _  _ 
  -- |__] |__/ |__| |\ | |    |__| 
  -- |__] |  \ |  | | \| |___ |  | 
  constant MIPS_OPCODE_BEQ      : t_mips_opcode             := b"00_0100";      -- if(rs == rt) pc = imm16 << 2
  constant MIPS_OPCODE_BNE      : t_mips_opcode             := b"00_0101";      -- if(rs != rt) pc = imm16 << 2
  constant MIPS_OPCODE_BLEZ     : t_mips_opcode             := b"00_0110";      -- if(rs <=  0) pc = imm16 << 2
  constant MIPS_OPCODE_BGTZ     : t_mips_opcode             := b"00_0111";      -- if(rs >   0) pc = imm16 << 2

  -- addition, comparison, logic
  constant MIPS_OPCODE_ADDI     : t_mips_opcode             := b"00_1000";      -- rt = rs + imm16
  constant MIPS_OPCODE_ADDIU    : t_mips_opcode             := b"00_1001";      -- rt = unsigned(rs) + imm16
  constant MIPS_OPCODE_SLTI     : t_mips_opcode             := b"00_1010";      -- rt = rs < imm16
  constant MIPS_OPCODE_SLTIU    : t_mips_opcode             := b"00_1011";      -- rt = unsigned(rs) < imm16
  constant MIPS_OPCODE_ANDI     : t_mips_opcode             := b"00_1100";      -- rt = rs and imm16
  constant MIPS_OPCODE_ORI      : t_mips_opcode             := b"00_1101";      -- rt = rs or imm16
  constant MIPS_OPCODE_XORI     : t_mips_opcode             := b"00_1110";      -- rt = rs xor imm16
  constant MIPS_OPCODE_LUI      : t_mips_opcode             := b"00_1111";      -- rt = imm16 << 16

  -- ____ ____ ___  ____ ____ ____ ____ ____ ____ ____ ____ 
  -- |    |  | |__] |__/ |  | |    |___ [__  [__  |  | |__/ 
  -- |___ |__| |    |  \ |__| |___ |___ ___] ___] |__| |  \ 
  --
  -- 01_00zz & fmt(5) & rt(5) & fs(5) & imm11
  --
  constant MIPS_OPCODE_COP0     : t_mips_opcode             := b"01_0000";      -- coprocessor0 = interrupt
  constant MIPS_OPCODE_COP1     : t_mips_opcode             := b"01_0001";      -- coprocessor1 = FPU
  constant MIPS_OPCODE_COP2     : t_mips_opcode             := b"01_0010";      -- coprocessor2

    --
    -- 01_0000 & 0_1011 & rt(5) & 0_1100 & 0_0000 & func
    --
    constant MIPS_OPCODE_MFMC0  : t_mips_reg_addr           := b"01_011";       -- disable/enable interrupts

      constant MIPS_FUNC_DI       : t_mips_function           := b"00_0000";      -- disable interrupts
      constant MIPS_FUNC_EI       : t_mips_function           := b"10_0000";      -- enable interrupts


    --
    -- 01_0000 & 1 & 000_0000_0000_0000_0000 & 01_1000
    --
    constant MIPS_FUNC_ERET       : t_mips_function           := b"01_1000";      -- exception return

    -- exchange between coprocessor and core
    constant MIPS_FMT_MFC         : t_mips_fmt                := b"0_0000";       -- rt = fs
    constant MIPS_FMT_CFC         : t_mips_fmt                := b"0_0010";       -- rt = cs
    constant MIPS_FMT_MTC         : t_mips_fmt                := b"0_0100";       -- fs = rt
    constant MIPS_FMT_CTC         : t_mips_fmt                := b"0_0110";       -- cs = rt

    -- branches
    constant MIPS_FMT_BRANCH      : t_mips_fmt                := b"0_1000";       -- FPU branch operation

      --
      -- FPU BRANCH OREPATIONS
      -- 01_0001(6) & 01000(5) & cc(3) & nd(1) & tf(1) & immediate(16)
      --
      constant MIPS_FUNC_FMT_BCZF   : t_mips_z_branch           := b"00";         -- branch if false
      constant MIPS_FUNC_FMT_BCZT   : t_mips_z_branch           := b"01";         -- branch if true
      constant MIPS_FUNC_FMT_BCZFL  : t_mips_z_branch           := b"10";         -- branch if false likely
      constant MIPS_FUNC_FMT_BCZTL  : t_mips_z_branch           := b"11";         -- branch if true likely

    -- operations
    constant MIPS_FMT_FLOAT_SINGLE: t_mips_fmt                := b"1_0000";       -- operations with single precision
    constant MIPS_FMT_FLOAT_DOUBLE: t_mips_fmt                := b"1_0001";       -- operations with double precision
    constant MIPS_FMT_FIXED_WORD  : t_mips_fmt                := b"1_0100";       -- operations with 32 bit words, fixed point
    constant MIPS_FMT_FIXED_LONG  : t_mips_fmt                := b"1_0101";       -- operations with 64 bit words, fixed point

      --
      -- OPERATIONS FOR FLOATIN OR FIXED POINT
      --
      -- ALU OPERATIONS
      -- 01_0001(6) & fmt(5) & ft(5) & fs(5) & fd(5) & func
      --
      constant MIPS_FUNC_FMT_ADD    : t_mips_function           := b"00_0000";      -- fd = fs + ft
      constant MIPS_FUNC_FMT_SUB    : t_mips_function           := b"00_0001";      -- fd = fs - ft
      constant MIPS_FUNC_FMT_MUL    : t_mips_function           := b"00_0010";      -- fd = fs * ft
      constant MIPS_FUNC_FMT_DIV    : t_mips_function           := b"00_0011";      -- fd = fs * ft
      constant MIPS_FUNC_FMT_SQRT   : t_mips_function           := b"00_0100";      -- fd = fs * ft
      constant MIPS_FUNC_FMT_ABS    : t_mips_function           := b"00_0101";      -- fd = fs * ft
      constant MIPS_FUNC_FMT_MOV    : t_mips_function           := b"00_0110";      -- fd = fs * ft
      constant MIPS_FUNC_FMT_NEG    : t_mips_function           := b"00_0111";      -- fd = fs * ft

      --
      -- CONVERT OPERATIONS
      -- 01_0001(6) & fmt(5) & 0_0000(5) & fs(5) & fd(5) & func
      --
      constant MIPS_FUNC_FMT_CVTS   : t_mips_function           := b"10_0000";      -- fd = convert_and_round(fs) to single precision
      constant MIPS_FUNC_FMT_CVTD   : t_mips_function           := b"10_0001";      -- fd = convert_and_round(fs) to double precision
      constant MIPS_FUNC_FMT_CVTW   : t_mips_function           := b"10_0100";      -- fd = convert_and_round(fs) to word

      --
      -- COMPARE OPERATIONS
      -- 01_0001(6) & fmt(5) & ft(5) & fs(5) & cc(3) & 00(2) & 11(2) & cond(4)
      --
      constant MIPS_FUNC_FMT_COND   : t_mips_function           :=  "11----";        -- general condition command
      constant MIPS_FUNC_FMT_C_F    : t_mips_function           := b"11_0000";      -- 
      constant MIPS_FUNC_FMT_C_UN   : t_mips_function           := b"11_0001";      -- 
      constant MIPS_FUNC_FMT_C_EQ   : t_mips_function           := b"11_0010";      -- 
      constant MIPS_FUNC_FMT_C_UEQ  : t_mips_function           := b"11_0011";      -- 
      constant MIPS_FUNC_FMT_C_OLT  : t_mips_function           := b"11_0100";      -- 
      constant MIPS_FUNC_FMT_C_ULT  : t_mips_function           := b"11_0101";      -- 
      constant MIPS_FUNC_FMT_C_OLE  : t_mips_function           := b"11_0110";      -- 
      constant MIPS_FUNC_FMT_C_ULE  : t_mips_function           := b"11_0111";      -- 
      constant MIPS_FUNC_FMT_C_SF   : t_mips_function           := b"11_1000";      -- 
      constant MIPS_FUNC_FMT_C_NGLE : t_mips_function           := b"11_1001";      -- 
      constant MIPS_FUNC_FMT_C_SEQ  : t_mips_function           := b"11_1010";      -- 
      constant MIPS_FUNC_FMT_C_NGL  : t_mips_function           := b"11_1011";      -- 
      constant MIPS_FUNC_FMT_C_LT   : t_mips_function           := b"11_1100";      -- 
      constant MIPS_FUNC_FMT_C_NGE  : t_mips_function           := b"11_1101";      -- 
      constant MIPS_FUNC_FMT_C_LE   : t_mips_function           := b"11_1110";      -- 
      constant MIPS_FUNC_FMT_C_NGT  : t_mips_function           := b"11_1111";      -- 

  -- _  _ ____ _  _ ____ ____ _   _ 
  -- |\/| |___ |\/| |  | |__/  \_/  
  -- |  | |___ |  | |__| |  \   |   
  -- load from memory
  constant MIPS_OPCODE_LB       : t_mips_opcode             := b"10_0000";      -- rt = *(char*           )(rs + offset)
  constant MIPS_OPCODE_LH       : t_mips_opcode             := b"10_0001";      -- rt = *(short*          )(rs + offset)
  constant MIPS_OPCODE_LWL      : t_mips_opcode             := b"10_0010";      -- rt = rt[15:0]|(*(short*)(rs + offset) << 16)
  constant MIPS_OPCODE_LW       : t_mips_opcode             := b"10_0011";      -- rt = *(int*            )(rs + offset)
  constant MIPS_OPCODE_LBU      : t_mips_opcode             := b"10_0100";      -- rt = *(unsigned char*  )(rs + offset)
  constant MIPS_OPCODE_LHU      : t_mips_opcode             := b"10_0101";      -- rt = *(unsigned short* )(rs + offset)
  constant MIPS_OPCODE_LWR      : t_mips_opcode             := b"10_0110";      -- rt = rt[31:16]|*(short*)(rs + offset)[15:0]

  -- store to memory
  constant MIPS_OPCODE_SB       : t_mips_opcode             := b"10_1000";      -- *(char*  )(rs + offset) = rt
  constant MIPS_OPCODE_SH       : t_mips_opcode             := b"10_1001";      -- *(short* )(rs + offset) = rt
  constant MIPS_OPCODE_SWL      : t_mips_opcode             := b"10_1010";      -- *(short* )(rs + offset)[31:16] = rt[31:16]
  constant MIPS_OPCODE_SW       : t_mips_opcode             := b"10_1011";      -- *(int*   )(rs + offset) = rt
  constant MIPS_OPCODE_SWR      : t_mips_opcode             := b"10_1110";      -- *(short* )(rs + offset)[15:0] = rt[15:0]

  -- coprocessor load from memory
  constant MIPS_OPCODE_LWC1     : t_mips_opcode             := b"11_0001";      -- ft = *(int*  )(base + offset)
  constant MIPS_OPCODE_LWC2     : t_mips_opcode             := b"11_0010";

  -- coprocessor store to memory
  constant MIPS_OPCODE_SWC1     : t_mips_opcode             := b"11_1001";      -- *(int*   )(base + offset) = ft

end package mips_instruction_set;
