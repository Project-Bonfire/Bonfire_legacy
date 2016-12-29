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
#include <map>
#include "common.h"
#include "memory.h"

using namespace std;

/**
 * Creates a memory.
 * @param   memory_size     Size of the memory to be created
 */
Memory::Memory(uint32_t memory_size)
{
    size = memory_size;

    try
    {
        allocate(memory_size);
    }
    catch(...) { throw; }
}

/**
 * Creates a memory.
 * @param   memory_size     Size of the memory to be created
 */
Memory::Memory(uint32_t memory_size, std::map < uint32_t, int > &const_map)
{
    addr_const_map = const_map;

    try
    {
        allocate(memory_size);
    }
    catch(...) { throw; }
}

/**
 * Destructor. Releases memory.
 */
Memory::~Memory()
{
    delete[] memory;
}

/**
 * Allocates the memory.
 * @param Number of 32-bit register / memory cells to allocate
 */
void Memory::allocate(uint32_t memory_size)
{
    size = memory_size;

    try
    {
        /* Allocate memory */
        memory = new uint32_t[memory_size];
    }
    catch (bad_alloc& ba)
    {
        cerr << endl << "Memory allocation failed" << endl << endl;

        throw;
    }
}

/**
* Get size of the current memory object
* @return Size of the current memory object (in cells)
*/
uint32_t Memory::get_size()
{
    return size;
}

/**
 * Writes a word into a specified address in memory
 * @param address Address of the memory cell to write into
 * @param value   Value to write into the memory cell
 */
void Memory::write(uint32_t address, uint32_t value)
{
    if ((address < 0) || (address >= size))
    {
        throw std::out_of_range ("Address out of bounds!");
    }

    memory[address] = value;
}

/**
 * Reads a word from the memory
 * @param  address Address of the memory cell to read
 * @return         Contents of the memory cell read
 */
uint32_t Memory::read(uint32_t address)
{
    if ((address < 0) || (address >= size))
    {
        throw std::out_of_range ("Address out of bounds!");
    }

    /* Check whether we are using an address that is defined as constant */
    if (addr_const_map.find(address) != addr_const_map.end())
    {
        return addr_const_map[address];
    }

    /* Else read the memory contents */
    else
    {
        return memory[address];
    }
}
