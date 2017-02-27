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
add wave -noupdate :tb_network_2x2:clk

add wave -noupdate -group {R0: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_0:N_FIFO_checkers_ORed
add wave -noupdate -group {R0: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_0:E_FIFO_checkers_ORed
add wave -noupdate -group {R0: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_0:W_FIFO_checkers_ORed
add wave -noupdate -group {R0: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_0:S_FIFO_checkers_ORed
add wave -noupdate -group {R0: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_0:L_FIFO_checkers_ORed
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate -group {R1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_1:N_FIFO_checkers_ORed
add wave -noupdate -group {R1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_1:E_FIFO_checkers_ORed
add wave -noupdate -group {R1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_1:W_FIFO_checkers_ORed
add wave -noupdate -group {R1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_1:S_FIFO_checkers_ORed
add wave -noupdate -group {R1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_1:L_FIFO_checkers_ORed
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate -group {R2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_2:N_FIFO_checkers_ORed
add wave -noupdate -group {R2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_2:E_FIFO_checkers_ORed
add wave -noupdate -group {R2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_2:W_FIFO_checkers_ORed
add wave -noupdate -group {R2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_2:S_FIFO_checkers_ORed
add wave -noupdate -group {R2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_2:L_FIFO_checkers_ORed
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate -group {R3: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_3:N_FIFO_checkers_ORed
add wave -noupdate -group {R3: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_3:E_FIFO_checkers_ORed
add wave -noupdate -group {R3: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_3:W_FIFO_checkers_ORed
add wave -noupdate -group {R3: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_3:L_FIFO_checkers_ORed
add wave -noupdate -group {R3: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_3:S_FIFO_checkers_ORed
add wave -noupdate -group {R3: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_3:L_FIFO_checkers_ORed
add wave -noupdate :tb_network_2x2:clk

add wave -noupdate -group {R0: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_0:N_LBDR_checkers_ORed
add wave -noupdate -group {R0: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_0:E_LBDR_checkers_ORed
add wave -noupdate -group {R0: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_0:W_LBDR_checkers_ORed
add wave -noupdate -group {R0: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_0:S_LBDR_checkers_ORed
add wave -noupdate -group {R0: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_0:L_LBDR_checkers_ORed
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate -group {R1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_1:N_LBDR_checkers_ORed
add wave -noupdate -group {R1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_1:E_LBDR_checkers_ORed
add wave -noupdate -group {R1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_1:W_LBDR_checkers_ORed
add wave -noupdate -group {R1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_1:S_LBDR_checkers_ORed
add wave -noupdate -group {R1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_1:L_LBDR_checkers_ORed
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate -group {R2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_2:N_LBDR_checkers_ORed
add wave -noupdate -group {R2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_2:E_LBDR_checkers_ORed
add wave -noupdate -group {R2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_2:W_LBDR_checkers_ORed
add wave -noupdate -group {R2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_2:S_LBDR_checkers_ORed
add wave -noupdate -group {R2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_2:L_LBDR_checkers_ORed
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate -group {R3: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_3:N_LBDR_checkers_ORed
add wave -noupdate -group {R3: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_3:E_LBDR_checkers_ORed
add wave -noupdate -group {R3: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_3:W_LBDR_checkers_ORed
add wave -noupdate -group {R3: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_3:S_LBDR_checkers_ORed
add wave -noupdate -group {R3: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_3:L_LBDR_checkers_ORed
add wave -noupdate :tb_network_2x2:clk

add wave -noupdate -group {Allocator Checkers ORed} -color green :tb_network_2x2:NoC:R_0:Allocator_checkers_ORed
add wave -noupdate -group {Allocator Checkers ORed} -color green :tb_network_2x2:NoC:R_1:Allocator_checkers_ORed
add wave -noupdate -group {Allocator Checkers ORed} -color green :tb_network_2x2:NoC:R_2:Allocator_checkers_ORed
add wave -noupdate -group {Allocator Checkers ORed} -color green :tb_network_2x2:NoC:R_3:Allocator_checkers_ORed
add wave -noupdate :tb_network_2x2:clk

add wave -noupdate -color green :tb_network_2x2:NoC:R_0:link_faults
add wave -noupdate -color green :tb_network_2x2:NoC:R_1:link_faults
add wave -noupdate -color green :tb_network_2x2:NoC:R_2:link_faults
add wave -noupdate -color green :tb_network_2x2:NoC:R_3:link_faults
add wave -noupdate :tb_network_2x2:clk

add wave -noupdate -color green :tb_network_2x2:NoC:R_0:turn_faults
add wave -noupdate -color green :tb_network_2x2:NoC:R_1:turn_faults
add wave -noupdate -color green :tb_network_2x2:NoC:R_2:turn_faults
add wave -noupdate -color green :tb_network_2x2:NoC:R_3:turn_faults
add wave -noupdate :tb_network_2x2:clk

add wave -noupdate -group {Router 3, W LBDR checker outputs} -color green \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_empty_Requests_FF_Requests_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_tail_Requests_in_all_zero \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_tail_empty_Requests_FF_Requests_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_tail_not_empty_not_grants_Requests_FF_Requests_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_grants_onehot \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_grants_mismatch \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_tail_Requests_FF_Requests_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_dst_addr_cur_addr_N1 \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_dst_addr_cur_addr_not_N1 \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_dst_addr_cur_addr_E1 \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_dst_addr_cur_addr_not_E1 \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_dst_addr_cur_addr_W1 \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_dst_addr_cur_addr_not_W1 \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_dst_addr_cur_addr_S1 \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_dst_addr_cur_addr_not_S1 \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_dst_addr_cur_addr_Req_L_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_dst_addr_cur_addr_not_Req_L_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_not_empty_faulty_drop_packet_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_not_empty_not_faulty_drop_packet_in_packet_drop_not_change \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_not_empty_faulty_Req_in_all_zero \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_not_empty_Req_L_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_not_empty_Req_N_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_not_empty_Req_E_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_not_empty_Req_W_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_not_empty_Req_S_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_not_empty_packet_drop_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_not_empty_dst_addr_cur_addr_equal_packet_drop_in_packet_drop_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_header_empty_packet_drop_in_packet_drop_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_tail_not_empty_packet_drop_not_packet_drop_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_invalid_or_body_flit_packet_drop_in_packet_drop_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_packet_drop_order \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_reconfig_cx_flit_type_Tail_not_empty_grants_Cx_in_Temp_Cx_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_reconfig_cx_flit_type_Tail_not_empty_grants_not_reconfig_cx_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Cx_in_Cx_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_reconfig_cx_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_Temp_Cx_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Reconfig_command_reconfig_cx_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_reconfig_cx_flit_type_Tail_not_empty_grants_Temp_Cx_in_Temp_Cx_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Temp_Cx_in_Cx_reconf_PE_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_reconfig_cx_in_reconfig_cx_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_Temp_Cx_in_Temp_Cx_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_ReConf_FF_out_flit_type_Tail_not_empty_grants_Rxy_in_Rxy_tmp \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_ReConf_FF_out_flit_type_Tail_not_empty_grants_not_ReConf_FF_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Rxy_in_Rxy_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_ReConf_FF_in \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_Rxy_tmp_in_Rxy_reconf_PE_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_Rxy_tmp_in_Rxy_tmp_equal \
sim/:tb_network_2x2:NoC:R_3:LBDR_W:err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_ReConf_FF_in_ReConf_FF_out_equal

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
