/*--------------------------------------------------------------------
 * TITLE: CPU Commands
 * AUTHOR: Karl Janson
 * DATE CREATED: 01.01.17
 * FILENAME: cpu_commands.cpp
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Class definitions for CPU control commands
 *--------------------------------------------------------------------*/

#include <map>
#include <boost/function.hpp>
#include "cpu_commands.h"
#include "ui.h"

namespace CPU_Cmds
{
    /**
    * Exit Command.
    */
    void Exit_Command::execute()
    {
        ui->display_msg(msg_type_info, "Bye, Bye!", "Exit command received");
    }

    /**
    * Assembly execution command.
    */
    void ASM_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Run assembly");
    };

    /**
    * Breakpoint management command.
    */
    void Breakpoint_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Breakpoint");
    };

    /**
    * Load file command.
    */
    void Load_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Load file");
    };

    /**
    * Execute code command
    */
    void Run_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Run code");
    };

    /**
    * Stop executn command
    */
    void Stop_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Stop execution");
    };

    /**
    * Reset CPU command
    */
    void Reset_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Reset CPU");
    };
}
