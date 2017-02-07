-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma MEMORY CONTROL
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
--    preparate data for memory access
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

library PLASMA;
  use PLASMA.mips_instruction_set.ALL;
  use PLASMA.plasma_pack.ALL;


entity plasma_mem_ctrl is
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
end entity plasma_mem_ctrl;


architecture structure_plasma_mem_ctrl of plasma_mem_ctrl is

  -- ___  ____ ___ ____    ___ ____    _  _ ____ _  _ ____ ____ _   _ 
  -- |  \ |__|  |  |__|     |  |  |    |\/| |___ |\/| |  | |__/  \_/  
  -- |__/ |  |  |  |  |     |  |__|    |  | |___ |  | |__| |  \   |   
  signal i_wr_mask        : t_plasma_mask;
  signal i_rd_mask        : t_plasma_mask;
  signal i_data_w         : t_plasma_word;

  -- ___  ____ ___ ____    ___ ____    ___  _    ____ ____ _  _ ____ 
  -- |  \ |__|  |  |__|     |  |  |    |__] |    |__| [__  |\/| |__| 
  -- |__/ |  |  |  |  |     |  |__|    |    |___ |  | ___] |  | |  | 
  signal i_data_r         : t_plasma_word;


begin
  -- ----------------------------------------------------------------------------------------------
  --  _____  _____   ____   _____ _____            __  __ 
  -- |  __ \|  __ \ / __ \ / ____|  __ \     /\   |  \/  |
  -- | |__) | |__) | |  | | |  __| |__) |   /  \  | \  / |
  -- |  ___/|  _  /| |  | | | |_ |  _  /   / /\ \ | |\/| |
  -- | |    | | \ \| |__| | |__| | | \ \  / ____ \| |  | |
  -- |_|    |_|  \_\\____/ \_____|_|  \_\/_/    \_\_|  |_|
  -- ----------------------------------------------------------------------------------------------
  --
  -- FORWARDING ONLY, WORDS AS INPUT AND OUTPUT
  --
  -- ____ ___  ___  ____    ___ ____    ___  _    ____ ____ _  _ ____ 
  -- |__| |  \ |  \ |__/     |  |  |    |__] |    |__| [__  |\/| |__| 
  -- |  | |__/ |__/ |  \     |  |__|    |    |___ |  | ___] |  | |  | 
  prog_stall_out        <= prog_stall_in;                                                       -- program memory stall
  prog_out              <= prog_in;                                                             -- program data

  -- ____ ___  ___  ____    ___ ____    _  _ ____ _  _ ____ ____ _   _ 
  -- |__| |  \ |  \ |__/     |  |  |    |\/| |___ |\/| |  | |__/  \_/  
  -- |  | |__/ |__/ |  \     |  |__|    |  | |___ |  | |__| |  \   |   
  prog_addr_out         <= prog_addr_in;                                                        -- program address

  -- ----------------------------------------------------------------------------------------------
  --  _____       _______       
  -- |  __ \   /\|__   __|/\    
  -- | |  | | /  \  | |  /  \   
  -- | |  | |/ /\ \ | | / /\ \  
  -- | |__| / ____ \| |/ ____ \ 
  -- |_____/_/    \_\_/_/    \_\
  -- ----------------------------------------------------------------------------------------------
  --
  -- REGISTER STAGE AND MASK LOGIC
  --

