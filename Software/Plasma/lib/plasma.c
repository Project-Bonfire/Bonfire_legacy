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

 /* Interrupt handler called by the assmebly */
 void OS_InterruptServiceRoutine(uint32 status, uint32 *stack)
 {
   recv_packet_counter++;
 }
