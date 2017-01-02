/*--------------------------------------------------------------------
 * TITLE: Text Based User Commands
 * AUTHOR: Karl Janson
 * DATE CREATED: 01.10.17
 * FILENAME: text_ui_commands.h
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    User commands used in the text user interface
 *--------------------------------------------------------------------*/

#ifndef __TEXT_UI_COMMANDS_H__
#define __TEXT_UI_COMMANDS_H__

#include <boost/function.hpp>
#include "command.h"

class UI;

namespace text_ui_cmds
{
    /*************** Type Definitions *******************/
    typedef boost::function< Command*() > text_ui_cmd_class;

    /************* CPU Internal Commands *************/

    /**
    * Print usage information.
    */
    class Help_Command : public Command
    {
    public:
        Help_Command (UI* r_ui) : Command(r_ui, nullptr){}
        void execute ();
    };

    /**
    * Display contents of a register.
    */
    class Read_Reg_Command : public Command
    {
    public:
        Read_Reg_Command (UI* r_ui) : Command(r_ui, nullptr){}
        void execute ();
    };

    /**
    * Display contents of a memory address.
    */
    class Read_Mem_Command : public Command
    {
    public:
        Read_Mem_Command (UI* r_ui) : Command(r_ui, nullptr){}
        void execute ();
    };

    /**
    * Display contents of the entire register bank.
    */
    class Read_Reg_Bank_Command : public Command
    {
    public:
        Read_Reg_Bank_Command (UI* r_ui) : Command(r_ui, nullptr){}
        void execute ();
    };

    /**
    * Display contents of the entire memory.
    */
    class Read_Mem_All_Command : public Command
    {
    public:
        Read_Mem_All_Command (UI* r_ui) : Command(r_ui, nullptr){}
        void execute ();
    };

    /**
    * Set a register to a value
    */
    class Set_Reg_Command : public Command
    {
    public:
        Set_Reg_Command (UI* r_ui) : Command(r_ui, nullptr){}
        void execute ();
    };

    /**
    * Set a memory address to a value.
    */
    class Set_Mem_Command : public Command
    {
    public:
        Set_Mem_Command (UI* r_ui) : Command(r_ui, nullptr){}
        void execute ();
    };

    /**
    * Read a register from a memory mapped device.
    */
    class MM_IO_Read_Command : public Command
    {
    public:
        MM_IO_Read_Command (UI* r_ui) : Command(r_ui, nullptr){}
        void execute ();
    };

    /**
    * Set a register of a memory mapped device.
    */
    class MM_IO_Write_Command : public Command
    {
    public:
        MM_IO_Write_Command (UI* r_ui) : Command(r_ui, nullptr){}
        void execute ();
    };
}

#endif //__TEXT_UI_COMMANDS_H__
