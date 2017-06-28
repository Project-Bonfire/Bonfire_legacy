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


restart -force
vcd file noc_full_vcd.vcd
vcd add tb_network_4x4:NoC:R_0:FIFO_L:*
vcd add tb_network_4x4:NoC:R_0:FIFO_N:*
vcd add tb_network_4x4:NoC:R_0:FIFO_E:*
vcd add tb_network_4x4:NoC:R_0:FIFO_W:*
vcd add tb_network_4x4:NoC:R_0:FIFO_S:*
vcd add tb_network_4x4:NoC:R_0:LBDR_L:*
vcd add tb_network_4x4:NoC:R_0:LBDR_N:*
vcd add tb_network_4x4:NoC:R_0:LBDR_E:*
vcd add tb_network_4x4:NoC:R_0:LBDR_W:*
vcd add tb_network_4x4:NoC:R_0:LBDR_S:*
vcd add tb_network_4x4:NoC:R_0:XBAR_L:*
vcd add tb_network_4x4:NoC:R_0:XBAR_N:*
vcd add tb_network_4x4:NoC:R_0:XBAR_E:*
vcd add tb_network_4x4:NoC:R_0:XBAR_W:*
vcd add tb_network_4x4:NoC:R_0:XBAR_S:*
vcd add tb_network_4x4:NoC:R_0:allocator_unit:*

vcd add tb_network_4x4:NoC:R_1:FIFO_L:*
vcd add tb_network_4x4:NoC:R_1:FIFO_N:*
vcd add tb_network_4x4:NoC:R_1:FIFO_E:*
vcd add tb_network_4x4:NoC:R_1:FIFO_W:*
vcd add tb_network_4x4:NoC:R_1:FIFO_S:*
vcd add tb_network_4x4:NoC:R_1:LBDR_L:*
vcd add tb_network_4x4:NoC:R_1:LBDR_N:*
vcd add tb_network_4x4:NoC:R_1:LBDR_E:*
vcd add tb_network_4x4:NoC:R_1:LBDR_W:*
vcd add tb_network_4x4:NoC:R_1:LBDR_S:*
vcd add tb_network_4x4:NoC:R_1:XBAR_L:*
vcd add tb_network_4x4:NoC:R_1:XBAR_N:*
vcd add tb_network_4x4:NoC:R_1:XBAR_E:*
vcd add tb_network_4x4:NoC:R_1:XBAR_W:*
vcd add tb_network_4x4:NoC:R_1:XBAR_S:*
vcd add tb_network_4x4:NoC:R_1:allocator_unit:*

vcd add tb_network_4x4:NoC:R_2:FIFO_L:*
vcd add tb_network_4x4:NoC:R_2:FIFO_N:*
vcd add tb_network_4x4:NoC:R_2:FIFO_E:*
vcd add tb_network_4x4:NoC:R_2:FIFO_W:*
vcd add tb_network_4x4:NoC:R_2:FIFO_S:*
vcd add tb_network_4x4:NoC:R_2:LBDR_L:*
vcd add tb_network_4x4:NoC:R_2:LBDR_N:*
vcd add tb_network_4x4:NoC:R_2:LBDR_E:*
vcd add tb_network_4x4:NoC:R_2:LBDR_W:*
vcd add tb_network_4x4:NoC:R_2:LBDR_S:*
vcd add tb_network_4x4:NoC:R_2:XBAR_L:*
vcd add tb_network_4x4:NoC:R_2:XBAR_N:*
vcd add tb_network_4x4:NoC:R_2:XBAR_E:*
vcd add tb_network_4x4:NoC:R_2:XBAR_W:*
vcd add tb_network_4x4:NoC:R_2:XBAR_S:*
vcd add tb_network_4x4:NoC:R_2:allocator_unit:*

