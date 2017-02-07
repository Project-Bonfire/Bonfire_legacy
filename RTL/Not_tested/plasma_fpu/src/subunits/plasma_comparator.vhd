-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma COMPARATOR
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
-- FILENAME:      plasma_comparator.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    compares input values depeding on operation code
--
--    SYNTHESIZABLE
--
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0      4/2014    AS         initial
-- 2.0      5/2015    AS         works with MIPS I commands directly
-- --------------------------------------------------------------------------
library IEEE;
   use IEEE.std_logic_1164.ALL;

library PLASMA;
  use PLASMA.mips_instruction_set.ALL;
  use PLASMA.plasma_pack.ALL;

   
entity plasma_comparator is
    port(
      comp_a_in               : in  t_plasma_word;
      comp_b_in               : in  t_plasma_word;
      comp_func               : in  t_mips_opcode;
      comp_out                : out std_logic
    );
end entity plasma_comparator;


architecture structure_comparator of plasma_comparator is

  alias  func           : std_logic_vector(2 downto 0) is comp_func(2 downto 0);

  signal comp_eq        : std_logic;            -- input values are equal
  
  signal comp_eq_z      : std_logic;            -- input = 0
  signal comp_neg       : std_logic;            -- input < 0

begin

  comp_eq       <= '1' when comp_a_in = comp_b_in         else '0';
  comp_eq_z     <= '1' when comp_a_in = PLASMA_ZERO_WORD  else '0';
  comp_neg      <= comp_a_in(PLASMA_DATA_WIDTH - 1);                    -- check MSB
  
  -- COMPARATOR MUX
  with func select
    comp_out    <=  comp_eq                     when "100",   -- BEQ
                    not comp_eq                 when "101",   -- BNE
                    comp_neg or comp_eq_z       when "110",   -- BLEZ
                    not(comp_neg or comp_eq_z)  when "111",   -- BGTZ
                    comp_neg                    when "000",   -- BLTZ
                    not comp_neg                when "001",   -- BGEZ
                    '0'                         when others;
                    
end architecture structure_comparator;
