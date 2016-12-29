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

#include <boost/lexical_cast.hpp>
#include <iostream>
#include <string>
#include <sstream>
#include <future>
#include <chrono>
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
Command TextUI::extract_command(string line)
{
    Command command;
    stringstream ss;

    ss.str(line);

    /* Extract all space seperated words from line and put the in the command object */
    while (! ss.eof())
    {
        getline(ss, line, ' ');
        command.push_back(line);
    }

    return command;
}

/**
* Executes the command or sends it to the higher layer,
* based on the command type.
 * @param  command The Command object to work on
 * @return         False if the command needs to be sent to the calling function,
 *                      true if it was handled locally.
 */
bool TextUI::process_command(Command& command)
{

    /* Locally handled Commands */
    if (command.get_head() == "read_reg")
    {
        //try
        //{
            /* Read a register and display its contents on the screen */
            if (command.body_size() != 0)
            {
                auto data = UI::read_reg(boost::lexical_cast<uint32_t>(command.get_body()[0]));
                display_msg(MSG_INFO, to_string(data), "Contents of register " + command.get_body()[0] + ":");
            }
            else
            {
                display_msg(MSG_ERR, "Please specify a register number to read!");
            }
        //}
        //catch (exception& e)
        //{
            //ostringstream e_stream;
            //e_stream  << "Error while reading register " << command.get_body()[0] << ": " << e.what();
            //throw out_of_range (e_stream.str());

        //}

        return true;
    }

    else if (command.get_head() == "read_mem")
    {
        try
        {
            /* Read a memory address and display its contents on the screen */
            if (command.body_size() != 0)
            {
                auto data = UI::read_mem(boost::lexical_cast<uint32_t>(command.get_body()[0]));
                display_msg(MSG_INFO, to_string(data), "Contents of memeory address " + command.get_body()[0] + ":");
            }
            else
            {
                display_msg(MSG_ERR, "Please specify a memory address to read!");
            }
        }
        catch (...) { throw; }

        return true;
    }

    else
    {
        return false;
    }

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
Command TextUI::get_command()
{
    Command command;
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
            auto cmd_processed_locally = process_command(command);

            if (! cmd_processed_locally)
            {
                break;
            }
        }
        catch (out_of_range& e)
        {
            display_msg(MSG_ERR, e.what());
        }

    }
    return command;
}
