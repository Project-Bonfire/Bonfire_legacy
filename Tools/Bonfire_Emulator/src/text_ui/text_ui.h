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

class CPU;

/**************** TextUI Main Class *****************/
class TextUI : public UI
{
private:
    std::map<const int, std::string> msg_type_map;
    std::map<std::string,text_ui_cmds::text_ui_cmd_class> ui_cmd_factory;

    void print_hello_msg();
    std::vector<std::string> extract_command(std::string line);

public:
    TextUI();

    Command* get_command(CPU* cpu);
    void display_msg(int msg_type, std::string Command, std::string title = "");
};

#endif //__TEXT_UI_H__
