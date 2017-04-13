/*--------------------------------------------------------------------
 * TITLE: NoC Network interface related defines
 * AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
 * DATE CREATED: 02.12.16
 * FILENAME: ni.h
 * PROJECT: Project Bonfire
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty. Author liable for nothing.
 * DESCRIPTION:
 *    Functions for accessing the Bonfire NoC
 *--------------------------------------------------------------------*/

#ifndef __NI_H__
#define __NI_H__

/*********** Hardware addresses ***********/
#define NI_IO_ADDRESS     0x7FFCu
#define NI_FLAGS_ADDRESS  0x8000u
#define NI_COUNTER_ADDRESS  0x8004u

/* NI flag masks */
#define NI_READ_MASK   0x80000000
#define NI_WRITE_MASK  0x40000000

/***** Functions for accessing NI *****/
#define ni_read() (*(volatile unsigned int*)NI_IO_ADDRESS)
#define ni_write(A) (*(volatile unsigned int*)NI_IO_ADDRESS = (A))

/***** Functions for accessing NI *****/
#define ni_read_flags() (*(volatile unsigned int*)NI_FLAGS_ADDRESS)

#endif //__NI_H__
