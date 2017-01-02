/*--------------------------------------------------------------------
 * TITLE: Toplevel generic CPU implementation
 * AUTHOR: Karl Janson
 * DATE CREATED: 14.12.16
 * FILENAME: cpu.cpp
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Toplevel generic CPU implementation
 *--------------------------------------------------------------------*/

#include <boost/functional/factory.hpp>
#include <boost/bind.hpp>
#include <string>
#include "cpu.h"
#include "common.h"
#include "command.h"
#include "ui.h"
#include "cpu_state.h"
#include "cpu_commands.h"

/**
 * Constructor
 */
CPU::CPU(UI* ui)
{
    /* Initialize command factory */
    cpu_cmd_factory["exit"]       = boost::bind( boost::factory<CPU_Cmds::Exit_Command*>(), ui, this);
    cpu_cmd_factory["asm"]        = boost::bind( boost::factory<CPU_Cmds::ASM_Command*>(), ui, this);
    cpu_cmd_factory["pb"]         = boost::bind( boost::factory<CPU_Cmds::Breakpoint_Command*>(), ui, this);
    cpu_cmd_factory["load"]       = boost::bind( boost::factory<CPU_Cmds::Load_Command*>(), ui, this);
    cpu_cmd_factory["run"]        = boost::bind( boost::factory<CPU_Cmds::Run_Command*>(), ui, this);
    cpu_cmd_factory["stop"]       = boost::bind( boost::factory<CPU_Cmds::Stop_Command*>(), ui, this);
    cpu_cmd_factory["reset"]      = boost::bind( boost::factory<CPU_Cmds::Reset_Command*>(), ui, this);

    /* Create a CPU state object */
    cpu_state = new CPU_State;
}

/**
 * Destructor
 */
CPU::~CPU()
{
    delete cpu_state;
}

/**
 * Gives access to the CPU state object
 * @return CPU state object
 */
CPU_State* CPU::get_state()
{
    return cpu_state;
}

/**
 * Builds a command object based on the name
 * @param  command_name Command name
 * @return              Command object
 */
Command* CPU::get_command(std::string command_name)
{
    if (cpu_cmd_factory.find(command_name) != cpu_cmd_factory.end())
    {
        Command* command = cpu_cmd_factory[command_name]();
        return command;
    }
    else
    {
        return nullptr;
    }
}
