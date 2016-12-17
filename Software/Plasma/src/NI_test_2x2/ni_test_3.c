#include "../../lib/bonfire.h"
#include "../../lib/packets.h"
#include "../../lib/uart.h"

BONFIRE_MAIN()
{
    //uart_puts("Node 2 started.\n")
    int test = 0;

    BONFIRE_LOOP()
    {
        bonfire_send(build_header(0,3));
        test++;
        bonfire_send(test);
        test++;
        bonfire_send(test);
    }

    BONFIRE_RET();
}
