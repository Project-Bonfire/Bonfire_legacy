#################################
run 25ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
run 11ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 0ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 3ns -cancel 4ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 1ns -cancel 2ns
run 7ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 1ns -cancel 2ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 3ns -cancel 4ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) for good!
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_N(25) U 1ns
# ###################################################
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 3ns -cancel 4ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 0ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) for good!
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_S(26) U 1ns
# ###################################################
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 3ns -cancel 4ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 0ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) for good!
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_L(18) U 1ns
# ###################################################
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 12ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC_top:NoC:R_1:RX_E(30) for good!
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_E(30) U 1ns
# ###################################################
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 3ns -cancel 4ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 0ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 3ns -cancel 4ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 3ns -cancel 4ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC_top:NoC:R_7:RX_N(13) for good!
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_N(13) U 1ns
# ###################################################
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) for good!
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_L(4) U 1ns
# ###################################################
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) for good!
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_S(14) U 1ns
# ###################################################
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 7ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 8ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 0ns -cancel 1ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) for good!
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_W(7) U 1ns
# ###################################################
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 3ns -cancel 4ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC_top:NoC:R_2:RX_L(27) for good!
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_L(27) U 1ns
# ###################################################
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 3ns -cancel 4ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) for good!
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_S(4) U 1ns
# ###################################################
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 3ns -cancel 4ns
run 8ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 2ns -cancel 3ns
run 10ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
run 7ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 0ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 0ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 0ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 1ns -cancel 2ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 0ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 7ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) for good!
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_E(8) U 1ns
# ###################################################
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 12ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 1ns -cancel 2ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 2ns -cancel 3ns
run 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 2ns -cancel 3ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_S(18) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_W(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_L(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 3ns -cancel 4ns
run 7ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 0ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 3ns -cancel 4ns
run 4ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 1 2ns -cancel 3ns
run 6ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_S(28) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_S(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_L(15) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_E(9) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_S(27) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_2:RX_E(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_L(1) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_W(29) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_6:RX_E(10) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_4:RX_N(6) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_7:RX_W(0) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_E(4) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_3:RX_W(7) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC_top:NoC:R_5:RX_N(3) 0 1ns -cancel 2ns
run 100ns
stop