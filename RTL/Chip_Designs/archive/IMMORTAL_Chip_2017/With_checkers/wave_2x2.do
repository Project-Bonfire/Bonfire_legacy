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

add wave -noupdate -group {R1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_1:N_FIFO_checkers_ORed
add wave -noupdate -group {R1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_1:E_FIFO_checkers_ORed
add wave -noupdate -group {R1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_1:W_FIFO_checkers_ORed
add wave -noupdate -group {R1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_1:S_FIFO_checkers_ORed
add wave -noupdate -group {R1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_1:L_FIFO_checkers_ORed

add wave -noupdate -group {R2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_2:N_FIFO_checkers_ORed
add wave -noupdate -group {R2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_2:E_FIFO_checkers_ORed
add wave -noupdate -group {R2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_2:W_FIFO_checkers_ORed
add wave -noupdate -group {R2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_2:S_FIFO_checkers_ORed
add wave -noupdate -group {R2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC:R_2:L_FIFO_checkers_ORed

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

add wave -noupdate -group {R1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_1:N_LBDR_checkers_ORed
add wave -noupdate -group {R1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_1:E_LBDR_checkers_ORed
add wave -noupdate -group {R1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_1:W_LBDR_checkers_ORed
add wave -noupdate -group {R1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_1:S_LBDR_checkers_ORed
add wave -noupdate -group {R1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_1:L_LBDR_checkers_ORed

add wave -noupdate -group {R2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_2:N_LBDR_checkers_ORed
add wave -noupdate -group {R2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_2:E_LBDR_checkers_ORed
add wave -noupdate -group {R2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_2:W_LBDR_checkers_ORed
add wave -noupdate -group {R2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_2:S_LBDR_checkers_ORed
add wave -noupdate -group {R2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC:R_2:L_LBDR_checkers_ORed

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

add wave -noupdate -group {Turn Faults for R0} \
sim/:tb_network_2x2:NoC:R_0:N2E_turn_fault \
sim/:tb_network_2x2:NoC:R_0:N2W_turn_fault \
sim/:tb_network_2x2:NoC:R_0:E2N_turn_fault \
sim/:tb_network_2x2:NoC:R_0:E2S_turn_fault \
sim/:tb_network_2x2:NoC:R_0:W2N_turn_fault \
sim/:tb_network_2x2:NoC:R_0:W2S_turn_fault \
sim/:tb_network_2x2:NoC:R_0:S2E_turn_fault \
sim/:tb_network_2x2:NoC:R_0:S2W_turn_fault \
sim/:tb_network_2x2:NoC:R_0:N2S_path_fault \
sim/:tb_network_2x2:NoC:R_0:S2N_path_fault \
sim/:tb_network_2x2:NoC:R_0:E2W_path_fault \
sim/:tb_network_2x2:NoC:R_0:W2E_path_fault \
sim/:tb_network_2x2:NoC:R_0:L2N_fault \
sim/:tb_network_2x2:NoC:R_0:L2E_fault \
sim/:tb_network_2x2:NoC:R_0:L2W_fault \
sim/:tb_network_2x2:NoC:R_0:L2S_fault \
sim/:tb_network_2x2:NoC:R_0:N2L_fault \
sim/:tb_network_2x2:NoC:R_0:E2L_fault \
sim/:tb_network_2x2:NoC:R_0:W2L_fault \
sim/:tb_network_2x2:NoC:R_0:S2L_fault

add wave -noupdate -group {Turn Faults for R1} \
sim/:tb_network_2x2:NoC:R_1:N2E_turn_fault \
sim/:tb_network_2x2:NoC:R_1:N2W_turn_fault \
sim/:tb_network_2x2:NoC:R_1:E2N_turn_fault \
sim/:tb_network_2x2:NoC:R_1:E2S_turn_fault \
sim/:tb_network_2x2:NoC:R_1:W2N_turn_fault \
sim/:tb_network_2x2:NoC:R_1:W2S_turn_fault \
sim/:tb_network_2x2:NoC:R_1:S2E_turn_fault \
sim/:tb_network_2x2:NoC:R_1:S2W_turn_fault \
sim/:tb_network_2x2:NoC:R_1:N2S_path_fault \
sim/:tb_network_2x2:NoC:R_1:S2N_path_fault \
sim/:tb_network_2x2:NoC:R_1:E2W_path_fault \
sim/:tb_network_2x2:NoC:R_1:W2E_path_fault \
sim/:tb_network_2x2:NoC:R_1:L2N_fault \
sim/:tb_network_2x2:NoC:R_1:L2E_fault \
sim/:tb_network_2x2:NoC:R_1:L2W_fault \
sim/:tb_network_2x2:NoC:R_1:L2S_fault \
sim/:tb_network_2x2:NoC:R_1:N2L_fault \
sim/:tb_network_2x2:NoC:R_1:E2L_fault \
sim/:tb_network_2x2:NoC:R_1:W2L_fault \
sim/:tb_network_2x2:NoC:R_1:S2L_fault

add wave -noupdate -group {Turn Faults for R2} \
sim/:tb_network_2x2:NoC:R_2:N2E_turn_fault \
sim/:tb_network_2x2:NoC:R_2:N2W_turn_fault \
sim/:tb_network_2x2:NoC:R_2:E2N_turn_fault \
sim/:tb_network_2x2:NoC:R_2:E2S_turn_fault \
sim/:tb_network_2x2:NoC:R_2:W2N_turn_fault \
sim/:tb_network_2x2:NoC:R_2:W2S_turn_fault \
sim/:tb_network_2x2:NoC:R_2:S2E_turn_fault \
sim/:tb_network_2x2:NoC:R_2:S2W_turn_fault \
sim/:tb_network_2x2:NoC:R_2:N2S_path_fault \
sim/:tb_network_2x2:NoC:R_2:S2N_path_fault \
sim/:tb_network_2x2:NoC:R_2:E2W_path_fault \
sim/:tb_network_2x2:NoC:R_2:W2E_path_fault \
sim/:tb_network_2x2:NoC:R_2:L2N_fault \
sim/:tb_network_2x2:NoC:R_2:L2E_fault \
sim/:tb_network_2x2:NoC:R_2:L2W_fault \
sim/:tb_network_2x2:NoC:R_2:L2S_fault \
sim/:tb_network_2x2:NoC:R_2:N2L_fault \
sim/:tb_network_2x2:NoC:R_2:E2L_fault \
sim/:tb_network_2x2:NoC:R_2:W2L_fault \
sim/:tb_network_2x2:NoC:R_2:S2L_fault

add wave -noupdate -group {Turn Faults for R3} \
sim/:tb_network_2x2:NoC:R_3:N2E_turn_fault \
sim/:tb_network_2x2:NoC:R_3:N2W_turn_fault \
sim/:tb_network_2x2:NoC:R_3:E2N_turn_fault \
sim/:tb_network_2x2:NoC:R_3:E2S_turn_fault \
sim/:tb_network_2x2:NoC:R_3:W2N_turn_fault \
sim/:tb_network_2x2:NoC:R_3:W2S_turn_fault \
sim/:tb_network_2x2:NoC:R_3:S2E_turn_fault \
sim/:tb_network_2x2:NoC:R_3:S2W_turn_fault \
sim/:tb_network_2x2:NoC:R_3:N2S_path_fault \
sim/:tb_network_2x2:NoC:R_3:S2N_path_fault \
sim/:tb_network_2x2:NoC:R_3:E2W_path_fault \
sim/:tb_network_2x2:NoC:R_3:W2E_path_fault \
sim/:tb_network_2x2:NoC:R_3:L2N_fault \
sim/:tb_network_2x2:NoC:R_3:L2E_fault \
sim/:tb_network_2x2:NoC:R_3:L2W_fault \
sim/:tb_network_2x2:NoC:R_3:L2S_fault \
sim/:tb_network_2x2:NoC:R_3:N2L_fault \
sim/:tb_network_2x2:NoC:R_3:E2L_fault \
sim/:tb_network_2x2:NoC:R_3:W2L_fault \
sim/:tb_network_2x2:NoC:R_3:S2L_fault

add wave -noupdate -group {CHK_CT:state}  \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_N2E_turn_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_N2W_turn_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_E2N_turn_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_E2S_turn_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_W2N_turn_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_W2S_turn_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_S2E_turn_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_S2W_turn_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_N2S_path_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_S2N_path_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_E2W_path_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_W2E_path_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_L2N_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_L2E_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_L2W_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_L2S_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_N2L_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_E2L_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_W2L_fault:state \
sim/:tb_network_2x2:NoC:R_0:CHK_CT_S2L_fault:state \
sim/:tb_network_2x2:clk \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_N2E_turn_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_N2W_turn_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_E2N_turn_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_E2S_turn_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_W2N_turn_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_W2S_turn_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_S2E_turn_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_S2W_turn_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_N2S_path_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_S2N_path_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_E2W_path_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_W2E_path_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_L2N_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_L2E_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_L2W_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_L2S_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_N2L_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_E2L_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_W2L_fault:state \
sim/:tb_network_2x2:NoC:R_1:CHK_CT_S2L_fault:state \
sim/:tb_network_2x2:clk \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_N2E_turn_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_N2W_turn_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_E2N_turn_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_E2S_turn_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_W2N_turn_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_W2S_turn_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_S2E_turn_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_S2W_turn_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_N2S_path_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_S2N_path_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_E2W_path_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_W2E_path_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_L2N_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_L2E_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_L2W_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_L2S_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_N2L_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_E2L_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_W2L_fault:state \
sim/:tb_network_2x2:NoC:R_2:CHK_CT_S2L_fault:state \
sim/:tb_network_2x2:clk \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_N2E_turn_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_N2W_turn_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_E2N_turn_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_E2S_turn_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_W2N_turn_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_W2S_turn_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_S2E_turn_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_S2W_turn_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_N2S_path_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_S2N_path_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_E2W_path_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_W2E_path_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_L2N_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_L2E_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_L2W_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_L2S_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_N2L_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_E2L_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_W2L_fault:state \
sim/:tb_network_2x2:NoC:R_3:CHK_CT_S2L_fault:state

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
