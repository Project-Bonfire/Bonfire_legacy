#include "ni.h"
#include "packets.h"
#include "plasma.h"
#include "uart.h"
#include "test_plasma.h"
#include "ni_test.h"


#define MY_ADDR     3
#define DST_ADDR    0

int main(int argc, char const *argv[]) {

    unsigned flit;
    unsigned flit_type;
    unsigned payload;
    unsigned packet_counter = 1;

    ni_write(build_header(DST_ADDR, 5));
    ni_write(0b0000010101000101000001001001);
    ni_write(0);
    ni_write(0);
    ni_write(0);


    return 0;
}
