import sys

if '-D'  in sys.argv[1:]:
	network_dime = int(sys.argv[sys.argv.index('-D')+1])
else:
	network_dime = 4

if '-o'  in sys.argv[1:]:
  file_path = sys.argv[sys.argv.index('-o')+1]
  if ".do" not in file_path:
      raise ValueError("wrong file extention. only do files are accepted!")
else:
  file_path = 'wave_'+str(network_dime)+"x"+str(network_dime)+'.do'

wave_file = open(file_path, 'w')

tb_name= "tb_network_"+str(network_dime)+"x"+str(network_dime)

wave_file.write("onerror {resume}\n")
wave_file.write("quietly WaveActivateNextPane {} 0\n")
for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {NoC RX} -color green -radix decimal :"+tb_name+":RX_L_"+str(i)+"\n")
 
for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {NoC TX} -color green -radix decimal :"+tb_name+":TX_L_"+str(i)+"\n")
 

for i in range(0 , network_dime*network_dime):
	if i/network_dime != 0:
		wave_file.write("add wave -noupdate -group {Link NoC RX} -color green -radix decimal :"+tb_name+":NoC:R_"+str(i)+":RX_N\n")
	if i % network_dime != network_dime-1:
		wave_file.write("add wave -noupdate -group {Link NoC RX} -color green -radix decimal :"+tb_name+":NoC:R_"+str(i)+":RX_E\n")
	if i % network_dime != 0:
		wave_file.write("add wave -noupdate -group {Link NoC RX} -color green -radix decimal :"+tb_name+":NoC:R_"+str(i)+":RX_W\n")
	if i/network_dime != network_dime-1:
		wave_file.write("add wave -noupdate -group {Link NoC RX} -color green -radix decimal :"+tb_name+":NoC:R_"+str(i)+":RX_S\n")


for i in range(0 , network_dime*network_dime):
	if i/network_dime != 0:
		wave_file.write("add wave -noupdate -group {Link NoC TX} -color green -radix decimal :"+tb_name+":NoC:R_"+str(i)+":TX_N\n")
	if i % network_dime != network_dime-1:
		wave_file.write("add wave -noupdate -group {Link NoC TX} -color green -radix decimal :"+tb_name+":NoC:R_"+str(i)+":TX_E\n")
	if i % network_dime != 0:
		wave_file.write("add wave -noupdate -group {Link NoC TX} -color green -radix decimal :"+tb_name+":NoC:R_"+str(i)+":TX_W\n")
	if i/network_dime != network_dime-1:
		wave_file.write("add wave -noupdate -group {Link NoC TX} -color green -radix decimal :"+tb_name+":NoC:R_"+str(i)+":TX_S\n")

for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {NoC Detailed} -color Gold -radix decimal :"+tb_name+":RX_L_"+str(i)+"\n")
	wave_file.write("add wave -noupdate -group {NoC Detailed} -color Gold :"+tb_name+":valid_in_L_"+str(i)+"\n")
	wave_file.write("add wave -noupdate -group {NoC Detailed} -color Gold :"+tb_name+":credit_out_L_"+str(i)+"\n")
	wave_file.write("add wave -noupdate -group {NoC Detailed} -color Violet -radix decimal :"+tb_name+":TX_L_"+str(i)+"\n")
	wave_file.write("add wave -noupdate -group {NoC Detailed} -color Violet :"+tb_name+":valid_out_L_"+str(i)+"\n")
	wave_file.write("add wave -noupdate -group {NoC Detailed} -color Violet :"+tb_name+":credit_in_L_"+str(i)+"\n")
 	wave_file.write("add wave -noupdate -group {NoC Detailed} :"+tb_name+":clk\n")
for i in range(0 , network_dime*network_dime):
 	wave_file.write("add wave -noupdate -group {NoC Empty_Sigs} :"+tb_name+":NoC:R_"+str(i)+":FIFO_N:empty\n")
 	wave_file.write("add wave -noupdate -group {NoC Empty_Sigs} :"+tb_name+":NoC:R_"+str(i)+":FIFO_E:empty\n")
 	wave_file.write("add wave -noupdate -group {NoC Empty_Sigs} :"+tb_name+":NoC:R_"+str(i)+":FIFO_W:empty\n")
 	wave_file.write("add wave -noupdate -group {NoC Empty_Sigs} :"+tb_name+":NoC:R_"+str(i)+":FIFO_S:empty\n")
 	wave_file.write("add wave -noupdate -group {NoC Empty_Sigs} :"+tb_name+":NoC:R_"+str(i)+":FIFO_L:empty\n")
