#include "ni.h"
#include "packets.h"
#include "plasma.h"
#include "uart.h"
#include "test_plasma.h"
#include "ni_test.h"


#define MY_ADDR     3
#define DST_ADDR    0

int main(int argc, char const *argv[]) {
    unsigned destination = 0;
    unsigned flit_number = 0;
    unsigned flit;
    unsigned packet_counter = 0;

    setup_uart(CPU_SPEED, UART_BAUDRATE);
    uart_puts("UART TEST: If you can read this, then UART output works!\n");

    ni_write(build_header(DST_ADDR, 6));
    ni_write(0b0000010101000101000001001001);
    ni_write(1);
    ni_write(1);
    ni_write(1);
    ni_write(1);


    while(1){
        if ((ni_read_flags() & NI_READ_MASK) == 0)
        {
            flit = ni_read();
        }else if((ni_read_flags() & NI_WRITE_MASK) == 0 && packet_counter < 100)
        {   
            flit_number ++; 
            if (flit_number == 1){
                ni_write(build_header(destination, 3));
                destination ++; 
                if (destination == MY_ADDR){
                    destination ++; 
                }
                if (destination == 4){
                    destination = 0;
                }
            }else if (flit_number == 3){
                ni_write(0);
                flit_number = 0;
                packet_counter ++;
            }else{
                ni_write(0b1111111111111111111111111111);
            }    
        }

        if (packet_counter >= 100){
            while ((ni_read_flags() & NI_READ_MASK) == 0){
                flit = ni_read();
            }
            uart_puts("finished sending packets!\n");
            break;
        }
    }
    
    /* Run CPU test */
    test_plasma_funcitons();
    return 0;
}
