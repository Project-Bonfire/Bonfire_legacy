import sys

if '-D'  in sys.argv[1:]:
	network_dime = int(sys.argv[sys.argv.index('-D')+1])
else:
	network_dime = 4

if '-LV'  in sys.argv[1:]:
  	add_lv = True
else:
  	add_lv = False


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
	wave_file.write("add wave -noupdate -color green -radix decimal :"+tb_name+":RX_L_"+str(i)+"\n")
wave_file.write("add wave -noupdate :"+tb_name+":clk\n")
wave_file.write("add wave -noupdate :"+tb_name+":clk\n")
for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -color green -radix decimal :"+tb_name+":TX_L_"+str(i)+"\n")
wave_file.write("add wave -noupdate :"+tb_name+":clk\n")
wave_file.write("add wave -noupdate :"+tb_name+":clk\n")
for i in range(0 , network_dime*network_dime):
	wave_file.write("add wave -noupdate -group {NoC Detailed} -color Gold -radix decimal :"+tb_name+":RX_L_"+str(i)+"\n")
	wave_file.write("add wave -noupdate -group {NoC Detailed} -color Gold :"+tb_name+":valid_in_L_"+str(i)+"\n")
	wave_file.write("add wave -noupdate -group {NoC Detailed} -color Gold :"+tb_name+":credit_out_L_"+str(i)+"\n")
	wave_file.write("add wave -noupdate -group {NoC Detailed} -color Violet -radix decimal :"+tb_name+":TX_L_"+str(i)+"\n")
	wave_file.write("add wave -noupdate -group {NoC Detailed} -color Violet :"+tb_name+":valid_out_L_"+str(i)+"\n")
	wave_file.write("add wave -noupdate -group {NoC Detailed} -color Violet :"+tb_name+":credit_in_L_"+str(i)+"\n")
 	wave_file.write("add wave -noupdate -group {NoC Detailed} :"+tb_name+":clk\n")
for i in range(0 , network_dime*network_dime):
 	wave_file.write("add wave -noupdate -group {NoC Empty_Sigs} :"+tb_name+":NoC:R_"+str(i)+":FIFO_L:full\n")
wave_file.write("add wave -noupdate -group {NoC Empty_Sigs} :"+tb_name+":clk\n")
for i in range(0 , network_dime*network_dime):
 	wave_file.write("add wave -noupdate -group {NoC Full_Sigs} :"+tb_name+":NoC:R_"+str(i)+":FIFO_L:empty\n")
wave_file.write("add wave -noupdate -group {NoC Full_Sigs} :"+tb_name+":clk\n")

if add_lv:
	wave_file.write("add wave -noupdate :"+tb_name+":clk\n")
	wave_file.write("add wave -noupdate :"+tb_name+":clk\n")
	for i in range(0 , network_dime*network_dime):
		wave_file.write("add wave -noupdate -color green -radix decimal :"+tb_name+":NoC:R_lv_"+str(i)+":FIFO_L:RX\n")
	wave_file.write("add wave -noupdate :"+tb_name+":clk\n")
	wave_file.write("add wave -noupdate :"+tb_name+":clk\n")
	for i in range(0 , network_dime*network_dime):
		wave_file.write("add wave -noupdate -color green -radix decimal :"+tb_name+":TX_LV_"+str(i)+"\n")
	wave_file.write("add wave -noupdate :"+tb_name+":clk\n")
	wave_file.write("add wave -noupdate :"+tb_name+":clk\n")
	for i in range(0 , network_dime*network_dime):
		wave_file.write("add wave -noupdate -group {LV Detailed} -color Gold -radix decimal :"+tb_name+":NoC:R_lv_"+str(i)+":FIFO_L:RX\n")
		wave_file.write("add wave -noupdate -group {LV Detailed} -color Gold :"+tb_name+":NoC:R_lv_"+str(i)+":FIFO_L:valid_in\n")
		wave_file.write("add wave -noupdate -group {LV Detailed} -color Gold :"+tb_name+":NoC:R_lv_"+str(i)+":FIFO_L:credit_out\n")
		wave_file.write("add wave -noupdate -group {LV Detailed} -color Violet -radix decimal :"+tb_name+":TX_LV_"+str(i)+"\n")
		wave_file.write("add wave -noupdate -group {LV Detailed} -color Violet :"+tb_name+":valid_out_LV_"+str(i)+"\n")
		wave_file.write("add wave -noupdate -group {LV Detailed} -color Violet :"+tb_name+":credit_in_LV_"+str(i)+"\n")
	 	wave_file.write("add wave -noupdate -group {LV Detailed} :"+tb_name+":clk\n")

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