wave_file.write("add wave -noupdate -group {NoC Empty_Sigs} :"+tb_name+":clk\n")
for i in range(0 , network_dime*network_dime):
 	wave_file.write("add wave -noupdate -group {NoC Full_Sigs} :"+tb_name+":NoC:R_"+str(i)+":FIFO_N:full\n")
 	wave_file.write("add wave -noupdate -group {NoC Full_Sigs} :"+tb_name+":NoC:R_"+str(i)+":FIFO_E:full\n")
 	wave_file.write("add wave -noupdate -group {NoC Full_Sigs} :"+tb_name+":NoC:R_"+str(i)+":FIFO_W:full\n")
 	wave_file.write("add wave -noupdate -group {NoC Full_Sigs} :"+tb_name+":NoC:R_"+str(i)+":FIFO_S:full\n")
 	wave_file.write("add wave -noupdate -group {NoC Full_Sigs} :"+tb_name+":NoC:R_"+str(i)+":FIFO_L:full\n")
wave_file.write("add wave -noupdate -group {NoC Full_Sigs} :"+tb_name+":clk\n")


for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {LBDR CX} -color green :"+tb_name+":NoC:R_"+str(i)+":LBDR_N:Cx\n")
	wave_file.write("add wave -noupdate -group {LBDR CX} -color green :"+tb_name+":NoC:R_"+str(i)+":LBDR_E:Cx\n")
	wave_file.write("add wave -noupdate -group {LBDR CX} -color green :"+tb_name+":NoC:R_"+str(i)+":LBDR_W:Cx\n")
	wave_file.write("add wave -noupdate -group {LBDR CX} -color green :"+tb_name+":NoC:R_"+str(i)+":LBDR_S:Cx\n")
	wave_file.write("add wave -noupdate -group {LBDR CX} -color Gold :"+tb_name+":NoC:R_"+str(i)+":LBDR_L:Cx\n")

for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {Faulty Counters} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_N:faulty_counter_out\n")
	wave_file.write("add wave -noupdate -group {Faulty Counters} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_E:faulty_counter_out\n")
	wave_file.write("add wave -noupdate -group {Faulty Counters} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_W:faulty_counter_out\n")
	wave_file.write("add wave -noupdate -group {Faulty Counters} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_S:faulty_counter_out\n")
	wave_file.write("add wave -noupdate -group {Faulty Counters} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_L:faulty_counter_out\n")

for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {Healthy Counters} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_N:healthy_counter_out\n")
	wave_file.write("add wave -noupdate -group {Healthy Counters} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_E:healthy_counter_out\n")
	wave_file.write("add wave -noupdate -group {Healthy Counters} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_W:healthy_counter_out\n")
	wave_file.write("add wave -noupdate -group {Healthy Counters} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_S:healthy_counter_out\n")
	wave_file.write("add wave -noupdate -group {Healthy Counters} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_L:healthy_counter_out\n")

for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_N:state\n")
	wave_file.write("add wave -noupdate -group {CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_E:state\n")
	wave_file.write("add wave -noupdate -group {CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_W:state\n")
	wave_file.write("add wave -noupdate -group {CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_S:state\n")
	wave_file.write("add wave -noupdate -group {CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CT_L:state\n")
wave_file.write("add wave -noupdate :"+tb_name+":clk\n")

for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {R_"+str(i)+": FIFO Checkers ORed} -color green :" +tb_name+":NoC:R_"+str(i)+":N_FIFO_checkers_ORed\n")
	wave_file.write("add wave -noupdate -group {R_"+str(i)+": FIFO Checkers ORed} -color green :" +tb_name+":NoC:R_"+str(i)+":E_FIFO_checkers_ORed\n")
	wave_file.write("add wave -noupdate -group {R_"+str(i)+": FIFO Checkers ORed} -color green :" +tb_name+":NoC:R_"+str(i)+":W_FIFO_checkers_ORed\n")
	wave_file.write("add wave -noupdate -group {R_"+str(i)+": FIFO Checkers ORed} -color green :" +tb_name+":NoC:R_"+str(i)+":S_FIFO_checkers_ORed\n")
	wave_file.write("add wave -noupdate -group {R_"+str(i)+": FIFO Checkers ORed} -color green :" +tb_name+":NoC:R_"+str(i)+":L_FIFO_checkers_ORed\n")
