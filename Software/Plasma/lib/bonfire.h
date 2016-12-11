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

#include "../../lib/pt-1.4/pt.h"

/* Flags for protothreads */
static int send_thread_flag, recv_thread_flag;

/* Protothread state variables */
static struct pt pt_send, pt_recv;



/**
 * NI sending protothread
 */
static int send_thread(struct pt *pt);

/**
 * NI receiving protothread
 */
static int recv_thread(struct pt *pt);

/**
 * NI data processing protothread
 */
static int data_thread(struct pt *pt);

#define BONFIRE_MAIN()                              \
                                                    \
    int main() {                                    \
                                                    \
        PT_INIT(&pt_send);                          \
        PT_INIT(&pt_recv);                          \
                                                    \
        while (1)                                   \
        {                                           \
            send_thread(&pt_send);                  \
            recv_thread(&pt_recv);                  \
        }                                           \
                                                    \
        return 0;                                   \
    }                                               \
    static int data_thread(struct pt *pt)

#endif //__NI_H__
