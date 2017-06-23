/*--------------------------------------------------------------------
 * TITLE: Genereic Message Object
 * AUTHOR: Karl Janson
 * DATE CREATED: 14.12.16
 * FILENAME: common.h
 * PROJECT: Bonfire NoC CPU Emulator
 * COPYRIGHT: Software placed into the public domain by the author.
 *    Software 'as is' without warranty.  Author liable for nothing.
 * DESCRIPTION:
 *    Message object for inter-thread communication
 *--------------------------------------------------------------------*/


#ifndef __MESSAGE_H__
#define __MESSAGE_H__

#include <string>
#include <vector>

class Message
{
private:
    std::vector<std::string> contents;

public:
    Message() {}

    /* Element manpulation */
    void push_back(std::string elem) { contents.push_back(elem); }
    void pop_back() { contents.pop_back(); }
    void swap(std::vector<std::string>& v) { contents.swap(v); }

    /* Element access */
    std::string& operator[] (int& n) { return contents[n]; }
    std::string& operator[] (const int& n) { return contents[n]; }

    std::vector<std::string>::iterator begin() { return contents.begin(); }
    std::vector<std::string>::iterator end()   { return contents.end(); }

    /* Size */

    int size() { return contents.size(); }
    int body_size() { return contents.size() - 1; }

    /* Making equal and initializing*/
    void operator=(const std::vector<std::string>& vec) { contents = vec; }
    void operator=(std::initializer_list<std::string> ilist) { contents = ilist; }

    /* Getters / setters for type and body parts of the message */
    std::string get_type() { return contents[0]; }
    void set_type(std::string type) { contents.insert(contents.begin(), type); }

    std::vector<std::string> get_body()
    {
        std::vector<std::string> v = contents;
        v.erase(v.begin());
        return v;
    }

    void set_body(std::vector<std::string>& v)
    {
        auto type = contents[0];
        contents = v;
        contents.insert(contents.begin(), type);
    }

    std::vector<std::string> get()
    {
        return contents;
    }

    void set(std::vector<std::string>& v)
    {
        contents = v;
    }

};

#endif //__MESSAGE_H__
