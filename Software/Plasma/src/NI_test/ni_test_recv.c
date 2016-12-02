#include "../../lib/plasma.h"
#include "../../lib/ni.h"

int main() {

  OS_AsmInterruptInit();
  OS_AsmInterruptEnable();

  while (1)
  {
    unsigned int recv_flit;
    recv_flit = ni_read();
  }

  return 0;
}
