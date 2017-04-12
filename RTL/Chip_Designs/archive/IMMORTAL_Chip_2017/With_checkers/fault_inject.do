#################################
# ###################################################
# Shutting down signal: tb_network_2x2:NoC:R_1:allocator_unit:valid_L_sig for good!
force -drive sim/:tb_network_2x2:NoC:R_1:allocator_unit:valid_L_sig U 1ns
# ###################################################
# ###################################################
# Shutting down signal: tb_network_2x2:NoC:R_3:allocator_unit:valid_L_sig for good!
force -drive sim/:tb_network_2x2:NoC:R_3:allocator_unit:valid_L_sig U 1ns
# ###################################################
# ###################################################
# Shutting down signal: tb_network_2x2:NoC:R_2:allocator_unit:valid_L_sig for good!
force -drive sim/:tb_network_2x2:NoC:R_2:allocator_unit:valid_L_sig U 1ns
# ###################################################
# ###################################################
# Shutting down signal: tb_network_2x2:NoC:R_0:allocator_unit:valid_L_sig for good!
force -drive sim/:tb_network_2x2:NoC:R_0:allocator_unit:valid_L_sig U 1ns
# ###################################################
run 1000ns
stop