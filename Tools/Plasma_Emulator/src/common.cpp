
/*--------------------------------------------------------------------
 * TITLE: Common defines
 * AUTHOR: Karl Janson
 * DATE CREATED: 14.12.16
 * FILENAME: common.h
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Common defines and variables used everywhere in the project
 *--------------------------------------------------------------------*/

#include "common.h"

CPU_State* state;
/*
std::queue<Message<Type_cmd>> command_queue;
std::mutex command_mutex;
volatile bool command_lock = false;
//std::condition_variable command_cond;

std::queue<Message<Type_txt>> msg_queue;
std::mutex msg_mutex;
volatile bool msg_lock = false;
*/
