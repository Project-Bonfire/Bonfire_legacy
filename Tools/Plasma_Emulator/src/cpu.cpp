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
#include "common.h"
#include "cpu.h"
#include "ui.h"
#include "cpu_state.h"
#include "cpu_commands.h"

CPU::CPU(UI* ui)
{
    /* Initialize command factory */
    command_factory["Exit_Command"]       = boost::bind( boost::factory<CPU_Cmds::Exit_Command*>(), ui, this);
    command_factory["ASM_Command"]        = boost::bind( boost::factory<CPU_Cmds::ASM_Command*>(), ui, this);
    command_factory["Breakpoint_Command"] = boost::bind( boost::factory<CPU_Cmds::Breakpoint_Command*>(), ui, this);
    command_factory["Load_Command"]       = boost::bind( boost::factory<CPU_Cmds::Load_Command*>(), ui, this);
    command_factory["Run_Command"]        = boost::bind( boost::factory<CPU_Cmds::Run_Command*>(), ui, this);
    command_factory["Stop_Command"]       = boost::bind( boost::factory<CPU_Cmds::Stop_Command*>(), ui, this);
    command_factory["Reset_Command"]      = boost::bind( boost::factory<CPU_Cmds::Reset_Command*>(), ui, this);

    /* Create a CPU state object */
    cpu_state = new CPU_State;
}

CPU::~CPU()
{
    delete cpu_state;
}

CPU_State* CPU::state()
{
    return cpu_state;
}
