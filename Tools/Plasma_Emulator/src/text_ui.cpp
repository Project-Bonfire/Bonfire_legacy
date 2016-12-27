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
 * Executes the command or sends it to the higher layer,
 * based on the command type.
 * @param  command The command the user enteres
 * @param  param   String with all the other data
 *                 the command had after the space
 * @return         The command to the top level
 */
Message TextUI::process_command(string command, string param)
{
    Message message;

    /* Control messages */
    if (command == "exit" || command == "quit")
    {
        message.build(Msg_type::cmd_exit, "");
    }

    else if (command == "asm")
    {
        message.build(Msg_type::cmd_asm, param);
    }

    else if (command == "bp")
    {
        message.build(Msg_type::cmd_bp, param);
    }

    else if (command == "load")
    {
        message.build(Msg_type::cmd_load, param);
    }

    else if (command == "run")
    {
        message.build(Msg_type::cmd_run, param);
    }

    else if (command == "pause")
    {
        message.build(Msg_type::cmd_pause, param);
    }

    else
    {
        display_msg(MSG_ERR, "Error! Command \'" + command + "\' not recognized!");
    }

    return message;
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
    stringstream ss;
    Message message;

    try
    {
        getline (cin, line);

        ss.str(line);
        getline(ss, command, ' ');
        getline(ss, param);

        message = process_command(command, param);
    }

    catch (...)
    {
        throw;
    }
    return message;

}
