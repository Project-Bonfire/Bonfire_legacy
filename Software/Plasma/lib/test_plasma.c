/*-------------------------------------------------------------------
-- TITLE: Plasma CPU test code
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 4/21/01
-- FILENAME: test.c
-- PROJECT: Plasma CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--   The executable image of this file is used as input to the VHDL.
--
--   This file must not contain any global or static data since
--   there isn't a loader to relocate the .data segment and since
--   having static data causes the opcodes to begin at a different
--   location in the resulting executable file.
--
--   Save the opcodes in "code.txt".
--
--   Testing subversion.
--
-- Edited by Karl Janson:
-- Made more universal, moved print functions to uart.h,
-- code cleanup
--------------------------------------------------------------------*/

#include "test_plasma.h"
#include "std_func.h"
#include "uart.h"

int failure_count = 0;

/**
 * Runs all Plasma tests
 */
void test_plasma_funcitons()
{

   uart_puts("\nGeneral plasma test\n\n");

   uart_puts("\nTesting shifting\n");
   uart_puts("=====================\n");
   test_shift(0x12345678, shift_array_1, 1);
   test_shift(0x92345678, shift_array_2, 2);

   /* Test multiply and divide */
   uart_puts("\n\nTesting multiplication / division\n");
   uart_puts("=====================\n");
   test_mult_div(0x7, mult_array_1, mult_add_array_1, div_array_1, rem_array_1, 1);
   test_mult_div(0x321, mult_array_2, mult_add_array_2, div_array_2, rem_array_2, 2);
   test_mult_div(0x54321, mult_array_3, mult_add_array_3, div_array_3, rem_array_3, 3);
   test_mult_div(0x12345, mult_array_4, mult_add_array_4, div_array_4, rem_array_4, 4);

   /* Test addition and subtraction */
   uart_puts("\n\nTesting adding / subtraction\n");
   uart_puts("=====================\n");
   test_add_sub();

   /* Test bit operations */
   uart_puts("Testing bit operations\n");
   uart_puts("=====================\n");
   test_bit_ops();

   /* Test memory access */
   uart_puts("Testing memory accesss\n");
   uart_puts("=====================\n");
   test_mem_access();

   uart_puts("Listing all prime numbers smaller than 1000\n");
   uart_puts("=====================\n");
   calculate_primes();

   uart_puts("Testing done\n\n");

   uart_puts("PLASMA TEST ");

   if (failure_count == 0)
   {
       uart_puts("PASSED!");
   }

   else
   {
       uart_puts("FAILED!\n");
       uart_puts("Total failed tests: ");
       uart_print_num(failure_count, 10, 0);
       uart_putchar('\n');
   }
}

/**
 * Calculates and prints all prime numbers less than 1000
 */
void calculate_primes()
{
   int i, j;
   int index = 0;
   int failure = 0;

   //show all calculate_primes numbers less than 1000
   for(i = 3; i < 1000; i += 2) {
      for(j = 3; j < i; j += 2) {
         if(i % j == 0) {
            j = 0;
            break;
         }
      }
      if(j) {
         uart_print_num(i, 10, 0);
         uart_putchar(':');
         uart_print_num(primes_array[index], 10, 0);

         if (i != primes_array[index])
         {
             failure = 1;
         }
         index++;
      }
      uart_putchar(' ');
   }
   if (failure == 1)
   {
       uart_puts("\n\nPRIME NUMBER CALCULATION FAILED!\n\n");
       failure_count++;
   }
   else
   {
       uart_puts("\n\nPRIME NUMBER CALCULATION PASSED!\n\n");
   }

}

/**
 * Testing Plasma's shifting functions
 */
void test_shift(long num, const unsigned result_array[], int test_num)
{
    short i;
    unsigned ans;

    int failure = 0;

    for(i = 0; i < 32; ++i) {
        ans = num >> i;

        uart_print_hex(ans);
        uart_putchar(':');
        uart_print_hex(result_array[i]);
        uart_putchar(' ');

        if (ans != result_array[i])
        {
            failure = 1;
        }
    }

    uart_puts("\n\nSHIFTING TEST ");
    uart_print_num(test_num, 10, 0);

    if (failure == 1)
    {
        uart_puts(" FAILED!\n\n");
        failure_count++;
    }
    else
    {
        uart_puts(" PASSED!\n\n");;
    }
}

/**
 * Testing multiplication on Plasma
 */
void test_mult_div(long num, const unsigned mult_array[],
                    const unsigned mult_add_array[],
                    const unsigned div_array[],
                    const unsigned rem_array[],
                    int test_num)
{
    short i;
    int failure = 0;
    unsigned ans;

    for(i = 0; i <= 5; ++i) {
       ans = num * i;
       uart_print_hex(ans);
       uart_putchar(':');
       uart_print_hex(mult_array[i]);
       uart_putchar(' ');

       if (ans != mult_array[i])
       {
           failure = 1;
       }
    }

    uart_putchar('\n');

    for(i = 0; i <= 5; ++i) {
       ans = num * (i + 0x123);
       uart_print_hex(ans);
       uart_putchar(':');
       uart_print_hex(mult_add_array[i]);
       uart_putchar(' ');

       if (ans != mult_add_array[i])
       {
           failure = 1;
       }
    }

    uart_putchar('\n');

    for(i = 1; i < 10; ++i) {
       ans = num / i;
       uart_print_hex(ans);
       uart_putchar(':');
       uart_print_hex(div_array[i - 1]);
       uart_putchar(' ');

       if (ans != div_array[i - 1])
       {
           failure = 1;
       }
    }

    uart_putchar('\n');

    for(i = 1; i < 10; ++i) {
       ans = num % i;
       uart_print_hex(ans);
       uart_putchar(':');
       uart_print_hex(rem_array[i - 1]);
       uart_putchar(' ');

       if (ans != rem_array[i - 1])
       {
           failure = 1;
       }
    }

    uart_puts("\n\nMULTIPLICATION / DIVISION TEST ");
    uart_print_num(test_num, 10, 0);

    if (failure == 1)
    {
        uart_puts(" FAILED!\n\n");
        failure_count++;
    }
    else
    {
        uart_puts(" PASSED!\n\n");;
    }
}

