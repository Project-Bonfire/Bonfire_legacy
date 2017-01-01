/*--------------------------------------------------------------------
 * TITLE: CPU Commands
 * AUTHOR: Karl Janson
 * DATE CREATED: 01.01.17
 * FILENAME: cpu_commands.h
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Class definitions for CPU control commands
 *--------------------------------------------------------------------*/

#ifndef __CPU_COMMANDS_H__
#define __CPU_COMMANDS_H__

#include <map>
#include <boost/function.hpp>
#include "command.h"

class UI;
class CPU;

namespace CPU_Cmds
{
    /***************** Type Definitions *****************/
    typedef boost::function< Command*() > CPU_command_class;

    /************* CPU Internal Commands *************/

    /**
    * Exit Command.
    */
    class Exit_Command : public Command
    {
    public:
        Exit_Command (UI* r_ui, CPU* r_cpu) : Command(r_ui, r_cpu){}
        void execute ();
    };

    /**
    * Assembly execution command.
    */
    class ASM_Command : public Command
    {
    public:
        ASM_Command (UI* r_ui, CPU* r_cpu) : Command(r_ui, r_cpu){}
        void execute ();
    };

    /**
    * Breakpoint management command.
    */
    class Breakpoint_Command : public Command
    {
    public:
        Breakpoint_Command (UI* r_ui, CPU* r_cpu) : Command(r_ui, r_cpu){}
        void execute ();
    };

    /**
    * Load file command.
    */
    class Load_Command : public Command
    {
    public:
        Load_Command (UI* r_ui, CPU* r_cpu) : Command(r_ui, r_cpu){}
        void execute ();
    };

    /**
    * Execute code command
    */
    class Run_Command : public Command
    {
    public:
        Run_Command (UI* r_ui, CPU* r_cpu) : Command(r_ui, r_cpu){}
        void execute ();
    };

    /**
    * Stop executn command
    */
    class Stop_Command : public Command
    {
    public:
        Stop_Command (UI* r_ui, CPU* r_cpu) : Command(r_ui, r_cpu){}
        void execute ();
    };

    /**
    * Reset CPU command
    */
    class Reset_Command : public Command
    {
    public:
        Reset_Command (UI* r_ui, CPU* r_cpu) : Command(r_ui, r_cpu){}
        void execute ();
    };
}

#endif //__CPU_COMMANDS_H__
