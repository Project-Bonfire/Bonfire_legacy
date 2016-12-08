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

#include "common.h"

#ifndef __MEMORY_H__
#define __MEMORY_H__

using namespace std;

class Memory
{
    public:
      Memory(uint32_t memory_size);

      void write(uint32_t address, uint32_t value);

      int read(uint32_t address);

      uint32_t load_byte(uint32_t address, bool load_signed);

      uint32_t load_hword(uint32_t address, bool load_signed);

      uint32_t load_word(uint32_t address);

      void store_byte(uint32_t address, uint32_t value);
      void store_hword(uint32_t address, uint32_t value);
      void store_word(uint32_t address, uint32_t value);

    private:
      uint32_t *memory;
};

#endif //__MEMORY_H__
