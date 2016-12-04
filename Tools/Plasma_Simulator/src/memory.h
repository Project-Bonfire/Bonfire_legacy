/*-------------------------------------------------------------------
-- TITLE: A gemory class for Plasma MIPS simulator
-- AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
-- DATE CREATED: 04.12.16
-- FILENAME: memory.h
-- PROJECT: Project Bonfire
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--   Includes a generic definition for memory functions
--   Does not simulate a specific memory type
--   Can be used for RAM, register bank, or any other memory
--------------------------------------------------------------------*/

#include "defines.h"

#ifndef __MEMORY_H__
#define __MEMORY_H__

using namespace std;

class Memory {
    public:
      Memory(reg memory_size);

      void write(reg address, reg value);

      int read(reg address);

    private:
      reg *memory;
};

#endif //__MEMORY_H__
