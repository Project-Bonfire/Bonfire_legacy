#include "bonfire.h"
#include "plasma.h"
#include "ni.h"
#include "packets.h"

/****** Recieve Buffer Initialization ******/
int recv_pointer = 0;
int send_pointer = 0;

/********* Flags for Protothreads *********/
int send_thread_flag    = THREAD_ENABLE;
int recv_thread_flag    = THREAD_DISABLE;
int process_thread_flag = THREAD_DISABLE;

/**************** Functions ****************/

/**
 * Puts a flit to the  send queue.
 * @param  data The flit to be sent
 * @return      Error code
 */
int bonfire_send(unsigned int data)
{
    if (send_pointer < SEND_BUF_SIZE - 1)
    {
        send_buffer[send_pointer] = data;
        send_pointer++;

        return 0;
    }
    else
    {
        return -1;
    }
}

/**************** Threads ****************/

/**
 * NI sending protothread
 */
int send_thread(struct pt *pt)
{
    int i;
    PT_BEGIN(pt);

    while(1)
    {
        /* Wait for our turn */
        PT_YIELD_UNTIL(pt, send_thread_flag == THREAD_ENABLE);

        if (((ni_read_flags() & NI_WRITE_MASK) == 0) && \
            (send_pointer > 0))
        {
            ni_write(send_buffer[0]);
        }

        /****** Sending code ******/
        /*if (((ni_read_flags() & NI_WRITE_MASK) == 0) && \
            (send_pointer > 0))
        {
            for (i = 0; i < send_pointer; i++)
            {
                ni_write(send_buffer[i]);
            }
            send_pointer = 0;
        }*/

        /****** End of sending code ******/

        /* Next thread's turn */
        send_thread_flag    = THREAD_DISABLE;
        recv_thread_flag    = THREAD_ENABLE;
        process_thread_flag = THREAD_DISABLE;
    }

    PT_END(pt);
}

/**
 * NI receiving protothread
 */
int recv_thread(struct pt *pt)
{
    unsigned int ni_flags;
    unsigned int packet_counter = 0;

    PT_BEGIN(pt);

    while(1)
    {
        /* Wait for our turn */
        PT_YIELD_UNTIL(pt, recv_thread_flag == THREAD_ENABLE);

        /****** Recieving code ******/
        packet_counter = memory_read(NI_COUNTER_ADDRESS);
        ni_flags = ni_read_flags();

        if ((packet_counter > 0) && \
            ((ni_flags & NI_READ_MASK) == 0) && \
            (recv_pointer < RECV_BUF_SIZE - 1))
        {
            recv_buffer[recv_pointer] = ni_read();
            recv_pointer++;
        }

        /****** End of recieving code ******/

        /* Next thread's turn */
        send_thread_flag    = THREAD_DISABLE;
        recv_thread_flag    = THREAD_DISABLE;
        process_thread_flag = THREAD_ENABLE;
    }
    PT_END(pt);
}
