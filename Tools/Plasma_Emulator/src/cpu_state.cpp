/*-------------------------------------------------------------------
-- TITLE: CPU state wrapper object.
-- AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
-- DATE CREATED: 04.12.16
-- FILENAME: memory.h
-- PROJECT: Project Bonfire
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
-- A CPU state wrapper object that contains all the object needed for
-- representing the CPU-s current state.
--------------------------------------------------------------------*/

#include <iostream>
#include <map>
#include "common.h"
#include "cpu_state.h"
#include "memory.h"
#include "wv_except.h"

using namespace std;

/**
 * Constructor.
 * @param   memory_size: Size of RAM to create (in memory cells)
 * @param   reg_bank_size:  Size of register bank to create (in registers)
 */
CPU_State::CPU_State(uint32_t memory_size, uint32_t reg_bank_size)
{

    if (memory_size < 0)
    {
        throw WrongValueException ("Memory size cannot be negative!");
    }

    else if (reg_bank_size < 0)
    {
        throw WrongValueException ("Register bank size cannot be negative!");
    }

    std::map<uint32_t, int> v = {{0,0}};
    try
    {
       /*
        * Assign nullptr in case the respective size is 0. Implemented for suppoting
        * other types of PE-s that do not require memory and / or register bank
        */

        ram = (memory_size == 0) ? nullptr : new Memory(memory_size);
        reg_bank = (reg_bank_size == 0) ? nullptr : new Memory(reg_bank_size, v);
    }
    catch (...){throw;}
}

/**
 * Destructor
 */
CPU_State::~CPU_State()
{
    delete ram;
    delete reg_bank;
}
