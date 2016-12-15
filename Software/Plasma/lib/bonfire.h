/*--------------------------------------------------------------------
 * TITLE: General Bonfire NoC related code
 * AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
 * DATE CREATED: 02.12.16
 * FILENAME: bonfire.h
 * PROJECT: Project Bonfire
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty. Author liable for nothing.
 * DESCRIPTION:
 *    Functions for accessing the Bonfire NoC functions
 *--------------------------------------------------------------------*/
#ifndef __BONFIRE_H__
#define __BONFIRE_H__

#include "pt-1.4/pt.h"

/************** Macro Defines **************/
#define RECV_BUF_SIZE   16
#define SEND_BUF_SIZE   16

#define THREAD_ENABLE   1
#define THREAD_DISABLE  0

/*** Recieve Buffers and Their Pointers ***/
extern int recv_pointer;
extern int send_pointer;

unsigned int recv_buffer[RECV_BUF_SIZE];
unsigned int send_buffer[SEND_BUF_SIZE];

/********* Flags for Protothreads *********/
extern int send_thread_flag;
extern int recv_thread_flag;
extern int process_thread_flag;

/****** Protothread State Variables *******/
struct pt pt_send;
struct pt pt_recv;
struct pt pt_process;

/**
 * Puts a flit to the  send queue.
 * @param  data The flit to be sent
 * @return      Error code
 */
int bonfire_send(unsigned int data);

/**
 * NI sending protothread
 */
int send_thread(struct pt *pt);

/**
 * NI receiving protothread
 */
int recv_thread(struct pt *pt);

/**
 * Data processing protothread
 */
int proc_thread(struct pt *pt);


#define BONFIRE_MAIN()                                                      \
                                                                            \
    int main() {                                                            \
                                                                            \
        /* Initialize protothreads */                                       \
        PT_INIT(&pt_send);                                                  \
        PT_INIT(&pt_recv);                                                  \
        PT_INIT(&pt_process);                                               \
                                                                            \
        while (1)                                                           \
        {                                                                   \
            send_thread(&pt_send);                                          \
            recv_thread(&pt_recv);                                          \
            proc_thread(&pt_process);                                       \
        }                                                                   \
                                                                            \
        return 0;                                                           \
    }                                                                       \
                                                                            \
    int proc_thread(struct pt *pt)

#define BONFIRE_LOOP()                                                                                                                        \
    PT_BEGIN(pt);                                                           \
                                                                            \
    while(1)                                                                \
    {                                                                       \
        /* Wait for our turn */                                             \
        PT_WAIT_UNTIL(pt, process_thread_flag == THREAD_ENABLE);            \
        if(1)                                                               \

#define BONFIRE_RET()                                                  \
        /* Next thread's turn */                                            \
        send_thread_flag    = THREAD_ENABLE;                                \
        recv_thread_flag    = THREAD_DISABLE;                               \
        process_thread_flag = THREAD_DISABLE;                               \
    }                                                                       \
    PT_END(pt)

#endif //__NI_H__
