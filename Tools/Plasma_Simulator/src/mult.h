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


#include "defines.h"
#include <cstdint>

class Multiplier {
    public:
      reg read_lo();
      reg read_hi();

      void write_lo(reg value);
      void write_hi(reg value);

      void multiply(reg multiplier, reg multiplicand);
      void multiply_unsigned(reg multiplier, reg multiplicand);

      void divide(reg dividend, reg divisor);
      void divide_unsigned(reg dividend, reg divisor);

    private:
      reg high_reg;
      reg low_reg;
};

#endif //__MULT_H__
