/*-------------------------------------------------------------------
-- TITLE: A memory class for Plasma MIPS simulator
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
 * Get size of the current memory object
 * @return Size of the current memory object (in cells)
 */
uint32_t Memory::get_size()
{
    return size;
}

/**
 * Get type of the current memory object.
 * @return Type of the current memory object
 */
Mem_Type Memory::get_type()
{
    return type;
}

/**
 * Creates a memory.
 * @param   memory_size     Size of the memory to be created
 */
Memory::Memory(uint32_t memory_size, Mem_Type mem_type)
{
    type = mem_type;

    try
    {
        /* Allocate memory */
        memory = new uint32_t[memory_size];
    }
    catch (bad_alloc& ba)
    {
        cerr << endl << "Memory allocation failed for virtual " << \
        ((type == Mem_Type::ram) ? "RAM!" : "register file!") << endl << endl;

        throw;
    }
}

/**
 * Destructor. Releases memory.
 */
Memory::~Memory()
{
    delete[] memory;
}

/**
 * Writes a word into a specified address in memory
 * @param address Address of the memory cell to write into
 * @param value   Value to write into the memory cell
 */
void Memory::write(uint32_t address, uint32_t value)
{
    try
    {
        memory[address] = value;
    }
    catch (out_of_range& oor)
    {
        cerr << endl << "Memory write failed for virtual " << \
            ((type == Mem_Type::ram) ? "RAM!" : "register file!") << \
            " Address was " << address << " This is out of range. " << endl \
            << endl;

        throw;
    }
}

/**
 * Reads a word from the memory
 * @param  address Address of the memory cell to read
 * @return         Contents of the memory cell read
 */
uint32_t Memory::read(uint32_t address)
{
    // Register 0 of MIPS always returns 0.
    if ((type == Mem_Type::reg_bank) && (address == 0))
    {
        return 0;
    }
    else
    {
        try
        {
            return memory[address];
        }
        catch (out_of_range& oor)
        {
            cerr << endl << "Memory read failed for virtual " << \
                ((type == Mem_Type::ram) ? "RAM!" : "register file!") << \
                " Address was " << address << " This is out of range. " << endl \
                << endl;
            throw;
        }
    }
}
