# Bonfire Emulator
Copyright (C) by Karl Janson and the Bonfire project 2016 -2017.

Licensed under GPL v3.

This application tries to provide an emulation platform for the Bonfire project, mainly for software development purposes.

This is achieved by emulating the behavior of the platform (including instruction-level emulation of the Plasma CPU) and mixing
it with some software debugging tools, like the ability to insert breakpoints into the code or reading / writing the registers and memory of the CPU
directly from the UI.

## NOTE:
This tool is currently still under heavy development and all components might not work properly.

## Building
**Note:** This tool has been tested only under Linux with GCC version 5.4.0.

The author cannot guarantee the compilation under any other operating system of using some other compiler.

* **To build** the tools, run __make all__ in the root directory
* **To clean**, run __make clean__
* **To run**. type __make run__

## Dependencies
* **Boost C++ libraries** Tested with version 1.58.0, however older versions might also work (but not guaranteed to do so).
