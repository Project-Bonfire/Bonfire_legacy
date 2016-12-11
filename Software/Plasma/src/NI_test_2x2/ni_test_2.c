#include "../../lib/plasma.h"
#include "../../lib/ni.h"
#include "../../lib/packets.h"
#include "../../lib/pt-1.4/pt.h"

/* Flags for protothreads */
static int send_thread_flag, recv_thread_flag;

/* Protothread state variables */
static struct pt pt_send, pt_recv;

/**
 * NI sending protothread
 */
static int
send_thread(struct pt *pt)
{
    PT_BEGIN(pt);

    while(1) {
        /* Wait until the recieving protothread has set its flag. */
        PT_WAIT_UNTIL(pt, recv_thread_flag != 0);

        /* Sending code */
        if ((ni_read_flags() & NI_WRITE_MASK) == 0)
        {
            ni_write(build_header(3, 3));
        }

        /* End of sending code */

        /* Enable the recieving protothread to run*/
        recv_thread_flag = 0;
        send_thread_flag = 1;

    }

    PT_END(pt);
}

/**
 * NI receiving protothread
 */
static int
recv_thread(struct pt *pt)
{
    unsigned int ni_flags;
    unsigned int flit;
    unsigned int packet_counter = 0;

    PT_BEGIN(pt);

    while(1) {
        /* Let the sending protothread run. */
        recv_thread_flag = 1;

        /* Wait until the other protothread has set its flag. */
        PT_WAIT_UNTIL(pt, send_thread_flag != 0);

        /* Recieving code */
        packet_counter = memory_read(NI_COUNTER_ADDRESS);
        ni_flags = ni_read_flags();

        if ((packet_counter > 0) && ((ni_flags & NI_READ_MASK) == 0))
        {
            flit = ni_read();
        }

        /* End of recieving code */

        /* We then reset the sending protothread's flag. */
        send_thread_flag = 0;
    }
    PT_END(pt);
}

int main() {

    /* Initialize protothreads */
    PT_INIT(&pt_send);
    PT_INIT(&pt_recv);

    while (1)
    {
        send_thread(&pt_send);
        recv_thread(&pt_recv);
    }

    return 0;
}
