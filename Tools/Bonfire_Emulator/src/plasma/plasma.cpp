/*--------------------------------------------------------------------
 * TITLE: Plasma CPU
 * AUTHOR: Karl Janson
 * DATE CREATED: 31.12.16
 * FILENAME: palsma.cpp
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Implements toplevel Plasma CPU functions
 *--------------------------------------------------------------------*/

#include "plasma.h"
#include "cpu_state.h"

/**
 * Initialize the Plasma CPU
 */
void Plasma::init()
{
    /* Create memory devices */
    std::map<std::string,Memory*> memories;

    std::map < uint32_t, int > reg_bank_const_map = {{0, 0}};

    memories["ram"] = new Memory(AMOUNT_OF_RAM);
    memories["reg_bank"] = new Memory(AMOUNT_OF_REGS, reg_bank_const_map);

    /* Build the CPU state object */
    try
    {
        cpu_state = new CPU_State(memories);
    }
    catch (std::exception& e)
    {
        std::cerr << "Cannot create CPU state variable! " << \
            "(Illegal amount of RAM / Registers specified in the configuration?)" \
            << std::endl << std::endl;
        std::terminate();
    }
}
