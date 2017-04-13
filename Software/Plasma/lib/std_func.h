/*--------------------------------------------------------------------
 * TITLE: Plasma standard library
 * AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
 * DATE CREATED: 02.12.16
 * FILENAME: ni.h
 * PROJECT: Project Bonfire
 * COPYRIGHT: BASED ON CODE FROM THE PLASMA PROJECT
 *    Software placed into the public domain by the author.
 *    Software 'as is' without warranty. Author liable for nothing.
 * DESCRIPTION:
 *    Implementation of some standard library functions for the Plasma core
 *--------------------------------------------------------------------*/

#ifndef __STD_FUNC_H__
#define __STD_FUNC_H__

/**
 * Copies a string
 * @param  s destination string
 * @param  t source string
 * @return   destination
 */
char *strcpy2(char *s, const char *t);

/**
 * Converts an integer to a string
 * @param n      integer to convert
 * @param s      string to copy the integer to
 * @param base   Base of the output
 * @param digits number of digits to output
 */
void itoa2(long n, char *s, int base, long *digits);

#endif //__STD_FUNC_H__
