#include "../../lib/plasma.h"
#include "../../lib/ni.h"

int main() {
    unsigned int ni_flags;
    unsigned int flit;
    unsigned int packet_counter;


    while (1)
    {
        packet_counter = memory_read(NI_COUNTER_ADDRESS);
        if(packet_counter > 0)
        {
            ni_flags = ni_read_flags();
            if(((ni_flags & NI_READ_MASK) == 0)){
                flit = ni_read();
                
            }
        }

    }

    return 0;
}
