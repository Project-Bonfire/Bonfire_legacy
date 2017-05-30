#include "ni.h"
#include "self_test.h"
#include "packets.h"
#include "plasma.h"
#include "uart.h"
#include "test_plasma.h"
#include "ni_test.h"


#define MY_ADDR     0
#define DST_ADDR    1

int main(int argc, char const *argv[]) {

    unsigned flit;
    unsigned flit_type;
    unsigned counter = 0;
    unsigned body_counter = 0;
    unsigned test_program = 0;
    unsigned byte_counter = 0;
    unsigned flit_byte_counter = 0;
    unsigned write_inst = 0;
    unsigned current_byte = 0;

    setup_uart(CPU_SPEED, UART_BAUDRATE);

    ni_write(build_header(DST_ADDR, 3));
    ni_write(0b1111111111111111111111111111);
    ni_write(0);

    
    while(1){
        if ((ni_read_flags() & NI_READ_MASK) == 0)
        {
            flit = ni_read();
            flit_type = get_flit_type(flit); 
            if (flit_type == FLIT_TYPE_HEADER)
            {
                body_counter = 0;
            }
            if (flit_type == FLIT_TYPE_BODY)
            {
                body_counter ++;                                    // counting the number of body flits
                if (body_counter == 1)
                { 
                    if (flit == 1084792979 ){                       // check if preamble exists preamble is of the form 010 + "0000" + "01010100 01010000 01001001"+"1" the last part is TPI (test program instructions)
                        test_program  = 1;                          // recieved a test program!
                        uart_puts("recieved test instructions!\n");
                    }
                }else if(body_counter > 1 && test_program == 1){
                    // extract the program info from the flits. here the problem is that the flits are 28 bits and the instructions are 32 bit
                    // so we have to accumulate untill its 32 bits and then write to the memory
                    flit_byte_counter = 0;
                    while (flit_byte_counter < 3){                  // read the data byte by byte! we only get 28 bits so each flit has 3 bytes of an instruction
                        current_byte = (flit & (255<<(flit_byte_counter*8+1)))>>(flit_byte_counter*8+1);     // the additional one is due to the parity
                        write_inst = write_inst | (current_byte <<(((byte_counter)%4)*8));
                        flit_byte_counter ++;                       // to keep track of the bytes read!
                        byte_counter ++;                            // keeping track of all the bytes written so far!    
                        if (byte_counter % 4 == 0){                 // one instruction is full, write it to memory
                            self_test_write(write_inst, counter);   // write the instruction into the memory
                            counter ++;                             // increase the instruction counter
                            write_inst = 0;                         // clean the instruction
                        }
                    }
                }
            }
            
            if (flit_type == FLIT_TYPE_TAIL)
            {
                if (test_program == 1){
                     // extract the program info from the flits. here the problem is that the flits are 28 bits and the instructions are 32 bit
                    // so we have to accumulate untill its 32 bits and then write to the memory
                    flit_byte_counter = 0;
                    while (flit_byte_counter < 3){                  // read the data byte by byte! we only get 28 bits so each flit has 3 bytes of an instruction
                        current_byte = (flit & (255<<(flit_byte_counter*8+1)))>>(flit_byte_counter*8+1);     // the additional one is due to the parity
                        write_inst = write_inst | (current_byte <<(((byte_counter)%4)*8));
                        flit_byte_counter ++;                       // to keep track of the bytes read!
                        byte_counter ++;                            // keeping track of all the bytes written so far!    
                        if (byte_counter % 4 == 0){                 // one instruction is full, write it to memory
                            self_test_write(write_inst, counter);   // write the instruction into the memory
                            counter ++;                             // increase the instruction counter
                            write_inst = 0;                         // clean the instruction
                        }
                    }
                }
                self_test_write(65011720, counter);   // 00000011111000000000000000001000
                uart_puts("starting running test instructions!\n");
                __asm__("jal   15200\n");       // return to the current program
                break;
            }
        }
    }
    while(1){ 
        if ((ni_read_flags() & NI_READ_MASK) == 0)
        {
            flit = ni_read();
        }
    };
    return 0;
}
