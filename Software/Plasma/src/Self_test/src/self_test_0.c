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
    unsigned payload;
    unsigned counter = 0;
    unsigned body_counter = 0;
    unsigned test_program = 0;
    unsigned byte_counter = 0;
    unsigned flit_byte_counter = 0;
    unsigned write_inst = 0;
    unsigned current_byte = 0;

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
                body_counter ++;
                if (body_counter == 1)
                { 
                    if (flit == 1084792979 ){      // check if preamble exists preamble is of the form 010 + "0000" + "01010100 01010000 01001001"+"1" the last part is TPI (test program instructions)
                        test_program  = 1;
                    }
                }else if(body_counter > 1 && test_program == 1){
                    // extract the program info into write_inst
                    flit_byte_counter = 0;
                    while (flit_byte_counter < 3){      // read the data byte by byte! we only get 28 bits so each flit has 3 bytes of an instruction
                        current_byte = (flit & (255<<(flit_byte_counter*8+1)))>>(flit_byte_counter*8+1);     // the additional one is due to the parity
                        flit_byte_counter ++;           // to keep track of the bytes read!
                        byte_counter ++;                // keeping track of all the bytes read so far!
                        if (byte_counter % 4 == 0){     // one instruction is full, write it to memory
                            self_test_write(write_inst, counter);
                            counter = counter + 1;
                            write_inst = 0;
                        } else {    // continue adding the info
                            write_inst = write_inst | (current_byte <<((byte_counter%4)*8));
                        }
                    }
                }
            }
        

            if (flit_type == FLIT_TYPE_TAIL)
            {
                break;
            }
        }
    }
    self_test_write(65011720, counter);   // 00000011111000000000000000001000
    __asm__("jal   13600\n");       // return to the current program

    while(1);
    return 0;
}
