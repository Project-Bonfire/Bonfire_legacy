#include "../../lib/plasma.h"
#include "../../lib/ni.h"

int main() {
  int i;

  //ni_write(0b00010000000000110000000000000000);
  //for(i = 0; i<1000; i++){}


  while (1)
  {
      ni_write(0b00010000000011110000000000000000);
      asm("nop");
      asm("nop");
  }

  return 0;
}
