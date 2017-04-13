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

#include "std_func.h"

/**
 * Copies a string
 * @param  s destination string
 * @param  t source string
 * @return   destination
 */
char *strcpy2(char *s, const char *t)
{
   char *tmp = s;
   while((int)(*s++ = *t++));
   return(tmp);
}

/**
 * Converts an integer to a string
 * @param n      integer to convert
 * @param s      string to copy the integer to
 * @param base   Base of the output
 * @param digits number of digits to output
 */
void itoa2(long n, char *s, int base, long *digits)
{
   long i, j, sign;
   unsigned long n2;
   char number[20];

   for (i = 0; i < 15; ++i) {
      number[i] = ' ';
   }

   number[15] = 0;

   if (n >= 0 || base != 10)
   {
      sign = 1;

   } else
   {
      sign =- 1;
   }

   n2 = n * sign;

   for (j = 14; j >= 0; --j) {
      i = n2 % base;
      n2 /= base;
      number[j] = i < 10 ? '0' +i : 'a' + i - 10;

      if(n2 == 0 && 15 - j >= *digits)
      {
          break;
      }
   }

   if (sign == -1)
   {
      number[--j] = '-';
   }

   if (*digits == 0 || *digits < 15 - j)
   {
      strcpy2(s, &number[j]);
      *digits = 15 - j;

   }
   else
   {
      strcpy2(s, &number[15 - *digits]);
   }
}
