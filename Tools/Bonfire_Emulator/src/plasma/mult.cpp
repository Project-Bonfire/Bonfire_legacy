#include <cmath>
#include "common.h"
#include "mult.h"

using namespace std;

uint32_t Multiplier::read_lo()
{
  return low_reg;
}
uint32_t Multiplier::read_hi()
{
  return high_reg;
}

void Multiplier::write_lo(uint32_t value)
{
  low_reg = value;
}

void Multiplier::write_hi(uint32_t value)
{
  high_reg = value;
}

void Multiplier::multiply(uint32_t multiplier, uint32_t multiplicand)
{
  uint64_t answer;
  answer = multiplier * multiplicand;
  high_reg = (answer & 0xFFFF0000) >> 16;
  low_reg = answer & 0x0000FFFF;
}
void Multiplier::multiply_unsigned(uint32_t multiplier, uint32_t multiplicand){
  uint64_t answer;
  answer = abs((signed)multiplier * (signed)multiplicand);
  high_reg = (answer & 0xFFFF0000) >> 16;
  low_reg = answer & 0x0000FFFF;
}

void Multiplier::divide(uint32_t dividend, uint32_t divisor)
{
  high_reg = dividend%divisor;
  low_reg = dividend/divisor;
}
void Multiplier::divide_unsigned(uint32_t dividend, uint32_t divisor)
{
  high_reg = abs(dividend%divisor);
  low_reg = abs(dividend/divisor);
}
