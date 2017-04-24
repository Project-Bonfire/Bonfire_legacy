#include "ni.h"
#include "packets.h"
#include "plasma.h"
#include "uart.h"
#include "test_plasma.h"
#include "ni_test.h"


#define MY_ADDR     1
#define DST_ADDR    2

int main(int argc, char const *argv[]) {

    unsigned flit;
    unsigned flit_type;
    unsigned payload;
    unsigned packet_counter = 1;

    /* Test UART */
    setup_uart(CPU_SPEED, UART_BAUDRATE);
    uart_puts("UART TEST: If you can read this, then UART output works!\n");

    #if (UART_IN_TEST == 1)

    uart_puts("Please press letter 'b' on the UART terminal:\n");
    char uart_in = uart_getch();

    if (uart_in == 'b')
    {
        uart_puts("UART INPUT TEST PASSED!\n\n");
    }

    else
    {
        uart_puts("UART INPUT TEST FAILED!\n");
        uart_puts("Received following letter: {ASCII:HEX}\n");
        uart_putchar(uart_in);
        uart_putchar(':');
        uart_print_hex(uart_in);
        uart_puts("\n\n");
    }

    #endif

    #if (GPIO_TEST == 1)

    /* Test GPIO */
    unsigned gpio_in = memory_read(GPIOA_IN);
    memory_write(GPIO0_SET, gpio_in);

    #endif

    uart_puts("\n\nBeginning communication test\n\n");


    ni_write(build_header(DST_ADDR, 3));
    ni_write(0b1111111111111111111111111111);
    ni_write(0);

    while (packet_counter < SEND_PACKET_COUNT)
    {
        if ((ni_read_flags() & NI_READ_MASK) == 0)
        {
            flit = ni_read();
            flit_type = get_flit_type(flit);

            if (flit_type == FLIT_TYPE_HEADER)
            {
                uart_puts("Sending packet number ");
                uart_print_num(packet_counter, 10, 0);
                uart_putchar('\n');
                ni_write(build_header(DST_ADDR, 3));
                packet_counter++;
            }
            else
            {
                payload = get_flit_payload(flit);
                ni_write(payload);
            }
        }
    }

    /* Run CPU test */
    test_plasma_funcitons();

    return 0;
}
