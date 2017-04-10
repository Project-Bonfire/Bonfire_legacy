#include "ni.h"
#include "packets.h"

#define MY_ADDR     2
#define DST_ADDR    3

int main(int argc, char const *argv[]) {

    unsigned flit;
    unsigned flit_type;
    unsigned payload;

    ni_write(build_header(DST_ADDR, 3));
    ni_write(42);
    ni_write(MY_ADDR);

    while (1) {
        if ((ni_read_flags() & NI_READ_MASK) == 0)
        {
            flit = ni_read();
            flit_type = get_flit_type(flit);

            if (flit_type == FLIT_TYPE_HEADER)
            {
                ni_write(build_header(DST_ADDR, 3));
            }
            else
            {
                payload = get_flit_payload(flit);
                ni_write(payload);
            }
        }
    }
    return 0;
}
