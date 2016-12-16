#include "plasma.h"
#include "uart.h"

int uart_putchar(int value)
{
   while((memory_read(IRQ_STATUS) & IRQ_UART_WRITE_AVAILABLE) == 0)
      ;
   memory_write(UART_WRITE, value);
   return 0;
}

int uart_puts(const char *string)
{
   while(*string)
   {
      if(*string == '\n')
         uart_putchar('\r');
      uart_putchar(*string++);
   }
   return 0;
}

void uart_print_hex(unsigned long num)
{
   long i;
   unsigned long j;
   for(i = 28; i >= 0; i -= 4)
   {
      j = (num >> i) & 0xf;
      if(j < 10)
         uart_putchar('0' + j);
      else
         uart_putchar('a' - 10 + j);
   }
}

int uart_kbhit(void)
{
   return memory_read(IRQ_STATUS) & IRQ_UART_READ_AVAILABLE;
}

int uart_getch(void)
{
   while(!uart_kbhit()) ;
   return memory_read(UART_READ);
}
