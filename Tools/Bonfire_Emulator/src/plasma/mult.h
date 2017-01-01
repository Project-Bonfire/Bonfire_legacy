/*-------------------------------------------------------------------
-- TITLE: multiplier simulator for Plasma MIPS CPU
-- AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
-- DATE CREATED: 04.12.16
-- FILENAME: mult.h
-- PROJECT: Project Bonfire
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--   Implements the functiona of Plasma's multiplier
--------------------------------------------------------------------*/

#ifndef __MULT_H__
#define __MULT_H__


#include "common.h"
#include <cstdint>

class Multiplier {
    public:
      uint32_t read_lo();
      uint32_t read_hi();

      void write_lo(uint32_t value);
      void write_hi(uint32_t value);

      void multiply(uint32_t multiplier, uint32_t multiplicand);
      void multiply_unsigned(uint32_t multiplier, uint32_t multiplicand);

      void divide(uint32_t dividend, uint32_t divisor);
      void divide_unsigned(uint32_t dividend, uint32_t divisor);

    private:
      uint32_t high_reg;
      uint32_t low_reg;
};

#endif //__MULT_H__
