#include "../../lib/bonfire.h"
#include "../../lib/packets.h"

BONFIRE_MAIN()
{
    int test = 0;

    BONFIRE_LOOP()
    {
        bonfire_send(build_header(1,3));
        test++;
        bonfire_send(test);
        test++;
        bonfire_send(test);
    }

    BONFIRE_RET();
}
