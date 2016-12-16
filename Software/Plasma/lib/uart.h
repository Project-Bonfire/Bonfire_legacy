#ifndef __UART_H__
#define __UART_H__

#include "plasma.h"

int uart_putchar(int value);

int uart_puts(const char *string);

void uart_print_hex(unsigned long num);

int uart_kbhit(void);

int uart_getch(void);

#endif //__UART_H__
