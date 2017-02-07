-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma register bank
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
-- FILENAME:      plasma_reg_bank.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    register set of plasma
--
--    SYNTHESIZABLE
--
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0      4/2014    AS         initial
-- --------------------------------------------------------------------------
library IEEE;
   use IEEE.std_logic_1164.ALL;
   use IEEE.numeric_std.ALL;

library PLASMA;
  use PLASMA.mips_instruction_set.ALL;
  use PLASMA.plasma_pack.ALL;


entity plasma_reg_bank is
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
end entity plasma_reg_bank;


architecture structure_reg_bank of plasma_reg_bank is

   -- register bank memory
   signal mem_reg_bank           : t_reg_bank;

   -- write signal detection
   signal dest_zero              : std_logic;
   signal write_en               : std_logic;

begin
-- -------- WRITE ENABLE DETECTION -------------------------
dest_zero <= '1' when reg_addr.rd = MIPS_R_ZERO else '0';   -- rs0 is always zero
write_en  <= (not dest_zero) and reg_addr.we;               -- no write enable for rs0

-- write process is a synchronous process
write_process: process( control.clk )
   begin        
      if rising_edge( control.clk ) then
         if control.rst = '1' then
            for i in 2**PLASMA_REG_ADDR_WIDTH - 1 downto 0 loop
               mem_reg_bank( i ) <= PLASMA_ZERO_WORD;
            end loop;
         else
            if write_en = '1' then
               mem_reg_bank( to_integer(unsigned(reg_addr.rd)) ) <= reg_dest_new;
            end if;
         end if;
      end if;
   end process;

-- read access is asynchronous
reg_source_out <= mem_reg_bank( to_integer(unsigned(reg_addr.rs)) );
reg_target_out <= mem_reg_bank( to_integer(unsigned(reg_addr.rt)) );

-- ############ DEBUGGING #############
--pragma translate_off
--synthesis translate_off
rb_debug: if DEBUG_FLAG = "ON" generate

   signal i_addr                 : t_mips_reg_addr;
   signal i_data                 : t_plasma_word;

begin
debug_process: process( control.clk )
   begin        
      if rising_edge( control.clk ) then
         if control.rst = '1' then
            i_addr <= (others => '0');
            i_data <= (others => '0');
         else
            if write_en = '1' then    
               i_addr <= reg_addr.rd;
               i_data <= reg_dest_new;

               if (i_addr /= reg_addr.rd) or (i_data /= reg_dest_new) then
                report integer'image( core_idx ) &
                       " Addr " & sv2string(debug_prog_addr) & 
                       " RB "   & sv2reg(reg_addr.rd) & " " & sv2string(reg_dest_new);
               end if;
            end if;
         end if;
      end if;
   end process;
end generate;

   plasma_rbank(core_idx).we     <= reg_addr.we;
   plasma_rbank(core_idx).zero   <= mem_reg_bank(0);
   plasma_rbank(core_idx).at     <= mem_reg_bank(1);
   plasma_rbank(core_idx).v(0)   <= mem_reg_bank(2);
   plasma_rbank(core_idx).v(1)   <= mem_reg_bank(3);
   plasma_rbank(core_idx).a(0)   <= mem_reg_bank(4);
   plasma_rbank(core_idx).a(1)   <= mem_reg_bank(5);
   plasma_rbank(core_idx).a(2)   <= mem_reg_bank(6);
   plasma_rbank(core_idx).a(3)   <= mem_reg_bank(7);
   plasma_rbank(core_idx).t(0)   <= mem_reg_bank(8);
   plasma_rbank(core_idx).t(1)   <= mem_reg_bank(9);
   plasma_rbank(core_idx).t(2)   <= mem_reg_bank(10);
   plasma_rbank(core_idx).t(3)   <= mem_reg_bank(11);
   plasma_rbank(core_idx).t(4)   <= mem_reg_bank(12);
   plasma_rbank(core_idx).t(5)   <= mem_reg_bank(13);
   plasma_rbank(core_idx).t(6)   <= mem_reg_bank(14);
   plasma_rbank(core_idx).t(7)   <= mem_reg_bank(15);
   plasma_rbank(core_idx).s(0)   <= mem_reg_bank(16);
   plasma_rbank(core_idx).s(1)   <= mem_reg_bank(17);
   plasma_rbank(core_idx).s(2)   <= mem_reg_bank(18);
   plasma_rbank(core_idx).s(3)   <= mem_reg_bank(19);
   plasma_rbank(core_idx).s(4)   <= mem_reg_bank(20);
   plasma_rbank(core_idx).s(5)   <= mem_reg_bank(21);
   plasma_rbank(core_idx).s(6)   <= mem_reg_bank(22);
   plasma_rbank(core_idx).s(7)   <= mem_reg_bank(23);
   plasma_rbank(core_idx).t(8)   <= mem_reg_bank(24);
   plasma_rbank(core_idx).t(9)   <= mem_reg_bank(25);
   plasma_rbank(core_idx).k(0)   <= mem_reg_bank(26);
   plasma_rbank(core_idx).k(1)   <= mem_reg_bank(27);
   plasma_rbank(core_idx).gp     <= mem_reg_bank(28);
   plasma_rbank(core_idx).sp     <= mem_reg_bank(29);
   plasma_rbank(core_idx).s(8)   <= mem_reg_bank(30);
   plasma_rbank(core_idx).ra     <= mem_reg_bank(31);
--synthesis translate_on
--pragma translate_on

end architecture structure_reg_bank;
