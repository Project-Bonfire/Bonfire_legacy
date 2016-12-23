/*--------------------------------------------------------------------
 * TITLE: Plasma hardware related functions
 * AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
 * DATE CREATED: 02.12.16
 * FILENAME: plasma.c
 * PROJECT: Bonfire NoC
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Plasma hardware related functions
 *--------------------------------------------------------------------*/

 #include "plasma.h"
 #include "ni.h"
 #include "uart.h"

 /*********** Global Variables *************/
 //unsigned int us_counter = 0;

 /* Interrupt handler called by the assmebly */
 void OS_InterruptServiceRoutine(uint32 status, uint32 *stack)
 {
     //us_counter++;
     /* detect what generated the IRQ */
     /*switch (status)
     {
         case IRQ_COUNTER18:
            //us_counter++;
            break;

         default:
            break;
     }*/
     //uart_print_hex(us_counter);
     //uart_putchar('\n');
     /* Reset the counter */
     memory_write(COUNTER_REG, US_INIT_VALUE);
 }
