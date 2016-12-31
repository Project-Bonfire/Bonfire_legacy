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
#include <iostream>
#include <boost/function.hpp>
#include "ui.h"
#include "command.h"

typedef boost::function< Command*() > command_class;

/************* TextUI Main Class *************/
class TextUI : public UI
{
private:
    Command* extract_command(std::string line);
    std::map<std::string,command_class> command_factory;

public:
    TextUI();
    Command* get_command();
    void display_msg(int msg_type, std::string Command, std::string title = "");
};

/************* TextUI Internal Commands *************/

class Help_Command : public Command
{
public:
    Help_Command (UI* r_ui) : Command(r_ui, nullptr){}
    void execute ()
    {
        ui->display_msg(MSG_DEBUG, "Command not yet implemented!", "Help command");
    };
};

class Read_Reg_Command : public Command
{
public:
    Read_Reg_Command (UI* r_ui) : Command(r_ui, nullptr){}

    void execute ()
    {
        ui->display_msg(MSG_DEBUG, "Command not yet implemented!", "Read register");
    };
};

class Read_Mem_Command : public Command
{
public:
    Read_Mem_Command (UI* r_ui) : Command(r_ui, nullptr){}

    void execute ()
    {
        ui->display_msg(MSG_DEBUG, "Command not yet implemented!", "Read memory");
    };
};

class Read_Reg_Bank_Command : public Command
{
public:
    Read_Reg_Bank_Command (UI* r_ui) : Command(r_ui, nullptr){}

    void execute ()
    {
        ui->display_msg(MSG_DEBUG, "Command not yet implemented!", "Read register bank");
    };
};

class Read_Mem_All_Command : public Command
{
public:
    Read_Mem_All_Command (UI* r_ui) : Command(r_ui, nullptr){}

    void execute ()
    {
        ui->display_msg(MSG_DEBUG, "Command not yet implemented!", "Read memory");
    };
};

class Set_Reg_Command : public Command
{
public:
    Set_Reg_Command (UI* r_ui) : Command(r_ui, nullptr){}

    void execute ()
    {
        ui->display_msg(MSG_DEBUG, "Command not yet implemented!", "Set register");
    };
};

class Set_Mem_Command : public Command
{
public:
    Set_Mem_Command (UI* r_ui) : Command(r_ui, nullptr){}

    void execute ()
    {
        ui->display_msg(MSG_DEBUG, "Command not yet implemented!", "Set memory address");
    };
};

class MM_IO_Read_Command : public Command
{
public:
    MM_IO_Read_Command (UI* r_ui) : Command(r_ui, nullptr){}

    void execute ()
    {
        ui->display_msg(MSG_DEBUG, "Command not yet implemented!", "Read MM IO");
    };
};

class MM_IO_Write_Command : public Command
{
public:
    MM_IO_Write_Command (UI* r_ui) : Command(r_ui, nullptr){}

    void execute ()
    {
        ui->display_msg(MSG_DEBUG, "Command not yet implemented!", "Write to MM IO");
    };
};

#endif //__TEXT_UI_H__
