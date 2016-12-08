/*-------------------------------------------------------------------
-- TITLE: Memory controller for Plasma CPU emulator implementation
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

#include <exception>
#include "common.h"
#include "memory_ctrl.h"
#include "memory.h"

using namespace std;

/********************* Private Functions *********************/

/**
 * Locates a memory cell and returns its contents.
 * @param  address    Address of the byte/hword/word to be read/written
 * @param  cell_addr  Pointer to a variable for storing
 *                    the calculated cell address
 * @param  byte_index Pointer to a variable for storing
 *                    the calculated byte index in the memory cell
 * @param  ram        Pointer to the memory
 * @return            contents of the memory cell
 */
uint32_t MemoryCtrl::locate_mem_cell(uint32_t address, uint32_t& cell_addr, uint32_t& byte_index, Memory& ram)
{
    cell_addr = address / 4;
    byte_index = address % 4;

    return ram.read(cell_addr);
}

/**
 * Checks the alignment of the memory read/write operation
 * @param  address      Address of the byte/hword/word to be read/written
 * @param  chunk_length Length of the data to be written
 * @return              Alignment status
 */
int MemoryCtrl::check_alignment(uint32_t address, int chunk_length)
{
    if (address % chunk_length != ALIGNED) //not aligned
    {
        return UNALIGNED;
    }
    else
    {
        return ALIGNED;
    }
}

/**
 * Exatracts data from the memory cell in case of data requests
 * that are shorter than a word.
 * @param  mem_cell_contents Contents of the entire memory cell
 * @param  byte_index        Index of the read operation in the memory cell
 * @param  extraction_mask   Mask used for extraction of the data
 * @param  load_signed       Whether the sign bit should be preserved or not
 * @return                   The extracted data
 */
uint32_t MemoryCtrl::extract_data(uint32_t mem_cell_contents, uint32_t byte_index, int extraction_mask, bool load_signed)
{
    uint32_t extracted_data;

    extracted_data = (mem_cell_contents & (extraction_mask << byte_index*8)) >> byte_index*8;

    if (load_signed)
    {
        if ((mem_cell_contents & SIGN_MASK_32) >> 31) // If the value is negative
        {
            return 0xFFFFFF00 | extracted_data;
        }
        else
        {
            return extracted_data;
        }

    }
    else // !load_siged
    {
        return extracted_data;
    }
}
/********************* Public Functions *********************/

/**
 * Loads a byte from the memory
 * @param  address     Address of the byte to be loaded
 * @param  load_signed Whether the sign bit should be preserved or not
 * @param  ram         Pointer to the memory
 * @return             Byte loaded from the memory
 */
uint32_t MemoryCtrl::load_byte(uint32_t address, bool load_signed, Memory& ram)
{
    uint32_t cell_addr;
    uint32_t byte_index;
    uint32_t mem_cell_contents;

    mem_cell_contents = locate_mem_cell(address, cell_addr, byte_index, ram);

    return extract_data(mem_cell_contents, byte_index, BYTE_MASK, load_signed);
}

/**
 * Loads a halfword from the memory
 * @param  address     Address of the halfword to be loaded
 * @param  load_signed Whether the sign bit should be preserved or not
 * @param  ram         Pointer to the memory
 * @return             Halfword loaded from the memory
 */
uint32_t MemoryCtrl::load_hword(uint32_t address, bool load_signed, Memory& ram)
{
    uint32_t cell_addr;
    uint32_t byte_index;
    uint32_t mem_cell_contents;

    if (check_alignment(address, HWORD_LENGTH) == UNALIGNED)
    {
        throw "Unaligned memory access!";
    }

    mem_cell_contents = locate_mem_cell(address, cell_addr, byte_index, ram);
    return extract_data(mem_cell_contents, byte_index, HWORD_MASK, load_signed);
}

/**
 * Loads a word from the memory
 * @param  address     Address of the word to be loaded
 * @param  ram         Pointer to the memory
 * @return             Word loaded from the memory
 */
uint32_t MemoryCtrl::load_word(uint32_t address, Memory& ram)
{
    uint32_t cell_addr;
    uint32_t byte_index;
    uint32_t mem_cell_contents;

    if (check_alignment(address, WORD_LENGTH) == UNALIGNED)
    {
        throw "Unaligned memory access!";
    }

    mem_cell_contents = locate_mem_cell(address, cell_addr, byte_index, ram);
    return mem_cell_contents;
}

/**
 * Store a byte in the memory
 * @param address Address of the byte to be stored
 * @param value   Value to be stored
 * @param ram     Pointer to the memory
 */
void MemoryCtrl::store_byte(uint32_t address, uint32_t value, Memory& ram)
{
    uint32_t cell_addr;
    uint32_t byte_index;
    uint32_t mem_cell_contents;

    mem_cell_contents = locate_mem_cell(address, cell_addr, byte_index, ram);
    mem_cell_contents = mem_cell_contents | (value << byte_index*8);
    ram.write(cell_addr, mem_cell_contents);
}

/**
 * Store a halfword in the memory
 * @param address Address of the halfword to be stored
 * @param value   Value to be stored
 * @param ram     Pointer to the memory
 */
void MemoryCtrl::store_hword(uint32_t address, uint32_t value, Memory& ram)
{
    uint32_t cell_addr;
    uint32_t byte_index;
    uint32_t mem_cell_contents;

    if (check_alignment(address, HWORD_LENGTH) == UNALIGNED)
    {
        throw "Unaligned memory access!";
    }

    mem_cell_contents = locate_mem_cell(address, cell_addr, byte_index, ram);
    mem_cell_contents = mem_cell_contents | (value << byte_index*8);
    ram.write(cell_addr, mem_cell_contents);
}

/**
 * Store a word in the memory
 * @param address Address of the word to be stored
 * @param value   Value to be stored
 * @param ram     Pointer to the memory
 */
void MemoryCtrl::store_word(uint32_t address, uint32_t value, Memory& ram)
{
    uint32_t cell_addr;
    uint32_t byte_index;

    if (check_alignment(address, WORD_LENGTH) == UNALIGNED)
    {
        throw "Unaligned memory access!";
    }

    locate_mem_cell(address, cell_addr, byte_index, ram);
    ram.write(cell_addr, value);
}
