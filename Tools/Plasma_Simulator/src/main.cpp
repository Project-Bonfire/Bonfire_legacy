#include <iostream>
#include "defines.h"
#include "memory.h"

using namespace std;

int main(int argc, char const *argv[]) {
  Memory ram(1024);
  ram.write(10, 42);
  ram.write(11, 41);

  cout << "Read 10 (should be 42)" << ram.read(10) << endl;
  cout << "Read 11 (should be 41)" << ram.read(11) << endl;
  return 0;
}