/**
 * Test adder / subtractor on Plasma
 */
void test_add_sub()
{
    long i;
    long j = 0x1234;

    int failure = 0;
    unsigned ans;

    for(i = 0; i < 10; ++i) {
       ans = j + i;
       uart_print_hex(ans);
       uart_putchar(':');
       uart_print_hex(add_array[i]);
       uart_putchar(' ');

       if (ans != add_array[i])
       {
           failure = 1;
       }
    }
    uart_putchar('\n');

    for(i = 0; i < 10; ++i) {
       ans = j - i;
       uart_print_hex(ans);
       uart_putchar(':');
       uart_print_hex(sub_array[i]);
       uart_putchar(' ');

       if (ans != sub_array[i])
       {
           failure = 1;
       }
    }

    uart_puts("\n\nADDER / SUBTRACTOR TEST ");

    if (failure == 1)
    {
        uart_puts(" FAILED!\n\n");
        failure_count++;
    }
    else
    {
        uart_puts(" PASSED!\n\n");;
    }
}

/**
 * Tests memory access on Plasma
 */
void test_mem_access()
{
    long i, j;
    int failure = 0;

    char char_buf[16];
    short short_buf[16];
    long long_buf[16];

    static const int test_buf[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

    for(i = 0; i < 10; ++i) {
       char_buf[i] = i;
       short_buf[i] = i;
       long_buf[i] = i;
    }

    for(i = 0; i < 10; ++i) {

       j = char_buf[i];
       uart_print_num(j, 10, 0);
       uart_putchar(':');
       uart_print_num(test_buf[i], 10, 0);
       uart_putchar(' ');

       if (j != test_buf[i])
       {
           failure = 1;
       }

       j = short_buf[i];
       uart_print_num(j, 10, 0);
       uart_putchar(':');
       uart_print_num(test_buf[i], 10, 0);
       uart_putchar(' ');

       if (j != test_buf[i])
       {
           failure = 1;
       }

       j = long_buf[i];
       uart_print_num(j, 10, 0);
       uart_putchar(':');
       uart_print_num(test_buf[i], 10, 0);
       uart_putchar('\n');

       if (j != test_buf[i])
       {
           failure = 1;
       }
    }

    uart_puts("\n\nMEMORY TEST ");

    if (failure == 1)
    {
        uart_puts(" FAILED!\n\n");
        failure_count++;
    }
    else
    {
        uart_puts(" PASSED!\n\n");;
    }
}

/**
 * Tests bit operations on Plasma
 */
void test_bit_ops()
{
    long i = 0x1234;
    long j = 0x4321;
    int failure = 0;
    unsigned ans;

    static const unsigned test_buf[] =
    {
        0x00000220, 0x00005335, 0x00005115, 0xffffedcb,
        0x00001246, 0x00001222
    };

    ans = i & j;
    uart_print_hex(ans);
    uart_putchar(':');
    uart_print_hex(test_buf[0]);
    uart_putchar(' ');

    if (ans != test_buf[0])
    {
        failure = 1;
    }

    ans = i | j;
    uart_print_hex(ans);
    uart_putchar(':');
    uart_print_hex(test_buf[1]);
    uart_putchar(' ');

    if (ans != test_buf[1])
    {
        failure = 1;
    }

    ans = i ^ j;
    uart_print_hex(ans);
    uart_putchar(':');
    uart_print_hex(test_buf[2]);
    uart_putchar(' ');

    if (ans != test_buf[2])
    {
        failure = 1;
    }

    ans = ~i;
    uart_print_hex(ans);
    uart_putchar(':');
    uart_print_hex(test_buf[3]);
    uart_putchar(' ');

    if (ans != test_buf[3])
    {
        failure = 1;
    }

    ans = i + 0x12;
    uart_print_hex(ans);
    uart_putchar(':');
    uart_print_hex(test_buf[4]);
    uart_putchar(' ');

    if (ans != test_buf[4])
    {
        failure = 1;
    }

    ans = i - 0x12;
    uart_print_hex(ans);
    uart_putchar(':');
    uart_print_hex(test_buf[5]);

    if (ans != test_buf[5])
    {
        failure = 1;
    }

    uart_puts("\n\nBIT OPERATIONS TEST ");

    if (failure == 1)
    {
        uart_puts(" FAILED!\n\n");
        failure_count++;
    }
    else
    {
        uart_puts(" PASSED!\n\n");;
    }
}
