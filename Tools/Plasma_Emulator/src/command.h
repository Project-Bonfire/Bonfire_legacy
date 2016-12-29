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

enum class Msg_type
{
    /* Commands */
    cmd_none,
    cmd_exit,
    cmd_asm,
    cmd_bp,
    cmd_load,
    cmd_run,
    cmd_pause,

    /* Text */
    txt_info,
    txt_debug,
    txt_warn,
    txt_err
};

class Command
{
public:
  Msg_type type;
  std::string param;

  Command(){}

  void build(Msg_type m_type, std::string parameters = "")
  {
    type = m_type;
    param = parameters;
  }
};

#endif //__COMMAND_H__
