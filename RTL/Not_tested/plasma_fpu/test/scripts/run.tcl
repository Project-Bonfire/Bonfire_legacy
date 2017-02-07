# <Feb. 7th 2017> edit by Behrad Niazmand (bniazmand@ati.ttu.ee), disabled the optimization flags, since they were removed from the design and not accessible by the memory script.
# <Feb. 7th 2017> edit by Behrad Niazmand (bniazmand@ati.ttu.ee), added logging output to the simulator.

#
# create environment libraries
#
proc env {} { vlib mul
              vlib plasma
              vlib memory
              vlib work
}

#
# compile all source files
#
proc c_src {} {set src_path ../src
vcom -work plasma -93 -O5 -quiet $src_path/mips_instruction_set.vhd
vcom -work plasma -93 -O5 -quiet $src_path/plasma_pack.vhd
vcom -work mul    -93 -O5 -quiet $src_path/cores/mul_core.vhd 
vcom -work mul    -93 -O5 -quiet $src_path/cores/div_core.vhd 
vcom -work plasma -93 -O5 -quiet $src_path/subunits/plasma_pc.vhd
vcom -work plasma -93 -O5 -quiet $src_path/subunits/plasma_reg_bank.vhd
vcom -work plasma -93 -O5 -quiet $src_path/subunits/plasma_alu.vhd
vcom -work plasma -93 -O5 -quiet $src_path/subunits/plasma_mult.vhd
vcom -work plasma -93 -O5 -quiet $src_path/subunits/plasma_shifter.vhd
vcom -work plasma -93 -O5 -quiet $src_path/subunits/plasma_comparator.vhd
vcom -work plasma -93 -O5 -quiet $src_path/fpu/plasma_fpu_alu.vhd
vcom -work plasma -93 -O5 -quiet $src_path/fpu/plasma_fpu_comparator.vhd
vcom -work plasma -93 -O5 -quiet $src_path/fpu/plasma_fpu_reg_bank.vhd
vcom -work plasma -93 -O5 -quiet $src_path/fpu/plasma_fpu.vhd
vcom -work plasma -93 -O5 -quiet $src_path/datapaths/plasma_datapath_MIPSI.vhd
vcom -work plasma -93 -O5 -quiet $src_path/datapaths/plasma_datapath_MIPSI_FPU.vhd
vcom -work plasma -93 -O5 -quiet $src_path/controlunits/plasma_control_MIPSI.vhd
vcom -work plasma -93 -O5 -quiet $src_path/controlunits/plasma_control_MIPSI_FPU.vhd
vcom -work plasma -93 -O5 -quiet $src_path/plasma_mem_ctrl.vhd
vcom -work plasma -93 -O5 -quiet $src_path/plasma.vhd

set test_path ../test/vhdl
vcom -work memory -explicit -93 -rangecheck -O5 -nologo -quiet -pedanticerrors $test_path/plasma_memory.vhd
vcom -work work -explicit -93 -O5 $test_path/tb_plasma.vhd
}


#
# MAIN PROGRAM
#
# create simulation libraries
env
# compile sources
c_src
# start simulation

vsim -t ps -l log work.tb_plasma

# vsim -t ps -vopt -voptargs="-G FPU_FLAG=OF" \
#                  -voptargs="-G SIM_FLAG=OF" \
#                  -voptargs="-G DEBUG_FLAG=OF" \
#                  -voptargs="+acc=r+/tb_plasma/sim_finish" \
#                  -voptargs="+acc=r+/plasma_pack/plasma_rbank" \
#                  -voptargs="+acc=r+/tb_plasma/u2_memory/ram"\
#                   work.tb_plasma

#                 -voptargs="+acc=r+/tb_plasma/init" \

# add simulation memory access
source plasma_memory.tcl

# add plasma signals
do wave.do

# start simulation
run -all