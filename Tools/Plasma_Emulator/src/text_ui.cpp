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
#include <future>
#include <chrono>
#include <boost/lexical_cast.hpp>
#include <boost/functional/factory.hpp>
#include <boost/function.hpp>
#include <boost/bind.hpp>
#include "common.h"
#include "text_ui.h"
#include "command.h"
#include "wv_except.h"
#include "ui.h"

using namespace std;

/**
 * Constructor
 */
TextUI::TextUI()
{
    /* Initiate command factory */
    command_factory["help"]           = boost::bind( boost::factory<Help_Command*>(), this);
    command_factory["read_reg"]       = boost::bind( boost::factory<Read_Reg_Command*>(), this);
    command_factory["read_mem"]       = boost::bind( boost::factory<Read_Mem_Command*>(), this);
    command_factory["read_reg_bank"]  = boost::bind( boost::factory<Read_Reg_Bank_Command*>(), this);
    command_factory["read_mem_all"]   = boost::bind( boost::factory<Read_Mem_All_Command*>(), this);
    command_factory["set_reg"]        = boost::bind( boost::factory<Set_Reg_Command*>(), this);
    command_factory["set_mem"]        = boost::bind( boost::factory<Set_Mem_Command*>(), this);
    command_factory["io_read"]     = boost::bind( boost::factory<MM_IO_Read_Command*>(), this);
    command_factory["io_write"]    = boost::bind( boost::factory<MM_IO_Write_Command*>(), this);

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
Command* TextUI::extract_command(string line)
{
    Command* command = new Command (this, nullptr);
    stringstream ss;

    ss.str(line);

    /* Extract all space seperated words from line and put the in the command object */
    while (! ss.eof())
    {
        getline(ss, line, ' ');
        command -> push_back(line);
    }

    return command;
}

/**
 * Prints a Command on the screen.
 * @param msg_type Command type
 * @param Command  Command body
 * @param title    Command title (optional)
 */
void TextUI::display_msg(int msg_type, std::string Command, std::string title)
{
    switch (msg_type) {
        case MSG_DEBUG:
            cout << endl << "DEBUG: " << title << endl;
            break;

        case MSG_INFO:
            cout << endl << "INFO: " << title << endl;
            break;

        case MSG_WARN:
            cout << endl << "WARNING: " << title << endl;
            break;

        case MSG_ERR:
            cout << endl << "ERROR: " << title << endl;
            break;

        default:
            throw WrongValueException("Cannot display Command: wrong Command type!\n \
                The Command was: " + Command);
            break;
    }

    cout << Command << endl << endl;
    cout << "Command:> ";
}

/**
 * Gets input from the terminal
 * @return The Command conatining the command
 */
Command* TextUI::get_command()
{

    Command* command = new Command(this, nullptr);
    string line;

    while (1)
    {
        try
        {
            /* Read a line from the console */
            getline (cin, line);
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
                cout << "not a gui command" << endl;
            }
        }
        catch (out_of_range& e)
        {
            display_msg(MSG_ERR, e.what());
        }

    }
    return command;
}
