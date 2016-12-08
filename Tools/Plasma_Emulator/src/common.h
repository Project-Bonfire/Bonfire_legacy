/*--------------------------------------------------------------------
 * TITLE: Plasma Hardware Defines
 * AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
 * DATE CREATED: 12/17/05
 * FILENAME: common.h
 * PROJECT: Plasma CPU core
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Plasma Hardware Defines
 *
 * MODIFIED by Karl Janson (karl.janson@ati.ttu.ee):
 *    -- Moved memory accessing fuctions here from no-os.c
 *    -- Added interrupt related function declarations
 *--------------------------------------------------------------------*/


#ifndef __COMMON_H__
#define __COMMON_H__

#include <cstdint>

#define SIGNED    1
#define UNSIGNED  0

#define BYTE_MASK   0xFF
#define HWORD_MASK   0xFFFF
#define SIGN_MASK_32    0x80000000


#endif //__COMMON_H__
