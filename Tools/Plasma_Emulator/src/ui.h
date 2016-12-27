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

#define MSG_DEBUG   0
#define MSG_INFO    1
#define MSG_WARN    2
#define MSG_ERR     3

#include <string>
#include "message.h"

class UI
{
private:
    /* Display reg/mem contents */
    void read_reg(unsigned reg_num) {};
    void read_mem_addr(unsigned addr) {};

    void read_reg_bank() {};
    void read_mem() {};

public:
    virtual Message get_command() = 0;
    virtual void display_msg(int msg_type, std::string message, std::string title = "") = 0;

    /* Set reg / mem contents */
    void set_reg(unsigned reg_num) {};
    void set_mem(unsigned addr) {};

    void mm_io_read() {};
    void mm_io_write() {};

    void get_last_command() {};

    void set_breakpoint() {};
    void list_breakpoints() {};
    void del_breakpoint() {};
};

#endif //__UI_H__
