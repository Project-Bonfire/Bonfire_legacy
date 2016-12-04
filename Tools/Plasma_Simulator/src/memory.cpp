/*-------------------------------------------------------------------
-- TITLE: A gemory class for Plasma MIPS simulator
-- AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
-- DATE CREATED: 04.12.16
-- FILENAME: memory.cpp
-- PROJECT: Project Bonfire
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--   Includes a generic definition for memory functions
--   Does not simulate a specific memory type
--   Can be used for RAM, register bank, or any other memory
--------------------------------------------------------------------*/

#include <stdlib.h>
#include "defines.h"
#include "memory.h"

using namespace std;

Memory::Memory(reg memory_size)
{
  memory = (reg *)malloc(sizeof(reg)*memory_size);
}

void Memory::write(reg address, reg value)
{
    memory[address] = value;
}

int Memory::read(reg address)
{
    return memory[address];
}