vcd add tb_network_4x4:NoC:R_3:FIFO_L:*
vcd add tb_network_4x4:NoC:R_3:FIFO_N:*
vcd add tb_network_4x4:NoC:R_3:FIFO_E:*
vcd add tb_network_4x4:NoC:R_3:FIFO_W:*
vcd add tb_network_4x4:NoC:R_3:FIFO_S:*
vcd add tb_network_4x4:NoC:R_3:LBDR_L:*
vcd add tb_network_4x4:NoC:R_3:LBDR_N:*
vcd add tb_network_4x4:NoC:R_3:LBDR_E:*
vcd add tb_network_4x4:NoC:R_3:LBDR_W:*
vcd add tb_network_4x4:NoC:R_3:LBDR_S:*
vcd add tb_network_4x4:NoC:R_3:XBAR_L:*
vcd add tb_network_4x4:NoC:R_3:XBAR_N:*
vcd add tb_network_4x4:NoC:R_3:XBAR_E:*
vcd add tb_network_4x4:NoC:R_3:XBAR_W:*
vcd add tb_network_4x4:NoC:R_3:XBAR_S:*
vcd add tb_network_4x4:NoC:R_3:allocator_unit:*

vcd add tb_network_4x4:NoC:R_4:FIFO_L:*
vcd add tb_network_4x4:NoC:R_4:FIFO_N:*
vcd add tb_network_4x4:NoC:R_4:FIFO_E:*
vcd add tb_network_4x4:NoC:R_4:FIFO_W:*
vcd add tb_network_4x4:NoC:R_4:FIFO_S:*
vcd add tb_network_4x4:NoC:R_4:LBDR_L:*
vcd add tb_network_4x4:NoC:R_4:LBDR_N:*
vcd add tb_network_4x4:NoC:R_4:LBDR_E:*
vcd add tb_network_4x4:NoC:R_4:LBDR_W:*
vcd add tb_network_4x4:NoC:R_4:LBDR_S:*
vcd add tb_network_4x4:NoC:R_4:XBAR_L:*
vcd add tb_network_4x4:NoC:R_4:XBAR_N:*
vcd add tb_network_4x4:NoC:R_4:XBAR_E:*
vcd add tb_network_4x4:NoC:R_4:XBAR_W:*
vcd add tb_network_4x4:NoC:R_4:XBAR_S:*
vcd add tb_network_4x4:NoC:R_4:allocator_unit:*

vcd add tb_network_4x4:NoC:R_5:FIFO_L:*
vcd add tb_network_4x4:NoC:R_5:FIFO_N:*
vcd add tb_network_4x4:NoC:R_5:FIFO_E:*
vcd add tb_network_4x4:NoC:R_5:FIFO_W:*
vcd add tb_network_4x4:NoC:R_5:FIFO_S:*
vcd add tb_network_4x4:NoC:R_5:LBDR_L:*
vcd add tb_network_4x4:NoC:R_5:LBDR_N:*
vcd add tb_network_4x4:NoC:R_5:LBDR_E:*
vcd add tb_network_4x4:NoC:R_5:LBDR_W:*
vcd add tb_network_4x4:NoC:R_5:LBDR_S:*
vcd add tb_network_4x4:NoC:R_5:XBAR_L:*
vcd add tb_network_4x4:NoC:R_5:XBAR_N:*
vcd add tb_network_4x4:NoC:R_5:XBAR_E:*
vcd add tb_network_4x4:NoC:R_5:XBAR_W:*
vcd add tb_network_4x4:NoC:R_5:XBAR_S:*
vcd add tb_network_4x4:NoC:R_5:allocator_unit:*

