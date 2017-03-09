onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color green -radix decimal :tb_network_2x2:RX_L_0
add wave -noupdate -color green -radix decimal :tb_network_2x2:RX_L_1
add wave -noupdate -color green -radix decimal :tb_network_2x2:RX_L_2
add wave -noupdate -color green -radix decimal :tb_network_2x2:RX_L_3
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate -color green -radix decimal :tb_network_2x2:TX_L_0
add wave -noupdate -color green -radix decimal :tb_network_2x2:TX_L_1
add wave -noupdate -color green -radix decimal :tb_network_2x2:TX_L_2
add wave -noupdate -color green -radix decimal :tb_network_2x2:TX_L_3
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate -color Gold -radix decimal :tb_network_2x2:RX_L_0
add wave -noupdate -color Gold :tb_network_2x2:CTS_L_0
add wave -noupdate -color Gold :tb_network_2x2:DRTS_L_0
add wave -noupdate -color Violet -radix decimal :tb_network_2x2:TX_L_0
add wave -noupdate -color Violet :tb_network_2x2:RTS_L_0
add wave -noupdate -color Violet :tb_network_2x2:DCTS_L_0
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate -color Gold -radix decimal :tb_network_2x2:RX_L_1
add wave -noupdate -color Gold :tb_network_2x2:CTS_L_1
add wave -noupdate -color Gold :tb_network_2x2:DRTS_L_1
add wave -noupdate -color Violet -radix decimal :tb_network_2x2:TX_L_1
add wave -noupdate -color Violet :tb_network_2x2:RTS_L_1
add wave -noupdate -color Violet :tb_network_2x2:DCTS_L_1
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate -color Gold -radix decimal :tb_network_2x2:RX_L_2
add wave -noupdate -color Gold :tb_network_2x2:CTS_L_2
add wave -noupdate -color Gold :tb_network_2x2:DRTS_L_2
add wave -noupdate -color Violet -radix decimal :tb_network_2x2:TX_L_2
add wave -noupdate -color Violet :tb_network_2x2:RTS_L_2
add wave -noupdate -color Violet :tb_network_2x2:DCTS_L_2
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate -color Gold -radix decimal :tb_network_2x2:RX_L_3
add wave -noupdate -color Gold :tb_network_2x2:CTS_L_3
add wave -noupdate -color Gold :tb_network_2x2:DRTS_L_3
add wave -noupdate -color Violet -radix decimal :tb_network_2x2:TX_L_3
add wave -noupdate -color Violet :tb_network_2x2:RTS_L_3
add wave -noupdate -color Violet :tb_network_2x2:DCTS_L_3
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate :tb_network_2x2:NoC:R_0:FIFO_L:full
add wave -noupdate :tb_network_2x2:NoC:R_1:FIFO_L:full
add wave -noupdate :tb_network_2x2:NoC:R_2:FIFO_L:full
add wave -noupdate :tb_network_2x2:NoC:R_3:FIFO_L:full
add wave -noupdate :tb_network_2x2:clk
add wave -noupdate :tb_network_2x2:NoC:R_0:FIFO_L:empty
add wave -noupdate :tb_network_2x2:NoC:R_1:FIFO_L:empty
add wave -noupdate :tb_network_2x2:NoC:R_2:FIFO_L:empty
add wave -noupdate :tb_network_2x2:NoC:R_3:FIFO_L:empty
add wave -noupdate :tb_network_2x2:clk
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {147 ns}
