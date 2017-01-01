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
CPU_State::CPU_State(std::map<std::string,Memory*> memories)
{
    m_memories = memories;
}

/**
 * Destructor
 */
CPU_State::~CPU_State()
{
}
