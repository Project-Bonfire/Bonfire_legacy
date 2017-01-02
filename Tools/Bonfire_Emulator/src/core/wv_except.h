/*--------------------------------------------------------------------
 * TITLE: Wrong Value Exception Class
 * AUTHOR: Karl Janson
 * DATE CREATED: 14.12.16
 * FILENAME: common.h
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Implements an exception to be thrown in case of a wrong value
 *--------------------------------------------------------------------*/


#ifndef __WV_EXCEPT_H__
#define __WV_EXCEPT_H__

#include <stdexcept>
#include <string>

class WrongValueException : public std::runtime_error
{
public:
    WrongValueException(std::string mess): std::runtime_error(mess) {}
};

#endif //__WV_EXCEPT_H__
