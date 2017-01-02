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

#ifndef __UI_H__
#define __UI_H__

#include <string>

/************** Constant Definitions ***************/
const int msg_type_debug  = 0;
const int msg_type_info   = 0;
const int msg_type_warn   = 0;
const int msg_type_err    = 0;

class Command;

class UI
{
private:

public:

    /* Communication with other parts of the system */
    virtual Command* get_command() = 0;
    virtual void display_msg(int msg_type, std::string Command, std::string title = "") = 0;

    /* Display reg/mem contents */
    uint32_t read_reg(uint32_t reg_num);
    uint32_t read_mem(uint32_t addr);

    uint32_t read_reg_bank();
    uint32_t read_mem_all();

    /* Set reg / mem contents */
    void set_reg(uint32_t reg_num, uint32_t value);
    void set_mem(uint32_t addr, uint32_t value);

    void mm_io_read();
    void mm_io_write();

    void print_status();

    void set_breakpoint();
    void list_breakpoints();
    void del_breakpoint();
};

#endif //__UI_H__
