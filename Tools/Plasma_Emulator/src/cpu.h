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

class Cpu
{

public:
    Cpu(struct Command_storage &command);
    void run();
private:
    void execute();
    Command_storage& command_storage;
    bool exit_signal;
};

#endif //__CPU_H__
