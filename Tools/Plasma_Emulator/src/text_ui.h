/*--------------------------------------------------------------------
 * TITLE: Text Based User Interface
 * AUTHOR: Karl Janson
 * DATE CREATED: 14.12.16
 * FILENAME: text_ui.h
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Text user interface
 *--------------------------------------------------------------------*/

#ifndef __TEXT_UI_H__
#define __TEXT_UI_H__

#include <string>
#include <map>

using namespace std;

class TextUI
{

public:
    TextUI(struct Command_storage &command);
    void cmd();
private:
    void extract_command(string line, string &command, string &param);
    void process_command(string command, string param);
    Command_storage& command_storage;
    bool exit_signal;
};

#endif //__TEXT_UI_H__