mem_read_write_process:
  process( mem_func, data_w_in, data_r_in )
  begin
    -- DEFAULT VALUES
    i_rd_mask     <= (others => '0');
    i_wr_mask     <= (others => '0');
    
    i_data_w      <= PLASMA_ZERO_WORD;
    i_data_r      <= PLASMA_ZERO_WORD;

    -- MEMORY ACCESS FUNCTION
    case mem_func is
                            -- ____ ____ ____ ___  
                            -- |__/ |___ |__| |  \ 
                            -- |  \ |___ |  | |__/ 
      when MIPS_OPCODE_LW   |
           MIPS_OPCODE_LWC1 |
           MIPS_OPCODE_LWL    =>  i_rd_mask               <= PLASMA_MASK_READ32;
                                  i_data_r                <= data_r_in;

      -- when MIPS_OPCODE_LWL    =>  i_rd_mask               <= PLASMA_MASK_READ32L;    -- COMPILER BUG !!
      --                             i_data_w                <= data_w_in;
      --                             i_data_r                <= data_r_in;

      -- when MIPS_OPCODE_LWR    =>  i_rd_mask               <= PLASMA_MASK_READ32R;    -- COMPILER BUG !!
      --                             i_data_w                <= data_w_in;
      --                             i_data_r                <= data_r_in;

      when MIPS_OPCODE_LHU    =>  i_rd_mask               <= PLASMA_MASK_READ16;
                                  i_data_r(31 downto 16)  <= (others => '0');
                                  i_data_r(15 downto  0)  <= data_r_in(15 downto 0);

      when MIPS_OPCODE_LH     =>  i_rd_mask               <= PLASMA_MASK_READ16;
                                  i_data_r(31 downto 16)  <= (others => data_r_in(15));
                                  i_data_r(15 downto  0)  <= data_r_in(15 downto 0);

      when MIPS_OPCODE_LBU    =>  i_rd_mask               <= PLASMA_MASK_READ8;
                                  i_data_r(31 downto  8)  <= (others => '0');
                                  i_data_r( 7 downto  0)  <= data_r_in(7 downto 0);

      when MIPS_OPCODE_LB     =>  i_rd_mask               <= PLASMA_MASK_READ8;
                                  i_data_r(31 downto  8)  <= (others => data_r_in(7));
                                  i_data_r( 7 downto  0)  <= data_r_in(7 downto 0);
                            -- _ _ _ ____ _ ___ ____ 
                            -- | | | |__/ |  |  |___ 
                            -- |_|_| |  \ |  |  |___ 
      when MIPS_OPCODE_SW   |
           MIPS_OPCODE_SWC1 |
           MIPS_OPCODE_SWL    =>  i_wr_mask               <= PLASMA_MASK_WRITE32;
                                  i_data_w                <= data_w_in;

      -- when MIPS_OPCODE_SWL    =>  i_wr_mask               <= PLASMA_MASK_WRITE32L;   -- COMPILER BUG !!
      --                             i_data_w                <= data_w_in;

      -- when MIPS_OPCODE_SWR    =>  i_wr_mask               <= PLASMA_MASK_WRITE32R;   -- COMPILER BUG !!
      --                             i_data_w                <= data_w_in;

      when MIPS_OPCODE_SH     =>  i_wr_mask     <= PLASMA_MASK_WRITE16;
                                  --i_data_w(31 downto 16)  <= (others => '0');
                                  i_data_w(31 downto 16)  <= data_w_in(15 downto 0);
                                  i_data_w(15 downto  0)  <= data_w_in(15 downto 0);

      when MIPS_OPCODE_SB     =>  i_wr_mask     <= PLASMA_MASK_WRITE8;
                                  -- i_data_w(31 downto  8)  <= (others => '0');
                                  i_data_w(31 downto 24)  <= data_w_in(7 downto 0);
                                  i_data_w(23 downto 16)  <= data_w_in(7 downto 0);
                                  i_data_w(15 downto  8)  <= data_w_in(7 downto 0);
                                  i_data_w( 7 downto  0)  <= data_w_in(7 downto 0);

      when  others            => -- default values
    end case;
  end process;
  
  -- ADDRESS
  data_addr_out         <= data_addr_in;
  
  -- STALL
  data_stall_out        <= data_stall_in;

  -- READ
  rd_mask_out           <= i_rd_mask;
  data_r_out            <= i_data_r;

  -- WRITE
  wr_mask_out           <= i_wr_mask;
  data_w_out            <= i_data_w;

end architecture structure_plasma_mem_ctrl;
