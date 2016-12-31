#include <iostream>
#include <thread>
#include <future>
#include <chrono>
#include <map>
#include "common.h"
#include "text_ui.h"
#include "cpu.h"
#include "command.h"
#include "memory.h"
#include "plasma.h"


int main(int argc, char const *argv[]) {

    /* Variable declarations */
    auto exit_signal = false;

    /* Create a simple text-based UI */
    TextUI* ui = new TextUI();
    
    /* Create a Plasma CPU */
    CPU* plasma_CPU = new Plasma();

    /* Start listening for commands from the UI */

    /* Main loop */
    do
    {
        auto ui_command = std::async(std::launch::async,&UI::get_command, ui);
        try
        {
            /* Check if user has sent a command through the UI, non-blocking */
            if (ui_command.wait_for(std::chrono::seconds(0)) == std::future_status::ready)
            {
                // auto command = ui_command.get();
                //
                // /* TODO: Just for testing */
                // //command.execute();
                //
                // /* Process command */
                // if (command.get_type() == "exit")
                // {
                //     exit_signal = true;
                // }
                //
                // else if (command.get_type() == "asm")
                // {
                //     ui.display_msg(MSG_DEBUG, "Command not implemented!", "Stub");
                // }
                //
                // else if (command.get_type() == "pb")
                // {
                //     ui.display_msg(MSG_DEBUG, "Command not implemented!", "Stub");
                // }
                //
                // else if (command.get_type() == "load")
                // {
                //     ui.display_msg(MSG_DEBUG, "Command not implemented!", "Stub");
                // }
                //
                // else if (command.get_type() == "run")
                // {
                //     ui.display_msg(MSG_DEBUG, "Command not implemented!", "Stub");
                // }
                //
                // else if (command.get_type() == "pause")
                // {
                //     ui.display_msg(MSG_DEBUG, "Command not implemented!", "Stub");
                // }
                //
                // else
                // {
                //     ui.display_msg(MSG_ERR, "Error! Command \'" + command.get_type() + "\' not recognized!");
                // }

            }
        }
        catch (std::exception& e)
        {
            std::cout << "UI ERROR: " << e.what() << std::endl << "Exiting" << std::endl;
            break;
        }
    } while (! exit_signal);

    return 0;
}
