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
#include "common.h"
#include "cpu.h"
#include "memory.h"
#include "memory_ctrl.h"

using namespace std;

Cpu::Cpu(struct Command_storage &command) : command_storage(command)
{
    exit_signal = false;
}

void Cpu::execute(){}

void Cpu::run()
{

    Memory ram(1024, MEM_TYPE_RAM);

    Memory reg_bank(32, MEM_TYPE_REG_BANK);


    while (!exit_signal)
    {
        if (command_storage.Status == Cmd_status::set)
        {
            switch (command_storage.Type)
            {
                case Cmd_type::cmd_exit:
                    exit_signal = true;
                    break;
                case Cmd_type::cmd_asm:
                    cout << "ASM cmd" << endl;
                default:
                    break;
            }
            command_storage.Status = Cmd_status::reset;
        }
    }
    cout << "cpu out" << endl;
}
