/*-------------------------------------------------------------------
-- TITLE: Memory controller for Plasma CPU emulator
-- AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
-- DATE CREATED: 08.12.16
-- FILENAME: memory_ctrl.h
-- PROJECT: Project Bonfire
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
--
-- DESCRIPTION: A memory controller for accessing the RAM. Provides
-- functions for reading and writing bytes, halfwords and
-- words from the RAM. Does byte number to memory cell
-- calculations and detects unaligned access.
-- Supports both signed and unsigned reads.
--------------------------------------------------------------------*/

#include "common.h"
#include "memory.h"

#ifndef __MEMORY_CTRL_H__
#define __MEMORY_CTRL_H__

#define ALIGNED     0
#define UNALIGNED   1

class MemoryCtrl
{
    public:
        uint32_t load_byte(uint32_t address, bool load_signed, Memory& ram);

        uint32_t load_hword(uint32_t address, bool load_signed, Memory& ram);

        uint32_t load_word(uint32_t address, Memory& ram);

        void store_byte(uint32_t address, uint32_t value, Memory& ram);
        void store_hword(uint32_t address, uint32_t value, Memory& ram);
        void store_word(uint32_t address, uint32_t value, Memory& ram);

    private:
        uint32_t locate_mem_cell(uint32_t address, uint32_t& cell_addr, uint32_t& byte_index, Memory& ram);
        int check_alignment(uint32_t address, int chunk_length);
        uint32_t extract_data(uint32_t mem_cell_contents, uint32_t byte_index, int extraction_mask, bool load_signed);
};

#endif //__MEMORY_CTRL_H__
