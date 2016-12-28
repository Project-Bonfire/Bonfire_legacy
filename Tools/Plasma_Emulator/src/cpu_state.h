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

#ifndef __CPU_STATE_H__
#define __CPU_STATE_H__

#include "common.h"
#include "memory.h"

class CPU_State
{
    
public:
    CPU_State(uint32_t memory_size = 0, uint32_t reg_bank_size = 0);
    ~CPU_State();

    Memory* ram;
    Memory* reg_bank;
};

#endif //__CPU_STATE_H__
