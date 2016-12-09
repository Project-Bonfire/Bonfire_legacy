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

#ifndef __MEMORY_H__
#define __MEMORY_H__

#include "common.h"

#define MEM_TYPE_RAM        0
#define MEM_TYPE_REG_BANK   1

class Memory
{
    public:
      Memory(uint32_t memory_size, int mem_type);
      ~Memory();

      void write(uint32_t address, uint32_t value);

      uint32_t read(uint32_t address);

    private:
      int type;
      uint32_t *memory;
};

#endif //__MEMORY_H__
