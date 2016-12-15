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

void Cpu::execute(){}

void Cpu::run()
{
    Memory ram(1024, MEM_TYPE_RAM);
    MemoryCtrl ram_ctrl;

    Memory reg_bank(32, MEM_TYPE_REG_BANK);


    while (!exit_signal)
    {
        execute();
    }
    cout << "cpu out" << endl;
}
