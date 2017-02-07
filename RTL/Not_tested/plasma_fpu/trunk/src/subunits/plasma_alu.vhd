-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma ALU
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
-- FILENAME:      plasma_alu.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    implements ALU operation depending on instruction code:
--    ADD, ADDU, SUB, SUBU, AND, OR, XOR, NOR, less than, less than signed
--
--    SYNTHESIZABLE
--
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0       4/2014    AS        initial
-- 2.0       5/2015    AS        work with MIPS commands directly 
-- --------------------------------------------------------------------------
library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

library PLASMA;
  use PLASMA.mips_instruction_set.ALL;
  use PLASMA.plasma_pack.ALL;

entity plasma_alu is
    port(
      alu_a_in                : in  t_plasma_word;
      alu_b_in                : in  t_plasma_word;
      alu_func                : in  t_mips_function;
      alu_out                 : out t_plasma_word
    );
end entity plasma_alu;

--synthesis translate_off
-- ____ _ _  _ _  _ _    ____ ___ _ ____ _  _ 
-- [__  | |\/| |  | |    |__|  |  | |  | |\ | 
-- ___] | |  | |__| |___ |  |  |  | |__| | \| 
architecture sim_alu of plasma_alu is 

  signal eq, equ      : Boolean;

begin

  eq  <= signed(alu_a_in) < signed(alu_b_in);
  equ <= unsigned(alu_a_in) < unsigned(alu_b_in);  

  process( alu_a_in, alu_b_in, alu_func, eq, equ )
  begin
    alu_out   <= PLASMA_ZERO_WORD;      -- default value

    case alu_func(2 downto 0) is
      when "000" => alu_out    <= std_logic_vector(  signed(alu_a_in) +     signed(alu_b_in));        -- ADD
      when "001" => alu_out    <= std_logic_vector(unsigned(alu_a_in) +   unsigned(alu_b_in));        -- ADDU
      when "010" => if alu_func(5 downto 3) = "100" then
                    alu_out    <= std_logic_vector(  signed(alu_a_in) -     signed(alu_b_in));        -- SUB
                    else
                      if eq then alu_out <= PLASMA_SET_WORD; end if;                                  -- SLT
                    end if;
      when "011" => if alu_func(5 downto 3) = "100" then
                    alu_out    <= std_logic_vector(unsigned(alu_a_in) -   unsigned(alu_b_in));        -- SUBU
                    else
                      if equ then alu_out <= PLASMA_SET_WORD; end if;                                 -- SLTU
                    end if;
      when "100" => alu_out    <= alu_a_in and alu_b_in;                                              -- AND
      when "101" => alu_out    <= alu_a_in or  alu_b_in;                                              -- OR
      when "110" => alu_out    <= alu_a_in xor alu_b_in;                                              -- XOR
      when "111" => if alu_func(5) ='1' then
                    alu_out    <= alu_a_in nor alu_b_in;                                              -- NOR
                    else
                    alu_out    <= std_logic_vector(  signed(alu_a_in) +     signed(alu_b_in));        -- LUI
                    end if;
      when others => 
    end case;
  end process;

end architecture sim_alu;
--synthesis translate_on

-- ____ ___  ____ ____ 
-- |___ |__] | __ |__| 
-- |    |    |__] |  | 
architecture FPGA_alu of plasma_alu is begin

  process( alu_a_in, alu_b_in, alu_func )
    variable    temp_result   : t_plasma_word;
    variable    sign_xor      : std_logic;
  begin
    alu_out     <= PLASMA_ZERO_WORD;    -- default value

    case alu_func(2 downto 0) is
      when "000" => alu_out    <= std_logic_vector(  signed(alu_a_in) +     signed(alu_b_in));        -- ADD
      when "001" => alu_out    <= std_logic_vector(unsigned(alu_a_in) +   unsigned(alu_b_in));        -- ADDU
      when "010" => if alu_func(5 downto 3) = "100" then
                    alu_out    <= std_logic_vector(  signed(alu_a_in) -     signed(alu_b_in));        -- SUB
                    else                                                                              -- SLT
                      temp_result := std_logic_vector(signed(alu_a_in) - signed(alu_b_in));       -- calculate difference
                      sign_xor    := 
                        alu_a_in(PLASMA_DATA_WIDTH - 1) xor alu_b_in(PLASMA_DATA_WIDTH - 1);      -- check for different sign bits

                        if sign_xor = '0' then                                                    -- equal signs
                          alu_out(0) <= temp_result(PLASMA_DATA_WIDTH - 1);                       -- pass sign of difference
                        else                                                                      -- different signs
                          alu_out(0) <= alu_a_in(PLASMA_DATA_WIDTH - 1);                          -- if a < 0 -> a < b (because b > 0)
                        end if;                                                                   -- if a > 0 -> a > b (because b < 0)

                      alu_out(PLASMA_DATA_WIDTH - 1 downto 1) 
                                    <= PLASMA_ZERO_WORD(PLASMA_DATA_WIDTH - 1 downto 1);          -- fill rest with zeros                                 
                    end if;

      when "011" => if alu_func(5 downto 3) = "100" then
                    alu_out    <= std_logic_vector(unsigned(alu_a_in) -   unsigned(alu_b_in));        -- SUBU
                    else                                                                              -- SLTU
                      temp_result := std_logic_vector(unsigned(alu_a_in) - unsigned(alu_b_in));       -- calculate difference
                      sign_xor    := 
                        alu_a_in(PLASMA_DATA_WIDTH - 1) xor alu_b_in(PLASMA_DATA_WIDTH - 1);        -- check for different sign bits

                      if sign_xor = '0' then                                                      -- operands have equal signs
                        alu_out(0)  <= temp_result(PLASMA_DATA_WIDTH - 1);                        -- pass difference sign
                      else                                                                        -- operands have different signs
                        alu_out(0)  <= alu_b_in(PLASMA_DATA_WIDTH - 1);                           -- if MSB(a) = 1 then a > b (MSB(b) must be 0)
                      end if;                                                                     -- if MSB(a) = 0 then a < b (MSB(b) must be 1)

                      alu_out(PLASMA_DATA_WIDTH - 1 downto 1) 
                        <= PLASMA_ZERO_WORD(PLASMA_DATA_WIDTH - 1 downto 1);                        -- fill rest with zeros
                    end if;
      when "100" => alu_out    <= alu_a_in and alu_b_in;                                              -- AND
      when "101" => alu_out    <= alu_a_in or  alu_b_in;                                              -- OR
      when "110" => alu_out    <= alu_a_in xor alu_b_in;                                              -- XOR
      when "111" => if alu_func(5) ='1' then
                    alu_out    <= alu_a_in nor alu_b_in;                                              -- NOR
                    else
                    alu_out    <= std_logic_vector(  signed(alu_a_in) +     signed(alu_b_in));        -- LUI
                    end if;
      when others => 

    end case;
  end process;
    
end architecture FPGA_alu;