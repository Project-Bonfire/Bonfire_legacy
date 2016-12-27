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


#ifndef __COMMON_H__
#define __COMMON_H__

#include <iostream>
#include <cstdint>
#include <queue>
#include <condition_variable>
#include <mutex>
#include "message.h"

/**
 * Global Defines
 */
#define SIGNED    1
#define UNSIGNED  0

#define BYTE_MASK   0xFF
#define HWORD_MASK   0xFFFF
#define SIGN_MASK_32    0x80000000

#define BYTE_LENGTH     1
#define HWORD_LENGTH    2
#define WORD_LENGTH     4

/**
 * Threading Related Variables
 */
/*
extern std::queue<Message<Type_cmd>> command_queue;
extern std::mutex command_mutex;
extern volatile bool command_lock;
//extern std::condition_variable command_cond;

extern std::queue<Message<Type_txt>> msg_queue;
extern std::mutex msg_mutex;
extern volatile bool msg_lock;
*/

#endif //__COMMON_H__
