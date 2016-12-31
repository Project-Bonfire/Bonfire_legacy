/*--------------------------------------------------------------------
 * TITLE: Toplevel CPU Class
 * AUTHOR: Karl Janson
 * DATE CREATED: 14.12.16
 * FILENAME: text_ui.h
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Implements toplevel CPU functions
 *--------------------------------------------------------------------*/

#ifndef __CPU_H__
#define __CPU_H__

#include "command.h"
#include "ui.h"
#include "cpu_state.h"

class Command;

class CPU
{
protected:
    CPU_State* cpu_state;

public:
    CPU();
    ~CPU();

    virtual void init() = 0;

    CPU_State* state();
};
/*
class Exit_Command : public Command
{
    void execute (UI& ui)
    {
        ui.display_msg(MSG_INFO, "Bye, Bye!", "Exit command received");
        //exit_signal = true;
    };
};

class ASM_Command : public Command
{
    void execute (UI& ui)
    {
        ui.display_msg(MSG_DEBUG, "Command not yet implemented!", "Run assembly");
    };
};

class Breakpoint_Command : public Command
{
    void execute (UI& ui)
    {
        ui.display_msg(MSG_DEBUG, "Command not yet implemented!", "Breakpoint");
    };
};

class Load_Command : public Command
{
    void execute (UI& ui)
    {
        ui.display_msg(MSG_DEBUG, "Command not yet implemented!", "Load file");
    };
};

class Run_Command : public Command
{
    void execute (UI& ui)
    {
        ui.display_msg(MSG_DEBUG, "Command not yet implemented!", "Run code");
    };
};

class Stop_Command : public Command
{
    void execute (UI& ui)
    {
        ui.display_msg(MSG_DEBUG, "Command not yet implemented!", "Stop execution");
    };
};

class Reset_Command : public Command
{
    void execute (UI& ui)
    {
        ui.display_msg(MSG_DEBUG, "Command not yet implemented!", "Reset CPU");
    };
};
*/



#endif //__CPU_H__
