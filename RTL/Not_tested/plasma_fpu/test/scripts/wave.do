# <Feb. 7th 2017> edit by Behrad Niazmand (bniazmand@ati.ttu.ee), Fixed notation and representation of waves based on QuestaSim instead of ModelSim script.

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate  -group GENERAL -radix sym -label clk {:tb_plasma:clk}
add wave -noupdate  -group GENERAL -radix sym -label rst {:tb_plasma:rst}
add wave -noupdate  -group GENERAL -radix sym -label init {:tb_plasma:init}
add wave -noupdate  -group GENERAL -radix sym -label exec_done {:tb_plasma:exec_done}
add wave -noupdate  -group GENERAL -radix sym -label sim_finish {:tb_plasma:sim_finish}
add wave -noupdate  -group GENERAL -radix sym -label i_sim_control {:plasma_pack:i_sim_control}
add wave -noupdate -divider
add wave -noupdate  -group PLASMA -radix hex -label prog_addr {:tb_plasma:instr_addr}
add wave -noupdate  -group PLASMA -radix hex -label prog_stall {:tb_plasma:instr_stall}
add wave -noupdate  -group PLASMA -radix hex -label prog_in {:tb_plasma:instr_in}
add wave -noupdate  -group PLASMA -radix hex -label data_addr {:tb_plasma:data_addr}
add wave -noupdate  -group PLASMA -radix hex -label data_stall {:tb_plasma:data_stall}
add wave -noupdate  -group PLASMA -radix bin -label wr_mask {:tb_plasma:wr_mask}
add wave -noupdate  -group PLASMA -radix bin -label rd_mask {:tb_plasma:rd_mask}
add wave -noupdate  -group PLASMA -radix hex -label data_to_cpu {:tb_plasma:data_to_cpu}
add wave -noupdate  -group PLASMA -radix hex -label data_from_cpu {:tb_plasma:data_from_cpu}
add wave -noupdate  -group PLASMA -radix hex -label reg_bank {:plasma_pack:plasma_rbank(0)}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2 ps} 0} {{Cursor 2} {98 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 250
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
WaveRestoreZoom {0 ps} {100 ns}