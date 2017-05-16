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
                    self_test_write(1, counter);
                    counter = counter + 1;
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

    // while(counter < 10){
    //     self_test_write(1, counter);
    //     counter = counter + 1;
    // }
    // self_test_write(65011720, counter);   // 00000011111000000000000000001000
    // __asm__(
    //     "jal   13600\n"  
    // );    
    while(1);
    return 0;
}
