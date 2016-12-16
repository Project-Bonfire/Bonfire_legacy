/*--------------------------------------------------------------------
 * TITLE: UART functions
 * AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
 * DATE CREATED: 02.12.16
 * FILENAME: ni.h
 * PROJECT: Project Bonfire
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty. Author liable for nothing.
 * DESCRIPTION:
 *    Functions related to communication over UART
 *--------------------------------------------------------------------*/

#ifndef __UART_H__
#define __UART_H__

#include "plasma.h"

/**
 * Write a character to UART.
 * @param  value Character to write
 */
void uart_putchar(int value);

/**
 * Write a string to UART
 * @param string String to write
 */
void uart_puts(const char *string);

/**
 * Write some hexadecimal value to UART
 * @param num Value to write
 */
void uart_print_hex(unsigned long num);

/**
 * Check if there is a character in UART buffer
 * @return  True if there is a character to read, False otherwise
 */
int uart_kbhit(void);

/**
 * Gets a character from UART
 * @return  Character recieved over uart
 */
int uart_getch(void);

#endif //__UART_H__
