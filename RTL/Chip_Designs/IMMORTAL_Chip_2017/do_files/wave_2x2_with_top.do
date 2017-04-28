onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {NoC RX} -color green -radix decimal :tb_network_2x2:NoC_top:RX_L_0
add wave -noupdate -group {NoC RX} -color green -radix decimal :tb_network_2x2:NoC_top:RX_L_1
add wave -noupdate -group {NoC RX} -color green -radix decimal :tb_network_2x2:NoC_top:RX_L_2
add wave -noupdate -group {NoC RX} -color green -radix decimal :tb_network_2x2:NoC_top:RX_L_3
add wave -noupdate -group {NoC TX} -color green -radix decimal :tb_network_2x2:NoC_top:TX_L_0
add wave -noupdate -group {NoC TX} -color green -radix decimal :tb_network_2x2:NoC_top:TX_L_1
add wave -noupdate -group {NoC TX} -color green -radix decimal :tb_network_2x2:NoC_top:TX_L_2
add wave -noupdate -group {NoC TX} -color green -radix decimal :tb_network_2x2:NoC_top:TX_L_3

add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_0:RX_E
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_0:RX_S
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_1:RX_W
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_1:RX_S
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_2:RX_N
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_2:RX_E
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_3:RX_N
add wave -noupdate -group {Link NoC RX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_3:RX_W
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_0:TX_E
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_0:TX_S
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_1:TX_W
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_1:TX_S
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_2:TX_N
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_2:TX_E
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_3:TX_N
add wave -noupdate -group {Link NoC TX} -color green -radix decimal :tb_network_2x2:NoC_top:NoC:R_3:TX_W

add wave -noupdate -group {NoC Detailed} -color Gold -radix decimal :tb_network_2x2:NoC_top:RX_L_0
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:NoC_top:valid_in_L_0
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:NoC_top:credit_out_L_0
add wave -noupdate -group {NoC Detailed} -color Violet -radix decimal :tb_network_2x2:NoC_top:TX_L_0
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:NoC_top:valid_out_L_0
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:NoC_top:credit_in_L_0
add wave -noupdate -group {NoC Detailed} :tb_network_2x2:clk
add wave -noupdate -group {NoC Detailed} -color Gold -radix decimal :tb_network_2x2:NoC_top:RX_L_1
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:NoC_top:valid_in_L_1
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:NoC_top:credit_out_L_1
add wave -noupdate -group {NoC Detailed} -color Violet -radix decimal :tb_network_2x2:NoC_top:TX_L_1
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:NoC_top:valid_out_L_1
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:NoC_top:credit_in_L_1
add wave -noupdate -group {NoC Detailed} :tb_network_2x2:clk
add wave -noupdate -group {NoC Detailed} -color Gold -radix decimal :tb_network_2x2:NoC_top:RX_L_2
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:NoC_top:valid_in_L_2
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:NoC_top:credit_out_L_2
add wave -noupdate -group {NoC Detailed} -color Violet -radix decimal :tb_network_2x2:NoC_top:TX_L_2
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:NoC_top:valid_out_L_2
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:NoC_top:credit_in_L_2
add wave -noupdate -group {NoC Detailed} :tb_network_2x2:clk
add wave -noupdate -group {NoC Detailed} -color Gold -radix decimal :tb_network_2x2:NoC_top:RX_L_3
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:NoC_top:valid_in_L_3
add wave -noupdate -group {NoC Detailed} -color Gold :tb_network_2x2:NoC_top:credit_out_L_3
add wave -noupdate -group {NoC Detailed} -color Violet -radix decimal :tb_network_2x2:NoC_top:TX_L_3
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:NoC_top:valid_out_L_3
add wave -noupdate -group {NoC Detailed} -color Violet :tb_network_2x2:NoC_top:credit_in_L_3
add wave -noupdate -group {NoC Detailed} :tb_network_2x2:clk

add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC_top:NoC:R_0:FIFO_E:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC_top:NoC:R_0:FIFO_S:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC_top:NoC:R_0:FIFO_L:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC_top:NoC:R_1:FIFO_W:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC_top:NoC:R_1:FIFO_S:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC_top:NoC:R_1:FIFO_L:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC_top:NoC:R_2:FIFO_N:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC_top:NoC:R_2:FIFO_E:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC_top:NoC:R_2:FIFO_L:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC_top:NoC:R_3:FIFO_N:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC_top:NoC:R_3:FIFO_W:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC_top:NoC:R_3:FIFO_L:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:clk

add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC_top:NoC:R_0:FIFO_E:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC_top:NoC:R_0:FIFO_S:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC_top:NoC:R_0:FIFO_L:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC_top:NoC:R_1:FIFO_W:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC_top:NoC:R_1:FIFO_S:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC_top:NoC:R_1:FIFO_L:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC_top:NoC:R_2:FIFO_N:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC_top:NoC:R_2:FIFO_E:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC_top:NoC:R_2:FIFO_L:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC_top:NoC:R_3:FIFO_N:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC_top:NoC:R_3:FIFO_W:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC_top:NoC:R_3:FIFO_L:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:clk

add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC_top:NoC:R_0:LBDR_E:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC_top:NoC:R_0:LBDR_S:Cx
add wave -noupdate -group {LBDR CX} -color Gold  :tb_network_2x2:NoC_top:NoC:R_0:LBDR_L:Cx

add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC_top:NoC:R_1:LBDR_W:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC_top:NoC:R_1:LBDR_S:Cx
add wave -noupdate -group {LBDR CX} -color Gold  :tb_network_2x2:NoC_top:NoC:R_1:LBDR_L:Cx

add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC_top:NoC:R_2:LBDR_N:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC_top:NoC:R_2:LBDR_E:Cx
add wave -noupdate -group {LBDR CX} -color Gold  :tb_network_2x2:NoC_top:NoC:R_2:LBDR_L:Cx

add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC_top:NoC:R_3:LBDR_N:Cx
add wave -noupdate -group {LBDR CX} -color green :tb_network_2x2:NoC_top:NoC:R_3:LBDR_W:Cx
add wave -noupdate -group {LBDR CX} -color Gold  :tb_network_2x2:NoC_top:NoC:R_3:LBDR_L:Cx

add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC_top:NoC:R_0:CT_E:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC_top:NoC:R_0:CT_S:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC_top:NoC:R_0:CT_L:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC_top:NoC:R_1:CT_W:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC_top:NoC:R_1:CT_S:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC_top:NoC:R_1:CT_L:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC_top:NoC:R_2:CT_N:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC_top:NoC:R_2:CT_E:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC_top:NoC:R_2:CT_L:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC_top:NoC:R_3:CT_N:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC_top:NoC:R_3:CT_W:faulty_counter_out
add wave -noupdate -group {Faulty Counters} -color green :tb_network_2x2:NoC_top:NoC:R_3:CT_L:faulty_counter_out

add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC_top:NoC:R_0:CT_E:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC_top:NoC:R_0:CT_S:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC_top:NoC:R_0:CT_L:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC_top:NoC:R_1:CT_W:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC_top:NoC:R_1:CT_S:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC_top:NoC:R_1:CT_L:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC_top:NoC:R_2:CT_N:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC_top:NoC:R_2:CT_E:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC_top:NoC:R_2:CT_L:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC_top:NoC:R_3:CT_N:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC_top:NoC:R_3:CT_W:healthy_counter_out
add wave -noupdate -group {Healthy Counters} -color green :tb_network_2x2:NoC_top:NoC:R_3:CT_L:healthy_counter_out

add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_0:CT_E:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_0:CT_S:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_0:CT_L:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_1:CT_W:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_1:CT_S:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_1:CT_L:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_2:CT_N:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_2:CT_E:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_2:CT_L:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_3:CT_N:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_3:CT_W:state
add wave -noupdate -group {CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_3:CT_L:state

add wave -noupdate -group {R_0: FIFO Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_0:E_FIFO_checkers_ORed
add wave -noupdate -group {R_0: FIFO Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_0:S_FIFO_checkers_ORed
add wave -noupdate -group {R_0: FIFO Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_0:L_FIFO_checkers_ORed

add wave -noupdate -group {R_1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_1:W_FIFO_checkers_ORed
add wave -noupdate -group {R_1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_1:S_FIFO_checkers_ORed
add wave -noupdate -group {R_1: FIFO Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_1:L_FIFO_checkers_ORed

add wave -noupdate -group {R_2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_2:N_FIFO_checkers_ORed
add wave -noupdate -group {R_2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_2:E_FIFO_checkers_ORed
add wave -noupdate -group {R_2: FIFO Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_2:L_FIFO_checkers_ORed

add wave -noupdate -group {R_3: FIFO Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_3:N_FIFO_checkers_ORed
add wave -noupdate -group {R_3: FIFO Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_3:W_FIFO_checkers_ORed
add wave -noupdate -group {R_3: FIFO Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_3:L_FIFO_checkers_ORed

add wave -noupdate -group {R_0: LBDR Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_0:E_LBDR_checkers_ORed
add wave -noupdate -group {R_0: LBDR Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_0:S_LBDR_checkers_ORed
add wave -noupdate -group {R_0: LBDR Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_0:L_LBDR_checkers_ORed

add wave -noupdate -group {R_1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_1:W_LBDR_checkers_ORed
add wave -noupdate -group {R_1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_1:S_LBDR_checkers_ORed
add wave -noupdate -group {R_1: LBDR Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_1:L_LBDR_checkers_ORed

add wave -noupdate -group {R_2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_2:N_LBDR_checkers_ORed
add wave -noupdate -group {R_2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_2:E_LBDR_checkers_ORed
add wave -noupdate -group {R_2: LBDR Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_2:L_LBDR_checkers_ORed

add wave -noupdate -group {R_3: LBDR Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_3:N_LBDR_checkers_ORed
add wave -noupdate -group {R_3: LBDR Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_3:W_LBDR_checkers_ORed
add wave -noupdate -group {R_3: LBDR Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_3:L_LBDR_checkers_ORed

add wave -noupdate -group {Allocator Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_0:Allocator_checkers_ORed
add wave -noupdate -group {Allocator Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_1:Allocator_checkers_ORed
add wave -noupdate -group {Allocator Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_2:Allocator_checkers_ORed
add wave -noupdate -group {Allocator Checkers ORed} -color green :tb_network_2x2:NoC_top:NoC:R_3:Allocator_checkers_ORed

add wave -noupdate -group {classified link faults} -color green :tb_network_2x2:NoC_top:NoC:R_0:link_faults
add wave -noupdate -group {classified link faults} -color green :tb_network_2x2:NoC_top:NoC:R_1:link_faults
add wave -noupdate -group {classified link faults} -color green :tb_network_2x2:NoC_top:NoC:R_2:link_faults
add wave -noupdate -group {classified link faults} -color green :tb_network_2x2:NoC_top:NoC:R_3:link_faults

add wave -noupdate -group {Non-classified link faults} -color green :tb_network_2x2:NoC_top:NoC:R_0:link_faults_async
add wave -noupdate -group {Non-classified link faults} -color green :tb_network_2x2:NoC_top:NoC:R_1:link_faults_async
add wave -noupdate -group {Non-classified link faults} -color green :tb_network_2x2:NoC_top:NoC:R_2:link_faults_async
add wave -noupdate -group {Non-classified link faults} -color green :tb_network_2x2:NoC_top:NoC:R_3:link_faults_async

add wave -noupdate -group {classified turn faults} -color green :tb_network_2x2:NoC_top:NoC:R_0:turn_faults
add wave -noupdate -group {classified turn faults} -color green :tb_network_2x2:NoC_top:NoC:R_1:turn_faults
add wave -noupdate -group {classified turn faults} -color green :tb_network_2x2:NoC_top:NoC:R_2:turn_faults
add wave -noupdate -group {classified turn faults} -color green :tb_network_2x2:NoC_top:NoC:R_3:turn_faults

add wave -noupdate -group {Non-classified turn faults} -color green :tb_network_2x2:NoC_top:NoC:R_0:turn_faults_async
add wave -noupdate -group {Non-classified turn faults} -color green :tb_network_2x2:NoC_top:NoC:R_1:turn_faults_async
add wave -noupdate -group {Non-classified turn faults} -color green :tb_network_2x2:NoC_top:NoC:R_2:turn_faults_async
add wave -noupdate -group {Non-classified turn faults} -color green :tb_network_2x2:NoC_top:NoC:R_3:turn_faults_async

add wave -noupdate -group {Turn Faults for R_0} -color green :tb_network_2x2:NoC_top:NoC:R_0:E2S_turn_fault
add wave -noupdate -group {Turn Faults for R_0} -color green :tb_network_2x2:NoC_top:NoC:R_0:S2E_turn_fault
add wave -noupdate -group {Turn Faults for R_0} -color green :tb_network_2x2:NoC_top:NoC:R_0:L2E_fault
add wave -noupdate -group {Turn Faults for R_0} -color green :tb_network_2x2:NoC_top:NoC:R_0:L2S_fault
add wave -noupdate -group {Turn Faults for R_0} -color green :tb_network_2x2:NoC_top:NoC:R_0:E2L_fault
add wave -noupdate -group {Turn Faults for R_0} -color green :tb_network_2x2:NoC_top:NoC:R_0:S2L_fault

add wave -noupdate -group {Turn Faults for R_1} -color green :tb_network_2x2:NoC_top:NoC:R_1:W2S_turn_fault
add wave -noupdate -group {Turn Faults for R_1} -color green :tb_network_2x2:NoC_top:NoC:R_1:S2W_turn_fault
add wave -noupdate -group {Turn Faults for R_1} -color green :tb_network_2x2:NoC_top:NoC:R_1:L2W_fault
add wave -noupdate -group {Turn Faults for R_1} -color green :tb_network_2x2:NoC_top:NoC:R_1:L2S_fault
add wave -noupdate -group {Turn Faults for R_1} -color green :tb_network_2x2:NoC_top:NoC:R_1:W2L_fault
add wave -noupdate -group {Turn Faults for R_1} -color green :tb_network_2x2:NoC_top:NoC:R_1:S2L_fault

add wave -noupdate -group {Turn Faults for R_2} -color green :tb_network_2x2:NoC_top:NoC:R_2:N2E_turn_fault
add wave -noupdate -group {Turn Faults for R_2} -color green :tb_network_2x2:NoC_top:NoC:R_2:E2N_turn_fault
add wave -noupdate -group {Turn Faults for R_2} -color green :tb_network_2x2:NoC_top:NoC:R_2:L2N_fault
add wave -noupdate -group {Turn Faults for R_2} -color green :tb_network_2x2:NoC_top:NoC:R_2:L2E_fault
add wave -noupdate -group {Turn Faults for R_2} -color green :tb_network_2x2:NoC_top:NoC:R_2:N2L_fault
add wave -noupdate -group {Turn Faults for R_2} -color green :tb_network_2x2:NoC_top:NoC:R_2:E2L_fault

add wave -noupdate -group {Turn Faults for R_3} -color green :tb_network_2x2:NoC_top:NoC:R_3:N2W_turn_fault
add wave -noupdate -group {Turn Faults for R_3} -color green :tb_network_2x2:NoC_top:NoC:R_3:W2N_turn_fault
add wave -noupdate -group {Turn Faults for R_3} -color green :tb_network_2x2:NoC_top:NoC:R_3:L2N_fault
add wave -noupdate -group {Turn Faults for R_3} -color green :tb_network_2x2:NoC_top:NoC:R_3:L2W_fault
add wave -noupdate -group {Turn Faults for R_3} -color green :tb_network_2x2:NoC_top:NoC:R_3:N2L_fault
add wave -noupdate -group {Turn Faults for R_3} -color green :tb_network_2x2:NoC_top:NoC:R_3:W2L_fault

add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_0:CHK_CT_E2S_turn_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_0:CHK_CT_S2E_turn_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_0:CHK_CT_L2E_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_0:CHK_CT_L2S_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_0:CHK_CT_E2L_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_0:CHK_CT_S2L_fault:state

add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_1:CHK_CT_W2S_turn_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_1:CHK_CT_S2W_turn_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_1:CHK_CT_L2W_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_1:CHK_CT_L2S_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_1:CHK_CT_W2L_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_1:CHK_CT_S2L_fault:state

add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_2:CHK_CT_N2E_turn_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_2:CHK_CT_E2N_turn_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_2:CHK_CT_L2N_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_2:CHK_CT_L2E_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_2:CHK_CT_N2L_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_2:CHK_CT_E2L_fault:state

add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_3:CHK_CT_N2W_turn_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_3:CHK_CT_W2N_turn_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_3:CHK_CT_L2N_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_3:CHK_CT_L2W_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_3:CHK_CT_N2L_fault:state
add wave -noupdate -group {CHK_CT:state} -color green :tb_network_2x2:NoC_top:NoC:R_3:CHK_CT_W2L_fault:state

add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:FIFO_L:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:FIFO_E:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:FIFO_S:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:LBDR_L:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:LBDR_E:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:LBDR_S:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:allocator_unit:arb_L_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:allocator_unit:arb_N_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:allocator_unit:arb_E_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:allocator_unit:arb_W_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:allocator_unit:arb_S_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:allocator_unit:arb_X_L:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:allocator_unit:arb_X_N:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:allocator_unit:arb_X_E:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:allocator_unit:arb_X_W:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:allocator_unit:arb_X_S:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_0:allocator_unit:FI_add_sta

add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:FIFO_L:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:FIFO_W:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:FIFO_S:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:LBDR_L:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:LBDR_W:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:LBDR_S:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:allocator_unit:arb_L_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:allocator_unit:arb_N_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:allocator_unit:arb_E_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:allocator_unit:arb_W_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:allocator_unit:arb_S_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:allocator_unit:arb_X_L:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:allocator_unit:arb_X_N:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:allocator_unit:arb_X_E:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:allocator_unit:arb_X_W:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:allocator_unit:arb_X_S:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_1:allocator_unit:FI_add_sta

add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:FIFO_L:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:FIFO_N:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:FIFO_E:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:LBDR_L:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:LBDR_N:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:LBDR_E:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:allocator_unit:arb_L_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:allocator_unit:arb_N_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:allocator_unit:arb_E_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:allocator_unit:arb_W_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:allocator_unit:arb_S_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:allocator_unit:arb_X_L:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:allocator_unit:arb_X_N:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:allocator_unit:arb_X_E:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:allocator_unit:arb_X_W:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:allocator_unit:arb_X_S:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_2:allocator_unit:FI_add_sta

add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:FIFO_L:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:FIFO_N:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:FIFO_W:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:LBDR_L:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:LBDR_N:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:LBDR_W:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:allocator_unit:arb_L_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:allocator_unit:arb_N_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:allocator_unit:arb_E_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:allocator_unit:arb_W_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:allocator_unit:arb_S_X:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:allocator_unit:arb_X_L:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:allocator_unit:arb_X_N:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:allocator_unit:arb_X_E:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:allocator_unit:arb_X_W:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:allocator_unit:arb_X_S:FI_add_sta
add wave -noupdate -group {Fault Injection information} -color green :tb_network_2x2:NoC_top:NoC:R_3:allocator_unit:FI_add_sta

add wave -noupdate -group {GPIO} -color green :tb_network_2x2:PE_0_GPIO_in
add wave -noupdate -group {GPIO} -color green :tb_network_2x2:PE_0_GPIO_out

add wave -noupdate -group {UART_read} -color green :tb_network_2x2:uart_read_0
add wave -noupdate -group {UART_read} -color green :tb_network_2x2:uart_read_1
add wave -noupdate -group {UART_read} -color green :tb_network_2x2:uart_read_2
add wave -noupdate -group {UART_read} -color green :tb_network_2x2:uart_read_3

add wave -noupdate -group {UART_write} -color Gold :tb_network_2x2:uart_write_0
add wave -noupdate -group {UART_write} -color Gold :tb_network_2x2:uart_write_1
add wave -noupdate -group {UART_write} -color Gold :tb_network_2x2:uart_write_2
add wave -noupdate -group {UART_write} -color Gold :tb_network_2x2:uart_write_3


add wave -noupdate -group {CPU insturctions} -color green :tb_network_2x2:NoC_top:PE_0:u1_plasma:u1_cpu:u3_control:instruction
add wave -noupdate -group {CPU insturctions} -color green :tb_network_2x2:NoC_top:PE_1:u1_plasma:u1_cpu:u3_control:instruction
add wave -noupdate -group {CPU insturctions} -color green :tb_network_2x2:NoC_top:PE_2:u1_plasma:u1_cpu:u3_control:instruction
add wave -noupdate -group {CPU insturctions} -color green :tb_network_2x2:NoC_top:PE_3:u1_plasma:u1_cpu:u3_control:instruction


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
