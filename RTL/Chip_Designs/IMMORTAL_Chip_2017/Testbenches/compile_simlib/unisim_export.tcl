# this script exports XILINX UNISIM libraries. Those libraries are needed to simulate Xilinx Rams on third party software(questasim).

# I can't put generated files on github, its license issue.

# below is the script to generate those files.
  # but they work only on strudel (and if you copy you should fix hardcoded directories)

set origin /home/tsotne/ownCloud/git/Bonfire_sim/Bonfire

# this variable is used to copy original modelsim.ini file.
set MODEL_TECH /eda/mentor/2015-16/RHELx86/QUESTA-SV-AFV_10.4c-5/questasim/

# this generates the actual libraries.
compile_simlib -force -verbose -language vhdl -dir {$origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/Testbenches/compile_simlib/questa} -simulator questa -simulator_exec_path {/eda/mentor/2015-16/RHELx86/QUESTA-SV-AFV_10.4c-5/questasim/bin} -library unisim -family  zynq
