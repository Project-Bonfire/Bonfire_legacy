/*--------------------------------------------------------------------
 * TITLE: Plasma CPU
 * AUTHOR: Karl Janson
 * DATE CREATED: 31.12.16
 * FILENAME: plasma.h
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Implements toplevel Plasma CPU functions
 *--------------------------------------------------------------------*/

#ifndef __PLASMA_H__
#define __PLASMA_H__

#include "cpu.h"

class UI;

class Plasma : public CPU
{
public:
    Plasma(UI* ui) : CPU(ui) {}

    void init();
};

#endif //__PLASMA_H__
