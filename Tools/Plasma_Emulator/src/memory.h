/*-------------------------------------------------------------------
-- TITLE: A memory class for Plasma MIPS simulator
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

#include <map>
#include "common.h"

class Memory
{

private:

    uint32_t size;
    uint32_t *memory;

    //   map < addr,     constant value > Contains only addresses with constant values
    std::map < uint32_t, int > addr_const_map;

public:
    Memory(uint32_t memory_size);
    Memory(uint32_t memory_size, std::map < uint32_t, int > &const_map);
    ~Memory();

    void write(uint32_t address, uint32_t value);

    uint32_t read(uint32_t address);

    uint32_t get_size();
};

#endif //__MEMORY_H__
