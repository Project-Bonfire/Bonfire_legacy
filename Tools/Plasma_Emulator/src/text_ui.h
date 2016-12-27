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
#include "ui.h"
#include "message.h"

class TextUI : public UI
{
private:
    Message process_command(std::string command, std::string param);

public:
    TextUI();
    Message get_command();
    void display_msg(int msg_type, std::string message, std::string title = "");
};

#endif //__TEXT_UI_H__
