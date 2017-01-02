#include <iostream>
#include <future>
#include <chrono>
#include "common.h"
#include "text_ui.h"
#include "cpu.h"
#include "command.h"
#include "plasma.h"

/**
 * Main function
 * @param  argc Number of arguments
 * @param  argv Array of arguments
 * @return      0 on success, 1 otherwise
 */
int main(int argc, char const *argv[]) {

    /* Variable declarations */
    auto exit_signal = false;

    /* Create a simple text-based UI */
    TextUI* ui = new TextUI();

    /* Create a Plasma CPU */
    CPU* plasma_CPU = new Plasma(ui);

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
                auto command = ui_command.get();
                if (command != nullptr) // Something went very wrong
                {
                    // command.execute();
                }
                else
                {
                    std::terminate();
                }
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
