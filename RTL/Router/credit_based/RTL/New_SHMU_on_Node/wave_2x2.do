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
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_0:FIFO_L:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_1:FIFO_L:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_2:FIFO_L:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:NoC:R_3:FIFO_L:empty
add wave -noupdate -group {NoC Empty_Sigs} :tb_network_2x2:clk
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_0:FIFO_L:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_1:FIFO_L:full
add wave -noupdate -group {NoC Full_Sigs} :tb_network_2x2:NoC:R_2:FIFO_L:full
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
add wave -noupdate -color Gold -group {FI Detailed} :tb_network_2x2:NoC:FI_0_1:sta_0
add wave -noupdate -color Violet -group {FI Detailed} :tb_network_2x2:NoC:FI_0_1:sta_1
add wave -noupdate -color Gold -group {FI Detailed} :tb_network_2x2:NoC:FI_1_0:sta_0
add wave -noupdate -color Violet -group {FI Detailed} :tb_network_2x2:NoC:FI_1_0:sta_1
add wave -noupdate -color Gold -group {FI Detailed} :tb_network_2x2:NoC:FI_2_3:sta_0
add wave -noupdate -color Violet -group {FI Detailed} :tb_network_2x2:NoC:FI_2_3:sta_1
add wave -noupdate -color Gold -group {FI Detailed} :tb_network_2x2:NoC:FI_3_2:sta_0
add wave -noupdate -color Violet -group {FI Detailed} :tb_network_2x2:NoC:FI_3_2:sta_1
add wave -noupdate -color Gold -group {FI Detailed} :tb_network_2x2:NoC:FI_0_2:sta_0
add wave -noupdate -color Violet -group {FI Detailed} :tb_network_2x2:NoC:FI_0_2:sta_1
add wave -noupdate -color Gold -group {FI Detailed} :tb_network_2x2:NoC:FI_2_0:sta_0
add wave -noupdate -color Violet -group {FI Detailed} :tb_network_2x2:NoC:FI_2_0:sta_1
add wave -noupdate -color Gold -group {FI Detailed} :tb_network_2x2:NoC:FI_1_3:sta_0
add wave -noupdate -color Violet -group {FI Detailed} :tb_network_2x2:NoC:FI_1_3:sta_1
add wave -noupdate -color Gold -group {FI Detailed} :tb_network_2x2:NoC:FI_3_1:sta_0
add wave -noupdate -color Violet -group {FI Detailed} :tb_network_2x2:NoC:FI_3_1:sta_1
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
