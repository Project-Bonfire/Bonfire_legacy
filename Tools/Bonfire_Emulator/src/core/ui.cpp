/*--------------------------------------------------------------------
 * TITLE: User Interface
 * AUTHOR: Karl Janson
 * DATE CREATED: 14.12.16
 * FILENAME: common.h
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Defines an interface for attaching an UI to the CPU
 *--------------------------------------------------------------------*/

#include <string>
#include "ui.h"
#include "common.h"
#include "command.h"
#include "cpu.h"

//TODO: Cleanup

uint32_t UI::read_reg(uint32_t reg_num)
{
    try
    {
        //return state->reg_bank->read(reg_num);
        return 0;
    }
    catch (...) { throw; }
}

uint32_t UI::read_mem(uint32_t addr)
{
    try
    {
        //return state->ram->read(addr);
        return 0;
    }
    catch (...) { throw; }}

uint32_t UI::read_reg_bank()
{
    return 0; // not implemented
}

uint32_t UI::read_mem_all()
{
    return 0; // not implemented
}

void UI::set_reg(uint32_t reg_num, uint32_t value)
{
    try
    {
        //state->reg_bank->write(reg_num, value);
    }
    catch (...) { throw; }
}

void UI::set_mem(uint32_t addr, uint32_t value)
{
    try
    {
        //state->ram->write(addr, value);
    }
    catch (...) { throw; }
}

void UI::mm_io_read() {}
void UI::mm_io_write() {}

void UI::print_status() {}

void UI::set_breakpoint() {}
void UI::list_breakpoints() {}
void UI::del_breakpoint() {}
