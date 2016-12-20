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
#include "common.h"
#include "text_ui.h"

using namespace std;

TextUI::TextUI(struct Command_storage &command) : command_storage(command)
{
    exit_signal = false;
}

void TextUI::extract_command(string line, string &command, string &param)
{
    stringstream ss;
    ss.str(line);
    getline(ss, command, ' ');
    getline(ss, param);
}

void TextUI::process_command(string command, string param)
{
    while(command_storage.Status != Cmd_status::reset);

    if (command == "exit" || command == "quit")
    {
        command_storage.Type = Cmd_type::cmd_exit;
        command_storage.Status = Cmd_status::set;
        exit_signal = true;
    }
    else if (command == "asm")
    {
        command_storage.Type = Cmd_type::cmd_asm;
        command_storage.Status = Cmd_status::set;
    }
    else
    {
        cout << "Error! Command \'" << command << "\' not recognized!" << endl;
    }
}

void TextUI::cmd()
{
    string line;
    string command;
    string param;

    cout << endl << endl;
    cout << "*****************************************" << endl;
    cout << "*                                       *" << endl;
    cout << "*    Bonfire NoC Plasma CPU Emulator    *" << endl;
    cout << "*       v0.000001 alpha -testing        *" << endl;
    cout << "*                                       *" << endl;
    cout << "*****************************************" << endl << endl;

    while (! exit_signal)
    {
        cout << "Command:> ";
        getline (cin, line);

        extract_command(line, command, param);
        process_command(command, param);
    }
}
