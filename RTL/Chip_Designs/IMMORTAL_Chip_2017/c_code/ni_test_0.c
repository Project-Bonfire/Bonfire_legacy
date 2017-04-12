#include "ni.h"
#include "packets.h"
#include "plasma.h"
#include "uart.h"

#define CPU_SPEED       25000000
#define UART_BAUDRATE   115200

#define MY_ADDR     0
#define DST_ADDR    1

int main(int argc, char const *argv[]) {

    unsigned flit;
    unsigned flit_type;
    unsigned payload;

    setup_uart(CPU_SPEED, UART_BAUDRATE);
    uart_puts("Hello!\n");


    // Test GPIO
    unsigned gpio_in = memory_read(GPIOA_IN);
    memory_write(GPIO0_SET, gpio_in);

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
