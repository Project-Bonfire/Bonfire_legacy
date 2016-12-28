#include <iostream>
#include <thread>
#include <future>
#include <chrono>
#include "common.h"
#include "text_ui.h"
#include "cpu.h"
#include "message.h"

using namespace std;


int main(int argc, char const *argv[]) {


    try
    {
        state = new CPU_State(AMOUNT_OF_RAM, AMOUNT_OF_REGS);
    }
    catch (exception& e)
    {
        cerr << "Cannot create CPU state variable! " << \
            "(Illegal amount of RAM / Registers specified in the configuration?)" \
            << endl << endl;
        terminate();
    }

    /* TODO: Remove. For debugging only */
    state->reg_bank->write(0, 55);
    state->reg_bank->write(3, 42);

    state->ram->write(12, 34);
    
    /* For UI */
    TextUI ui;
    std::future<Message> ui_command;

    /* Variable declarations */
    auto exit_signal = false;

    /* Start listening for commands from the UI */
    ui_command = async(launch::async,&TextUI::get_command, &ui);

    while (1)
    {
        try
        {
            /* Check if user has sent a command through the UI */
            if (ui_command.wait_for(chrono::seconds(0)) == future_status::ready)
            {
                auto command = ui_command.get();

                /* Process command */
                switch (command.type)
                {
                    case Msg_type::cmd_exit:

                    exit_signal = true;
                    break;

                    case Msg_type::cmd_asm:
                    ui.display_msg(MSG_DEBUG, "Command not implemented!", "Stub");
                    break;

                    case Msg_type::cmd_bp:
                    ui.display_msg(MSG_DEBUG, "Command not implemented!", "Stub");
                    break;

                    case Msg_type::cmd_load:
                    ui.display_msg(MSG_DEBUG, "Command not implemented!", "Stub");
                    break;

                    case Msg_type::cmd_run:
                    ui.display_msg(MSG_DEBUG, "Command not implemented!", "Stub");
                    break;

                    case Msg_type::cmd_pause:
                    ui.display_msg(MSG_DEBUG, "Command not implemented!", "Stub");
                    break;

                    case Msg_type::cmd_none:
                    break;

                    default:
                    break;
                }

                if (exit_signal)
                {
                    break;
                }

                else
                {
                    ui_command = async(launch::async,&TextUI::get_command, &ui);
                }
            }
        }
        catch (exception& e)
        {
            cout << "UI ERROR: " << e.what() << endl << "Exiting" << endl;
            break;
        }
    }

    return 0;
}
