#include "bonfire.h"
#include "plasma.h"
#include "uart.h"

volatile unsigned int us_counter;

void int_counter()
{
    us_counter++;
}

int main()
{
    us_counter = 5;

    memory_write(IRQ_MASK, IRQ_COUNTER18);
    memory_write(COUNTER_REG, US_INIT_VALUE);

    OS_AsmInterruptEnable(1);



    while (1)
    {
        //uart_print_hex(us_counter);
        //uart_putchar('\n');
        int_counter();
    }
    return 0;
}
