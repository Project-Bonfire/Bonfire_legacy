#include "bonfire.h"
#include "plasma.h"
#include "uart.h"

int main()
{
    unsigned i = 0;
    // memory_write(GPIO0_CLEAR, 0);
    while (1){

        unsigned a = memory_read(GPIOA_IN);
        uart_print_hex(a);
        memory_write(GPIO0_SET, i);
        i++;
    }
    return 0;
}