vcd add tb_network_4x4:NoC:R_6:FIFO_L:*
vcd add tb_network_4x4:NoC:R_6:FIFO_N:*
vcd add tb_network_4x4:NoC:R_6:FIFO_E:*
vcd add tb_network_4x4:NoC:R_6:FIFO_W:*
vcd add tb_network_4x4:NoC:R_6:FIFO_S:*
vcd add tb_network_4x4:NoC:R_6:LBDR_L:*
vcd add tb_network_4x4:NoC:R_6:LBDR_N:*
vcd add tb_network_4x4:NoC:R_6:LBDR_E:*
vcd add tb_network_4x4:NoC:R_6:LBDR_W:*
vcd add tb_network_4x4:NoC:R_6:LBDR_S:*
vcd add tb_network_4x4:NoC:R_6:XBAR_L:*
vcd add tb_network_4x4:NoC:R_6:XBAR_N:*
vcd add tb_network_4x4:NoC:R_6:XBAR_E:*
vcd add tb_network_4x4:NoC:R_6:XBAR_W:*
vcd add tb_network_4x4:NoC:R_6:XBAR_S:*
vcd add tb_network_4x4:NoC:R_6:allocator_unit:*

vcd add tb_network_4x4:NoC:R_7:FIFO_L:*
vcd add tb_network_4x4:NoC:R_7:FIFO_N:*
vcd add tb_network_4x4:NoC:R_7:FIFO_E:*
vcd add tb_network_4x4:NoC:R_7:FIFO_W:*
vcd add tb_network_4x4:NoC:R_7:FIFO_S:*
vcd add tb_network_4x4:NoC:R_7:LBDR_L:*
vcd add tb_network_4x4:NoC:R_7:LBDR_N:*
vcd add tb_network_4x4:NoC:R_7:LBDR_E:*
vcd add tb_network_4x4:NoC:R_7:LBDR_W:*
vcd add tb_network_4x4:NoC:R_7:LBDR_S:*
vcd add tb_network_4x4:NoC:R_7:XBAR_L:*
vcd add tb_network_4x4:NoC:R_7:XBAR_N:*
vcd add tb_network_4x4:NoC:R_7:XBAR_E:*
vcd add tb_network_4x4:NoC:R_7:XBAR_W:*
vcd add tb_network_4x4:NoC:R_7:XBAR_S:*
vcd add tb_network_4x4:NoC:R_7:allocator_unit:*

vcd add tb_network_4x4:NoC:R_8:FIFO_L:*
vcd add tb_network_4x4:NoC:R_8:FIFO_N:*
vcd add tb_network_4x4:NoC:R_8:FIFO_E:*
vcd add tb_network_4x4:NoC:R_8:FIFO_W:*
vcd add tb_network_4x4:NoC:R_8:FIFO_S:*
vcd add tb_network_4x4:NoC:R_8:LBDR_L:*
vcd add tb_network_4x4:NoC:R_8:LBDR_N:*
vcd add tb_network_4x4:NoC:R_8:LBDR_E:*
vcd add tb_network_4x4:NoC:R_8:LBDR_W:*
vcd add tb_network_4x4:NoC:R_8:LBDR_S:*
vcd add tb_network_4x4:NoC:R_8:XBAR_L:*
vcd add tb_network_4x4:NoC:R_8:XBAR_N:*
vcd add tb_network_4x4:NoC:R_8:XBAR_E:*
vcd add tb_network_4x4:NoC:R_8:XBAR_W:*
vcd add tb_network_4x4:NoC:R_8:XBAR_S:*
vcd add tb_network_4x4:NoC:R_8:allocator_unit:*

vcd add tb_network_4x4:NoC:R_9:FIFO_L:*
vcd add tb_network_4x4:NoC:R_9:FIFO_N:*
vcd add tb_network_4x4:NoC:R_9:FIFO_E:*
vcd add tb_network_4x4:NoC:R_9:FIFO_W:*
vcd add tb_network_4x4:NoC:R_9:FIFO_S:*
vcd add tb_network_4x4:NoC:R_9:LBDR_L:*
vcd add tb_network_4x4:NoC:R_9:LBDR_N:*
vcd add tb_network_4x4:NoC:R_9:LBDR_E:*
vcd add tb_network_4x4:NoC:R_9:LBDR_W:*
vcd add tb_network_4x4:NoC:R_9:LBDR_S:*
vcd add tb_network_4x4:NoC:R_9:XBAR_L:*
vcd add tb_network_4x4:NoC:R_9:XBAR_N:*
vcd add tb_network_4x4:NoC:R_9:XBAR_E:*
vcd add tb_network_4x4:NoC:R_9:XBAR_W:*
vcd add tb_network_4x4:NoC:R_9:XBAR_S:*
vcd add tb_network_4x4:NoC:R_9:allocator_unit:*

