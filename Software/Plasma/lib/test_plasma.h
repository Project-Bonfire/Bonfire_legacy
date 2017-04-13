/*--------------------------------------------------------------------
 * TITLE: Header file for plasma testing function
 * AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
 * DATE CREATED: 02.12.16
 * FILENAME: ni.h
 * PROJECT: Project Bonfire
 * COPYRIGHT: BASED ON CODE FROM THE PLASMA PROJECT
 *    Software placed into the public domain by the author.
 *    Software 'as is' without warranty. Author liable for nothing.
 * DESCRIPTION:
 *    Functions related to testing different Plasma functions
 *--------------------------------------------------------------------*/

 #ifndef __TEST_PLASMA_H__
 #define __TEST_PLASMA_H__


 extern int failure_count;

 static const unsigned primes_array[] =
 {
       3,   5,   7,  11,  13,  17,  19,  23,  29,  31,  37,  41,  43,  47,  53,
      59,  61,  67,  71,  73,  79,  83,  89,  97, 101, 103, 107, 109, 113, 127,
     131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199,
     211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283,
     293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383,
     389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467,
     479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577,
     587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661,
     673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769,
     773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877,
     881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983,
     991, 997
 };

 static const unsigned shift_array_1[] =
 {
     0x12345678, 0x091a2b3c, 0x048d159e, 0x02468acf, 0x01234567, 0x0091a2b3,
     0x0048d159, 0x002468ac, 0x00123456, 0x00091a2b, 0x00048d15, 0x0002468a,
     0x00012345, 0x000091a2, 0x000048d1, 0x00002468, 0x00001234, 0x0000091a,
     0x0000048d, 0x00000246, 0x00000123, 0x00000091, 0x00000048, 0x00000024,
     0x00000012, 0x00000009, 0x00000004, 0x00000002, 0x00000001, 0x00000000,
     0x00000000, 0x00000000
 };

 static const unsigned shift_array_2[] =
 {
     0x92345678, 0xc91a2b3c, 0xe48d159e, 0xf2468acf, 0xf9234567, 0xfc91a2b3,
     0xfe48d159, 0xff2468ac, 0xff923456, 0xffc91a2b, 0xffe48d15, 0xfff2468a,
     0xfff92345, 0xfffc91a2, 0xfffe48d1, 0xffff2468, 0xffff9234, 0xffffc91a,
     0xffffe48d, 0xfffff246, 0xfffff923, 0xfffffc91, 0xfffffe48, 0xffffff24,
     0xffffff92, 0xffffffc9, 0xffffffe4, 0xfffffff2, 0xfffffff9, 0xfffffffc,
     0xfffffffe, 0xffffffff
 };

 static const unsigned mult_array_1[] =
 {
     0x00000000, 0x00000007, 0x0000000e, 0x00000015, 0x0000001c, 0x00000023
 };

 static const unsigned mult_add_array_1[] =
 {
     0x000007f5, 0x000007fc, 0x00000803, 0x0000080a, 0x00000811, 0x00000818
 };

 static const unsigned div_array_1[] =
 {
     0x00000007, 0x00000003, 0x00000002, 0x00000001, 0x00000001, 0x00000001,
     0x00000001, 0x00000000, 0x00000000
 };

 static const unsigned rem_array_1[] =
 {
     0x00000000, 0x00000001, 0x00000001, 0x00000003, 0x00000002, 0x00000001,
     0x00000000, 0x00000007, 0x00000007
 };

 static const unsigned mult_array_2[] =
 {
     0x00000000, 0x00000321, 0x00000642, 0x00000963, 0x00000c84, 0x00000fa5
 };

 static const unsigned mult_add_array_2[] =
 {
     0x00038e83, 0x000391a4, 0x000394c5, 0x000397e6, 0x00039b07, 0x00039e28
 };

 static const unsigned div_array_2[] =
 {
     0x00000321, 0x00000190, 0x0000010b, 0x000000c8, 0x000000a0, 0x00000085,
     0x00000072, 0x00000064, 0x00000059
 };

 static const unsigned rem_array_2[] =
 {
     0x00000000, 0x00000001, 0x00000000, 0x00000001, 0x00000001, 0x00000003,
     0x00000003, 0x00000001, 0x00000000
 };

 static const unsigned mult_array_3[] =
 {
     0x00000000, 0x00054321, 0x000a8642, 0x000fc963, 0x00150c84, 0x001a4fa5
 };

 static const unsigned mult_add_array_3[] =
 {
     0x05fb4e83, 0x060091a4, 0x0605d4c5, 0x060b17e6, 0x06105b07, 0x06159e28
 };

 static const unsigned div_array_3[] =
 {
     0x00054321, 0x0002a190, 0x0001c10b, 0x000150c8, 0x00010d6d, 0x0000e085,
     0x0000c072, 0x0000a864, 0x000095ae
 };

 static const unsigned rem_array_3[] =
 {
     0x00000000, 0x00000001, 0x00000000, 0x00000001, 0x00000000, 0x00000003,
     0x00000003, 0x00000001, 0x00000003
 };

 static const unsigned mult_array_4[] =
 {
     0x00000000, 0x00054321, 0x000a8642, 0x000fc963, 0x00150c84, 0x001a4fa5
 };

 static const unsigned mult_add_array_4[] =
 {
     0x00000000, 0x00012345, 0x0002468a, 0x000369cf, 0x00048d14, 0x0005b059
 };

 static const unsigned div_array_4[] =
 {
     0x00012345, 0x000091a2, 0x00006117, 0x000048d1, 0x00003a41, 0x0000308b,
     0x0000299c, 0x00002468, 0x0000205d
 };

 static const unsigned rem_array_4[] =
 {
     00000000, 0x00000001, 0x00000000, 0x00000001, 0x00000000, 0x00000003,
     0x00000001, 0x00000005, 0x00000000
 };

 static const unsigned add_array[] =
 {
     0x00001234, 0x00001235, 0x00001236, 0x00001237, 0x00001238, 0x00001239,
     0x0000123a, 0x0000123b, 0x0000123c, 0x0000123d
 };

 static const unsigned sub_array[] =
 {
     0x00001234, 0x00001233, 0x00001232, 0x00001231, 0x00001230, 0x0000122f,
     0x0000122e, 0x0000122d, 0x0000122c, 0x0000122b
 };

 /**
 * Runs all Plasma tests
 */
 void test_plasma_funcitons();

/**
 * Calculates and prints all prime numbers less than 1000
 */
void calculate_primes();

/**
 * Testing Plasma's shifting functions
 */
void test_shift(long num, const unsigned result_array[], int test_num);

/**
 * Testing multiplication on Plasma
 */
 void test_mult_div(long num, const unsigned mult_array[],
                     const unsigned mult_add_array[],
                     const unsigned div_array[],
                     const unsigned rem_array[],
                     int test_num);

/**
 * Test adder / subtractor on Plasma
 */
void test_add_sub();

/**
 * Tests memory access on Plasma
 */
void test_mem_access();

/**
 * Tests bit operations on Plasma
 */
void test_bit_ops();

#endif //__TEST_PLASMA_H__
