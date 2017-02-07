# --------------------------------------------------------------------------
# >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
# --------------------------------------------------------------------------
# TITLE:       Plasma MEMORY ACCESS SCRIPT
# AUTHOR:      Alex Schoenberger (Alex.Schoenberger@ies.tu-darmstadt.de)
# COMMENT:     This project is based on Plasma CPU core by Steve Rhoads

# www.ies.tu-darmstadt.de
# TU Darmstadt
# Institute for Integrated Systems
# Merckstr. 25

# 64283 Darmstadt - GERMANY
# --------------------------------------------------------------------------
# PROJECT:       Plasma CPU core with FPU
# FILENAME:      plasma_memory.tcl
# --------------------------------------------------------------------------
# COPYRIGHT: 
#  This project is distributed by GPLv2.0
#  Software placed into the public domain by the author.
#  Software 'as is' without warranty.  Author liable for nothing.
# --------------------------------------------------------------------------
# DESCRIPTION:
#    read and write memory
#
# --------------------------------------------------------------------------
# Revision History
# --------------------------------------------------------------------------
# Revision   Date    Author     CHANGES
# 1.0      4/2014    AS         initial
# --------------------------------------------------------------------------
# #################################################################################################
# _    ____ ____ ___     _  _ ____ _  _ ____ ____ _   _ 
# |    |  | |__| |  \    |\/| |___ |\/| |  | |__/  \_/  
# |___ |__| |  | |__/    |  | |___ |  | |__| |  \   |   
#
# write content of a extern file to memory
#
proc load_memory { } {
  #
  # generic memory model
  #
  mem load -infile memory_in.mem -format hex -filltype value -filldata 8'h00  /tb_plasma/u2_memory/ram
}

# #################################################################################################
# ____ ___ ____ ____ ____    _  _ ____ _  _ ____ ____ _   _ 
# [__   |  |  | |__/ |___    |\/| |___ |\/| |  | |__/  \_/  
# ___]  |  |__| |  \ |___    |  | |___ |  | |__| |  \   |   
#
# write content of memory to extern file
#
proc store_memory { } {

  # 0x8D_0000
  set OUTPUT_START_ADDR      9240576
  # 0x8D_0000 + 0xD_0000 = 0x9A_0000
  set OUTPUT_END_ADDR       10092544

  #
  # generic memory model
  #
  mem save -format hex -wordsperline 32 -st $OUTPUT_START_ADDR -end $OUTPUT_END_ADDR -outfile memory_out.mem /tb_plasma/u2_memory/ram
}

# #################################################################################################
# _ _  _ _ ___ _ ____ _    _ ____ ____ ___ _ ____ _  _ 
# | |\ | |  |  | |__| |    | [__  |__|  |  | |  | |\ | 
# | | \| |  |  | |  | |___ | ___] |  |  |  | |__| | \| 
#
# triggered on "init" signal
#
when { init = 1 } {

  echo "Memory initialisation start"
  load_memory
  echo "Memory initialisation done"
}

# #################################################################################################
# ____ _ _  _ _  _ _    ____ ___ _ ____ _  _    ____ _  _ _ ___ 
# [__  | |\/| |  | |    |__|  |  | |  | |\ |    |___  \/  |  |  
# ___] | |  | |__| |___ |  |  |  | |__| | \|    |___ _/\_ |  |  
#
when { sim_finish = 1 } {
    stop
    store_memory
    exit -f
}