vcd add tb_network_4x4:NoC:R_10:FIFO_L:*
vcd add tb_network_4x4:NoC:R_10:FIFO_N:*
vcd add tb_network_4x4:NoC:R_10:FIFO_E:*
vcd add tb_network_4x4:NoC:R_10:FIFO_W:*
vcd add tb_network_4x4:NoC:R_10:FIFO_S:*
vcd add tb_network_4x4:NoC:R_10:LBDR_L:*
vcd add tb_network_4x4:NoC:R_10:LBDR_N:*
vcd add tb_network_4x4:NoC:R_10:LBDR_E:*
vcd add tb_network_4x4:NoC:R_10:LBDR_W:*
vcd add tb_network_4x4:NoC:R_10:LBDR_S:*
vcd add tb_network_4x4:NoC:R_10:XBAR_L:*
vcd add tb_network_4x4:NoC:R_10:XBAR_N:*
vcd add tb_network_4x4:NoC:R_10:XBAR_E:*
vcd add tb_network_4x4:NoC:R_10:XBAR_W:*
vcd add tb_network_4x4:NoC:R_10:XBAR_S:*
vcd add tb_network_4x4:NoC:R_10:allocator_unit:*

vcd add tb_network_4x4:NoC:R_11:FIFO_L:*
vcd add tb_network_4x4:NoC:R_11:FIFO_N:*
vcd add tb_network_4x4:NoC:R_11:FIFO_E:*
vcd add tb_network_4x4:NoC:R_11:FIFO_W:*
vcd add tb_network_4x4:NoC:R_11:FIFO_S:*
vcd add tb_network_4x4:NoC:R_11:LBDR_L:*
vcd add tb_network_4x4:NoC:R_11:LBDR_N:*
vcd add tb_network_4x4:NoC:R_11:LBDR_E:*
vcd add tb_network_4x4:NoC:R_11:LBDR_W:*
vcd add tb_network_4x4:NoC:R_11:LBDR_S:*
vcd add tb_network_4x4:NoC:R_11:XBAR_L:*
vcd add tb_network_4x4:NoC:R_11:XBAR_N:*
vcd add tb_network_4x4:NoC:R_11:XBAR_E:*
vcd add tb_network_4x4:NoC:R_11:XBAR_W:*
vcd add tb_network_4x4:NoC:R_11:XBAR_S:*
vcd add tb_network_4x4:NoC:R_11:allocator_unit:*

vcd add tb_network_4x4:NoC:R_12:FIFO_L:*
vcd add tb_network_4x4:NoC:R_12:FIFO_N:*
vcd add tb_network_4x4:NoC:R_12:FIFO_E:*
vcd add tb_network_4x4:NoC:R_12:FIFO_W:*
vcd add tb_network_4x4:NoC:R_12:FIFO_S:*
vcd add tb_network_4x4:NoC:R_12:LBDR_L:*
vcd add tb_network_4x4:NoC:R_12:LBDR_N:*
vcd add tb_network_4x4:NoC:R_12:LBDR_E:*
vcd add tb_network_4x4:NoC:R_12:LBDR_W:*
vcd add tb_network_4x4:NoC:R_12:LBDR_S:*
vcd add tb_network_4x4:NoC:R_12:XBAR_L:*
vcd add tb_network_4x4:NoC:R_12:XBAR_N:*
vcd add tb_network_4x4:NoC:R_12:XBAR_E:*
vcd add tb_network_4x4:NoC:R_12:XBAR_W:*
vcd add tb_network_4x4:NoC:R_12:XBAR_S:*
vcd add tb_network_4x4:NoC:R_12:allocator_unit:*

