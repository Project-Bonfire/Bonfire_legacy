#################################
run 29ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 20ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 17ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 18ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 20ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 18ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 17ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 16ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 18ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 18ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 21ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 17ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 19ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 17ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 16ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC:R_1:RX_S(26) for good!
force -drive sim/:tb_network_2x2:NoC:R_1:RX_S(26) U 1ns
# ###################################################
run 17ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 23ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 20ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 18ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 22ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 25ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 19ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 16ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 19ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 26ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 28ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 23ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 19ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 22ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 21ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 16ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 27ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 22ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 32ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 17ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 19ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 16ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 19ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 23ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 24ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC:R_2:RX_L(30) for good!
force -drive sim/:tb_network_2x2:NoC:R_2:RX_L(30) U 1ns
# ###################################################
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 20ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 20ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 18ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 18ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 30ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns

force -drive sim/:tb_network_2x2:NoC:R_0:FIFO_D_out_L(10) U 1ns

force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 22ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 20ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 29ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 22ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 27ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 27ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 17ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 20ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 18ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) 1 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 23ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC:R_1:RX_L(4) for good!
force -drive sim/:tb_network_2x2:NoC:R_1:RX_L(4) U 1ns
# ###################################################
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 17ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 22ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC:R_2:RX_E(14) for good!
force -drive sim/:tb_network_2x2:NoC:R_2:RX_E(14) U 1ns
# ###################################################
run 16ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 18ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 22ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 22ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 23ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 27ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 31ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 31ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 20ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 29ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 28ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 21ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 21ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 28ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 16ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 27ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 32ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 29ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 40ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 25ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC:R_2:RX_N(27) for good!
force -drive sim/:tb_network_2x2:NoC:R_2:RX_N(27) U 1ns
# ###################################################
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 27ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 19ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 22ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 17ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 19ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 17ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 19ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 22ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 16ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 17ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 19ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 26ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 27ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 21ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) 0 0 ns -cancel 1ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 5ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
# ###################################################
# Shutting down signal: tb_network_2x2:NoC:R_0:RX_E(8) for good!
force -drive sim/:tb_network_2x2:NoC:R_0:RX_E(8) U 1ns
# ###################################################
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 15ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 30ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 16ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 17ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 14ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 26ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 18ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 19ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 18ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 11ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 13ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 21ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 10ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 33ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 12ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
run 33ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
run 35ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 25ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 21ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
run 30ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 3ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 25ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 36ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 9ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 30ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 0ns -cancel 1ns
run 41ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 3ns -cancel 4ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 7ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 31ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 29ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 1ns -cancel 2ns
run 8ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 1ns -cancel 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 29ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 36ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 0 2ns -cancel 3ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 6ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 35ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 2ns -cancel 3ns
run 32ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 3ns -cancel 4ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_W(15) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_L(22) 1 0 ns -cancel 1ns
run 2ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_S(24) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_1:RX_W(22) 1 0ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 1 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
force -drive sim/:tb_network_2x2:NoC:R_3:RX_N(23) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 0 0 ns -cancel 1ns
run 1ns
force -drive sim/:tb_network_2x2:NoC:R_0:RX_L(30) 1 0 ns -cancel 1ns
run 1000ns
stop