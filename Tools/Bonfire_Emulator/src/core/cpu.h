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
class Command;

class CPU
{
protected:
    CPU_State* cpu_state;

public:
    std::map<std::string,CPU_Cmds::cpu_cmd_class> cpu_cmd_factory;
    CPU(UI* ui);
    ~CPU();

    virtual void init() = 0;

    CPU_State* get_state();
    Command* get_command(std::string command_name);
};

#endif //__CPU_H__
