analyze -library WORK -format vhdl {../../Fault_injector_parameterized.vhd ../../LBDR_checkers.vhd ../../Arbiter_checkers.vhd ../../FIFO_control_part_checkers.vhd ../../xbar.vhd ../../FIFO_Data_path.vhd ../../shift_register.vhd  ../../modules_with_fault_injectors/shift_register_serial_in.vhd ../../modules_with_fault_injectors/to_be_tested/LBDR_with_checkers_with_FI.vhd ../../modules_with_fault_injectors/to_be_tested/Arbiter_one_hot_with_checkers_with_FI.vhd ../../modules_with_fault_injectors/to_be_tested/FIFO_one_hot_with_checkers_with_FI.vhd ../../modules_with_fault_injectors/Channel_32_bit_with_dominant_checkers_shift_register.vhd }

elaborate router_channel -architecture BEHAVIOR -library DEFAULT -parameters "DATA_WIDTH = 32, current_address = 5, Rxy_rst = 60, Cx_rst = 15, NoC_size = 4" -update

write -hierarchy -format ddc -output Channel_32_bit_with_checkers_FI_shift_register.ddc

link

create_clock -name "clk" -period 10 -waveform { 0 1  }  { clk  }

set_dont_touch reset

set_max_area 0

compile -map_effort medium -area_effort medium

write -hierarchy -format ddc -output Channel_32_bit_with_checkers_FI_shift_register_updated.ddc

uplevel #0 { report_constraint -all_violators -significant_digits 2 }

uplevel #0 { report_area }

report_area > area/Channel_32_bit_with_checkers_FI_shift_register_area.txt

change_names -rules verilog -hierarchy -verbose

write -format verilog -hierarchy -output Channel_32_bit_with_checkers_FI_shift_register_gate_level.v

write_sdf -version 2.1 Channel_32_bit_with_checkers_FI_shift_register.sdf
