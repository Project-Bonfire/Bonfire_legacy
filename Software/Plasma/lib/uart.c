/*--------------------------------------------------------------------
 * TITLE: UART functions
 * AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
 * DATE CREATED: 02.12.16
 * FILENAME: ni.h
 * PROJECT: Project Bonfire
 * COPYRIGHT: BASED ON CODE FROM THE PLASMA PROJECT
 *    Software placed into the public domain by the author.
 *    Software 'as is' without warranty. Author liable for nothing.
 * DESCRIPTION:
 *    Functions related to communication over UART
 * DISCLAIMER: This file contains code from the Plasma CPU core project.
 *    The code was originally written and put to public domain
 *    by Steve Rhoads (rhoadss@yahoo.com).
 *--------------------------------------------------------------------*/

#include "uart.h"
#include "plasma.h"
#include "std_func.h"

/**
 * Sets up the UART port
 * @param cpu_hz      CPU speed in Hz
 * @param uart_baud_hz Desired UART baudrate in Hz
 */
void setup_uart(unsigned cpu_hz, unsigned uart_baud_hz)
{
    unsigned uart_counter = cpu_hz / uart_baud_hz;
    memory_write(UART_CONF_ADDR, uart_counter);
}

/**
 * Write a character to UART.
 * @param  value Character to write
 */
void uart_putchar(int value)
{
   while((memory_read(IRQ_STATUS) & IRQ_UART_WRITE_AVAILABLE) == 0);
   memory_write(UART_WRITE_ADDR, value);
}

/**
 * Write a string to UART
 * @param string String to write
 */
void uart_puts(const char *string)
{
   while(*string)
   {
      if(*string == '\n')
         uart_putchar('\r');
      uart_putchar(*string++);
   }
}

/**
 * Write some hexadecimal value to UART
 * @param num Value to write
 */
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

/**
* Prints a number into UART
* @param num    Number to print
* @param base   Base of the number
* @param digits Number of digits to print
*/
void uart_print_num(long num, long base, long digits)
{
    char *ptr, buffer[128];
    itoa2(num, buffer, base, &digits);
    ptr = buffer;

    while(*ptr) {
        uart_putchar(*ptr++);         // Put the character out
        if(ptr[-1] == '\n') *--ptr = '\r';
    }
}

/**
 * Check if there is a character in UART buffer
 * @return  True if there is a character to read, False otherwise
 */
int uart_kbhit(void)
{
   return memory_read(IRQ_STATUS) & IRQ_UART_READ_AVAILABLE;
}

/**
 * Gets a character from UART
 * @return  Character recieved over uart
 */
char uart_getch(void)
{
   while(!uart_kbhit()) ;
   return memory_read(UART_READ_ADDR);
}
