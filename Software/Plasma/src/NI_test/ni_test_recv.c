#include "../../lib/plasma.h"
#include "../../lib/ni.h"

int main() {

  //OS_AsmInterruptInit();
  OS_AsmInterruptEnable(1);
  unsigned int ni_flags;
  unsigned int recv_flit;

  recv_packet_counter = 0;

  while (1)
  {

    if(recv_packet_counter > 0)
    {
      ni_flags = ni_read_flags();
      if(((ni_flags & NI_READ_MASK) == 0)){
        recv_flit = ni_read();
        if ((recv_flit & 0xC0000000) == 0){
            recv_packet_counter--;
        }
      }
    }


  }

  return 0;
}
