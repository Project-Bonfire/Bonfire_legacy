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
#include "common.h"
#include "text_ui.h"
#include "message.h"
#include "wv_except.h"
#include "ui.h"
#include <boost/lexical_cast.hpp>

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
 * Extracts a command and its parameters from an user imput
 * @param line    User input
 * @param command Reference to an object for storing the command.
 * @param param   Reference to an object for storing the command's parameters
 */
void TextUI::extract_command(string line, string& command, string& param)
{
    stringstream ss;

    ss.str(line);
    getline(ss, command, ' ');
    getline(ss, param);
}

/**
 * Executes the command or sends it to the higher layer,
 * based on the command type.
 * @param  message A reference to a Message object where the information will be
 *                 stored in case it needs to be sent to the calling function.
 * @param  command The command the user enteres
 * @param  param   String with all the other data
 *                 the command had after the space
 * @return         True if the command needs to be sent to the calling function,
 *                      false if it was handled locally.
 */
bool TextUI::process_command(Message& message, string command, string param)
{

    /* Control messages */
    if (command == "exit" || command == "quit")
    {
        message.build(Msg_type::cmd_exit, "");

        return true;
    }

    else if (command == "asm")
    {
        message.build(Msg_type::cmd_asm, param);

        return true;
    }

    else if (command == "bp")
    {
        message.build(Msg_type::cmd_bp, param);

        return true;
    }

    else if (command == "load")
    {
        message.build(Msg_type::cmd_load, param);

        return true;
    }

    else if (command == "run")
    {
        message.build(Msg_type::cmd_run, param);

        return true;
    }

    else if (command == "pause")
    {
        message.build(Msg_type::cmd_pause, param);

        return true;
    }

    /* Locally handled messages */
    else if (command == "read_reg")
    {
        try
        {
            /* Read a register and display its contents on the screen */
            if (param != "")
            {
                auto data = UI::read_reg(boost::lexical_cast<uint32_t>(param));
                display_msg(MSG_INFO, to_string(data), "Contents of register " + param + ":");
            }
            else
            {
                display_msg(MSG_ERR, "Please specify a register number to read!");
            }
        }
        catch (...) { throw; }

        return false;
    }

    else if (command == "read_mem")
    {
        try
        {
            /* Read a memory address and display its contents on the screen */
            if (param != "")
            {
                auto data = UI::read_mem(boost::lexical_cast<uint32_t>(param));
                display_msg(MSG_INFO, to_string(data), "Contents of memeory address " + param + ":");
            }
            else
            {
                display_msg(MSG_ERR, "Please specify a memory address to read!");
            }
        }
        catch (...) { throw; }

        return false;
    }

    else
    {
        display_msg(MSG_ERR, "Error! Command \'" + command + "\' not recognized!");

        return false;
    }

}

/**
 * Prints a message on the screen.
 * @param msg_type Message type
 * @param message  Message body
 * @param title    Message title (optional)
 */
void TextUI::display_msg(int msg_type, std::string message, std::string title)
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
            throw WrongValueException("Cannot display message: wrong message type!\n \
                The message was: " + message);
            break;
    }

    cout << message << endl << endl;
    cout << "Command:> ";
}

/**
 * Gets input from the terminal
 * @return The message conatining the command
 */
Message TextUI::get_command()
{
    string line;
    string command;
    string param;
    Message message;

    while (1)
    {
        try
        {
            /* Read a line from the console */
            getline (cin, line);
            extract_command(line, command, param);
        }
        catch (...) { throw; }

       /*
        * If we got a command that is needed to be sent to the main(),
        * return, otherwize continue.
        */

        auto result = process_command(message, command, param);
        if (result == true)
        {
            break;
        }
    }
    return message;
}
