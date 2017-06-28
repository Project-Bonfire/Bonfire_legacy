restart -force
vcd file R5_FIFO_vcd.vcd
vcd add tb_network_4x4:NoC:R_5:FIFO_L:*
vcd add tb_network_4x4:NoC:R_5:FIFO_N:*
vcd add tb_network_4x4:NoC:R_5:FIFO_E:*
vcd add tb_network_4x4:NoC:R_5:FIFO_W:*
vcd add tb_network_4x4:NoC:R_5:FIFO_S:*
run 21000ns

restart -force
vcd file R5_LBDR_vcd.vcd
vcd add tb_network_4x4:NoC:R_5:LBDR_L:*
vcd add tb_network_4x4:NoC:R_5:LBDR_N:*
vcd add tb_network_4x4:NoC:R_5:LBDR_E:*
vcd add tb_network_4x4:NoC:R_5:LBDR_W:*
vcd add tb_network_4x4:NoC:R_5:LBDR_S:*
run 21000ns

restart -force
vcd file R5_parity_LBDR_vcd.vcd
vcd add tb_network_4x4:NoC:R_5:parity_LBDR_L:*
vcd add tb_network_4x4:NoC:R_5:parity_LBDR_N:*
vcd add tb_network_4x4:NoC:R_5:parity_LBDR_E:*
vcd add tb_network_4x4:NoC:R_5:parity_LBDR_W:*
vcd add tb_network_4x4:NoC:R_5:parity_LBDR_S:*
run 21000ns

restart -force
vcd file R5_XBAR_vcd.vcd
vcd add tb_network_4x4:NoC:R_5:XBAR_L:*
vcd add tb_network_4x4:NoC:R_5:XBAR_N:*
vcd add tb_network_4x4:NoC:R_5:XBAR_E:*
vcd add tb_network_4x4:NoC:R_5:XBAR_W:*
vcd add tb_network_4x4:NoC:R_5:XBAR_S:*
run 21000ns

restart -force
vcd file R5_CT_vcd.vcd
vcd add tb_network_4x4:NoC:R_5:CT_E:*
vcd add tb_network_4x4:NoC:R_5:CT_E:*
vcd add tb_network_4x4:NoC:R_5:CT_E:*
vcd add tb_network_4x4:NoC:R_5:CT_E:*
vcd add tb_network_4x4:NoC:R_5:CT_E:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_N2E_Turn_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_N2W_Turn_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_E2N_Turn_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_E2S_Turn_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_W2N_Turn_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_W2S_Turn_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_S2E_Turn_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_S2W_Turn_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_N2S_path_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_S2N_path_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_E2W_path_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_W2E_path_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_L2N_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_L2E_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_L2W_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_L2S_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_N2L_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_E2L_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_W2L_fault:*
vcd add tb_network_4x4:NoC:R_5:CHK_CT_S2L_fault:*
run 21000ns

restart -force
vcd file R5_ALLOCATIOR_vcd.vcd
vcd add tb_network_4x4:NoC:R_5:allocator_unit:*
run 21000ns
quit -f