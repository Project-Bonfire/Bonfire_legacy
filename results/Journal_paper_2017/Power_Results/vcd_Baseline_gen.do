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
vcd file R5_XBAR_vcd.vcd
vcd add tb_network_4x4:NoC:R_5:XBAR_L:*
vcd add tb_network_4x4:NoC:R_5:XBAR_N:*
vcd add tb_network_4x4:NoC:R_5:XBAR_E:*
vcd add tb_network_4x4:NoC:R_5:XBAR_W:*
vcd add tb_network_4x4:NoC:R_5:XBAR_S:*
run 21000ns

restart -force
vcd file R5_ALLOCATIOR_vcd.vcd
vcd add tb_network_4x4:NoC:R_5:allocator_unit:*
run 21000ns
quit -f