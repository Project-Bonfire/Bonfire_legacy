onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {NoC RX} -color green -radix decimal :tb_network_2x2:RX_L_0
add wave -noupdate -group {NoC RX} -color green -radix decimal :tb_network_2x2:RX_L_1
add wave -noupdate -group {NoC RX} -color green -radix decimal :tb_network_2x2:RX_L_2
add wave -noupdate -group {NoC RX} -color green -radix decimal :tb_network_2x2:RX_L_3
add wave -noupdate -group {NoC TX} -color green -radix decimal :tb_network_2x2:TX_L_0
add wave -noupdate -group {NoC TX} -color green -radix decimal :tb_network_2x2:TX_L_1
add wave -noupdate -group {NoC TX} -color green -radix decimal :tb_network_2x2:TX_L_2
add wave -noupdate -group {NoC TX} -color green -radix decimal :tb_network_2x2:TX_L_3
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC:R_0:RX_E
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC:R_0:RX_S
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC:R_1:RX_W
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC:R_1:RX_S
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC:R_2:RX_N
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC:R_2:RX_E
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC:R_3:RX_N
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC:R_3:RX_W
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC:R_0:TX_E
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC:R_0:TX_S
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC:R_1:TX_W
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC:R_1:TX_S
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC:R_2:TX_N
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC:R_2:TX_E
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC:R_3:TX_N
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC:R_3:TX_W
add wave -noupdate -group {NoC Detailed} -color Gold -radix decimal :tb_network_2x2:RX_L_0
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:valid_in_L_0
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:credit_out_L_0
add wave -noupdate -group {NoC Detailed} -color Violet -radix decimal :tb_network_2x2:TX_L_0
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:valid_out_L_0
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:credit_in_L_0
add wave -noupdate -group {NoC Detailed} :tb_network_2x2:clk
add wave -noupdate -group {NoC Detailed} -color Gold -radix decimal :tb_network_2x2:RX_L_1
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:valid_in_L_1
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:credit_out_L_1
add wave -noupdate -group {NoC Detailed} -color Violet -radix decimal :tb_network_2x2:TX_L_1
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:valid_out_L_1
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:credit_in_L_1
add wave -noupdate -group {NoC Detailed} :tb_network_2x2:clk
add wave -noupdate -group {NoC Detailed} -color Gold -radix decimal :tb_network_2x2:RX_L_2
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:valid_in_L_2
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:credit_out_L_2
add wave -noupdate -group {NoC Detailed} -color Violet -radix decimal :tb_network_2x2:TX_L_2
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:valid_out_L_2
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:credit_in_L_2
add wave -noupdate -group {NoC Detailed} :tb_network_2x2:clk
add wave -noupdate -group {NoC Detailed} -color Gold -radix decimal :tb_network_2x2:RX_L_3
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:valid_in_L_3
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:credit_out_L_3
add wave -noupdate -group {NoC Detailed} -color Violet -radix decimal :tb_network_2x2:TX_L_3
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:valid_out_L_3
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:credit_in_L_3
add wave -noupdate -group {NoC Detailed} :tb_network_2x2:clk
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_0:FIFO_N:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_0:FIFO_E:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_0:FIFO_W:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_0:FIFO_S:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_0:FIFO_L:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_1:FIFO_N:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_1:FIFO_E:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_1:FIFO_W:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_1:FIFO_S:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_1:FIFO_L:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_2:FIFO_N:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_2:FIFO_E:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_2:FIFO_W:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_2:FIFO_S:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_2:FIFO_L:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_3:FIFO_N:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_3:FIFO_E:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_3:FIFO_W:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_3:FIFO_S:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_3:FIFO_L:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:clk
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_0:FIFO_N:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_0:FIFO_E:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_0:FIFO_W:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_0:FIFO_S:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_0:FIFO_L:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_1:FIFO_N:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_1:FIFO_E:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_1:FIFO_W:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_1:FIFO_S:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_1:FIFO_L:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_2:FIFO_N:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_2:FIFO_E:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_2:FIFO_W:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_2:FIFO_S:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_2:FIFO_L:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_3:FIFO_N:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_3:FIFO_E:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_3:FIFO_W:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_3:FIFO_S:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_3:FIFO_L:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:clk
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_0:LBDR_N:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_0:LBDR_E:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_0:LBDR_W:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_0:LBDR_S:Cx
add wave -noupdate -group {LBDR CX} -color Gold :tb_network_2x2:NoC:R_0:LBDR_L:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_1:LBDR_N:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_1:LBDR_E:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_1:LBDR_W:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_1:LBDR_S:Cx
add wave -noupdate -group {LBDR CX} -color Gold :tb_network_2x2:NoC:R_1:LBDR_L:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_2:LBDR_N:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_2:LBDR_E:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_2:LBDR_W:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_2:LBDR_S:Cx
add wave -noupdate -group {LBDR CX} -color Gold :tb_network_2x2:NoC:R_2:LBDR_L:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_3:LBDR_N:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_3:LBDR_E:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_3:LBDR_W:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC:R_3:LBDR_S:Cx
add wave -noupdate -group {LBDR CX} -color Gold :tb_network_2x2:NoC:R_3:LBDR_L:Cx
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_0:CT_N:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_0:CT_E:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_0:CT_W:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_0:CT_S:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_0:CT_L:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_1:CT_N:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_1:CT_E:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_1:CT_W:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_1:CT_S:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_1:CT_L:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_2:CT_N:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_2:CT_E:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_2:CT_W:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_2:CT_S:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_2:CT_L:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_3:CT_N:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_3:CT_E:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_3:CT_W:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_3:CT_S:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC:R_3:CT_L:faulty_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_0:CT_N:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_0:CT_E:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_0:CT_W:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_0:CT_S:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_0:CT_L:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_1:CT_N:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_1:CT_E:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_1:CT_W:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_1:CT_S:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_1:CT_L:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_2:CT_N:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_2:CT_E:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_2:CT_W:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_2:CT_S:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_2:CT_L:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_3:CT_N:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_3:CT_E:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_3:CT_W:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_3:CT_S:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC:R_3:CT_L:healthy_counter_out
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_0:CT_N:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_0:CT_E:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_0:CT_W:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_0:CT_S:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_0:CT_L:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_1:CT_N:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_1:CT_E:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_1:CT_W:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_1:CT_S:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_1:CT_L:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_2:CT_N:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_2:CT_E:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_2:CT_W:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_2:CT_S:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_2:CT_L:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_3:CT_N:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_3:CT_E:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_3:CT_W:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_3:CT_S:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC:R_3:CT_L:state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 396
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {147 ns}
