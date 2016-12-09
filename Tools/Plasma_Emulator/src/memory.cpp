/*-------------------------------------------------------------------
-- TITLE: A gemory class for Plasma MIPS simulator
-- AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
-- DATE CREATED: 04.12.16
-- FILENAME: memory.cpp
-- PROJECT: Project Bonfire
-- COPYRIGHT: Software placed into the public domain by the author.
--        Software 'as is' without warranty.    Author liable for nothing.
-- DESCRIPTION:
--     Includes a generic definition for memory functions
--     Does not simulate a specific memory type
--     Can be used for RAM, register bank, or any other memory
--------------------------------------------------------------------*/

#include <stdlib.h>
#include <iostream>
#include "common.h"
#include "memory.h"

using namespace std;

/**
 * Creates a memory.
 * @param   memory_size     Size of the memory to be created
 */
Memory::Memory(uint32_t memory_size, int mem_type)
{
    type = mem_type;
    memory = (uint32_t *)malloc(sizeof(uint32_t)*memory_size);
}

/**
 * Destructor. Releases memory.
 */
Memory::~Memory()
{
    free(memory);
}

/**
 * Writes a word into a specified address in memory
 * @param address Address of the memory cell to write into
 * @param value   Value to write into the memory cell
 */
void Memory::write(uint32_t address, uint32_t value)
{
    memory[address] = value;
}

/**
 * Reads a word from the memory
 * @param  address Address of the memory cell to read
 * @return         Contents of the memory cell read
 */
uint32_t Memory::read(uint32_t address)
{
    // Register 0 of MIPS always returns 0.
    if (type == MEM_TYPE_REG_BANK)
    {
        return 0;
    }
    else
    {
        return memory[address];
    }
}
