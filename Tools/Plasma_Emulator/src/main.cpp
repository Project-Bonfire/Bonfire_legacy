#include <iostream>
#include "common.h"
#include "memory.h"
#include "memory_ctrl.h"

using namespace std;

int main(int argc, char const *argv[]) {
  Memory ram(1024);
  MemoryCtrl ram_ctrl;

  ram.write(10, 42);
  ram.write(2, 0xa1234567);

  cout << "Read 10 (should be 42)" << ram.read(10) << endl;
  cout << "Read 2 (should be 41)" << ram.read(2) << endl;

  /*ram.store_byte(0x3, 0x03);
  ram.store_byte(0x9, 0x09);
  ram.store_byte(0x10, 0x10);
  ram.store_byte(0xF3, 0xF3);*/
/*
  int32_t result;
  for (int32_t i = 0; i < 20; i++) {
    result = ram.load_word(i);
    cout << "result: " << std::hex << result << endl;
    cout << "+++++++++++++" << endl;
  }
*/

ram_ctrl.store_word(4, 22, ram);
uint32_t test = ram_ctrl.load_word(4, ram);
cout << test << endl;

  return 0;
}
