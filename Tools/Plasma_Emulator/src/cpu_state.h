/*-------------------------------------------------------------------
-- TITLE: CPU state wrapper object.
-- AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
-- DATE CREATED: 04.12.16
-- FILENAME: cpu_state.h
-- PROJECT: Project Bonfire
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
-- A CPU state wrapper object that contains all the object needed for
-- representing the CPU-s current state.
--------------------------------------------------------------------*/

#ifndef __CPU_STATE_H__
#define __CPU_STATE_H__

#include <map>
#include "common.h"
#include "memory.h"

class CPU_State
{
private:
    std::map<std::string,Memory*> m_memories;

public:
    CPU_State() {}
    CPU_State(std::map<std::string,Memory*> memories);
    ~CPU_State();
};

#endif //__CPU_STATE_H__
