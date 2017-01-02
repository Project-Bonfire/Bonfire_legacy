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
#include "ui.h"
#include "command.h"
#include "text_ui_commands.h"


/**************** TextUI Main Class *****************/
class TextUI : public UI
{
private:
    std::map<const int, std::string> msg_type_map;
    Command* extract_command(std::string line);
    std::map<std::string,text_ui_cmds::command_class> command_factory;
    void print_hello_msg();

public:
    TextUI();
    Command* get_command();
    void display_msg(int msg_type, std::string Command, std::string title = "");
};

#endif //__TEXT_UI_H__
