/*--------------------------------------------------------------------
 * TITLE: Command object
 * AUTHOR: Karl Janson
 * DATE CREATED: 14.12.16
 * FILENAME: common.h
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Command object for inter-thread communication
 *--------------------------------------------------------------------*/


#ifndef __COMMAND_H__
#define __COMMAND_H__

#include <string>
#include <iostream>
#include "message.h"

class UI;
class CPU;

class Command : public Message
{
protected:
    UI* ui;
    CPU* cpu;
public:
    Command(UI* r_ui, CPU* r_cpu)
    {
        ui = r_ui;
        cpu = r_cpu;
    }
    virtual void execute () {}
};

#endif //__COMMAND_H__
