onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate :tb_network_4x4:clk
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_1
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_2
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_4
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_3
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_5
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_6
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_7
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_8
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_9
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_10
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_11
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_12
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_13
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_14
add wave -noupdate -radix decimal :tb_network_4x4:RX_L_15
add wave -noupdate :tb_network_4x4:clk
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_0
add wave -noupdate :tb_network_4x4:DCTS_L_0
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_1
add wave -noupdate :tb_network_4x4:DCTS_L_1
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_2
add wave -noupdate :tb_network_4x4:DCTS_L_2
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_3
add wave -noupdate :tb_network_4x4:DCTS_L_3
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_4
add wave -noupdate :tb_network_4x4:DCTS_L_4
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_5
add wave -noupdate :tb_network_4x4:DCTS_L_5
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_6
add wave -noupdate :tb_network_4x4:DCTS_L_6
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_7
add wave -noupdate :tb_network_4x4:DCTS_L_7
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_8
add wave -noupdate :tb_network_4x4:DCTS_L_8
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_9
add wave -noupdate :tb_network_4x4:DRTS_L_9
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_10
add wave -noupdate :tb_network_4x4:DCTS_L_10
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_11
add wave -noupdate :tb_network_4x4:DCTS_L_11
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_12
add wave -noupdate :tb_network_4x4:DCTS_L_12
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_13
add wave -noupdate :tb_network_4x4:DCTS_L_13
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_14
add wave -noupdate :tb_network_4x4:DCTS_L_14
add wave -noupdate -radix decimal :tb_network_4x4:TX_L_15
add wave -noupdate :tb_network_4x4:DCTS_L_15
add wave -noupdate :tb_network_4x4:clk
add wave -noupdate :tb_network_4x4:NoC:R_0:FIFO_L:DATA_WIDTH
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:reset
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:clk
add wave -noupdate -radix decimal -childformat {{:tb_network_4x4:NoC:R_0:FIFO_L:FIFO_Mem(0) -radix decimal} {:tb_network_4x4:NoC:R_0:FIFO_L:FIFO_Mem(1) -radix decimal} {:tb_network_4x4:NoC:R_0:FIFO_L:FIFO_Mem(2) -radix decimal} {:tb_network_4x4:NoC:R_0:FIFO_L:FIFO_Mem(3) -radix decimal}} -expand -subitemconfig {:tb_network_4x4:NoC:R_0:FIFO_L:FIFO_Mem(0) {-height 16 -radix decimal} :tb_network_4x4:NoC:R_0:FIFO_L:FIFO_Mem(1) {-height 16 -radix decimal} :tb_network_4x4:NoC:R_0:FIFO_L:FIFO_Mem(2) {-height 16 -radix decimal} :tb_network_4x4:NoC:R_0:FIFO_L:FIFO_Mem(3) {-height 16 -radix decimal}} :tb_network_4x4:NoC:R_0:FIFO_L:FIFO_Mem
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:HS_state_out
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:RX
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:DRTS
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:CTS
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:Data_out
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:full
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:read_en
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:read_en_N
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:read_en_E
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:read_en_W
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:read_en_S
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:read_en_L
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:read_pointer
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:read_pointer_in
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:write_pointer
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:write_pointer_in
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:empty
add wave -noupdate -radix decimal :tb_network_4x4:NoC:R_0:FIFO_L:CB_write
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {60684 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {12743 ps} {411268 ps}
