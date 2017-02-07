-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma PROGRAM COUNTER
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
-- FILENAME:      plasma_pc.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    program counter logic, pc-register, imm<->inc mux, control input
--
--    NOT SYNTHESIZABLE
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
  use PLASMA.plasma_pack.ALL;

entity plasma_pc is
    port(
      control                 : in  t_main_control;
      stall                   : in  std_logic;
      pc_new_value            : in  t_plasma_word;
      pc_imm_in               : in  t_plasma_word;
      pc_out                  : out t_plasma_pc_out
    );
end entity plasma_pc;


architecture structure_plasma_pc of plasma_pc is

  -- pc register
  signal reg_pc               : t_plasma_word  := (others => '0');

  -- pc calculated values
  signal i_pc_inc             : t_plasma_word;
  signal i_pc_branch          : t_plasma_word;  

begin

  -- INCREMENTATION
  i_pc_inc      <= std_logic_vector(unsigned(reg_pc) + unsigned(PLASMA_INC_WORD));
  -- BRANCH VALUE
  i_pc_branch   <= std_logic_vector(unsigned(reg_pc) + unsigned(pc_imm_in));

 -- PC REGISTER
pc_register:process( control.clk )
  begin
    if rising_edge( control.clk ) then
      if control.rst = '1' then
        reg_pc          <= PLASMA_ZERO_WORD;
      else
        if stall = '0' then
          reg_pc        <= pc_new_value;
        end if;
      end if;
    end if; 
  end process;

  -- OUTPUT
  pc_out.pc_out           <= reg_pc;
  pc_out.pc_out_inc       <= i_pc_inc;
  pc_out.pc_out_branch    <= i_pc_branch;

end architecture structure_plasma_pc;