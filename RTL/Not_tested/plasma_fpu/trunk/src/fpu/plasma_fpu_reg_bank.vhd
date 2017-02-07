-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma FPU register bank
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
-- FILENAME:      plasma_fpu_reg_bank.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION
--    register set of plasma FPU coprocessor I (FPU)
--
--    SYNTHESIZABLE
--
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0       4/2014    AS        initial
-- 2.0       5/2015    AS        include implementation from Max Reuter 
-- --------------------------------------------------------------------------
library IEEE;
   use IEEE.std_logic_1164.ALL;
   use IEEE.numeric_std.ALL;

library PLASMA;
  use PLASMA.mips_instruction_set.ALL;
  use PLASMA.plasma_pack.ALL;


entity plasma_fpu_reg_bank is
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
end entity plasma_fpu_reg_bank;


architecture structure_plasma_fpu_reg_bank of plasma_fpu_reg_bank is

  alias data_in_upp           : t_plasma_word is reg_dest_new(   2*PLASMA_DATA_WIDTH - 1 downto PLASMA_DATA_WIDTH);
  alias data_in_low           : t_plasma_word is reg_dest_new(     PLASMA_DATA_WIDTH - 1 downto                 0);

  alias data_rs_upp           : t_plasma_word is reg_source_out( 2*PLASMA_DATA_WIDTH - 1 downto PLASMA_DATA_WIDTH);
  alias data_rs_low           : t_plasma_word is reg_source_out(   PLASMA_DATA_WIDTH - 1 downto                 0);

  alias data_rt_upp           : t_plasma_word is reg_target_out( 2*PLASMA_DATA_WIDTH - 1 downto PLASMA_DATA_WIDTH);
  alias data_rt_low           : t_plasma_word is reg_target_out(   PLASMA_DATA_WIDTH - 1 downto                 0);

  --
  -- register bank memory
  --
  signal mem_reg_bank         : t_reg_bank;
  signal fcsr                 : t_fpu_fcsr;

  --
  -- convert FPU flags to bit vector
  --
  function flags2slv( flags : t_fpu_flags ) return std_logic_vector is
  begin
    return flags.v & flags.z & flags.o & flags.u & flags.i;
  end flags2slv;

  --
  -- convert bit vector to FPU flags
  --
  function slv2flags( vector : std_logic_vector ) return t_fpu_flags is
    variable res    : t_fpu_flags;
  begin
    res.v := vector(vector'left - 0);
    res.z := vector(vector'left - 1);
    res.o := vector(vector'left - 2);
    res.u := vector(vector'left - 3);
    res.i := vector(vector'left - 4);

    return res;
  end slv2flags;

  --
  -- convert FPU constrol/status register to bit vector
  --
  function fcsr2slv( fcsr_in : t_fpu_fcsr ) return t_plasma_word is
    variable res      : t_plasma_word;
  begin
    res :=  fcsr_in.fcc(7 downto 1)       &
            fcsr_in.fs                    &
            fcsr_in.fcc(0)                &
            fcsr_in.unused                &
            fcsr_in.cause_e               &
            flags2slv( fcsr_in.cause )    &
            flags2slv( fcsr_in.enables )  &
            flags2slv( fcsr_in.flags )    &
            fcsr_in.rm;

    return res;
  end fcsr2slv;

  --
  -- convert bit vector to FPU control/status regsiter
  --
  function slv2fcsr( vector : t_plasma_word ) return t_fpu_fcsr is
    variable res    : t_fpu_fcsr;
  begin
    res.fcc     := vector(31 downto 25) & vector(23);
    res.fs      := vector(24);
    res.unused  := vector(22 downto 18);
    res.cause_e := vector(17);
    res.cause   := slv2flags( vector(16 downto 12) );
    res.enables := slv2flags( vector(11 downto  7) );
    res.flags   := slv2flags( vector( 8 downto  2) );
    res.rm      := vector(1 downto 0);

    return res;
  end slv2fcsr;

begin
  -- _ _ _ ____ _ ___ ____ 
  -- | | | |__/ |  |  |___ 
  -- |_|_| |  \ |  |  |___ 
  --
  -- write process is a synchronous process
  --
write_process:process( control.clk )
    
    --
    -- ModelSIM causes error by direct call of slv2flags( flags2slv or flags2slv )
    --
    variable v_alu_cause      : std_logic_vector(4 downto 0); 
    variable v_flags          : std_logic_vector(4 downto 0);
    variable v_or_flags       : std_logic_vector(4 downto 0);

   begin        
      if rising_edge( control.clk ) then
         if control.rst = '1' then
            mem_reg_bank <= (others => PLASMA_ZERO_WORD);
            fcsr         <= slv2fcsr( PLASMA_ZERO_WORD );
         else
          if reg_addr.we = '1' then

            case fpu_ctrl.mode is
              when FPU_MODE_NONE  =>

              -- ############ REGULAR ALU ACCESS, write FGRs and flags
              when FPU_MODE_ALU   =>
                --
                -- write registers
                --
                mem_reg_bank( to_integer(unsigned(reg_addr.rd))    ) <= data_in_low;
                mem_reg_bank( to_integer(unsigned(reg_addr.rd)) + 1) <= data_in_upp;

                --
                -- write flags
                --
                fcsr.cause  <= alu_cause;
                -- fcsr.flags  <= slv2flags( flags2slv(alu_cause) or flags2slv(fcsr.flags));  -- in ModelSIM or results in a 2-bit vector
                v_alu_cause := flags2slv( alu_cause );
                v_flags     := flags2slv( fcsr.flags );

                v_or_flags  := v_alu_cause or v_flags;

                fcsr.flags  <= slv2flags( v_or_flags );

              -- ############# ACCESS TO FRG from main core (single precision only)
              when FPU_MODE_FGR   =>
                --
                -- main core provides only single precision
                --
                mem_reg_bank( to_integer(unsigned(reg_addr.rd))    ) <= data_in_low;

              -- ############# ACCESS TO CONTROL REGISTER
              when FPU_MODE_CTC   =>
                --
                -- write directly to control register
                --
                fcsr  <= slv2fcsr( data_in_low );

              -- ############# ACCESS TO COMPARATOR RESULT
              when FPU_MODE_C     =>
                --
                -- write CC bit
                --
                fcsr.fcc(0)   <= comp_out;

--synthesis translate_off              
              when others         => report "ERROR: FPU regbank write with unknown mode!";
--synthesis translate_on

            end case;

          end if;
         end if;
      end if;
   end process;

-- ____ ____ ____ ___  
-- |__/ |___ |__| |  \ 
-- |  \ |___ |  | |__/ 
--
-- read access is asynchronous
--
with fpu_ctrl.c_reg select
  data_rs_low    <= mem_reg_bank( to_integer(unsigned(reg_addr.rs)    ) )   when '0',
                    fcsr2slv( fcsr )                                        when others;
  data_rs_upp    <= mem_reg_bank( to_integer(unsigned(reg_addr.rs) + 1) );

  data_rt_low    <= mem_reg_bank( to_integer(unsigned(reg_addr.rt)    ) );
  data_rt_upp    <= mem_reg_bank( to_integer(unsigned(reg_addr.rt) + 1) );

  cc_out         <= fcsr.fcc(0);

-- synthesis translate_off
rb_debug: if DEBUG_FLAG = "ON" generate

   signal i_addr                 : t_mips_reg_addr;
   signal i_data                 : t_plasma_dword;

begin
debug_process: process( control.clk )
   begin        
      if rising_edge( control.clk ) then
         if control.rst = '1' then
            i_addr <= (others => '0');
            i_data <= (others => '0');
         else
            if reg_addr.we = '1' then    
               i_addr <= reg_addr.rd;
               i_data <= reg_dest_new;

               if (i_addr /= reg_addr.rd) or (i_data /= reg_dest_new) then
                  report "0 Addr " & sv2string(debug_prog_addr) &
                    " RB "  & "f" & integer'image(to_integer(unsigned(reg_addr.rd)))
                    & " " & sv2string(reg_dest_new);
               end if;
            end if;
         end if;
      end if;
   end process;
end generate;


plasma_fpu_bank   <= mem_reg_bank;
-- synthesis translate_on

end architecture structure_plasma_fpu_reg_bank;