vcd add tb_network_4x4:NoC:R_13:FIFO_L:*
vcd add tb_network_4x4:NoC:R_13:FIFO_N:*
vcd add tb_network_4x4:NoC:R_13:FIFO_E:*
vcd add tb_network_4x4:NoC:R_13:FIFO_W:*
vcd add tb_network_4x4:NoC:R_13:FIFO_S:*
vcd add tb_network_4x4:NoC:R_13:LBDR_L:*
vcd add tb_network_4x4:NoC:R_13:LBDR_N:*
vcd add tb_network_4x4:NoC:R_13:LBDR_E:*
vcd add tb_network_4x4:NoC:R_13:LBDR_W:*
vcd add tb_network_4x4:NoC:R_13:LBDR_S:*
vcd add tb_network_4x4:NoC:R_13:XBAR_L:*
vcd add tb_network_4x4:NoC:R_13:XBAR_N:*
vcd add tb_network_4x4:NoC:R_13:XBAR_E:*
vcd add tb_network_4x4:NoC:R_13:XBAR_W:*
vcd add tb_network_4x4:NoC:R_13:XBAR_S:*
vcd add tb_network_4x4:NoC:R_13:allocator_unit:*

vcd add tb_network_4x4:NoC:R_14:FIFO_L:*
vcd add tb_network_4x4:NoC:R_14:FIFO_N:*
vcd add tb_network_4x4:NoC:R_14:FIFO_E:*
vcd add tb_network_4x4:NoC:R_14:FIFO_W:*
vcd add tb_network_4x4:NoC:R_14:FIFO_S:*
vcd add tb_network_4x4:NoC:R_14:LBDR_L:*
vcd add tb_network_4x4:NoC:R_14:LBDR_N:*
vcd add tb_network_4x4:NoC:R_14:LBDR_E:*
vcd add tb_network_4x4:NoC:R_14:LBDR_W:*
vcd add tb_network_4x4:NoC:R_14:LBDR_S:*
vcd add tb_network_4x4:NoC:R_14:XBAR_L:*
vcd add tb_network_4x4:NoC:R_14:XBAR_N:*
vcd add tb_network_4x4:NoC:R_14:XBAR_E:*
vcd add tb_network_4x4:NoC:R_14:XBAR_W:*
vcd add tb_network_4x4:NoC:R_14:XBAR_S:*
vcd add tb_network_4x4:NoC:R_14:allocator_unit:*

vcd add tb_network_4x4:NoC:R_15:FIFO_L:*
vcd add tb_network_4x4:NoC:R_15:FIFO_N:*
vcd add tb_network_4x4:NoC:R_15:FIFO_E:*
vcd add tb_network_4x4:NoC:R_15:FIFO_W:*
vcd add tb_network_4x4:NoC:R_15:FIFO_S:*
vcd add tb_network_4x4:NoC:R_15:LBDR_L:*
vcd add tb_network_4x4:NoC:R_15:LBDR_N:*
vcd add tb_network_4x4:NoC:R_15:LBDR_E:*
vcd add tb_network_4x4:NoC:R_15:LBDR_W:*
vcd add tb_network_4x4:NoC:R_15:LBDR_S:*
vcd add tb_network_4x4:NoC:R_15:XBAR_L:*
vcd add tb_network_4x4:NoC:R_15:XBAR_N:*
vcd add tb_network_4x4:NoC:R_15:XBAR_E:*
vcd add tb_network_4x4:NoC:R_15:XBAR_W:*
vcd add tb_network_4x4:NoC:R_15:XBAR_S:*
vcd add tb_network_4x4:NoC:R_15:allocator_unit:*

run 21000ns
quit -f