/*--------------------------------------------------------------------
 * TITLE: Text Based User Commands
 * AUTHOR: Karl Janson
 * DATE CREATED: 01.10.17
 * FILENAME: text_ui_commands.cpp
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    User commands used in the text user interface
 *--------------------------------------------------------------------*/

#include "text_ui_commands.h"
#include "ui.h"

namespace text_ui_cmds
{
    /**
    * Print usage information.
    */
    void Help_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Help command");
    }

    /**
    * Display contents of a register.
    */
    void Read_Reg_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Read register");
    }

    /**
    * Display contents of a memory address.
    */
    void Read_Mem_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Read memory");
    }

    /**
    * Display contents of the entire register bank.
    */
    void Read_Reg_Bank_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Read register bank");
    }

    /**
    * Display contents of the entire memory.
    */
    void Read_Mem_All_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Read memory");
    }

    /**
    * Set a register to a value
    */
    void Set_Reg_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Set register");
    }

    /**
    * Set a memory address to a value.
    */
    void Set_Mem_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Set memory address");
    }

    /**
    * Read a register from a memory mapped device.
    */
    void MM_IO_Read_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Read MM IO");
    }

    /**
    * Set a register of a memory mapped device.
    */
    void MM_IO_Write_Command::execute()
    {
        ui->display_msg(msg_type_debug, "Command not yet implemented!", "Write to MM IO");
    }
}
