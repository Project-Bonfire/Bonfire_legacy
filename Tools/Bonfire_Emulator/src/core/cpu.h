/*--------------------------------------------------------------------
 * TITLE: Toplevel CPU Class
 * AUTHOR: Karl Janson
 * DATE CREATED: 14.12.16
 * FILENAME: cpu.h
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Implements toplevel CPU functions
 *--------------------------------------------------------------------*/

#ifndef __CPU_H__
#define __CPU_H__

#include <string>
#include "cpu_state.h"
#include "cpu_commands.h"

class UI;

class CPU
{
protected:
    CPU_State* cpu_state;
    std::map<std::string,CPU_Cmds::CPU_command_class> command_factory;

public:
    CPU(UI* ui);
    ~CPU();

    virtual void init() = 0;

    CPU_State* state();
};

#endif //__CPU_H__
