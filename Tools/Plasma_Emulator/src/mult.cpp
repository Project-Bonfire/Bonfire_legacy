#include <cmath>
#include "defines.h"
#include "mult.h"

using namespace std;

reg Multiplier::read_lo()
{
  return low_reg;
}
reg Multiplier::read_hi()
{
  return high_reg;
}

void Multiplier::write_lo(reg value)
{
  low_reg = value;
}

void Multiplier::write_hi(reg value)
{
  high_reg = value;
}

void Multiplier::multiply(reg multiplier, reg multiplicand)
{
  uint64_t answer;
  answer = multiplier * multiplicand;
  high_reg = (answer & 0xFFFF0000) >> 16;
  low_reg = answer & 0x0000FFFF;
}
void Multiplier::multiply_unsigned(reg multiplier, reg multiplicand){
  uint64_t answer;
  answer = abs((signed)multiplier * (signed)multiplicand);
  high_reg = (answer & 0xFFFF0000) >> 16;
  low_reg = answer & 0x0000FFFF;
}

void Multiplier::divide(reg dividend, reg divisor)
{
  high_reg = dividend%divisor;
  low_reg = dividend/divisor;
}
void Multiplier::divide_unsigned(reg dividend, reg divisor)
{
  high_reg = abs(dividend%divisor);
  low_reg = abs(dividend/divisor);
}
