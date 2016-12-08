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

Memory::Memory(uint32_t memory_size)
{
    memory = (uint32_t *)malloc(sizeof(uint32_t)*memory_size);
}

void Memory::write(uint32_t address, uint32_t value)
{
        memory[address] = value;
}

int Memory::read(uint32_t address)
{
        return memory[address];
}


uint32_t Memory::load_byte(uint32_t address, bool load_signed)
{

    uint32_t cell_addr;
    uint32_t byte_index;
    uint32_t memory_cell;
    uint32_t extracted_byte;

    cell_addr = address / 4;
    byte_index = address % 4;
    memory_cell = memory[cell_addr];
    extracted_byte = (memory_cell & (BYTE_MASK << byte_index*8)) >> byte_index*8;

    if (load_signed)
    {
        if ((memory_cell & SIGN_MASK_32) >> 31) //value is negative
        {
            return 0xFFFFFF00 | extracted_byte;
        }
        else
        {
            return extracted_byte;
        }

    }
    else // !load_siged
    {
        return extracted_byte;
    }

}

uint32_t Memory::load_hword(uint32_t address, bool load_signed)
{
    uint32_t cell_addr;
    uint32_t byte_index;
    uint32_t memory_cell;
    uint32_t extracted_byte;

    if (address % 2 != 0)
    {
        cout << "Unaligned memory access at address " << address << endl;
        cout << "This cannot be tolerated! Will exit." << endl;
        //TODO: actually exit
        return 1;
    }

    cell_addr = address / 4;
    byte_index = address % 4;
    memory_cell = memory[cell_addr];
    extracted_byte = (memory_cell & (HWORD_MASK << byte_index*8)) >> byte_index*8;

    if (load_signed)
    {
        if ((memory_cell & SIGN_MASK_32) >> 31) //value is negative
        {
            return 0xFFFF0000 | extracted_byte;
        }
        else
        {
            return extracted_byte;
        }

    }
    else // !load_siged
    {
        return extracted_byte;
    }
}

uint32_t Memory::load_word(uint32_t address)
{
    uint32_t cell_addr;

    if (address % 4 != 0)
    {
        cout << "Unaligned memory access at address " << address << endl;
        cout << "This cannot be tolerated! Will exit." << endl;
        //TODO: actually exit
        return 1;
    }

    cell_addr = address / 4;

    return memory[cell_addr];

}

void Memory::store_byte(uint32_t address, uint32_t value)
{
    uint32_t cell_addr;
    uint32_t byte_index;
    uint32_t memory_cell;

    cell_addr = address / 4;
    byte_index = address % 4;
    memory_cell = memory[cell_addr];
    memory[cell_addr] = memory_cell | (value << byte_index*8);
}

void Memory::store_hword(uint32_t address, uint32_t value)
{
    uint32_t cell_addr;
    uint32_t byte_index;
    uint32_t memory_cell;

    if (address % 2 != 0)
    {
        cout << "Unaligned memory access at address " << address << endl;
        cout << "This cannot be tolerated! Will exit." << endl;
        //TODO: actually exit
        return 1;
    }

    cell_addr = address / 4;
    byte_index = address % 4;
    memory_cell = memory[cell_addr];
    memory[cell_addr] = memory_cell | (value << byte_index*8);
}

void Memory::store_word(uint32_t address, uint32_t value)
{
    uint32_t cell_addr;

    if (address % 4 != 0)
    {
        cout << "Unaligned memory access at address " << address << endl;
        cout << "This cannot be tolerated! Will exit." << endl;
        //TODO: actually exit
        return 1;
    }

    cell_addr = address / 4;

    memory[cell_addr] = value;
}