wave_file.write("add wave -noupdate :"+tb_name+":clk\n")

for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {R_"+str(i)+": LBDR Checkers ORed} -color green :" +tb_name+":NoC:R_"+str(i)+":N_LBDR_checkers_ORed\n")
	wave_file.write("add wave -noupdate -group {R_"+str(i)+": LBDR Checkers ORed} -color green :" +tb_name+":NoC:R_"+str(i)+":E_LBDR_checkers_ORed\n")
	wave_file.write("add wave -noupdate -group {R_"+str(i)+": LBDR Checkers ORed} -color green :" +tb_name+":NoC:R_"+str(i)+":W_LBDR_checkers_ORed\n")
	wave_file.write("add wave -noupdate -group {R_"+str(i)+": LBDR Checkers ORed} -color green :" +tb_name+":NoC:R_"+str(i)+":S_LBDR_checkers_ORed\n")
	wave_file.write("add wave -noupdate -group {R_"+str(i)+": LBDR Checkers ORed} -color green :" +tb_name+":NoC:R_"+str(i)+":L_LBDR_checkers_ORed\n")
wave_file.write("add wave -noupdate :"+tb_name+":clk\n")

for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {Allocator Checkers ORed} -color green :"+tb_name+":NoC:R_"+str(i)+":Allocator_checkers_ORed\n")
wave_file.write("add wave -noupdate :"+tb_name+":clk\n")

for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -color green :"+tb_name+":NoC:R_"+str(i)+":link_faults\n")
wave_file.write("add wave -noupdate :"+tb_name+":clk\n")

for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -color green :"+tb_name+":NoC:R_"+str(i)+":turn_faults\n")
wave_file.write("add wave -noupdate :"+tb_name+":clk\n")

for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":N2E_turn_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":N2W_turn_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":E2N_turn_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":E2S_turn_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":W2N_turn_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":W2S_turn_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":S2E_turn_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":S2W_turn_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":N2S_path_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":S2N_path_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":E2W_path_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":W2E_path_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":L2N_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":L2E_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":L2W_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":L2S_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":N2L_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":E2L_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":W2L_fault\n")
	wave_file.write("add wave -noupdate -group {Turn Faults for R_"+str(i)+"} -color green :"+tb_name+":NoC:R_"+str(i)+":S2L_fault\n")

for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_N2E_turn_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_N2W_turn_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_E2N_turn_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_E2S_turn_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_W2N_turn_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_W2S_turn_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_S2E_turn_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_S2W_turn_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_N2S_path_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_S2N_path_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_E2W_path_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_W2E_path_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_L2N_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_L2E_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_L2W_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_L2S_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_N2L_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_E2L_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_W2L_fault:state\n")
	wave_file.write("add wave -noupdate -group {CHK_CT:state} -color green :"+tb_name+":NoC:R_"+str(i)+":CHK_CT_S2L_fault:state\n")


wave_file.write("TreeUpdate [SetDefaultTree]\n")
wave_file.write("WaveRestoreCursors\n")
wave_file.write("quietly wave cursor active 0\n")
wave_file.write("configure wave -namecolwidth 396\n")
wave_file.write("configure wave -valuecolwidth 100\n")
wave_file.write("configure wave -justifyvalue left\n")
wave_file.write("configure wave -signalnamewidth 0\n")
wave_file.write("configure wave -snapdistance 10\n")
wave_file.write("configure wave -datasetprefix 0\n")
wave_file.write("configure wave -rowmargin 4\n")
wave_file.write("configure wave -childrowmargin 2\n")
wave_file.write("configure wave -gridoffset 0\n")
wave_file.write("configure wave -gridperiod 1\n")
wave_file.write("configure wave -griddelta 40\n")
wave_file.write("configure wave -timeline 0\n")
wave_file.write("configure wave -timelineunits ns\n")
wave_file.write("update\n")
wave_file.write("WaveRestoreZoom {0 ps} {147 ns}\n")
