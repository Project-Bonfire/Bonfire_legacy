#include "../../lib/plasma.h"
#include "../../lib/ni.h"
#include "../../lib/packets.h"

int main() {
    unsigned int ni_flags;
    unsigned int flit;
    unsigned int packet_counter = 0;


    while (1)
    {
        packet_counter = memory_read(NI_COUNTER_ADDRESS);
        ni_flags = ni_read_flags();
        if ((packet_counter > 0) && ((ni_flags & NI_READ_MASK) == 0))
        {
                flit = ni_read();

        }
        else
        {
            ni_write(build_header(2, 3));
        }

    }

    return 0;
}
