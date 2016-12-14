#include <iostream>
#include <thread>
#include "common.h"
#include "text_ui.h"
#include "cpu.h"

using namespace std;

int main(int argc, char const *argv[]) {

    thread ui_thread(&TextUI::cmd, TextUI());
    thread cpu_thread(&Cpu::run, Cpu());

    ui_thread.join();
    cpu_thread.join();
    return 0;
}
