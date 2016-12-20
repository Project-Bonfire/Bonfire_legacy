#include <iostream>
#include <thread>
#include "common.h"
#include "text_ui.h"
#include "cpu.h"

using namespace std;


int main(int argc, char const *argv[]) {

    Command_storage command;

    command.Type = Cmd_type::cmd_none;
    command.Status = Cmd_status::reset;

    thread ui_thread(&TextUI::cmd, TextUI(command));
    thread cpu_thread(&Cpu::run, Cpu(command));

    ui_thread.join();
    cpu_thread.join();
    return 0;
}
