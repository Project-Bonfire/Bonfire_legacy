/*--------------------------------------------------------------------
 * TITLE: Text Based User Interface
 * AUTHOR: Karl Janson
 * DATE CREATED: 14.12.16
 * FILENAME: text_ui.cpp
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Text user interface
 *--------------------------------------------------------------------*/

#include <iostream>
#include <string>
#include <sstream>
#include <map>
#include <boost/functional/factory.hpp>
#include <boost/bind.hpp>
#include "common.h"
#include "text_ui.h"
#include "command.h"
#include "text_ui_commands.h"
#include "wv_except.h"

/**
 * Constructor
 */
TextUI::TextUI()
{
    /* Initialize command factory */
    command_factory["help"]           = boost::bind( boost::factory<text_ui_cmds::Help_Command*>(), this);
    command_factory["read_reg"]       = boost::bind( boost::factory<text_ui_cmds::Read_Reg_Command*>(), this);
    command_factory["read_mem"]       = boost::bind( boost::factory<text_ui_cmds::Read_Mem_Command*>(), this);
    command_factory["read_reg_bank"]  = boost::bind( boost::factory<text_ui_cmds::Read_Reg_Bank_Command*>(), this);
    command_factory["read_mem_all"]   = boost::bind( boost::factory<text_ui_cmds::Read_Mem_All_Command*>(), this);
    command_factory["set_reg"]        = boost::bind( boost::factory<text_ui_cmds::Set_Reg_Command*>(), this);
    command_factory["set_mem"]        = boost::bind( boost::factory<text_ui_cmds::Set_Mem_Command*>(), this);
    command_factory["io_read"]        = boost::bind( boost::factory<text_ui_cmds::MM_IO_Read_Command*>(), this);
    command_factory["io_write"]       = boost::bind( boost::factory<text_ui_cmds::MM_IO_Write_Command*>(), this);

    /* Initialize message types */
    msg_type_map[msg_type_debug] = "DEBUG: ";
    msg_type_map[msg_type_debug] = "INFO: ";
    msg_type_map[msg_type_debug] = "WARNING: ";
    msg_type_map[msg_type_debug] = "ERROR: ";

    print_hello_msg();
}

/**
 * Prints a hello message upon startup.
 */
void TextUI::print_hello_msg()
{
    using std::cout;
    using std::endl;

    /* Print message */
    cout << endl << endl;
    cout << "*****************************************" << endl;
    cout << "*                                       *" << endl;
    cout << "*    Bonfire NoC Plasma CPU Emulator    *" << endl;
    cout << "*       v0.000001 alpha -testing        *" << endl;
    cout << "*                                       *" << endl;
    cout << "*****************************************" << endl << endl;

    cout << "Command:> ";
}

/**
 * Extracts a command from the user input and generated a Command object.
 * @param  line Line input from the user
 * @return      Produced command object
 */
Command* TextUI::extract_command(std::string line)
{
    Command* command = new Command (this, nullptr);
    std::stringstream ss;

    ss.str(line);

    /* Extract all space seperated words from line and put the in the command object */
    while (! ss.eof())
    {
        std::getline(ss, line, ' ');
        command -> push_back(line);
    }

    return command;
}

/**
 * Prints a Command on the screen.
 * @param msg_type Message type
 * @param contents Message body
 * @param title    Message title (optional)
 */
void TextUI::display_msg(const int msg_type, std::string contents, std::string title)
{
    using std::cout;
    using std::endl;

    if (msg_type_map.find(msg_type) != msg_type_map.end())
    {
        cout << endl << msg_type_map[msg_type_debug] << title << endl \
        << contents << endl << endl;

        cout << "Command:> ";
    }
    else
    {
        throw WrongValueException("Cannot display Command: wrong Command type!\n");
    }

}

/**
 * Gets input from the terminal
 * @return The Command conatining the command
 */
Command* TextUI::get_command()
{

    Command* command = new Command(this, nullptr);
    std::string line;

    while (1)
    {
        try
        {
            /* Read a line from the console */
            std::getline (std::cin, line);
            command = extract_command(line);
        }
        catch (...) { throw; }

       /*
        * If we got a command that is needed to be sent to the main(),
        * return, otherwize continue.
        */
        try
        {

            if (command_factory.find(command->get_type()) != command_factory.end())
            {
                command_factory[command->get_type()]()->execute();
            }
            else
            {
                return command;
            }
        }
        catch (std::out_of_range& e)
        {
            display_msg(msg_type_err, e.what());
        }

    }
    /* Erronous state that we should never end up in */
    return nullptr;
}
