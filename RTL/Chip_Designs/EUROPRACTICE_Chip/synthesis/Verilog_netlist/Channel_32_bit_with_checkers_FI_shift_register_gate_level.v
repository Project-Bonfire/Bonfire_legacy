
module fault_injector_DATA_WIDTH28_ADDRESS_WIDTH5 ( data_in, address, sta_0,
        sta_1, data_out );
  input [27:0] data_in;
  input [4:0] address;
  output [27:0] data_out;
  input sta_0, sta_1;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n1, n2, n3, n23;

  INVXL U1 ( .A(address[0]), .Q(n2) );
  INVXL U2 ( .A(address[1]), .Q(n3) );
  AO22X3 U3 ( .A1(data_in[3]), .A2(n1), .B1(n13), .B2(n14), .Q(data_out[3]) );
  AO22X3 U4 ( .A1(data_in[1]), .A2(n4), .B1(n14), .B2(n5), .Q(data_out[1]) );
  AO22X3 U5 ( .A1(data_in[12]), .A2(n4), .B1(n12), .B2(n19), .Q(data_out[12])
         );
  AO22X3 U6 ( .A1(data_in[15]), .A2(n4), .B1(n9), .B2(n19), .Q(data_out[15])
         );
  AO22X3 U7 ( .A1(data_in[14]), .A2(n4), .B1(n10), .B2(n19), .Q(data_out[14])
         );
  AO22X3 U8 ( .A1(data_in[13]), .A2(n4), .B1(n11), .B2(n19), .Q(data_out[13])
         );
  AO22X3 U9 ( .A1(data_in[0]), .A2(n4), .B1(n14), .B2(n7), .Q(data_out[0]) );
  AO22X3 U10 ( .A1(data_in[20]), .A2(n1), .B1(n17), .B2(n12), .Q(data_out[20])
         );
  AO22X3 U11 ( .A1(data_in[4]), .A2(n1), .B1(n12), .B2(n8), .Q(data_out[4]) );
  AO22X3 U12 ( .A1(data_in[7]), .A2(n1), .B1(n8), .B2(n9), .Q(data_out[7]) );
  AO22X3 U13 ( .A1(data_in[6]), .A2(n1), .B1(n10), .B2(n8), .Q(data_out[6]) );
  AO22X3 U14 ( .A1(data_in[5]), .A2(n1), .B1(n11), .B2(n8), .Q(data_out[5]) );
  NOR2XL U15 ( .A(n20), .B(n2), .Q(n9) );
  NOR2XL U16 ( .A(n22), .B(n2), .Q(n11) );
  NAND2XL U17 ( .A(n21), .B(n3), .Q(n22) );
  CLKBUFX2 U18 ( .A(n4), .Q(n1) );
  AO22X3 U19 ( .A1(data_in[23]), .A2(n1), .B1(n17), .B2(n9), .Q(data_out[23])
         );
  AO22X3 U20 ( .A1(data_in[8]), .A2(n1), .B1(n7), .B2(n6), .Q(data_out[8]) );
  AO22X3 U21 ( .A1(data_in[9]), .A2(n1), .B1(n5), .B2(n6), .Q(data_out[9]) );
  AO22X3 U22 ( .A1(data_in[19]), .A2(n1), .B1(n18), .B2(n13), .Q(data_out[19])
         );
  AO22X3 U23 ( .A1(data_in[16]), .A2(n1), .B1(n18), .B2(n7), .Q(data_out[16])
         );
  AO22X3 U24 ( .A1(data_in[18]), .A2(n1), .B1(n18), .B2(n15), .Q(data_out[18])
         );
  AO22X3 U25 ( .A1(data_in[10]), .A2(n1), .B1(n15), .B2(n6), .Q(data_out[10])
         );
  AO22X3 U26 ( .A1(data_in[11]), .A2(n1), .B1(n13), .B2(n6), .Q(data_out[11])
         );
  AO22X3 U27 ( .A1(data_in[17]), .A2(n1), .B1(n18), .B2(n5), .Q(data_out[17])
         );
  AO22X3 U28 ( .A1(data_in[21]), .A2(n1), .B1(n17), .B2(n11), .Q(data_out[21])
         );
  AO22X3 U29 ( .A1(data_in[2]), .A2(n1), .B1(n15), .B2(n14), .Q(data_out[2])
         );
  NOR3X3 U30 ( .A(address[1]), .B(address[2]), .C(address[0]), .Q(n7) );
  NOR3X3 U31 ( .A(address[1]), .B(address[2]), .C(n2), .Q(n5) );
  NOR3X3 U32 ( .A(n2), .B(address[2]), .C(n3), .Q(n13) );
  NOR3X3 U33 ( .A(address[0]), .B(address[2]), .C(n3), .Q(n15) );
  NOR2XL U34 ( .A(sta_1), .B(sta_0), .Q(n4) );
  NOR2XL U35 ( .A(address[3]), .B(address[4]), .Q(n8) );
  NOR2XL U36 ( .A(n23), .B(address[3]), .Q(n17) );
  AND2X3 U37 ( .A(address[3]), .B(n23), .Q(n19) );
  NOR2XL U38 ( .A(n20), .B(address[0]), .Q(n10) );
  NOR2XL U39 ( .A(n22), .B(address[0]), .Q(n12) );
  AND2X3 U40 ( .A(address[2]), .B(sta_1), .Q(n21) );
  AO22X3 U41 ( .A1(data_in[27]), .A2(n1), .B1(n16), .B2(n13), .Q(data_out[27])
         );
  AND3X2 U42 ( .A(sta_1), .B(address[3]), .C(address[4]), .Q(n16) );
  AND2X3 U43 ( .A(sta_1), .B(n19), .Q(n6) );
  AND2X3 U44 ( .A(n8), .B(sta_1), .Q(n14) );
  AND2X3 U45 ( .A(n17), .B(sta_1), .Q(n18) );
  NAND2XL U46 ( .A(address[1]), .B(n21), .Q(n20) );
  AO22X3 U47 ( .A1(data_in[25]), .A2(n1), .B1(n16), .B2(n5), .Q(data_out[25])
         );
  AO22X3 U48 ( .A1(data_in[22]), .A2(n1), .B1(n17), .B2(n10), .Q(data_out[22])
         );
  AO22X3 U49 ( .A1(data_in[26]), .A2(n1), .B1(n16), .B2(n15), .Q(data_out[26])
         );
  AO22X3 U50 ( .A1(data_in[24]), .A2(n1), .B1(n16), .B2(n7), .Q(data_out[24])
         );
  INVXL U51 ( .A(address[4]), .Q(n23) );
endmodule


module shift_register_serial_in_REG_WIDTH35 ( clk, reset, shift,
        data_in_serial, data_out_parallel, data_out_serial );
  output [34:0] data_out_parallel;
  input clk, reset, shift, data_in_serial;
  output data_out_serial;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n1,
         n2;
  assign data_out_serial = data_out_parallel[33];

  DFCX1 shift_register_mem_out_reg_30_ ( .D(n42), .CP(clk), .RN(reset), .Q(
        data_out_parallel[30]), .QN(n7) );
  DFCX1 shift_register_mem_out_reg_31_ ( .D(n41), .CP(clk), .RN(reset), .Q(
        data_out_parallel[31]), .QN(n6) );
  DFCX1 shift_register_mem_out_reg_32_ ( .D(n40), .CP(clk), .RN(reset), .Q(
        data_out_parallel[32]), .QN(n5) );
  DFCX1 shift_register_mem_out_reg_34_ ( .D(n38), .CP(clk), .RN(reset), .Q(
        data_out_parallel[34]), .QN(n3) );
  DFCX1 shift_register_mem_out_reg_13_ ( .D(n59), .CP(clk), .RN(reset), .Q(
        data_out_parallel[13]), .QN(n24) );
  DFCX1 shift_register_mem_out_reg_15_ ( .D(n57), .CP(clk), .RN(reset), .Q(
        data_out_parallel[15]), .QN(n22) );
  DFCX1 shift_register_mem_out_reg_17_ ( .D(n55), .CP(clk), .RN(reset), .Q(
        data_out_parallel[17]), .QN(n20) );
  DFCX1 shift_register_mem_out_reg_18_ ( .D(n54), .CP(clk), .RN(reset), .Q(
        data_out_parallel[18]), .QN(n19) );
  DFCX1 shift_register_mem_out_reg_19_ ( .D(n53), .CP(clk), .RN(reset), .Q(
        data_out_parallel[19]), .QN(n18) );
  DFCX1 shift_register_mem_out_reg_21_ ( .D(n51), .CP(clk), .RN(reset), .Q(
        data_out_parallel[21]), .QN(n16) );
  DFCX1 shift_register_mem_out_reg_23_ ( .D(n49), .CP(clk), .RN(reset), .Q(
        data_out_parallel[23]), .QN(n14) );
  DFCX1 shift_register_mem_out_reg_26_ ( .D(n46), .CP(clk), .RN(reset), .Q(
        data_out_parallel[26]), .QN(n11) );
  DFCX1 shift_register_mem_out_reg_28_ ( .D(n44), .CP(clk), .RN(reset), .Q(
        data_out_parallel[28]), .QN(n9) );
  DFCX1 shift_register_mem_out_reg_7_ ( .D(n65), .CP(clk), .RN(reset), .Q(
        data_out_parallel[7]), .QN(n30) );
  DFCX1 shift_register_mem_out_reg_8_ ( .D(n64), .CP(clk), .RN(reset), .Q(
        data_out_parallel[8]), .QN(n29) );
  DFCX1 shift_register_mem_out_reg_9_ ( .D(n63), .CP(clk), .RN(reset), .Q(
        data_out_parallel[9]), .QN(n28) );
  DFCX1 shift_register_mem_out_reg_10_ ( .D(n62), .CP(clk), .RN(reset), .Q(
        data_out_parallel[10]), .QN(n27) );
  DFCX1 shift_register_mem_out_reg_11_ ( .D(n61), .CP(clk), .RN(reset), .Q(
        data_out_parallel[11]), .QN(n26) );
  DFCX1 shift_register_mem_out_reg_12_ ( .D(n60), .CP(clk), .RN(reset), .Q(
        data_out_parallel[12]), .QN(n25) );
  DFCX1 shift_register_mem_out_reg_14_ ( .D(n58), .CP(clk), .RN(reset), .Q(
        data_out_parallel[14]), .QN(n23) );
  DFCX1 shift_register_mem_out_reg_16_ ( .D(n56), .CP(clk), .RN(reset), .Q(
        data_out_parallel[16]), .QN(n21) );
  DFCX1 shift_register_mem_out_reg_20_ ( .D(n52), .CP(clk), .RN(reset), .Q(
        data_out_parallel[20]), .QN(n17) );
  DFCX1 shift_register_mem_out_reg_22_ ( .D(n50), .CP(clk), .RN(reset), .Q(
        data_out_parallel[22]), .QN(n15) );
  DFCX1 shift_register_mem_out_reg_24_ ( .D(n48), .CP(clk), .RN(reset), .Q(
        data_out_parallel[24]), .QN(n13) );
  DFCX1 shift_register_mem_out_reg_25_ ( .D(n47), .CP(clk), .RN(reset), .Q(
        data_out_parallel[25]), .QN(n12) );
  DFCX1 shift_register_mem_out_reg_27_ ( .D(n45), .CP(clk), .RN(reset), .Q(
        data_out_parallel[27]), .QN(n10) );
  DFCX1 shift_register_mem_out_reg_29_ ( .D(n43), .CP(clk), .RN(reset), .Q(
        data_out_parallel[29]), .QN(n8) );
  DFCX1 shift_register_mem_out_reg_1_ ( .D(n71), .CP(clk), .RN(reset), .Q(
        data_out_parallel[1]), .QN(n36) );
  DFCX1 shift_register_mem_out_reg_33_ ( .D(n39), .CP(clk), .RN(reset), .Q(
        data_out_parallel[33]), .QN(n4) );
  DFCX1 shift_register_mem_out_reg_5_ ( .D(n67), .CP(clk), .RN(reset), .Q(
        data_out_parallel[5]), .QN(n32) );
  DFCX1 shift_register_mem_out_reg_6_ ( .D(n66), .CP(clk), .RN(reset), .Q(
        data_out_parallel[6]), .QN(n31) );
  DFCX1 shift_register_mem_out_reg_0_ ( .D(n72), .CP(clk), .RN(reset), .Q(
        data_out_parallel[0]), .QN(n37) );
  DFCX1 shift_register_mem_out_reg_3_ ( .D(n69), .CP(clk), .RN(reset), .Q(
        data_out_parallel[3]), .QN(n34) );
  DFCX1 shift_register_mem_out_reg_4_ ( .D(n68), .CP(clk), .RN(reset), .Q(
        data_out_parallel[4]), .QN(n33) );
  DFCX1 shift_register_mem_out_reg_2_ ( .D(n70), .CP(clk), .RN(reset), .Q(
        data_out_parallel[2]), .QN(n35) );
  INVX3 U2 ( .A(shift), .Q(n1) );
  OAI22X3 U3 ( .A1(shift), .A2(n3), .B1(n4), .B2(n1), .Q(n38) );
  OAI22X3 U4 ( .A1(shift), .A2(n4), .B1(n5), .B2(n1), .Q(n39) );
  OAI22X3 U5 ( .A1(shift), .A2(n5), .B1(n6), .B2(n1), .Q(n40) );
  OAI22X3 U6 ( .A1(shift), .A2(n6), .B1(n7), .B2(n1), .Q(n41) );
  OAI22X3 U7 ( .A1(shift), .A2(n7), .B1(n8), .B2(n1), .Q(n42) );
  OAI22X3 U8 ( .A1(shift), .A2(n8), .B1(n9), .B2(n1), .Q(n43) );
  OAI22X3 U9 ( .A1(shift), .A2(n9), .B1(n10), .B2(n1), .Q(n44) );
  OAI22X3 U10 ( .A1(shift), .A2(n10), .B1(n11), .B2(n1), .Q(n45) );
  OAI22X3 U11 ( .A1(shift), .A2(n11), .B1(n12), .B2(n1), .Q(n46) );
  OAI22X3 U12 ( .A1(shift), .A2(n12), .B1(n13), .B2(n1), .Q(n47) );
  OAI22X3 U13 ( .A1(shift), .A2(n13), .B1(n14), .B2(n1), .Q(n48) );
  OAI22X3 U14 ( .A1(shift), .A2(n14), .B1(n15), .B2(n1), .Q(n49) );
  OAI22X3 U15 ( .A1(shift), .A2(n15), .B1(n16), .B2(n1), .Q(n50) );
  OAI22X3 U16 ( .A1(shift), .A2(n16), .B1(n17), .B2(n1), .Q(n51) );
  OAI22X3 U17 ( .A1(shift), .A2(n17), .B1(n18), .B2(n1), .Q(n52) );
  OAI22X3 U18 ( .A1(shift), .A2(n18), .B1(n19), .B2(n1), .Q(n53) );
  OAI22X3 U19 ( .A1(shift), .A2(n19), .B1(n20), .B2(n1), .Q(n54) );
  OAI22X3 U20 ( .A1(shift), .A2(n20), .B1(n21), .B2(n1), .Q(n55) );
  OAI22X3 U21 ( .A1(shift), .A2(n21), .B1(n22), .B2(n1), .Q(n56) );
  OAI22X3 U22 ( .A1(shift), .A2(n22), .B1(n23), .B2(n1), .Q(n57) );
  OAI22X3 U23 ( .A1(shift), .A2(n23), .B1(n24), .B2(n1), .Q(n58) );
  OAI22X3 U24 ( .A1(shift), .A2(n24), .B1(n25), .B2(n1), .Q(n59) );
  OAI22X3 U25 ( .A1(shift), .A2(n25), .B1(n26), .B2(n1), .Q(n60) );
  OAI22X3 U26 ( .A1(shift), .A2(n26), .B1(n27), .B2(n1), .Q(n61) );
  OAI22X3 U27 ( .A1(shift), .A2(n27), .B1(n28), .B2(n1), .Q(n62) );
  OAI22X3 U28 ( .A1(shift), .A2(n28), .B1(n29), .B2(n1), .Q(n63) );
  OAI22X3 U29 ( .A1(shift), .A2(n29), .B1(n30), .B2(n1), .Q(n64) );
  OAI22X3 U30 ( .A1(shift), .A2(n30), .B1(n31), .B2(n1), .Q(n65) );
  OAI22X3 U31 ( .A1(shift), .A2(n31), .B1(n32), .B2(n1), .Q(n66) );
  OAI22X3 U32 ( .A1(shift), .A2(n32), .B1(n33), .B2(n1), .Q(n67) );
  OAI22X3 U33 ( .A1(shift), .A2(n33), .B1(n34), .B2(n1), .Q(n68) );
  OAI22X3 U34 ( .A1(shift), .A2(n34), .B1(n35), .B2(n1), .Q(n69) );
  OAI22X3 U35 ( .A1(shift), .A2(n35), .B1(n36), .B2(n1), .Q(n70) );
  OAI22X3 U36 ( .A1(shift), .A2(n36), .B1(n37), .B2(n1), .Q(n71) );
  OAI22X3 U37 ( .A1(n37), .A2(shift), .B1(n2), .B2(n1), .Q(n72) );
  INVXL U38 ( .A(data_in_serial), .Q(n2) );
endmodule


module FIFO_control_part_checkers ( DRTS, CTS_out, CTS_in, read_en_N,
        read_en_E, read_en_W, read_en_S, read_en_L, read_pointer,
        read_pointer_in, write_pointer, write_pointer_in, empty_out, full_out,
        read_en_out, write_en_out, err_write_en_write_pointer,
        err_not_write_en_write_pointer,
        err_read_pointer_write_pointer_not_empty,
        err_read_pointer_write_pointer_empty,
        err_read_pointer_write_pointer_not_full,
        err_read_pointer_write_pointer_full, err_read_pointer_increment,
        err_read_pointer_not_increment, err_write_en, err_not_CTS_in,
        err_read_en_mismatch );
  input [3:0] read_pointer;
  input [3:0] read_pointer_in;
  input [3:0] write_pointer;
  input [3:0] write_pointer_in;
  input DRTS, CTS_out, CTS_in, read_en_N, read_en_E, read_en_W, read_en_S,
         read_en_L, empty_out, full_out, read_en_out, write_en_out;
  output err_write_en_write_pointer, err_not_write_en_write_pointer,
         err_read_pointer_write_pointer_not_empty,
         err_read_pointer_write_pointer_empty,
         err_read_pointer_write_pointer_not_full,
         err_read_pointer_write_pointer_full, err_read_pointer_increment,
         err_read_pointer_not_increment, err_write_en, err_not_CTS_in,
         err_read_en_mismatch;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n1, n2, n3;

  INVXL U1 ( .A(empty_out), .Q(n1) );
  NOR2XL U2 ( .A(empty_out), .B(n5), .Q(
        err_read_pointer_write_pointer_not_empty) );
  NOR2XL U3 ( .A(full_out), .B(n4), .Q(err_read_pointer_write_pointer_not_full) );
  NOR2XL U4 ( .A(write_en_out), .B(n17), .Q(err_write_en) );
  AND2X3 U5 ( .A(n5), .B(empty_out), .Q(err_read_pointer_write_pointer_empty)
         );
  AND2X3 U6 ( .A(CTS_in), .B(n17), .Q(err_not_CTS_in) );
  AND2X3 U7 ( .A(n4), .B(full_out), .Q(err_read_pointer_write_pointer_full) );
  INVXL U8 ( .A(read_en_out), .Q(n2) );
  AOI311X3 U9 ( .A1(n24), .A2(n25), .A3(n26), .B1(n2), .C1(empty_out), .Q(
        err_read_pointer_increment) );
  XNOR2X2 U10 ( .A(read_pointer_in[3]), .B(read_pointer[2]), .Q(n24) );
  XNOR2X2 U11 ( .A(read_pointer_in[1]), .B(read_pointer[0]), .Q(n25) );
  NOR2XL U12 ( .A(n27), .B(n28), .Q(n26) );
  AOI31X2 U13 ( .A1(n33), .A2(n34), .A3(n35), .B1(n3), .Q(
        err_write_en_write_pointer) );
  XNOR2X2 U14 ( .A(write_pointer_in[3]), .B(write_pointer[2]), .Q(n33) );
  XNOR2X2 U15 ( .A(write_pointer_in[1]), .B(write_pointer[0]), .Q(n34) );
  INVXL U16 ( .A(write_en_out), .Q(n3) );
  AOI32X3 U17 ( .A1(n19), .A2(n20), .A3(n21), .B1(read_en_out), .B2(n1), .Q(
        err_read_pointer_not_increment) );
  XNOR2X2 U18 ( .A(read_pointer_in[3]), .B(read_pointer[3]), .Q(n19) );
  XNOR2X2 U19 ( .A(read_pointer_in[1]), .B(read_pointer[1]), .Q(n20) );
  NOR2XL U20 ( .A(n22), .B(n23), .Q(n21) );
  AOI31X2 U21 ( .A1(n10), .A2(n11), .A3(n12), .B1(write_en_out), .Q(
        err_not_write_en_write_pointer) );
  XNOR2X2 U22 ( .A(write_pointer_in[3]), .B(write_pointer[3]), .Q(n10) );
  XNOR2X2 U23 ( .A(write_pointer_in[1]), .B(write_pointer[1]), .Q(n11) );
  NOR2XL U24 ( .A(n13), .B(n14), .Q(n12) );
  NAND4X3 U25 ( .A(n6), .B(n7), .C(n8), .D(n9), .Q(n5) );
  XNOR2X2 U26 ( .A(read_pointer[0]), .B(write_pointer[0]), .Q(n6) );
  XNOR2X2 U27 ( .A(read_pointer[1]), .B(write_pointer[1]), .Q(n7) );
  XNOR2X2 U28 ( .A(read_pointer[3]), .B(write_pointer[3]), .Q(n8) );
  NAND4X3 U29 ( .A(n29), .B(n30), .C(n31), .D(n32), .Q(n4) );
  XNOR2X2 U30 ( .A(read_pointer[1]), .B(write_pointer[0]), .Q(n29) );
  XNOR2X2 U31 ( .A(read_pointer[2]), .B(write_pointer[1]), .Q(n30) );
  XNOR2X2 U32 ( .A(read_pointer[0]), .B(write_pointer[3]), .Q(n31) );
  XOR2X1 U33 ( .A(n2), .B(n15), .Q(err_read_en_mismatch) );
  OAI31X2 U34 ( .A1(n16), .A2(read_en_L), .A3(read_en_E), .B1(n1), .Q(n15) );
  OR3X3 U35 ( .A(read_en_W), .B(read_en_S), .C(read_en_N), .Q(n16) );
  NOR2XL U36 ( .A(n36), .B(n37), .Q(n35) );
  XOR2X1 U37 ( .A(write_pointer_in[2]), .B(write_pointer[1]), .Q(n36) );
  XOR2X1 U38 ( .A(write_pointer_in[0]), .B(write_pointer[3]), .Q(n37) );
  NAND2XL U39 ( .A(n18), .B(DRTS), .Q(n17) );
  NOR2XL U40 ( .A(full_out), .B(CTS_out), .Q(n18) );
  XOR2X1 U41 ( .A(write_pointer_in[0]), .B(write_pointer[0]), .Q(n14) );
  XOR2X1 U42 ( .A(read_pointer_in[0]), .B(read_pointer[0]), .Q(n23) );
  XOR2X1 U43 ( .A(read_pointer_in[0]), .B(read_pointer[3]), .Q(n28) );
  XOR2X1 U44 ( .A(write_pointer_in[2]), .B(write_pointer[2]), .Q(n13) );
  XOR2X1 U45 ( .A(read_pointer_in[2]), .B(read_pointer[2]), .Q(n22) );
  XOR2X1 U46 ( .A(read_pointer_in[2]), .B(read_pointer[1]), .Q(n27) );
  XNOR2X2 U47 ( .A(read_pointer[2]), .B(write_pointer[2]), .Q(n9) );
  XNOR2X2 U48 ( .A(read_pointer[3]), .B(write_pointer[2]), .Q(n32) );
endmodule


module FIFO_DATA_WIDTH9 ( reset, clk, DRTS, read_en_N, read_en_E, read_en_W,
        read_en_S, read_en_L, CTS, empty_out, read_pointer_out,
        write_pointer_out, write_en_out, shift, fault_clk, data_in_serial,
        data_out_serial, err_write_en_write_pointer,
        err_not_write_en_write_pointer,
        err_read_pointer_write_pointer_not_empty,
        err_read_pointer_write_pointer_empty,
        err_read_pointer_write_pointer_not_full,
        err_read_pointer_write_pointer_full, err_read_pointer_increment,
        err_read_pointer_not_increment, err_write_en, err_not_CTS_in,
        err_read_en_mismatch );
  output [3:0] read_pointer_out;
  output [3:0] write_pointer_out;
  input reset, clk, DRTS, read_en_N, read_en_E, read_en_W, read_en_S,
         read_en_L, shift, fault_clk, data_in_serial;
  output CTS, empty_out, write_en_out, data_out_serial,
         err_write_en_write_pointer, err_not_write_en_write_pointer,
         err_read_pointer_write_pointer_not_empty,
         err_read_pointer_write_pointer_empty,
         err_read_pointer_write_pointer_not_full,
         err_read_pointer_write_pointer_full, err_read_pointer_increment,
         err_read_pointer_not_increment, err_write_en, err_not_CTS_in,
         err_read_en_mismatch;
  wire   non_faulty_signals_7, non_faulty_signals_6, non_faulty_signals_5,
         non_faulty_signals_4, non_faulty_signals_1, N8, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16,
         SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18,
         SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20,
         SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_22,
         SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_24,
         SYNOPSYS_UNCONNECTED_25, SYNOPSYS_UNCONNECTED_26,
         SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_28;
  wire   [15:12] non_faulty_signals;
  wire   [6:0] FI_add_sta;
  wire   [27:0] faulty_signals;

  fault_injector_DATA_WIDTH28_ADDRESS_WIDTH5 FI ( .data_in({DRTS, read_en_N,
        read_en_E, read_en_W, read_en_S, read_en_L, CTS, write_en_out,
        read_pointer_out, non_faulty_signals, write_pointer_out,
        non_faulty_signals_7, non_faulty_signals_6, non_faulty_signals_5,
        non_faulty_signals_4, empty_out, N8, non_faulty_signals_1,
        write_en_out}), .address(FI_add_sta[6:2]), .sta_0(FI_add_sta[1]),
        .sta_1(FI_add_sta[0]), .data_out(faulty_signals) );
  shift_register_serial_in_REG_WIDTH35 SR ( .clk(fault_clk), .reset(reset),
        .shift(shift), .data_in_serial(data_in_serial), .data_out_parallel({
        SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
        SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
        SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
        SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11,
        SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13,
        SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15,
        SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17,
        SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19,
        SYNOPSYS_UNCONNECTED_20, SYNOPSYS_UNCONNECTED_21,
        SYNOPSYS_UNCONNECTED_22, SYNOPSYS_UNCONNECTED_23,
        SYNOPSYS_UNCONNECTED_24, SYNOPSYS_UNCONNECTED_25,
        SYNOPSYS_UNCONNECTED_26, SYNOPSYS_UNCONNECTED_27,
        SYNOPSYS_UNCONNECTED_28, FI_add_sta}), .data_out_serial(
        data_out_serial) );
  FIFO_control_part_checkers FIFOCONTROLPARTCHECKERS ( .DRTS(DRTS), .CTS_out(
        CTS), .CTS_in(write_en_out), .read_en_N(read_en_N), .read_en_E(
        read_en_E), .read_en_W(read_en_W), .read_en_S(read_en_S), .read_en_L(
        read_en_L), .read_pointer(read_pointer_out), .read_pointer_in(
        non_faulty_signals), .write_pointer(write_pointer_out),
        .write_pointer_in({non_faulty_signals_7, non_faulty_signals_6,
        non_faulty_signals_5, non_faulty_signals_4}), .empty_out(empty_out),
        .full_out(N8), .read_en_out(non_faulty_signals_1), .write_en_out(
        write_en_out), .err_write_en_write_pointer(err_write_en_write_pointer),
        .err_not_write_en_write_pointer(err_not_write_en_write_pointer),
        .err_read_pointer_write_pointer_not_empty(
        err_read_pointer_write_pointer_not_empty),
        .err_read_pointer_write_pointer_empty(
        err_read_pointer_write_pointer_empty),
        .err_read_pointer_write_pointer_not_full(
        err_read_pointer_write_pointer_not_full),
        .err_read_pointer_write_pointer_full(
        err_read_pointer_write_pointer_full), .err_read_pointer_increment(
        err_read_pointer_increment), .err_read_pointer_not_increment(
        err_read_pointer_not_increment), .err_write_en(err_write_en),
        .err_not_CTS_in(err_not_CTS_in), .err_read_en_mismatch(
        err_read_en_mismatch) );
  DFCX1 CTS_out_reg ( .D(faulty_signals[20]), .CP(clk), .RN(reset), .Q(CTS) );
  DFPX3 write_pointer_reg_0_ ( .D(faulty_signals[4]), .CP(clk), .SN(reset),
        .Q(write_pointer_out[0]) );
  DFPX3 read_pointer_reg_0_ ( .D(faulty_signals[12]), .CP(clk), .SN(reset),
        .Q(read_pointer_out[0]) );
  DFCX1 write_pointer_reg_1_ ( .D(faulty_signals[5]), .CP(clk), .RN(reset),
        .Q(write_pointer_out[1]) );
  DFCX1 write_pointer_reg_2_ ( .D(faulty_signals[6]), .CP(clk), .RN(reset),
        .Q(write_pointer_out[2]) );
  DFCX1 write_pointer_reg_3_ ( .D(faulty_signals[7]), .CP(clk), .RN(reset),
        .Q(write_pointer_out[3]) );
  DFCX1 read_pointer_reg_1_ ( .D(faulty_signals[13]), .CP(clk), .RN(reset),
        .Q(read_pointer_out[1]) );
  DFCX1 read_pointer_reg_2_ ( .D(faulty_signals[14]), .CP(clk), .RN(reset),
        .Q(read_pointer_out[2]) );
  DFCX1 read_pointer_reg_3_ ( .D(faulty_signals[15]), .CP(clk), .RN(reset),
        .Q(read_pointer_out[3]) );
  INVXL U3 ( .A(n19), .Q(n3) );
  INVXL U4 ( .A(faulty_signals[0]), .Q(n1) );
  NAND2XL U5 ( .A(faulty_signals[1]), .B(n4), .Q(n19) );
  OAI22X3 U6 ( .A1(n19), .A2(n6), .B1(n3), .B2(n7), .Q(non_faulty_signals[13])
         );
  OAI22X3 U7 ( .A1(n19), .A2(n8), .B1(n3), .B2(n9), .Q(non_faulty_signals[15])
         );
  OAI22X3 U8 ( .A1(n9), .A2(n19), .B1(n3), .B2(n6), .Q(non_faulty_signals[12])
         );
  OAI22X3 U9 ( .A1(n19), .A2(n7), .B1(n3), .B2(n8), .Q(non_faulty_signals[14])
         );
  OAI22X3 U10 ( .A1(n1), .A2(n11), .B1(faulty_signals[0]), .B2(n12), .Q(
        non_faulty_signals_5) );
  OAI22X3 U11 ( .A1(n1), .A2(n2), .B1(faulty_signals[0]), .B2(n5), .Q(
        non_faulty_signals_7) );
  OAI22X3 U12 ( .A1(n5), .A2(n1), .B1(faulty_signals[0]), .B2(n11), .Q(
        non_faulty_signals_4) );
  OAI22X3 U13 ( .A1(n1), .A2(n12), .B1(faulty_signals[0]), .B2(n2), .Q(
        non_faulty_signals_6) );
  NOR4X3 U14 ( .A(n24), .B(n25), .C(n26), .D(n27), .Q(empty_out) );
  XOR2X1 U15 ( .A(faulty_signals[8]), .B(faulty_signals[16]), .Q(n24) );
  XOR2X1 U16 ( .A(faulty_signals[19]), .B(faulty_signals[11]), .Q(n25) );
  XOR2X1 U17 ( .A(faulty_signals[18]), .B(faulty_signals[10]), .Q(n26) );
  INVXL U18 ( .A(faulty_signals[3]), .Q(n4) );
  XOR2X1 U19 ( .A(faulty_signals[9]), .B(faulty_signals[17]), .Q(n27) );
  NOR4X3 U20 ( .A(n20), .B(n21), .C(n22), .D(n23), .Q(N8) );
  XOR2X1 U21 ( .A(faulty_signals[8]), .B(faulty_signals[17]), .Q(n20) );
  XOR2X1 U22 ( .A(faulty_signals[16]), .B(faulty_signals[11]), .Q(n21) );
  XOR2X1 U23 ( .A(faulty_signals[19]), .B(faulty_signals[10]), .Q(n22) );
  XOR2X1 U24 ( .A(faulty_signals[9]), .B(faulty_signals[18]), .Q(n23) );
  INVXL U25 ( .A(faulty_signals[8]), .Q(n11) );
  INVXL U26 ( .A(faulty_signals[9]), .Q(n12) );
  INVXL U27 ( .A(faulty_signals[16]), .Q(n6) );
  INVXL U28 ( .A(faulty_signals[18]), .Q(n8) );
  INVXL U29 ( .A(faulty_signals[10]), .Q(n2) );
  INVXL U30 ( .A(faulty_signals[17]), .Q(n7) );
  INVXL U31 ( .A(faulty_signals[19]), .Q(n9) );
  INVXL U32 ( .A(faulty_signals[11]), .Q(n5) );
  AOI21X3 U33 ( .A1(n17), .A2(n18), .B1(faulty_signals[3]), .Q(
        non_faulty_signals_1) );
  NOR2XL U34 ( .A(faulty_signals[23]), .B(faulty_signals[22]), .Q(n17) );
  NOR3X3 U35 ( .A(faulty_signals[24]), .B(faulty_signals[26]), .C(
        faulty_signals[25]), .Q(n18) );
  NOR3X3 U36 ( .A(n10), .B(faulty_signals[2]), .C(faulty_signals[21]), .Q(
        write_en_out) );
  INVXL U37 ( .A(faulty_signals[27]), .Q(n10) );
endmodule


module fault_injector_DATA_WIDTH22_ADDRESS_WIDTH5 ( data_in, address, sta_0,
        sta_1, data_out );
  input [21:0] data_in;
  input [4:0] address;
  output [21:0] data_out;
  input sta_0, sta_1;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n1, n2, n3, n4, n5, n6, n7;

  NOR2X3 U1 ( .A(sta_1), .B(sta_0), .Q(n1) );
  INVXL U2 ( .A(address[0]), .Q(n3) );
  INVXL U3 ( .A(address[2]), .Q(n5) );
  AO22X3 U4 ( .A1(data_in[21]), .A2(n1), .B1(n16), .B2(n14), .Q(data_out[21])
         );
  AO22X3 U5 ( .A1(data_in[7]), .A2(n1), .B1(n11), .B2(n12), .Q(data_out[7]) );
  AO22X3 U6 ( .A1(data_in[5]), .A2(n1), .B1(n14), .B2(n12), .Q(data_out[5]) );
  AO22X3 U7 ( .A1(data_in[6]), .A2(n1), .B1(n13), .B2(n11), .Q(data_out[6]) );
  AO22X3 U8 ( .A1(data_in[8]), .A2(n1), .B1(n10), .B2(n8), .Q(data_out[8]) );
  AO22X3 U9 ( .A1(data_in[4]), .A2(n1), .B1(n14), .B2(n13), .Q(data_out[4]) );
  NOR3X3 U10 ( .A(n4), .B(n2), .C(n5), .Q(n11) );
  NOR2XL U11 ( .A(n4), .B(n21), .Q(n15) );
  NOR2XL U12 ( .A(n18), .B(n3), .Q(n12) );
  NOR2XL U13 ( .A(n3), .B(n20), .Q(n9) );
  AO22X3 U14 ( .A1(data_in[3]), .A2(n1), .B1(n15), .B2(n12), .Q(data_out[3])
         );
  AO22X3 U15 ( .A1(data_in[0]), .A2(n1), .B1(n13), .B2(n8), .Q(data_out[0]) );
  NOR2XL U16 ( .A(n19), .B(n3), .Q(n16) );
  AO22X3 U17 ( .A1(data_in[2]), .A2(n1), .B1(n15), .B2(n13), .Q(data_out[2])
         );
  AO22X3 U18 ( .A1(data_in[1]), .A2(n1), .B1(n12), .B2(n8), .Q(data_out[1]) );
  NAND2XL U19 ( .A(n6), .B(n7), .Q(n18) );
  AO22X3 U20 ( .A1(data_in[9]), .A2(n1), .B1(n8), .B2(n9), .Q(data_out[9]) );
  AO22X3 U21 ( .A1(data_in[11]), .A2(n1), .B1(n15), .B2(n9), .Q(data_out[11])
         );
  AO22X3 U22 ( .A1(data_in[12]), .A2(n1), .B1(n14), .B2(n10), .Q(data_out[12])
         );
  AO22X3 U23 ( .A1(data_in[10]), .A2(n1), .B1(n15), .B2(n10), .Q(data_out[10])
         );
  AO22X3 U24 ( .A1(data_in[13]), .A2(n1), .B1(n14), .B2(n9), .Q(data_out[13])
         );
  NOR3X3 U25 ( .A(n2), .B(address[1]), .C(n5), .Q(n14) );
  AO22X3 U26 ( .A1(data_in[15]), .A2(n1), .B1(n11), .B2(n9), .Q(data_out[15])
         );
  AO22X3 U27 ( .A1(data_in[16]), .A2(n1), .B1(n17), .B2(n8), .Q(data_out[16])
         );
  AO22X3 U28 ( .A1(data_in[17]), .A2(n1), .B1(n16), .B2(n8), .Q(data_out[17])
         );
  AO22X3 U29 ( .A1(data_in[14]), .A2(n1), .B1(n11), .B2(n10), .Q(data_out[14])
         );
  NOR2XL U30 ( .A(n21), .B(address[1]), .Q(n8) );
  AO22X3 U31 ( .A1(data_in[18]), .A2(n1), .B1(n17), .B2(n15), .Q(data_out[18])
         );
  NOR2XL U32 ( .A(n20), .B(address[0]), .Q(n10) );
  NOR2XL U33 ( .A(n18), .B(address[0]), .Q(n13) );
  AO22X3 U34 ( .A1(data_in[20]), .A2(n1), .B1(n17), .B2(n14), .Q(data_out[20])
         );
  NOR2XL U35 ( .A(n19), .B(address[0]), .Q(n17) );
  NAND2XL U36 ( .A(sta_1), .B(n5), .Q(n21) );
  NAND2XL U37 ( .A(address[3]), .B(n7), .Q(n20) );
  NAND2XL U38 ( .A(address[4]), .B(n6), .Q(n19) );
  INVXL U39 ( .A(sta_1), .Q(n2) );
  INVXL U40 ( .A(address[1]), .Q(n4) );
  INVXL U41 ( .A(address[4]), .Q(n7) );
  INVXL U42 ( .A(address[3]), .Q(n6) );
  AO22X3 U43 ( .A1(data_in[19]), .A2(n1), .B1(n16), .B2(n15), .Q(data_out[19])
         );
endmodule


module shift_register_serial_in_REG_WIDTH29 ( clk, reset, shift,
        data_in_serial, data_out_parallel, data_out_serial );
  output [28:0] data_out_parallel;
  input clk, reset, shift, data_in_serial;
  output data_out_serial;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n1;
  assign data_out_serial = data_out_parallel[27];

  DFCX1 shift_register_mem_out_reg_7_ ( .D(n53), .CP(clk), .RN(reset), .Q(
        data_out_parallel[7]), .QN(n24) );
  DFCX1 shift_register_mem_out_reg_8_ ( .D(n52), .CP(clk), .RN(reset), .Q(
        data_out_parallel[8]), .QN(n23) );
  DFCX1 shift_register_mem_out_reg_9_ ( .D(n51), .CP(clk), .RN(reset), .Q(
        data_out_parallel[9]), .QN(n22) );
  DFCX1 shift_register_mem_out_reg_10_ ( .D(n50), .CP(clk), .RN(reset), .Q(
        data_out_parallel[10]), .QN(n21) );
  DFCX1 shift_register_mem_out_reg_11_ ( .D(n49), .CP(clk), .RN(reset), .Q(
        data_out_parallel[11]), .QN(n20) );
  DFCX1 shift_register_mem_out_reg_12_ ( .D(n48), .CP(clk), .RN(reset), .Q(
        data_out_parallel[12]), .QN(n19) );
  DFCX1 shift_register_mem_out_reg_13_ ( .D(n47), .CP(clk), .RN(reset), .Q(
        data_out_parallel[13]), .QN(n18) );
  DFCX1 shift_register_mem_out_reg_16_ ( .D(n44), .CP(clk), .RN(reset), .Q(
        data_out_parallel[16]), .QN(n15) );
  DFCX1 shift_register_mem_out_reg_17_ ( .D(n43), .CP(clk), .RN(reset), .Q(
        data_out_parallel[17]), .QN(n14) );
  DFCX1 shift_register_mem_out_reg_18_ ( .D(n42), .CP(clk), .RN(reset), .Q(
        data_out_parallel[18]), .QN(n13) );
  DFCX1 shift_register_mem_out_reg_20_ ( .D(n40), .CP(clk), .RN(reset), .Q(
        data_out_parallel[20]), .QN(n11) );
  DFCX1 shift_register_mem_out_reg_22_ ( .D(n38), .CP(clk), .RN(reset), .Q(
        data_out_parallel[22]), .QN(n9) );
  DFCX1 shift_register_mem_out_reg_25_ ( .D(n35), .CP(clk), .RN(reset), .Q(
        data_out_parallel[25]), .QN(n6) );
  DFCX1 shift_register_mem_out_reg_28_ ( .D(n32), .CP(clk), .RN(reset), .Q(
        data_out_parallel[28]), .QN(n3) );
  DFCX1 shift_register_mem_out_reg_14_ ( .D(n46), .CP(clk), .RN(reset), .Q(
        data_out_parallel[14]), .QN(n17) );
  DFCX1 shift_register_mem_out_reg_15_ ( .D(n45), .CP(clk), .RN(reset), .Q(
        data_out_parallel[15]), .QN(n16) );
  DFCX1 shift_register_mem_out_reg_19_ ( .D(n41), .CP(clk), .RN(reset), .Q(
        data_out_parallel[19]), .QN(n12) );
  DFCX1 shift_register_mem_out_reg_21_ ( .D(n39), .CP(clk), .RN(reset), .Q(
        data_out_parallel[21]), .QN(n10) );
  DFCX1 shift_register_mem_out_reg_23_ ( .D(n37), .CP(clk), .RN(reset), .Q(
        data_out_parallel[23]), .QN(n8) );
  DFCX1 shift_register_mem_out_reg_24_ ( .D(n36), .CP(clk), .RN(reset), .Q(
        data_out_parallel[24]), .QN(n7) );
  DFCX1 shift_register_mem_out_reg_26_ ( .D(n34), .CP(clk), .RN(reset), .Q(
        data_out_parallel[26]), .QN(n5) );
  DFCX1 shift_register_mem_out_reg_1_ ( .D(n59), .CP(clk), .RN(reset), .Q(
        data_out_parallel[1]), .QN(n30) );
  DFCX1 shift_register_mem_out_reg_4_ ( .D(n56), .CP(clk), .RN(reset), .Q(
        data_out_parallel[4]), .QN(n27) );
  DFCX1 shift_register_mem_out_reg_27_ ( .D(n33), .CP(clk), .RN(reset), .Q(
        data_out_parallel[27]), .QN(n4) );
  DFCX1 shift_register_mem_out_reg_5_ ( .D(n55), .CP(clk), .RN(reset), .Q(
        data_out_parallel[5]), .QN(n26) );
  DFCX1 shift_register_mem_out_reg_6_ ( .D(n54), .CP(clk), .RN(reset), .Q(
        data_out_parallel[6]), .QN(n25) );
  DFCX1 shift_register_mem_out_reg_0_ ( .D(n60), .CP(clk), .RN(reset), .Q(
        data_out_parallel[0]), .QN(n31) );
  DFCX1 shift_register_mem_out_reg_3_ ( .D(n57), .CP(clk), .RN(reset), .Q(
        data_out_parallel[3]), .QN(n28) );
  DFCX1 shift_register_mem_out_reg_2_ ( .D(n58), .CP(clk), .RN(reset), .Q(
        data_out_parallel[2]), .QN(n29) );
  INVX3 U2 ( .A(shift), .Q(n1) );
  OAI22X3 U3 ( .A1(shift), .A2(n3), .B1(n4), .B2(n1), .Q(n32) );
  OAI22X3 U4 ( .A1(shift), .A2(n4), .B1(n5), .B2(n1), .Q(n33) );
  OAI22X3 U5 ( .A1(shift), .A2(n5), .B1(n6), .B2(n1), .Q(n34) );
  OAI22X3 U6 ( .A1(shift), .A2(n6), .B1(n7), .B2(n1), .Q(n35) );
  OAI22X3 U7 ( .A1(shift), .A2(n7), .B1(n8), .B2(n1), .Q(n36) );
  OAI22X3 U8 ( .A1(shift), .A2(n8), .B1(n9), .B2(n1), .Q(n37) );
  OAI22X3 U9 ( .A1(shift), .A2(n9), .B1(n10), .B2(n1), .Q(n38) );
  OAI22X3 U10 ( .A1(shift), .A2(n10), .B1(n11), .B2(n1), .Q(n39) );
  OAI22X3 U11 ( .A1(shift), .A2(n11), .B1(n12), .B2(n1), .Q(n40) );
  OAI22X3 U12 ( .A1(shift), .A2(n12), .B1(n13), .B2(n1), .Q(n41) );
  OAI22X3 U13 ( .A1(shift), .A2(n13), .B1(n14), .B2(n1), .Q(n42) );
  OAI22X3 U14 ( .A1(shift), .A2(n14), .B1(n15), .B2(n1), .Q(n43) );
  OAI22X3 U15 ( .A1(shift), .A2(n15), .B1(n16), .B2(n1), .Q(n44) );
  OAI22X3 U16 ( .A1(shift), .A2(n16), .B1(n17), .B2(n1), .Q(n45) );
  OAI22X3 U17 ( .A1(shift), .A2(n17), .B1(n18), .B2(n1), .Q(n46) );
  OAI22X3 U18 ( .A1(shift), .A2(n18), .B1(n19), .B2(n1), .Q(n47) );
  OAI22X3 U19 ( .A1(shift), .A2(n19), .B1(n20), .B2(n1), .Q(n48) );
  OAI22X3 U20 ( .A1(shift), .A2(n20), .B1(n21), .B2(n1), .Q(n49) );
  OAI22X3 U21 ( .A1(shift), .A2(n21), .B1(n22), .B2(n1), .Q(n50) );
  OAI22X3 U22 ( .A1(shift), .A2(n22), .B1(n23), .B2(n1), .Q(n51) );
  OAI22X3 U23 ( .A1(shift), .A2(n23), .B1(n24), .B2(n1), .Q(n52) );
  OAI22X3 U24 ( .A1(shift), .A2(n24), .B1(n25), .B2(n1), .Q(n53) );
  OAI22X3 U25 ( .A1(shift), .A2(n25), .B1(n26), .B2(n1), .Q(n54) );
  OAI22X3 U26 ( .A1(shift), .A2(n26), .B1(n27), .B2(n1), .Q(n55) );
  OAI22X3 U27 ( .A1(shift), .A2(n27), .B1(n28), .B2(n1), .Q(n56) );
  OAI22X3 U28 ( .A1(shift), .A2(n28), .B1(n29), .B2(n1), .Q(n57) );
  OAI22X3 U29 ( .A1(shift), .A2(n29), .B1(n30), .B2(n1), .Q(n58) );
  OAI22X3 U30 ( .A1(shift), .A2(n30), .B1(n31), .B2(n1), .Q(n59) );
  AO22X3 U31 ( .A1(data_out_parallel[0]), .A2(n1), .B1(data_in_serial), .B2(
        shift), .Q(n60) );
endmodule


module LBDR_checkers_cur_addr_rst5_NoC_size4 ( empty, flit_type, Req_N_FF,
        Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF, Req_N_in, Req_E_in, Req_W_in,
        Req_S_in, Req_L_in, N1_out, E1_out, W1_out, S1_out, dst_addr,
        err_header_empty_Requests_FF_Requests_in,
        err_tail_Requests_in_all_zero, err_header_tail_Requests_FF_Requests_in,
        err_dst_addr_cur_addr_N1, err_dst_addr_cur_addr_not_N1,
        err_dst_addr_cur_addr_E1, err_dst_addr_cur_addr_not_E1,
        err_dst_addr_cur_addr_W1, err_dst_addr_cur_addr_not_W1,
        err_dst_addr_cur_addr_S1, err_dst_addr_cur_addr_not_S1,
        err_dst_addr_cur_addr_not_Req_L_in, err_dst_addr_cur_addr_Req_L_in,
        err_header_not_empty_Req_N_in, err_header_not_empty_Req_E_in,
        err_header_not_empty_Req_W_in, err_header_not_empty_Req_S_in );
  input [2:0] flit_type;
  input [3:0] dst_addr;
  input empty, Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF, Req_N_in,
         Req_E_in, Req_W_in, Req_S_in, Req_L_in, N1_out, E1_out, W1_out,
         S1_out;
  output err_header_empty_Requests_FF_Requests_in,
         err_tail_Requests_in_all_zero,
         err_header_tail_Requests_FF_Requests_in, err_dst_addr_cur_addr_N1,
         err_dst_addr_cur_addr_not_N1, err_dst_addr_cur_addr_E1,
         err_dst_addr_cur_addr_not_E1, err_dst_addr_cur_addr_W1,
         err_dst_addr_cur_addr_not_W1, err_dst_addr_cur_addr_S1,
         err_dst_addr_cur_addr_not_S1, err_dst_addr_cur_addr_not_Req_L_in,
         err_dst_addr_cur_addr_Req_L_in, err_header_not_empty_Req_N_in,
         err_header_not_empty_Req_E_in, err_header_not_empty_Req_W_in,
         err_header_not_empty_Req_S_in;
  wire   N4, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n1, n2, n3, n4, n5, n6, n7, n8, n9, n24, n25, n26, n27, n28;

  NOR3X3 U3 ( .A(n7), .B(n10), .C(n22), .Q(
        err_header_tail_Requests_FF_Requests_in) );
  INVXL U4 ( .A(N4), .Q(n7) );
  NOR2XL U5 ( .A(W1_out), .B(E1_out), .Q(n14) );
  NAND2XL U6 ( .A(n10), .B(n25), .Q(n12) );
  INVXL U7 ( .A(empty), .Q(n25) );
  NOR2XL U8 ( .A(n11), .B(n12), .Q(err_header_not_empty_Req_S_in) );
  XOR2X1 U9 ( .A(n13), .B(Req_S_in), .Q(n11) );
  NAND2XL U10 ( .A(S1_out), .B(n14), .Q(n13) );
  NOR2XL U11 ( .A(E1_out), .B(n28), .Q(err_dst_addr_cur_addr_E1) );
  NOR2XL U12 ( .A(n20), .B(n12), .Q(err_dst_addr_cur_addr_not_Req_L_in) );
  XNOR2X2 U13 ( .A(n21), .B(n8), .Q(n20) );
  NAND3X3 U14 ( .A(n9), .B(n24), .C(n14), .Q(n21) );
  INVXL U15 ( .A(N1_out), .Q(n9) );
  NOR2XL U16 ( .A(n15), .B(n12), .Q(err_header_not_empty_Req_W_in) );
  XNOR2X2 U17 ( .A(Req_W_in), .B(W1_out), .Q(n15) );
  NOR2XL U18 ( .A(n16), .B(n12), .Q(err_header_not_empty_Req_E_in) );
  XNOR2X2 U19 ( .A(Req_E_in), .B(E1_out), .Q(n16) );
  NOR2XL U20 ( .A(n17), .B(n12), .Q(err_header_not_empty_Req_N_in) );
  XOR2X1 U21 ( .A(n18), .B(Req_N_in), .Q(n17) );
  NAND2XL U22 ( .A(N1_out), .B(n14), .Q(n18) );
  AND3X2 U23 ( .A(empty), .B(n10), .C(N4), .Q(
        err_header_empty_Requests_FF_Requests_in) );
  AND2X3 U24 ( .A(n28), .B(E1_out), .Q(err_dst_addr_cur_addr_not_E1) );
  OA31X3 U25 ( .A1(Req_E_in), .A2(Req_L_in), .A3(n23), .B1(n22), .Q(
        err_tail_Requests_in_all_zero) );
  OR3X3 U26 ( .A(Req_N_in), .B(Req_W_in), .C(Req_S_in), .Q(n23) );
  INVXL U27 ( .A(S1_out), .Q(n24) );
  INVXL U28 ( .A(Req_L_in), .Q(n8) );
  AOI311X3 U29 ( .A1(dst_addr[2]), .A2(dst_addr[0]), .A3(n19), .B1(n8), .C1(
        n12), .Q(err_dst_addr_cur_addr_Req_L_in) );
  NOR2XL U30 ( .A(dst_addr[3]), .B(dst_addr[1]), .Q(n19) );
  NOR3X3 U31 ( .A(flit_type[1]), .B(flit_type[2]), .C(n27), .Q(n10) );
  INVXL U32 ( .A(flit_type[0]), .Q(n27) );
  NOR3X3 U33 ( .A(dst_addr[1]), .B(dst_addr[0]), .C(W1_out), .Q(
        err_dst_addr_cur_addr_W1) );
  NOR3X3 U34 ( .A(flit_type[0]), .B(flit_type[1]), .C(n26), .Q(n22) );
  INVXL U35 ( .A(flit_type[2]), .Q(n26) );
  NOR3X3 U36 ( .A(N1_out), .B(dst_addr[2]), .C(dst_addr[3]), .Q(
        err_dst_addr_cur_addr_N1) );
  NOR2XL U37 ( .A(dst_addr[3]), .B(n24), .Q(err_dst_addr_cur_addr_not_S1) );
  OA21X2 U38 ( .A1(dst_addr[0]), .A2(dst_addr[1]), .B1(W1_out), .Q(
        err_dst_addr_cur_addr_not_W1) );
  OA21X2 U39 ( .A1(dst_addr[2]), .A2(dst_addr[3]), .B1(N1_out), .Q(
        err_dst_addr_cur_addr_not_N1) );
  AND2X3 U40 ( .A(n24), .B(dst_addr[3]), .Q(err_dst_addr_cur_addr_S1) );
  INVXL U41 ( .A(dst_addr[1]), .Q(n28) );
  XNOR2X1 U42 ( .A(Req_S_in), .B(Req_S_FF), .Q(n6) );
  XNOR2X1 U43 ( .A(Req_L_in), .B(Req_L_FF), .Q(n5) );
  XNOR2X1 U44 ( .A(Req_W_in), .B(Req_W_FF), .Q(n4) );
  XOR2X1 U45 ( .A(Req_E_in), .B(Req_E_FF), .Q(n2) );
  XOR2X1 U46 ( .A(Req_N_in), .B(Req_N_FF), .Q(n1) );
  NOR2XL U47 ( .A(n2), .B(n1), .Q(n3) );
  NAND4X1 U48 ( .A(n6), .B(n5), .C(n4), .D(n3), .Q(N4) );
endmodule


module LBDR_cur_addr_rst5_Rxy_rst60_Cx_rst15_NoC_size4 ( reset, clk, empty,
        flit_type, dst_addr, Req_N, Req_E, Req_W, Req_S, Req_L, shift,
        fault_clk, data_in_serial, data_out_serial,
        err_header_empty_Requests_FF_Requests_in,
        err_tail_Requests_in_all_zero, err_header_tail_Requests_FF_Requests_in,
        err_dst_addr_cur_addr_N1, err_dst_addr_cur_addr_not_N1,
        err_dst_addr_cur_addr_E1, err_dst_addr_cur_addr_not_E1,
        err_dst_addr_cur_addr_W1, err_dst_addr_cur_addr_not_W1,
        err_dst_addr_cur_addr_S1, err_dst_addr_cur_addr_not_S1,
        err_dst_addr_cur_addr_not_Req_L_in, err_dst_addr_cur_addr_Req_L_in,
        err_header_not_empty_Req_N_in, err_header_not_empty_Req_E_in,
        err_header_not_empty_Req_W_in, err_header_not_empty_Req_S_in );
  input [2:0] flit_type;
  input [3:0] dst_addr;
  input reset, clk, empty, shift, fault_clk, data_in_serial;
  output Req_N, Req_E, Req_W, Req_S, Req_L, data_out_serial,
         err_header_empty_Requests_FF_Requests_in,
         err_tail_Requests_in_all_zero,
         err_header_tail_Requests_FF_Requests_in, err_dst_addr_cur_addr_N1,
         err_dst_addr_cur_addr_not_N1, err_dst_addr_cur_addr_E1,
         err_dst_addr_cur_addr_not_E1, err_dst_addr_cur_addr_W1,
         err_dst_addr_cur_addr_not_W1, err_dst_addr_cur_addr_S1,
         err_dst_addr_cur_addr_not_S1, err_dst_addr_cur_addr_not_Req_L_in,
         err_dst_addr_cur_addr_Req_L_in, err_header_not_empty_Req_N_in,
         err_header_not_empty_Req_E_in, err_header_not_empty_Req_W_in,
         err_header_not_empty_Req_S_in;
  wire   N3, N4, N5, N6, n12, n13, n14, n15, n1, n2, n3, n4, n5,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16,
         SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18,
         SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20,
         SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_22;
  wire   [8:4] non_faulty_signals;
  wire   [6:0] FI_add_sta;
  wire   [21:0] faulty_signals;

  fault_injector_DATA_WIDTH22_ADDRESS_WIDTH5 FI ( .data_in({empty, flit_type,
        dst_addr, Req_N, Req_E, Req_W, Req_S, Req_L, non_faulty_signals, N3,
        N4, N5, N6}), .address(FI_add_sta[6:2]), .sta_0(FI_add_sta[1]),
        .sta_1(FI_add_sta[0]), .data_out({faulty_signals[21:18], N6,
        faulty_signals[16], N4, faulty_signals[14:0]}) );
  shift_register_serial_in_REG_WIDTH29 SR ( .clk(fault_clk), .reset(reset),
        .shift(shift), .data_in_serial(data_in_serial), .data_out_parallel({
        SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
        SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
        SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
        SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11,
        SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13,
        SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15,
        SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17,
        SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19,
        SYNOPSYS_UNCONNECTED_20, SYNOPSYS_UNCONNECTED_21,
        SYNOPSYS_UNCONNECTED_22, FI_add_sta}), .data_out_serial(
        data_out_serial) );
  LBDR_checkers_cur_addr_rst5_NoC_size4 LBDRCHECKERS ( .empty(empty),
        .flit_type(flit_type), .Req_N_FF(Req_N), .Req_E_FF(Req_E), .Req_W_FF(
        Req_W), .Req_S_FF(Req_S), .Req_L_FF(Req_L), .Req_N_in(
        non_faulty_signals[8]), .Req_E_in(non_faulty_signals[7]), .Req_W_in(
        non_faulty_signals[6]), .Req_S_in(non_faulty_signals[5]), .Req_L_in(
        non_faulty_signals[4]), .N1_out(N3), .E1_out(N4), .W1_out(N5),
        .S1_out(N6), .dst_addr(dst_addr),
        .err_header_empty_Requests_FF_Requests_in(
        err_header_empty_Requests_FF_Requests_in),
        .err_tail_Requests_in_all_zero(err_tail_Requests_in_all_zero),
        .err_header_tail_Requests_FF_Requests_in(
        err_header_tail_Requests_FF_Requests_in), .err_dst_addr_cur_addr_N1(
        err_dst_addr_cur_addr_N1), .err_dst_addr_cur_addr_not_N1(
        err_dst_addr_cur_addr_not_N1), .err_dst_addr_cur_addr_E1(
        err_dst_addr_cur_addr_E1), .err_dst_addr_cur_addr_not_E1(
        err_dst_addr_cur_addr_not_E1), .err_dst_addr_cur_addr_W1(
        err_dst_addr_cur_addr_W1), .err_dst_addr_cur_addr_not_W1(
        err_dst_addr_cur_addr_not_W1), .err_dst_addr_cur_addr_S1(
        err_dst_addr_cur_addr_S1), .err_dst_addr_cur_addr_not_S1(
        err_dst_addr_cur_addr_not_S1), .err_dst_addr_cur_addr_not_Req_L_in(
        err_dst_addr_cur_addr_not_Req_L_in), .err_dst_addr_cur_addr_Req_L_in(
        err_dst_addr_cur_addr_Req_L_in), .err_header_not_empty_Req_N_in(
        err_header_not_empty_Req_N_in), .err_header_not_empty_Req_E_in(
        err_header_not_empty_Req_E_in), .err_header_not_empty_Req_W_in(
        err_header_not_empty_Req_W_in), .err_header_not_empty_Req_S_in(
        err_header_not_empty_Req_S_in) );
  DFCX1 Req_E_FF_reg ( .D(faulty_signals[7]), .CP(clk), .RN(reset), .Q(Req_E)
         );
  DFCX1 Req_N_FF_reg ( .D(faulty_signals[8]), .CP(clk), .RN(reset), .Q(Req_N)
         );
  DFCX1 Req_S_FF_reg ( .D(faulty_signals[5]), .CP(clk), .RN(reset), .Q(Req_S)
         );
  DFCX1 Req_L_FF_reg ( .D(faulty_signals[4]), .CP(clk), .RN(reset), .Q(Req_L)
         );
  DFCX1 Req_W_FF_reg ( .D(faulty_signals[6]), .CP(clk), .RN(reset), .Q(Req_W)
         );
  NOR2XL U3 ( .A(faulty_signals[16]), .B(N6), .Q(N3) );
  NOR3X3 U4 ( .A(faulty_signals[1]), .B(faulty_signals[2]), .C(n14), .Q(n13)
         );
  INVXL U5 ( .A(n14), .Q(n1) );
  AOI31X2 U6 ( .A1(faulty_signals[20]), .A2(n5), .A3(n4), .B1(n1), .Q(n12) );
  INVXL U7 ( .A(faulty_signals[18]), .Q(n4) );
  NAND3X3 U8 ( .A(faulty_signals[18]), .B(n5), .C(n15), .Q(n14) );
  NOR2XL U9 ( .A(faulty_signals[21]), .B(faulty_signals[20]), .Q(n15) );
  AO32X3 U10 ( .A1(n2), .A2(n3), .A3(n13), .B1(faulty_signals[9]), .B2(n12),
        .Q(non_faulty_signals[4]) );
  INVXL U11 ( .A(faulty_signals[0]), .Q(n2) );
  INVXL U12 ( .A(faulty_signals[3]), .Q(n3) );
  AO22X3 U13 ( .A1(faulty_signals[1]), .A2(n1), .B1(faulty_signals[11]), .B2(
        n12), .Q(non_faulty_signals[6]) );
  AO22X3 U14 ( .A1(faulty_signals[2]), .A2(n1), .B1(faulty_signals[12]), .B2(
        n12), .Q(non_faulty_signals[7]) );
  AO22X3 U15 ( .A1(faulty_signals[10]), .A2(n12), .B1(faulty_signals[0]), .B2(
        n13), .Q(non_faulty_signals[5]) );
  AO22X3 U16 ( .A1(faulty_signals[13]), .A2(n12), .B1(faulty_signals[3]), .B2(
        n13), .Q(non_faulty_signals[8]) );
  NOR2XL U17 ( .A(faulty_signals[14]), .B(N4), .Q(N5) );
  INVXL U18 ( .A(faulty_signals[19]), .Q(n5) );
endmodule


module fault_injector_DATA_WIDTH36_ADDRESS_WIDTH6 ( data_in, address, sta_0,
        sta_1, data_out );
  input [35:0] data_in;
  input [5:0] address;
  output [35:0] data_out;
  input sta_0, sta_1;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n1, n2, n3, n4, n5, n6, n7, n22;

  NOR2XL U1 ( .A(sta_1), .B(sta_0), .Q(n8) );
  INVXL U2 ( .A(address[2]), .Q(n5) );
  INVXL U3 ( .A(address[1]), .Q(n4) );
  INVXL U4 ( .A(address[0]), .Q(n3) );
  INVXL U5 ( .A(sta_1), .Q(n2) );
  AO22X3 U6 ( .A1(data_in[17]), .A2(n1), .B1(n21), .B2(n9), .Q(data_out[17])
         );
  AO22X3 U7 ( .A1(data_in[13]), .A2(n8), .B1(n15), .B2(n10), .Q(data_out[13])
         );
  AO22X3 U8 ( .A1(data_in[16]), .A2(n8), .B1(n21), .B2(n11), .Q(data_out[16])
         );
  AO22X3 U9 ( .A1(data_in[14]), .A2(n8), .B1(n14), .B2(n10), .Q(data_out[14])
         );
  AO22X3 U10 ( .A1(data_in[15]), .A2(n8), .B1(n12), .B2(n10), .Q(data_out[15])
         );
  AO22X3 U11 ( .A1(data_in[23]), .A2(n1), .B1(n21), .B2(n12), .Q(data_out[23])
         );
  AO22X3 U12 ( .A1(data_in[22]), .A2(n1), .B1(n21), .B2(n14), .Q(data_out[22])
         );
  AO22X3 U13 ( .A1(data_in[21]), .A2(n1), .B1(n21), .B2(n15), .Q(data_out[21])
         );
  AO22X3 U14 ( .A1(data_in[20]), .A2(n1), .B1(n21), .B2(n16), .Q(data_out[20])
         );
  AO22X3 U15 ( .A1(data_in[19]), .A2(n1), .B1(n21), .B2(n17), .Q(data_out[19])
         );
  AO22X3 U16 ( .A1(data_in[12]), .A2(n8), .B1(n16), .B2(n10), .Q(data_out[12])
         );
  AO22X3 U17 ( .A1(data_in[18]), .A2(n1), .B1(n21), .B2(n19), .Q(data_out[18])
         );
  AO22X3 U18 ( .A1(data_in[10]), .A2(n1), .B1(n19), .B2(n10), .Q(data_out[10])
         );
  NOR3X3 U19 ( .A(n4), .B(n3), .C(n5), .Q(n12) );
  CLKBUFX2 U20 ( .A(n8), .Q(n1) );
  AO22X3 U21 ( .A1(data_in[8]), .A2(n8), .B1(n11), .B2(n10), .Q(data_out[8])
         );
  AO22X3 U22 ( .A1(data_in[9]), .A2(n1), .B1(n9), .B2(n10), .Q(data_out[9]) );
  AO22X3 U23 ( .A1(data_in[2]), .A2(n1), .B1(n19), .B2(n13), .Q(data_out[2])
         );
  AO22X3 U24 ( .A1(data_in[3]), .A2(n1), .B1(n17), .B2(n13), .Q(data_out[3])
         );
  AO22X3 U25 ( .A1(data_in[4]), .A2(n1), .B1(n16), .B2(n13), .Q(data_out[4])
         );
  AO22X3 U26 ( .A1(data_in[5]), .A2(n1), .B1(n15), .B2(n13), .Q(data_out[5])
         );
  AO22X3 U27 ( .A1(data_in[6]), .A2(n1), .B1(n14), .B2(n13), .Q(data_out[6])
         );
  AO22X3 U28 ( .A1(data_in[7]), .A2(n1), .B1(n12), .B2(n13), .Q(data_out[7])
         );
  AO22X3 U29 ( .A1(data_in[0]), .A2(n1), .B1(n13), .B2(n11), .Q(data_out[0])
         );
  AO22X3 U30 ( .A1(data_in[1]), .A2(n1), .B1(n13), .B2(n9), .Q(data_out[1]) );
  AO22X3 U31 ( .A1(data_in[27]), .A2(n1), .B1(n20), .B2(n17), .Q(data_out[27])
         );
  AO22X3 U32 ( .A1(data_in[26]), .A2(n1), .B1(n20), .B2(n19), .Q(data_out[26])
         );
  AO22X3 U33 ( .A1(data_in[24]), .A2(n1), .B1(n20), .B2(n11), .Q(data_out[24])
         );
  AO22X3 U34 ( .A1(data_in[25]), .A2(n1), .B1(n20), .B2(n9), .Q(data_out[25])
         );
  AO22X3 U35 ( .A1(data_in[29]), .A2(n1), .B1(n20), .B2(n15), .Q(data_out[29])
         );
  AO22X3 U36 ( .A1(data_in[28]), .A2(n1), .B1(n20), .B2(n16), .Q(data_out[28])
         );
  AO22X3 U37 ( .A1(data_in[11]), .A2(n1), .B1(n17), .B2(n10), .Q(data_out[11])
         );
  NOR4X3 U38 ( .A(n2), .B(n6), .C(address[4]), .D(address[5]), .Q(n10) );
  NOR4X3 U39 ( .A(n2), .B(address[3]), .C(address[4]), .D(address[5]), .Q(n13)
         );
  NOR4X3 U40 ( .A(n7), .B(n2), .C(address[3]), .D(address[5]), .Q(n21) );
  NOR4X3 U41 ( .A(n7), .B(n2), .C(n6), .D(address[5]), .Q(n20) );
  NOR4X3 U42 ( .A(n22), .B(n2), .C(address[3]), .D(address[4]), .Q(n18) );
  INVXL U43 ( .A(address[5]), .Q(n22) );
  NOR3X3 U44 ( .A(address[1]), .B(address[2]), .C(address[0]), .Q(n11) );
  NOR3X3 U45 ( .A(address[1]), .B(address[2]), .C(n3), .Q(n9) );
  NOR3X3 U46 ( .A(n3), .B(address[2]), .C(n4), .Q(n17) );
  NOR3X3 U47 ( .A(address[0]), .B(address[2]), .C(n4), .Q(n19) );
  NOR3X3 U48 ( .A(n4), .B(address[0]), .C(n5), .Q(n14) );
  NOR3X3 U49 ( .A(address[0]), .B(address[1]), .C(n5), .Q(n16) );
  NOR3X3 U50 ( .A(n3), .B(address[1]), .C(n5), .Q(n15) );
  AO22X3 U51 ( .A1(data_in[35]), .A2(n1), .B1(n18), .B2(n17), .Q(data_out[35])
         );
  AO22X3 U52 ( .A1(data_in[33]), .A2(n1), .B1(n18), .B2(n9), .Q(data_out[33])
         );
  AO22X3 U53 ( .A1(data_in[32]), .A2(n1), .B1(n18), .B2(n11), .Q(data_out[32])
         );
  AO22X3 U54 ( .A1(data_in[31]), .A2(n1), .B1(n20), .B2(n12), .Q(data_out[31])
         );
  AO22X3 U55 ( .A1(data_in[34]), .A2(n1), .B1(n19), .B2(n18), .Q(data_out[34])
         );
  AO22X3 U56 ( .A1(data_in[30]), .A2(n1), .B1(n20), .B2(n14), .Q(data_out[30])
         );
  INVXL U57 ( .A(address[3]), .Q(n6) );
  INVXL U58 ( .A(address[4]), .Q(n7) );
endmodule


module shift_register_serial_in_REG_WIDTH44 ( clk, reset, shift,
        data_in_serial, data_out_parallel, data_out_serial );
  output [43:0] data_out_parallel;
  input clk, reset, shift, data_in_serial;
  output data_out_serial;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n1, n2, n91;
  assign data_out_serial = data_out_parallel[42];

  DFCX1 shift_register_mem_out_reg_30_ ( .D(n60), .CP(clk), .RN(reset), .Q(
        data_out_parallel[30]), .QN(n16) );
  DFCX1 shift_register_mem_out_reg_32_ ( .D(n58), .CP(clk), .RN(reset), .Q(
        data_out_parallel[32]), .QN(n14) );
  DFCX1 shift_register_mem_out_reg_33_ ( .D(n57), .CP(clk), .RN(reset), .Q(
        data_out_parallel[33]), .QN(n13) );
  DFCX1 shift_register_mem_out_reg_34_ ( .D(n56), .CP(clk), .RN(reset), .Q(
        data_out_parallel[34]), .QN(n12) );
  DFCX1 shift_register_mem_out_reg_35_ ( .D(n55), .CP(clk), .RN(reset), .Q(
        data_out_parallel[35]), .QN(n11) );
  DFCX1 shift_register_mem_out_reg_36_ ( .D(n54), .CP(clk), .RN(reset), .Q(
        data_out_parallel[36]), .QN(n10) );
  DFCX1 shift_register_mem_out_reg_37_ ( .D(n53), .CP(clk), .RN(reset), .Q(
        data_out_parallel[37]), .QN(n9) );
  DFCX1 shift_register_mem_out_reg_39_ ( .D(n51), .CP(clk), .RN(reset), .Q(
        data_out_parallel[39]), .QN(n7) );
  DFCX1 shift_register_mem_out_reg_40_ ( .D(n50), .CP(clk), .RN(reset), .Q(
        data_out_parallel[40]), .QN(n6) );
  DFCX1 shift_register_mem_out_reg_41_ ( .D(n49), .CP(clk), .RN(reset), .Q(
        data_out_parallel[41]), .QN(n5) );
  DFCX1 shift_register_mem_out_reg_43_ ( .D(n47), .CP(clk), .RN(reset), .Q(
        data_out_parallel[43]), .QN(n3) );
  DFCX1 shift_register_mem_out_reg_31_ ( .D(n59), .CP(clk), .RN(reset), .Q(
        data_out_parallel[31]), .QN(n15) );
  DFCX1 shift_register_mem_out_reg_38_ ( .D(n52), .CP(clk), .RN(reset), .Q(
        data_out_parallel[38]), .QN(n8) );
  DFCX1 shift_register_mem_out_reg_8_ ( .D(n82), .CP(clk), .RN(reset), .Q(
        data_out_parallel[8]), .QN(n38) );
  DFCX1 shift_register_mem_out_reg_9_ ( .D(n81), .CP(clk), .RN(reset), .Q(
        data_out_parallel[9]), .QN(n37) );
  DFCX1 shift_register_mem_out_reg_10_ ( .D(n80), .CP(clk), .RN(reset), .Q(
        data_out_parallel[10]), .QN(n36) );
  DFCX1 shift_register_mem_out_reg_11_ ( .D(n79), .CP(clk), .RN(reset), .Q(
        data_out_parallel[11]), .QN(n35) );
  DFCX1 shift_register_mem_out_reg_12_ ( .D(n78), .CP(clk), .RN(reset), .Q(
        data_out_parallel[12]), .QN(n34) );
  DFCX1 shift_register_mem_out_reg_13_ ( .D(n77), .CP(clk), .RN(reset), .Q(
        data_out_parallel[13]), .QN(n33) );
  DFCX1 shift_register_mem_out_reg_14_ ( .D(n76), .CP(clk), .RN(reset), .Q(
        data_out_parallel[14]), .QN(n32) );
  DFCX1 shift_register_mem_out_reg_15_ ( .D(n75), .CP(clk), .RN(reset), .Q(
        data_out_parallel[15]), .QN(n31) );
  DFCX1 shift_register_mem_out_reg_16_ ( .D(n74), .CP(clk), .RN(reset), .Q(
        data_out_parallel[16]), .QN(n30) );
  DFCX1 shift_register_mem_out_reg_17_ ( .D(n73), .CP(clk), .RN(reset), .Q(
        data_out_parallel[17]), .QN(n29) );
  DFCX1 shift_register_mem_out_reg_18_ ( .D(n72), .CP(clk), .RN(reset), .Q(
        data_out_parallel[18]), .QN(n28) );
  DFCX1 shift_register_mem_out_reg_19_ ( .D(n71), .CP(clk), .RN(reset), .Q(
        data_out_parallel[19]), .QN(n27) );
  DFCX1 shift_register_mem_out_reg_20_ ( .D(n70), .CP(clk), .RN(reset), .Q(
        data_out_parallel[20]), .QN(n26) );
  DFCX1 shift_register_mem_out_reg_21_ ( .D(n69), .CP(clk), .RN(reset), .Q(
        data_out_parallel[21]), .QN(n25) );
  DFCX1 shift_register_mem_out_reg_22_ ( .D(n68), .CP(clk), .RN(reset), .Q(
        data_out_parallel[22]), .QN(n24) );
  DFCX1 shift_register_mem_out_reg_23_ ( .D(n67), .CP(clk), .RN(reset), .Q(
        data_out_parallel[23]), .QN(n23) );
  DFCX1 shift_register_mem_out_reg_24_ ( .D(n66), .CP(clk), .RN(reset), .Q(
        data_out_parallel[24]), .QN(n22) );
  DFCX1 shift_register_mem_out_reg_25_ ( .D(n65), .CP(clk), .RN(reset), .Q(
        data_out_parallel[25]), .QN(n21) );
  DFCX1 shift_register_mem_out_reg_26_ ( .D(n64), .CP(clk), .RN(reset), .Q(
        data_out_parallel[26]), .QN(n20) );
  DFCX1 shift_register_mem_out_reg_27_ ( .D(n63), .CP(clk), .RN(reset), .Q(
        data_out_parallel[27]), .QN(n19) );
  DFCX1 shift_register_mem_out_reg_28_ ( .D(n62), .CP(clk), .RN(reset), .Q(
        data_out_parallel[28]), .QN(n18) );
  DFCX1 shift_register_mem_out_reg_29_ ( .D(n61), .CP(clk), .RN(reset), .Q(
        data_out_parallel[29]), .QN(n17) );
  DFCX1 shift_register_mem_out_reg_42_ ( .D(n48), .CP(clk), .RN(reset), .Q(
        data_out_parallel[42]), .QN(n4) );
  DFCX1 shift_register_mem_out_reg_1_ ( .D(n89), .CP(clk), .RN(reset), .Q(
        data_out_parallel[1]), .QN(n45) );
  DFCX1 shift_register_mem_out_reg_0_ ( .D(n90), .CP(clk), .RN(reset), .Q(
        data_out_parallel[0]), .QN(n46) );
  DFCX1 shift_register_mem_out_reg_5_ ( .D(n85), .CP(clk), .RN(reset), .Q(
        data_out_parallel[5]), .QN(n41) );
  DFCX1 shift_register_mem_out_reg_6_ ( .D(n84), .CP(clk), .RN(reset), .Q(
        data_out_parallel[6]), .QN(n40) );
  DFCX1 shift_register_mem_out_reg_7_ ( .D(n83), .CP(clk), .RN(reset), .Q(
        data_out_parallel[7]), .QN(n39) );
  DFCX1 shift_register_mem_out_reg_3_ ( .D(n87), .CP(clk), .RN(reset), .Q(
        data_out_parallel[3]), .QN(n43) );
  DFCX1 shift_register_mem_out_reg_2_ ( .D(n88), .CP(clk), .RN(reset), .Q(
        data_out_parallel[2]), .QN(n44) );
  DFCX1 shift_register_mem_out_reg_4_ ( .D(n86), .CP(clk), .RN(reset), .Q(
        data_out_parallel[4]), .QN(n42) );
  CLKINVX2 U2 ( .A(shift), .Q(n1) );
  CLKINVX2 U3 ( .A(shift), .Q(n2) );
  OAI22X3 U4 ( .A1(shift), .A2(n17), .B1(n18), .B2(n2), .Q(n61) );
  OAI22X3 U5 ( .A1(shift), .A2(n18), .B1(n19), .B2(n2), .Q(n62) );
  OAI22X3 U6 ( .A1(shift), .A2(n19), .B1(n20), .B2(n2), .Q(n63) );
  OAI22X3 U7 ( .A1(shift), .A2(n20), .B1(n21), .B2(n2), .Q(n64) );
  OAI22X3 U8 ( .A1(shift), .A2(n21), .B1(n22), .B2(n2), .Q(n65) );
  OAI22X3 U9 ( .A1(shift), .A2(n22), .B1(n23), .B2(n2), .Q(n66) );
  OAI22X3 U10 ( .A1(shift), .A2(n23), .B1(n24), .B2(n2), .Q(n67) );
  OAI22X3 U11 ( .A1(shift), .A2(n24), .B1(n25), .B2(n2), .Q(n68) );
  OAI22X3 U12 ( .A1(shift), .A2(n25), .B1(n26), .B2(n2), .Q(n69) );
  OAI22X3 U13 ( .A1(shift), .A2(n26), .B1(n27), .B2(n2), .Q(n70) );
  OAI22X3 U14 ( .A1(shift), .A2(n27), .B1(n28), .B2(n2), .Q(n71) );
  OAI22X3 U15 ( .A1(shift), .A2(n28), .B1(n29), .B2(n2), .Q(n72) );
  OAI22X3 U16 ( .A1(shift), .A2(n29), .B1(n30), .B2(n2), .Q(n73) );
  OAI22X3 U17 ( .A1(shift), .A2(n30), .B1(n31), .B2(n2), .Q(n74) );
  OAI22X3 U18 ( .A1(shift), .A2(n31), .B1(n32), .B2(n1), .Q(n75) );
  OAI22X3 U19 ( .A1(shift), .A2(n32), .B1(n33), .B2(n2), .Q(n76) );
  OAI22X3 U20 ( .A1(shift), .A2(n33), .B1(n34), .B2(n1), .Q(n77) );
  OAI22X3 U21 ( .A1(shift), .A2(n34), .B1(n35), .B2(n2), .Q(n78) );
  OAI22X3 U22 ( .A1(shift), .A2(n35), .B1(n36), .B2(n1), .Q(n79) );
  OAI22X3 U23 ( .A1(shift), .A2(n36), .B1(n37), .B2(n2), .Q(n80) );
  OAI22X3 U24 ( .A1(shift), .A2(n37), .B1(n38), .B2(n1), .Q(n81) );
  OAI22X3 U25 ( .A1(shift), .A2(n38), .B1(n39), .B2(n2), .Q(n82) );
  OAI22X3 U26 ( .A1(shift), .A2(n39), .B1(n40), .B2(n1), .Q(n83) );
  OAI22X3 U27 ( .A1(shift), .A2(n40), .B1(n41), .B2(n2), .Q(n84) );
  OAI22X3 U28 ( .A1(shift), .A2(n41), .B1(n42), .B2(n1), .Q(n85) );
  OAI22X3 U29 ( .A1(shift), .A2(n42), .B1(n43), .B2(n2), .Q(n86) );
  OAI22X3 U30 ( .A1(shift), .A2(n43), .B1(n44), .B2(n1), .Q(n87) );
  OAI22X3 U31 ( .A1(shift), .A2(n44), .B1(n45), .B2(n2), .Q(n88) );
  OAI22X3 U32 ( .A1(shift), .A2(n3), .B1(n4), .B2(n1), .Q(n47) );
  OAI22X3 U33 ( .A1(shift), .A2(n4), .B1(n5), .B2(n1), .Q(n48) );
  OAI22X3 U34 ( .A1(shift), .A2(n5), .B1(n6), .B2(n1), .Q(n49) );
  OAI22X3 U35 ( .A1(shift), .A2(n6), .B1(n7), .B2(n1), .Q(n50) );
  OAI22X3 U36 ( .A1(shift), .A2(n7), .B1(n8), .B2(n1), .Q(n51) );
  OAI22X3 U37 ( .A1(shift), .A2(n8), .B1(n9), .B2(n1), .Q(n52) );
  OAI22X3 U38 ( .A1(shift), .A2(n9), .B1(n10), .B2(n1), .Q(n53) );
  OAI22X3 U39 ( .A1(shift), .A2(n10), .B1(n11), .B2(n1), .Q(n54) );
  OAI22X3 U40 ( .A1(shift), .A2(n11), .B1(n12), .B2(n1), .Q(n55) );
  OAI22X3 U41 ( .A1(shift), .A2(n12), .B1(n13), .B2(n1), .Q(n56) );
  OAI22X3 U42 ( .A1(shift), .A2(n13), .B1(n14), .B2(n1), .Q(n57) );
  OAI22X3 U43 ( .A1(shift), .A2(n14), .B1(n15), .B2(n1), .Q(n58) );
  OAI22X3 U44 ( .A1(shift), .A2(n15), .B1(n16), .B2(n1), .Q(n59) );
  OAI22X3 U45 ( .A1(shift), .A2(n16), .B1(n17), .B2(n1), .Q(n60) );
  OAI22X3 U46 ( .A1(shift), .A2(n45), .B1(n46), .B2(n1), .Q(n89) );
  OAI22X3 U47 ( .A1(n46), .A2(shift), .B1(n91), .B2(n2), .Q(n90) );
  INVXL U48 ( .A(data_in_serial), .Q(n91) );
endmodule


module Arbiter_checkers ( Req_N, Req_E, Req_W, Req_S, Req_L, DCTS, Grant_N,
        Grant_E, Grant_W, Grant_S, Grant_L, Xbar_sel, state, state_in,
        next_state_out, RTS_FF, RTS_FF_in, err_state_IDLE_xbar,
        err_state_not_IDLE_xbar, err_state_IDLE_RTS_FF_in,
        err_state_not_IDLE_RTS_FF_RTS_FF_in,
        err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,
        err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,
        err_RTS_FF_not_DCTS_state_state_in, err_not_RTS_FF_state_in_next_state,
        err_RTS_FF_DCTS_state_in_next_state, err_not_DCTS_Grants,
        err_DCTS_not_RTS_FF_Grants, err_DCTS_RTS_FF_IDLE_Grants,
        err_DCTS_RTS_FF_not_IDLE_Grants_onehot, err_Requests_next_state_IDLE,
        err_IDLE_Req_L, err_Local_Req_L, err_North_Req_N, err_IDLE_Req_N,
        err_Local_Req_N, err_South_Req_L, err_West_Req_L, err_South_Req_N,
        err_East_Req_L, err_West_Req_N, err_East_Req_N, err_next_state_onehot,
        err_state_in_onehot, err_state_north_xbar_sel, err_state_east_xbar_sel,
        err_state_west_xbar_sel, err_state_south_xbar_sel );
  input [4:0] Xbar_sel;
  input [5:0] state;
  input [5:0] state_in;
  input [5:0] next_state_out;
  input Req_N, Req_E, Req_W, Req_S, Req_L, DCTS, Grant_N, Grant_E, Grant_W,
         Grant_S, Grant_L, RTS_FF, RTS_FF_in;
  output err_state_IDLE_xbar, err_state_not_IDLE_xbar,
         err_state_IDLE_RTS_FF_in, err_state_not_IDLE_RTS_FF_RTS_FF_in,
         err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,
         err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,
         err_RTS_FF_not_DCTS_state_state_in,
         err_not_RTS_FF_state_in_next_state,
         err_RTS_FF_DCTS_state_in_next_state, err_not_DCTS_Grants,
         err_DCTS_not_RTS_FF_Grants, err_DCTS_RTS_FF_IDLE_Grants,
         err_DCTS_RTS_FF_not_IDLE_Grants_onehot, err_Requests_next_state_IDLE,
         err_IDLE_Req_L, err_Local_Req_L, err_North_Req_N, err_IDLE_Req_N,
         err_Local_Req_N, err_South_Req_L, err_West_Req_L, err_South_Req_N,
         err_East_Req_L, err_West_Req_N, err_East_Req_N, err_next_state_onehot,
         err_state_in_onehot, err_state_north_xbar_sel,
         err_state_east_xbar_sel, err_state_west_xbar_sel,
         err_state_south_xbar_sel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95;

  NOR4X1 U1 ( .A(n1), .B(n2), .C(n3), .D(n4), .Q(
        err_DCTS_RTS_FF_not_IDLE_Grants_onehot) );
  IMUX2XL U2 ( .A(n5), .B(n6), .S(Grant_E), .Q(n4) );
  NAND2XL U3 ( .A(n7), .B(n8), .Q(n6) );
  INVXL U4 ( .A(Grant_L), .Q(n8) );
  NAND2XL U5 ( .A(Grant_L), .B(n7), .Q(n5) );
  IMUX2XL U6 ( .A(n9), .B(n10), .S(Grant_N), .Q(n3) );
  OR3X1 U7 ( .A(Grant_S), .B(Grant_W), .C(n11), .Q(n10) );
  INVXL U8 ( .A(n12), .Q(n11) );
  NAND2XL U9 ( .A(n12), .B(n13), .Q(n9) );
  XOR2X1 U10 ( .A(Grant_W), .B(Grant_S), .Q(n13) );
  NOR3X1 U11 ( .A(n14), .B(n15), .C(n2), .Q(err_DCTS_RTS_FF_IDLE_Grants) );
  NOR2XL U12 ( .A(n15), .B(n16), .Q(err_DCTS_not_RTS_FF_Grants) );
  NOR2XL U13 ( .A(RTS_FF), .B(n15), .Q(err_not_DCTS_Grants) );
  AND2X1 U14 ( .A(n7), .B(n12), .Q(n15) );
  NOR2XL U15 ( .A(Grant_E), .B(Grant_L), .Q(n12) );
  NOR3X1 U16 ( .A(Grant_S), .B(Grant_W), .C(Grant_N), .Q(n7) );
  NOR2XL U17 ( .A(n17), .B(n2), .Q(err_RTS_FF_DCTS_state_in_next_state) );
  NOR2XL U18 ( .A(RTS_FF), .B(n17), .Q(err_not_RTS_FF_state_in_next_state) );
  INVXL U19 ( .A(n18), .Q(n17) );
  NAND4X1 U20 ( .A(n19), .B(n20), .C(n21), .D(n22), .Q(n18) );
  NOR3X1 U21 ( .A(n23), .B(n24), .C(n25), .Q(n22) );
  XNOR2X1 U22 ( .A(n26), .B(next_state_out[0]), .Q(n25) );
  XNOR2X1 U23 ( .A(state_in[2]), .B(n27), .Q(n24) );
  XNOR2X1 U24 ( .A(n28), .B(next_state_out[1]), .Q(n23) );
  XNOR2X1 U25 ( .A(next_state_out[4]), .B(state_in[4]), .Q(n21) );
  XNOR2X1 U26 ( .A(state_in[5]), .B(next_state_out[5]), .Q(n20) );
  XNOR2X1 U27 ( .A(next_state_out[3]), .B(state_in[3]), .Q(n19) );
  AOI31X2 U28 ( .A1(n29), .A2(n30), .A3(n31), .B1(n16), .Q(
        err_RTS_FF_not_DCTS_state_state_in) );
  NOR3X1 U29 ( .A(n32), .B(n33), .C(n34), .Q(n31) );
  XNOR2X1 U30 ( .A(n26), .B(state[0]), .Q(n34) );
  XNOR2X1 U31 ( .A(state_in[2]), .B(n35), .Q(n33) );
  XNOR2X1 U32 ( .A(n28), .B(state[1]), .Q(n32) );
  XNOR2X1 U33 ( .A(state[4]), .B(state_in[4]), .Q(n30) );
  NOR2XL U34 ( .A(n36), .B(n37), .Q(n29) );
  XNOR2X1 U35 ( .A(n38), .B(state[3]), .Q(n37) );
  XNOR2X1 U36 ( .A(state_in[5]), .B(n39), .Q(n36) );
  NOR3X1 U37 ( .A(n16), .B(RTS_FF_in), .C(n40), .Q(
        err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in) );
  NAND2XL U38 ( .A(RTS_FF), .B(n41), .Q(n16) );
  INVXL U39 ( .A(DCTS), .Q(n41) );
  NOR3X1 U40 ( .A(n42), .B(n40), .C(n2), .Q(
        err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in) );
  NAND2XL U41 ( .A(RTS_FF), .B(DCTS), .Q(n2) );
  NOR3X1 U42 ( .A(n40), .B(RTS_FF_in), .C(RTS_FF), .Q(
        err_state_not_IDLE_RTS_FF_RTS_FF_in) );
  NOR2XL U43 ( .A(n14), .B(n42), .Q(err_state_IDLE_RTS_FF_in) );
  INVXL U44 ( .A(RTS_FF_in), .Q(n42) );
  AOI311X1 U45 ( .A1(Xbar_sel[4]), .A2(n43), .A3(n44), .B1(n45), .C1(n46), .Q(
        err_state_not_IDLE_xbar) );
  OR2X1 U46 ( .A(n1), .B(n47), .Q(n46) );
  OR3X1 U47 ( .A(n48), .B(n49), .C(n50), .Q(n45) );
  NOR2XL U48 ( .A(Xbar_sel[3]), .B(Xbar_sel[2]), .Q(n44) );
  NOR2XL U49 ( .A(n47), .B(n51), .Q(err_state_south_xbar_sel) );
  NOR4X1 U50 ( .A(n52), .B(n53), .C(Xbar_sel[2]), .D(Xbar_sel[4]), .Q(n47) );
  INVXL U51 ( .A(Xbar_sel[3]), .Q(n52) );
  NOR2XL U52 ( .A(n50), .B(n54), .Q(err_state_west_xbar_sel) );
  NOR4X1 U53 ( .A(n55), .B(n53), .C(Xbar_sel[3]), .D(Xbar_sel[4]), .Q(n50) );
  INVXL U54 ( .A(n43), .Q(n53) );
  INVXL U55 ( .A(Xbar_sel[2]), .Q(n55) );
  NOR2XL U56 ( .A(n48), .B(n56), .Q(err_state_east_xbar_sel) );
  NOR3X1 U57 ( .A(n57), .B(Xbar_sel[0]), .C(n58), .Q(n48) );
  INVXL U58 ( .A(n59), .Q(n57) );
  NOR2XL U59 ( .A(n49), .B(n60), .Q(err_state_north_xbar_sel) );
  AND3X2 U60 ( .A(n59), .B(n58), .C(Xbar_sel[0]), .Q(n49) );
  INVXL U61 ( .A(Xbar_sel[1]), .Q(n58) );
  OAI211X1 U62 ( .A1(n38), .A2(n61), .B1(n62), .C1(n63), .Q(
        err_state_in_onehot) );
  OA221X1 U63 ( .A1(n28), .A2(n26), .B1(n64), .B2(n65), .C1(n66), .Q(n63) );
  OAI21X1 U64 ( .A1(state_in[1]), .A2(state_in[0]), .B1(state_in[2]), .Q(n66)
         );
  INVXL U65 ( .A(state_in[0]), .Q(n26) );
  INVXL U66 ( .A(state_in[1]), .Q(n28) );
  XOR2X1 U67 ( .A(n67), .B(state_in[5]), .Q(n62) );
  NAND2XL U68 ( .A(n65), .B(n64), .Q(n67) );
  NOR2XL U69 ( .A(state_in[4]), .B(state_in[3]), .Q(n64) );
  NOR3X1 U70 ( .A(state_in[1]), .B(state_in[2]), .C(state_in[0]), .Q(n65) );
  INVXL U71 ( .A(state_in[4]), .Q(n61) );
  INVXL U72 ( .A(state_in[3]), .Q(n38) );
  AOI311X1 U73 ( .A1(n68), .A2(n69), .A3(n70), .B1(n71), .C1(n72), .Q(
        err_next_state_onehot) );
  INVXL U74 ( .A(n73), .Q(n72) );
  NAND2XL U75 ( .A(n74), .B(n75), .Q(n71) );
  NOR2XL U76 ( .A(next_state_out[2]), .B(next_state_out[1]), .Q(n70) );
  IMUX2XL U77 ( .A(n76), .B(n77), .S(next_state_out[5]), .Q(n68) );
  OR2X1 U78 ( .A(next_state_out[3]), .B(next_state_out[4]), .Q(n77) );
  XNOR2X1 U79 ( .A(next_state_out[3]), .B(next_state_out[4]), .Q(n76) );
  NOR3X1 U80 ( .A(n78), .B(n56), .C(n79), .Q(err_East_Req_N) );
  NOR3X1 U81 ( .A(n79), .B(n54), .C(n80), .Q(err_West_Req_N) );
  NOR3X1 U82 ( .A(n81), .B(n56), .C(n78), .Q(err_East_Req_L) );
  NOR3X1 U83 ( .A(n79), .B(Req_S), .C(n51), .Q(err_South_Req_N) );
  NOR3X1 U84 ( .A(n81), .B(n54), .C(n80), .Q(err_West_Req_L) );
  NOR3X1 U85 ( .A(n81), .B(Req_S), .C(n51), .Q(err_South_Req_L) );
  NOR3X1 U86 ( .A(n79), .B(n1), .C(n82), .Q(err_Local_Req_N) );
  NOR2XL U87 ( .A(n14), .B(n79), .Q(err_IDLE_Req_N) );
  NAND3X1 U88 ( .A(n74), .B(n83), .C(Req_N), .Q(n79) );
  AND3X2 U89 ( .A(Req_N), .B(n74), .C(n84), .Q(err_North_Req_N) );
  NAND3X1 U90 ( .A(next_state_out[2]), .B(n69), .C(n85), .Q(n74) );
  NOR3X1 U91 ( .A(n81), .B(n1), .C(n82), .Q(err_Local_Req_L) );
  NOR2XL U92 ( .A(n14), .B(n81), .Q(err_IDLE_Req_L) );
  NAND2XL U93 ( .A(Req_L), .B(n73), .Q(n81) );
  NAND4X1 U94 ( .A(n69), .B(n27), .C(next_state_out[1]), .D(n86), .Q(n73) );
  NOR3X1 U95 ( .A(next_state_out[3]), .B(next_state_out[5]), .C(
        next_state_out[4]), .Q(n86) );
  INVXL U96 ( .A(next_state_out[0]), .Q(n69) );
  AOI21X1 U97 ( .A1(n43), .A2(n59), .B1(n14), .Q(err_state_IDLE_xbar) );
  NOR3X1 U98 ( .A(Xbar_sel[3]), .B(Xbar_sel[4]), .C(Xbar_sel[2]), .Q(n59) );
  NOR2XL U99 ( .A(Xbar_sel[0]), .B(Xbar_sel[1]), .Q(n43) );
  AOI211X1 U100 ( .A1(n40), .A2(n14), .B1(n87), .C1(n78), .Q(
        err_Requests_next_state_IDLE) );
  OR2X1 U101 ( .A(Req_E), .B(n80), .Q(n78) );
  OR2X1 U102 ( .A(Req_W), .B(Req_S), .Q(n80) );
  NAND3X1 U103 ( .A(n83), .B(n88), .C(n75), .Q(n87) );
  NAND3X1 U104 ( .A(next_state_out[0]), .B(n27), .C(n85), .Q(n75) );
  NOR4X1 U105 ( .A(next_state_out[1]), .B(next_state_out[3]), .C(
        next_state_out[4]), .D(next_state_out[5]), .Q(n85) );
  INVXL U106 ( .A(next_state_out[2]), .Q(n27) );
  INVXL U107 ( .A(Req_N), .Q(n88) );
  INVXL U108 ( .A(Req_L), .Q(n83) );
  INVXL U109 ( .A(n1), .Q(n14) );
  NOR4X1 U110 ( .A(n89), .B(n90), .C(state[1]), .D(state[2]), .Q(n1) );
  INVXL U111 ( .A(state[0]), .Q(n89) );
  AOI31X2 U112 ( .A1(n91), .A2(n92), .A3(state[1]), .B1(n82), .Q(n40) );
  NAND4X1 U113 ( .A(n56), .B(n60), .C(n54), .D(n51), .Q(n82) );
  NAND4X1 U114 ( .A(n93), .B(state[5]), .C(n94), .D(n95), .Q(n51) );
  NAND4X1 U115 ( .A(n93), .B(state[4]), .C(n94), .D(n39), .Q(n54) );
  INVXL U116 ( .A(state[3]), .Q(n94) );
  INVXL U117 ( .A(n84), .Q(n60) );
  NOR4X1 U118 ( .A(n35), .B(n90), .C(state[0]), .D(state[1]), .Q(n84) );
  INVXL U119 ( .A(n92), .Q(n90) );
  INVXL U120 ( .A(state[2]), .Q(n35) );
  NAND4X1 U121 ( .A(n93), .B(state[3]), .C(n95), .D(n39), .Q(n56) );
  INVXL U122 ( .A(state[5]), .Q(n39) );
  INVXL U123 ( .A(state[4]), .Q(n95) );
  NOR3X1 U124 ( .A(state[1]), .B(state[2]), .C(state[0]), .Q(n93) );
  NOR3X1 U125 ( .A(state[4]), .B(state[5]), .C(state[3]), .Q(n92) );
  NOR2XL U126 ( .A(state[0]), .B(state[2]), .Q(n91) );
endmodule


module Arbiter ( reset, clk, Req_N, Req_E, Req_W, Req_S, Req_L, DCTS, Grant_N,
        Grant_E, Grant_W, Grant_S, Grant_L, Xbar_sel, RTS, shift, fault_clk,
        data_in_serial, data_out_serial, err_state_IDLE_xbar,
        err_state_not_IDLE_xbar, err_state_IDLE_RTS_FF_in,
        err_state_not_IDLE_RTS_FF_RTS_FF_in,
        err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,
        err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,
        err_RTS_FF_not_DCTS_state_state_in, err_not_RTS_FF_state_in_next_state,
        err_RTS_FF_DCTS_state_in_next_state, err_not_DCTS_Grants,
        err_DCTS_not_RTS_FF_Grants, err_DCTS_RTS_FF_IDLE_Grants,
        err_DCTS_RTS_FF_not_IDLE_Grants_onehot, err_Requests_next_state_IDLE,
        err_IDLE_Req_L, err_Local_Req_L, err_North_Req_N, err_IDLE_Req_N,
        err_Local_Req_N, err_South_Req_L, err_West_Req_L, err_South_Req_N,
        err_East_Req_L, err_West_Req_N, err_East_Req_N, err_next_state_onehot,
        err_state_in_onehot, err_state_north_xbar_sel, err_state_east_xbar_sel,
        err_state_west_xbar_sel, err_state_south_xbar_sel );
  output [4:0] Xbar_sel;
  input reset, clk, Req_N, Req_E, Req_W, Req_S, Req_L, DCTS, shift, fault_clk,
         data_in_serial;
  output Grant_N, Grant_E, Grant_W, Grant_S, Grant_L, RTS, data_out_serial,
         err_state_IDLE_xbar, err_state_not_IDLE_xbar,
         err_state_IDLE_RTS_FF_in, err_state_not_IDLE_RTS_FF_RTS_FF_in,
         err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,
         err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,
         err_RTS_FF_not_DCTS_state_state_in,
         err_not_RTS_FF_state_in_next_state,
         err_RTS_FF_DCTS_state_in_next_state, err_not_DCTS_Grants,
         err_DCTS_not_RTS_FF_Grants, err_DCTS_RTS_FF_IDLE_Grants,
         err_DCTS_RTS_FF_not_IDLE_Grants_onehot, err_Requests_next_state_IDLE,
         err_IDLE_Req_L, err_Local_Req_L, err_North_Req_N, err_IDLE_Req_N,
         err_Local_Req_N, err_South_Req_L, err_West_Req_L, err_South_Req_N,
         err_East_Req_L, err_West_Req_N, err_East_Req_N, err_next_state_onehot,
         err_state_in_onehot, err_state_north_xbar_sel,
         err_state_east_xbar_sel, err_state_west_xbar_sel,
         err_state_south_xbar_sel;
  wire   non_faulty_signals_10, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n1, n2, n3, n4, n5, n6, n9, n11, n12, n13, n15, n16, n17, n18, n19,
         n20, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16,
         SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18,
         SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20,
         SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_22,
         SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_24,
         SYNOPSYS_UNCONNECTED_25, SYNOPSYS_UNCONNECTED_26,
         SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_28,
         SYNOPSYS_UNCONNECTED_29, SYNOPSYS_UNCONNECTED_30,
         SYNOPSYS_UNCONNECTED_31, SYNOPSYS_UNCONNECTED_32,
         SYNOPSYS_UNCONNECTED_33, SYNOPSYS_UNCONNECTED_34,
         SYNOPSYS_UNCONNECTED_35, SYNOPSYS_UNCONNECTED_36,
         SYNOPSYS_UNCONNECTED_37, SYNOPSYS_UNCONNECTED_38,
         SYNOPSYS_UNCONNECTED_39, SYNOPSYS_UNCONNECTED_40,
         SYNOPSYS_UNCONNECTED_41, SYNOPSYS_UNCONNECTED_42,
         SYNOPSYS_UNCONNECTED_43, SYNOPSYS_UNCONNECTED_44,
         SYNOPSYS_UNCONNECTED_45, SYNOPSYS_UNCONNECTED_46;
  wire   [29:12] non_faulty_signals;
  wire   [7:0] FI_add_sta;
  wire   [35:10] faulty_signals;

  fault_injector_DATA_WIDTH36_ADDRESS_WIDTH6 FI ( .data_in({Req_N, Req_E,
        Req_W, Req_S, Req_L, DCTS, non_faulty_signals, RTS,
        non_faulty_signals_10, Grant_N, Grant_E, Grant_W, Grant_S, Grant_L,
        Xbar_sel}), .address(FI_add_sta[7:2]), .sta_0(FI_add_sta[1]), .sta_1(
        FI_add_sta[0]), .data_out({faulty_signals, SYNOPSYS_UNCONNECTED_1,
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
        SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
        SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
        SYNOPSYS_UNCONNECTED_10}) );
  shift_register_serial_in_REG_WIDTH44 SR ( .clk(fault_clk), .reset(reset),
        .shift(shift), .data_in_serial(data_in_serial), .data_out_parallel({
        SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
        SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
        SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16,
        SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18,
        SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20,
        SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_22,
        SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_24,
        SYNOPSYS_UNCONNECTED_25, SYNOPSYS_UNCONNECTED_26,
        SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_28,
        SYNOPSYS_UNCONNECTED_29, SYNOPSYS_UNCONNECTED_30,
        SYNOPSYS_UNCONNECTED_31, SYNOPSYS_UNCONNECTED_32,
        SYNOPSYS_UNCONNECTED_33, SYNOPSYS_UNCONNECTED_34,
        SYNOPSYS_UNCONNECTED_35, SYNOPSYS_UNCONNECTED_36,
        SYNOPSYS_UNCONNECTED_37, SYNOPSYS_UNCONNECTED_38,
        SYNOPSYS_UNCONNECTED_39, SYNOPSYS_UNCONNECTED_40,
        SYNOPSYS_UNCONNECTED_41, SYNOPSYS_UNCONNECTED_42,
        SYNOPSYS_UNCONNECTED_43, SYNOPSYS_UNCONNECTED_44,
        SYNOPSYS_UNCONNECTED_45, SYNOPSYS_UNCONNECTED_46, FI_add_sta}),
        .data_out_serial(data_out_serial) );
  Arbiter_checkers ARBITERCHECKERS ( .Req_N(Req_N), .Req_E(Req_E), .Req_W(
        Req_W), .Req_S(Req_S), .Req_L(Req_L), .DCTS(DCTS), .Grant_N(Grant_N),
        .Grant_E(Grant_E), .Grant_W(Grant_W), .Grant_S(Grant_S), .Grant_L(
        Grant_L), .Xbar_sel(Xbar_sel), .state(non_faulty_signals[29:24]),
        .state_in(non_faulty_signals[23:18]), .next_state_out(
        non_faulty_signals[17:12]), .RTS_FF(RTS), .RTS_FF_in(
        non_faulty_signals_10), .err_state_IDLE_xbar(err_state_IDLE_xbar),
        .err_state_not_IDLE_xbar(err_state_not_IDLE_xbar),
        .err_state_IDLE_RTS_FF_in(err_state_IDLE_RTS_FF_in),
        .err_state_not_IDLE_RTS_FF_RTS_FF_in(
        err_state_not_IDLE_RTS_FF_RTS_FF_in),
        .err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in(
        err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in),
        .err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in(
        err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in),
        .err_RTS_FF_not_DCTS_state_state_in(err_RTS_FF_not_DCTS_state_state_in), .err_not_RTS_FF_state_in_next_state(err_not_RTS_FF_state_in_next_state),
        .err_RTS_FF_DCTS_state_in_next_state(
        err_RTS_FF_DCTS_state_in_next_state), .err_not_DCTS_Grants(
        err_not_DCTS_Grants), .err_DCTS_not_RTS_FF_Grants(
        err_DCTS_not_RTS_FF_Grants), .err_DCTS_RTS_FF_IDLE_Grants(
        err_DCTS_RTS_FF_IDLE_Grants), .err_DCTS_RTS_FF_not_IDLE_Grants_onehot(
        err_DCTS_RTS_FF_not_IDLE_Grants_onehot),
        .err_Requests_next_state_IDLE(err_Requests_next_state_IDLE),
        .err_IDLE_Req_L(err_IDLE_Req_L), .err_Local_Req_L(err_Local_Req_L),
        .err_North_Req_N(err_North_Req_N), .err_IDLE_Req_N(err_IDLE_Req_N),
        .err_Local_Req_N(err_Local_Req_N), .err_South_Req_L(err_South_Req_L),
        .err_West_Req_L(err_West_Req_L), .err_South_Req_N(err_South_Req_N),
        .err_East_Req_L(err_East_Req_L), .err_West_Req_N(err_West_Req_N),
        .err_East_Req_N(err_East_Req_N), .err_next_state_onehot(
        err_next_state_onehot), .err_state_in_onehot(err_state_in_onehot),
        .err_state_north_xbar_sel(err_state_north_xbar_sel),
        .err_state_east_xbar_sel(err_state_east_xbar_sel),
        .err_state_west_xbar_sel(err_state_west_xbar_sel),
        .err_state_south_xbar_sel(err_state_south_xbar_sel) );
  DFCX1 state_reg_5_ ( .D(faulty_signals[23]), .CP(clk), .RN(reset), .Q(
        non_faulty_signals[29]) );
  DFCX1 state_reg_4_ ( .D(faulty_signals[22]), .CP(clk), .RN(reset), .Q(
        non_faulty_signals[28]) );
  DFCX1 RTS_FF_reg ( .D(faulty_signals[10]), .CP(clk), .RN(reset), .Q(RTS) );
  DFCX1 state_reg_2_ ( .D(faulty_signals[20]), .CP(clk), .RN(reset), .Q(
        non_faulty_signals[26]) );
  DFCX1 state_reg_3_ ( .D(faulty_signals[21]), .CP(clk), .RN(reset), .Q(
        non_faulty_signals[27]) );
  DFPX3 state_reg_0_ ( .D(faulty_signals[18]), .CP(clk), .SN(reset), .Q(
        non_faulty_signals[24]) );
  DFCX1 state_reg_1_ ( .D(faulty_signals[19]), .CP(clk), .RN(reset), .Q(
        non_faulty_signals[25]) );
  INVXL U3 ( .A(n40), .Q(Xbar_sel[3]) );
  NAND2XL U4 ( .A(faulty_signals[11]), .B(n19), .Q(n23) );
  NAND2XL U5 ( .A(faulty_signals[30]), .B(faulty_signals[11]), .Q(n21) );
  NOR2XL U6 ( .A(faulty_signals[33]), .B(faulty_signals[34]), .Q(n25) );
  INVXL U7 ( .A(n39), .Q(Xbar_sel[4]) );
  AOI21X3 U8 ( .A1(n3), .A2(n24), .B1(n1), .Q(non_faulty_signals[17]) );
  INVXL U9 ( .A(n27), .Q(n3) );
  NAND2XL U10 ( .A(n25), .B(n26), .Q(n24) );
  NAND4X3 U11 ( .A(n32), .B(n22), .C(n34), .D(n41), .Q(n39) );
  NOR2XL U12 ( .A(Xbar_sel[2]), .B(Xbar_sel[3]), .Q(n41) );
  NOR2XL U13 ( .A(n37), .B(n20), .Q(non_faulty_signals[13]) );
  AOI31X2 U14 ( .A1(n1), .A2(n5), .A3(n25), .B1(n36), .Q(n37) );
  AOI21X3 U15 ( .A1(n34), .A2(n35), .B1(n5), .Q(non_faulty_signals[14]) );
  NAND2XL U16 ( .A(n36), .B(n20), .Q(n35) );
  NAND2XL U17 ( .A(n39), .B(n22), .Q(n33) );
  INVXL U18 ( .A(Xbar_sel[2]), .Q(n12) );
  AOI21X3 U19 ( .A1(n6), .A2(n30), .B1(n4), .Q(non_faulty_signals[15]) );
  NAND2XL U20 ( .A(n29), .B(n27), .Q(n30) );
  INVXL U21 ( .A(n26), .Q(n6) );
  AND2X3 U22 ( .A(n21), .B(n22), .Q(non_faulty_signals_10) );
  INVXL U23 ( .A(n34), .Q(Xbar_sel[0]) );
  INVXL U24 ( .A(n32), .Q(Xbar_sel[1]) );
  INVXL U25 ( .A(n23), .Q(n18) );
  NOR2XL U26 ( .A(n12), .B(n21), .Q(Grant_W) );
  NOR2XL U27 ( .A(n21), .B(n40), .Q(Grant_S) );
  NOR2XL U28 ( .A(n21), .B(n39), .Q(Grant_L) );
  NOR2XL U29 ( .A(n32), .B(n21), .Q(Grant_E) );
  NOR2XL U30 ( .A(n21), .B(n34), .Q(Grant_N) );
  AND2X3 U31 ( .A(n25), .B(n29), .Q(non_faulty_signals[12]) );
  NOR4X3 U32 ( .A(faulty_signals[24]), .B(faulty_signals[25]), .C(
        faulty_signals[26]), .D(faulty_signals[27]), .Q(n42) );
  NOR3X3 U33 ( .A(n17), .B(faulty_signals[29]), .C(n13), .Q(Xbar_sel[2]) );
  INVXL U34 ( .A(n42), .Q(n13) );
  OAI21X3 U35 ( .A1(faulty_signals[33]), .A2(n12), .B1(n40), .Q(n27) );
  OAI21X3 U36 ( .A1(faulty_signals[35]), .A2(n31), .B1(n32), .Q(n26) );
  AOI21X3 U37 ( .A1(n33), .A2(n20), .B1(Xbar_sel[0]), .Q(n31) );
  AOI21X3 U38 ( .A1(n12), .A2(n28), .B1(n2), .Q(non_faulty_signals[16]) );
  INVXL U39 ( .A(faulty_signals[33]), .Q(n2) );
  OAI21X3 U40 ( .A1(n29), .A2(n26), .B1(n4), .Q(n28) );
  OAI21X3 U41 ( .A1(faulty_signals[32]), .A2(n38), .B1(n9), .Q(n36) );
  INVXL U42 ( .A(n33), .Q(n9) );
  AOI21X3 U43 ( .A1(Xbar_sel[1]), .A2(n25), .B1(n27), .Q(n38) );
  NAND3X3 U44 ( .A(faulty_signals[29]), .B(n17), .C(n42), .Q(n40) );
  AO22X3 U45 ( .A1(faulty_signals[29]), .A2(n18), .B1(faulty_signals[17]),
        .B2(n23), .Q(non_faulty_signals[23]) );
  AO22X3 U46 ( .A1(faulty_signals[25]), .A2(n18), .B1(faulty_signals[13]),
        .B2(n23), .Q(non_faulty_signals[19]) );
  AO22X3 U47 ( .A1(faulty_signals[28]), .A2(n18), .B1(faulty_signals[16]),
        .B2(n23), .Q(non_faulty_signals[22]) );
  AO22X3 U48 ( .A1(faulty_signals[26]), .A2(n18), .B1(faulty_signals[14]),
        .B2(n23), .Q(non_faulty_signals[20]) );
  AO22X3 U49 ( .A1(faulty_signals[27]), .A2(n18), .B1(faulty_signals[15]),
        .B2(n23), .Q(non_faulty_signals[21]) );
  NOR3X3 U50 ( .A(faulty_signals[28]), .B(faulty_signals[29]), .C(
        faulty_signals[25]), .Q(n43) );
  NAND4X3 U51 ( .A(faulty_signals[26]), .B(n43), .C(n11), .D(n16), .Q(n34) );
  NAND4X3 U52 ( .A(faulty_signals[27]), .B(n43), .C(n11), .D(n15), .Q(n32) );
  NAND4X3 U53 ( .A(faulty_signals[24]), .B(n43), .C(n15), .D(n16), .Q(n22) );
  INVXL U54 ( .A(faulty_signals[30]), .Q(n19) );
  AO22X3 U55 ( .A1(n18), .A2(faulty_signals[24]), .B1(faulty_signals[12]),
        .B2(n23), .Q(non_faulty_signals[18]) );
  INVXL U56 ( .A(faulty_signals[27]), .Q(n16) );
  INVXL U57 ( .A(faulty_signals[26]), .Q(n15) );
  INVXL U58 ( .A(faulty_signals[24]), .Q(n11) );
  INVXL U59 ( .A(faulty_signals[28]), .Q(n17) );
  NOR3X3 U60 ( .A(faulty_signals[32]), .B(faulty_signals[35]), .C(
        faulty_signals[31]), .Q(n29) );
  INVXL U61 ( .A(faulty_signals[31]), .Q(n20) );
  INVXL U62 ( .A(faulty_signals[35]), .Q(n5) );
  INVXL U63 ( .A(faulty_signals[32]), .Q(n1) );
  INVXL U64 ( .A(faulty_signals[34]), .Q(n4) );
endmodule


module shift_register_REG_WIDTH59 ( clk, reset, shift, data_in,
        data_out_parallel, data_out_serial );
  input [58:0] data_in;
  output [58:0] data_out_parallel;
  input clk, reset, shift;
  output data_out_serial;
  wire   N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75,
         N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88, N89,
         N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102,
         N103, N104, N105, N106, N107, N108, N109, N110, N111, N112, N113,
         N114, N115, N116, N117, N118, N119, N120, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n59, n118, n119;
  assign data_out_serial = data_out_parallel[57];

  DFCX1 shift_register_mem_out_reg_0_ ( .D(N62), .CP(clk), .RN(reset), .Q(
        data_out_parallel[0]), .QN(n58) );
  DFCX1 shift_register_mem_out_reg_5_ ( .D(N67), .CP(clk), .RN(reset), .Q(
        data_out_parallel[5]), .QN(n53) );
  DFCX1 shift_register_mem_out_reg_9_ ( .D(N71), .CP(clk), .RN(reset), .Q(
        data_out_parallel[9]), .QN(n49) );
  DFCX1 shift_register_mem_out_reg_15_ ( .D(N77), .CP(clk), .RN(reset), .Q(
        data_out_parallel[15]), .QN(n43) );
  DFCX1 shift_register_mem_out_reg_21_ ( .D(N83), .CP(clk), .RN(reset), .Q(
        data_out_parallel[21]), .QN(n37) );
  DFCX1 shift_register_mem_out_reg_28_ ( .D(N90), .CP(clk), .RN(reset), .Q(
        data_out_parallel[28]), .QN(n30) );
  DFCX1 shift_register_mem_out_reg_31_ ( .D(N93), .CP(clk), .RN(reset), .Q(
        data_out_parallel[31]), .QN(n27) );
  DFCX1 shift_register_mem_out_reg_35_ ( .D(N97), .CP(clk), .RN(reset), .Q(
        data_out_parallel[35]), .QN(n23) );
  DFCX1 shift_register_mem_out_reg_41_ ( .D(N103), .CP(clk), .RN(reset), .Q(
        data_out_parallel[41]), .QN(n17) );
  DFCX1 shift_register_mem_out_reg_45_ ( .D(N107), .CP(clk), .RN(reset), .Q(
        data_out_parallel[45]), .QN(n13) );
  DFCX1 shift_register_mem_out_reg_49_ ( .D(N111), .CP(clk), .RN(reset), .Q(
        data_out_parallel[49]), .QN(n9) );
  DFCX1 shift_register_mem_out_reg_55_ ( .D(N117), .CP(clk), .RN(reset), .Q(
        data_out_parallel[55]), .QN(n3) );
  DFCX1 shift_register_mem_out_reg_8_ ( .D(N70), .CP(clk), .RN(reset), .Q(
        data_out_parallel[8]), .QN(n50) );
  DFCX1 shift_register_mem_out_reg_14_ ( .D(N76), .CP(clk), .RN(reset), .Q(
        data_out_parallel[14]), .QN(n44) );
  DFCX1 shift_register_mem_out_reg_20_ ( .D(N82), .CP(clk), .RN(reset), .Q(
        data_out_parallel[20]), .QN(n38) );
  DFCX1 shift_register_mem_out_reg_27_ ( .D(N89), .CP(clk), .RN(reset), .Q(
        data_out_parallel[27]), .QN(n31) );
  DFCX1 shift_register_mem_out_reg_30_ ( .D(N92), .CP(clk), .RN(reset), .Q(
        data_out_parallel[30]), .QN(n28) );
  DFCX1 shift_register_mem_out_reg_34_ ( .D(N96), .CP(clk), .RN(reset), .Q(
        data_out_parallel[34]), .QN(n24) );
  DFCX1 shift_register_mem_out_reg_40_ ( .D(N102), .CP(clk), .RN(reset), .Q(
        data_out_parallel[40]), .QN(n18) );
  DFCX1 shift_register_mem_out_reg_44_ ( .D(N106), .CP(clk), .RN(reset), .Q(
        data_out_parallel[44]), .QN(n14) );
  DFCX1 shift_register_mem_out_reg_48_ ( .D(N110), .CP(clk), .RN(reset), .Q(
        data_out_parallel[48]), .QN(n10) );
  DFCX1 shift_register_mem_out_reg_54_ ( .D(N116), .CP(clk), .RN(reset), .Q(
        data_out_parallel[54]), .QN(n4) );
  DFCX1 shift_register_mem_out_reg_58_ ( .D(N120), .CP(clk), .RN(reset), .Q(
        data_out_parallel[58]) );
  DFCX1 shift_register_mem_out_reg_1_ ( .D(N63), .CP(clk), .RN(reset), .Q(
        data_out_parallel[1]), .QN(n57) );
  DFCX1 shift_register_mem_out_reg_2_ ( .D(N64), .CP(clk), .RN(reset), .Q(
        data_out_parallel[2]), .QN(n56) );
  DFCX1 shift_register_mem_out_reg_3_ ( .D(N65), .CP(clk), .RN(reset), .Q(
        data_out_parallel[3]), .QN(n55) );
  DFCX1 shift_register_mem_out_reg_7_ ( .D(N69), .CP(clk), .RN(reset), .Q(
        data_out_parallel[7]), .QN(n51) );
  DFCX1 shift_register_mem_out_reg_13_ ( .D(N75), .CP(clk), .RN(reset), .Q(
        data_out_parallel[13]), .QN(n45) );
  DFCX1 shift_register_mem_out_reg_26_ ( .D(N88), .CP(clk), .RN(reset), .Q(
        data_out_parallel[26]), .QN(n32) );
  DFCX1 shift_register_mem_out_reg_33_ ( .D(N95), .CP(clk), .RN(reset), .Q(
        data_out_parallel[33]), .QN(n25) );
  DFCX1 shift_register_mem_out_reg_43_ ( .D(N105), .CP(clk), .RN(reset), .Q(
        data_out_parallel[43]), .QN(n15) );
  DFCX1 shift_register_mem_out_reg_47_ ( .D(N109), .CP(clk), .RN(reset), .Q(
        data_out_parallel[47]), .QN(n11) );
  DFCX1 shift_register_mem_out_reg_53_ ( .D(N115), .CP(clk), .RN(reset), .Q(
        data_out_parallel[53]), .QN(n5) );
  DFCX1 shift_register_mem_out_reg_6_ ( .D(N68), .CP(clk), .RN(reset), .Q(
        data_out_parallel[6]), .QN(n52) );
  DFCX1 shift_register_mem_out_reg_12_ ( .D(N74), .CP(clk), .RN(reset), .Q(
        data_out_parallel[12]), .QN(n46) );
  DFCX1 shift_register_mem_out_reg_19_ ( .D(N81), .CP(clk), .RN(reset), .Q(
        data_out_parallel[19]), .QN(n39) );
  DFCX1 shift_register_mem_out_reg_25_ ( .D(N87), .CP(clk), .RN(reset), .Q(
        data_out_parallel[25]), .QN(n33) );
  DFCX1 shift_register_mem_out_reg_29_ ( .D(N91), .CP(clk), .RN(reset), .Q(
        data_out_parallel[29]), .QN(n29) );
  DFCX1 shift_register_mem_out_reg_32_ ( .D(N94), .CP(clk), .RN(reset), .Q(
        data_out_parallel[32]), .QN(n26) );
  DFCX1 shift_register_mem_out_reg_39_ ( .D(N101), .CP(clk), .RN(reset), .Q(
        data_out_parallel[39]), .QN(n19) );
  DFCX1 shift_register_mem_out_reg_42_ ( .D(N104), .CP(clk), .RN(reset), .Q(
        data_out_parallel[42]), .QN(n16) );
  DFCX1 shift_register_mem_out_reg_46_ ( .D(N108), .CP(clk), .RN(reset), .Q(
        data_out_parallel[46]), .QN(n12) );
  DFCX1 shift_register_mem_out_reg_52_ ( .D(N114), .CP(clk), .RN(reset), .Q(
        data_out_parallel[52]), .QN(n6) );
  DFCX1 shift_register_mem_out_reg_56_ ( .D(N118), .CP(clk), .RN(reset), .Q(
        data_out_parallel[56]), .QN(n2) );
  DFCX1 shift_register_mem_out_reg_4_ ( .D(N66), .CP(clk), .RN(reset), .Q(
        data_out_parallel[4]), .QN(n54) );
  DFCX1 shift_register_mem_out_reg_16_ ( .D(N78), .CP(clk), .RN(reset), .Q(
        data_out_parallel[16]), .QN(n42) );
  DFCX1 shift_register_mem_out_reg_22_ ( .D(N84), .CP(clk), .RN(reset), .Q(
        data_out_parallel[22]), .QN(n36) );
  DFCX1 shift_register_mem_out_reg_36_ ( .D(N98), .CP(clk), .RN(reset), .Q(
        data_out_parallel[36]), .QN(n22) );
  DFCX1 shift_register_mem_out_reg_11_ ( .D(N73), .CP(clk), .RN(reset), .Q(
        data_out_parallel[11]), .QN(n47) );
  DFCX1 shift_register_mem_out_reg_18_ ( .D(N80), .CP(clk), .RN(reset), .Q(
        data_out_parallel[18]), .QN(n40) );
  DFCX1 shift_register_mem_out_reg_24_ ( .D(N86), .CP(clk), .RN(reset), .Q(
        data_out_parallel[24]), .QN(n34) );
  DFCX1 shift_register_mem_out_reg_38_ ( .D(N100), .CP(clk), .RN(reset), .Q(
        data_out_parallel[38]), .QN(n20) );
  DFCX1 shift_register_mem_out_reg_51_ ( .D(N113), .CP(clk), .RN(reset), .Q(
        data_out_parallel[51]), .QN(n7) );
  DFCX1 shift_register_mem_out_reg_57_ ( .D(N119), .CP(clk), .RN(reset), .Q(
        data_out_parallel[57]), .QN(n1) );
  DFCX1 shift_register_mem_out_reg_10_ ( .D(N72), .CP(clk), .RN(reset), .Q(
        data_out_parallel[10]), .QN(n48) );
  DFCX1 shift_register_mem_out_reg_17_ ( .D(N79), .CP(clk), .RN(reset), .Q(
        data_out_parallel[17]), .QN(n41) );
  DFCX1 shift_register_mem_out_reg_23_ ( .D(N85), .CP(clk), .RN(reset), .Q(
        data_out_parallel[23]), .QN(n35) );
  DFCX1 shift_register_mem_out_reg_37_ ( .D(N99), .CP(clk), .RN(reset), .Q(
        data_out_parallel[37]), .QN(n21) );
  DFCX1 shift_register_mem_out_reg_50_ ( .D(N112), .CP(clk), .RN(reset), .Q(
        data_out_parallel[50]), .QN(n8) );
  INVXL U3 ( .A(shift), .Q(n119) );
  CLKBUFX2 U4 ( .A(n119), .Q(n59) );
  CLKBUFX2 U5 ( .A(n119), .Q(n118) );
  OAI22X3 U6 ( .A1(n119), .A2(n30), .B1(shift), .B2(n68), .Q(N91) );
  NOR2XL U7 ( .A(data_in[29]), .B(data_out_parallel[29]), .Q(n68) );
  OAI22X3 U8 ( .A1(n59), .A2(n35), .B1(shift), .B2(n73), .Q(N86) );
  NOR2XL U9 ( .A(data_in[24]), .B(data_out_parallel[24]), .Q(n73) );
  OAI22X3 U10 ( .A1(n59), .A2(n48), .B1(shift), .B2(n86), .Q(N73) );
  NOR2XL U11 ( .A(data_in[11]), .B(data_out_parallel[11]), .Q(n86) );
  OAI22X3 U12 ( .A1(n119), .A2(n42), .B1(shift), .B2(n80), .Q(N79) );
  NOR2XL U13 ( .A(data_in[17]), .B(data_out_parallel[17]), .Q(n80) );
  OAI22X3 U14 ( .A1(n22), .A2(n59), .B1(shift), .B2(n60), .Q(N99) );
  NOR2XL U15 ( .A(data_in[37]), .B(data_out_parallel[37]), .Q(n60) );
  OAI22X3 U16 ( .A1(n119), .A2(n36), .B1(shift), .B2(n74), .Q(N85) );
  NOR2XL U17 ( .A(data_in[23]), .B(data_out_parallel[23]), .Q(n74) );
  OAI22X3 U18 ( .A1(n59), .A2(n43), .B1(shift), .B2(n81), .Q(N78) );
  NOR2XL U19 ( .A(data_in[16]), .B(data_out_parallel[16]), .Q(n81) );
  OAI22X3 U20 ( .A1(n59), .A2(n20), .B1(shift), .B2(n116), .Q(N101) );
  NOR2XL U21 ( .A(data_in[39]), .B(data_out_parallel[39]), .Q(n116) );
  OAI22X3 U22 ( .A1(n118), .A2(n47), .B1(shift), .B2(n85), .Q(N74) );
  NOR2XL U23 ( .A(data_in[12]), .B(data_out_parallel[12]), .Q(n85) );
  OAI22X3 U24 ( .A1(n119), .A2(n41), .B1(shift), .B2(n79), .Q(N80) );
  NOR2XL U25 ( .A(data_in[18]), .B(data_out_parallel[18]), .Q(n79) );
  OAI22X3 U26 ( .A1(n59), .A2(n27), .B1(shift), .B2(n65), .Q(N94) );
  NOR2XL U27 ( .A(data_in[32]), .B(data_out_parallel[32]), .Q(n65) );
  OAI22X3 U28 ( .A1(n59), .A2(n21), .B1(shift), .B2(n117), .Q(N100) );
  NOR2XL U29 ( .A(data_in[38]), .B(data_out_parallel[38]), .Q(n117) );
  OAI22X3 U30 ( .A1(n59), .A2(n37), .B1(shift), .B2(n75), .Q(N84) );
  NOR2XL U31 ( .A(data_in[22]), .B(data_out_parallel[22]), .Q(n75) );
  OAI22X3 U32 ( .A1(n119), .A2(n23), .B1(shift), .B2(n61), .Q(N98) );
  NOR2XL U33 ( .A(data_in[36]), .B(data_out_parallel[36]), .Q(n61) );
  OAI22X3 U34 ( .A1(n59), .A2(n46), .B1(shift), .B2(n84), .Q(N75) );
  NOR2XL U35 ( .A(data_in[13]), .B(data_out_parallel[13]), .Q(n84) );
  OAI22X3 U36 ( .A1(n59), .A2(n26), .B1(shift), .B2(n64), .Q(N95) );
  NOR2XL U37 ( .A(data_in[33]), .B(data_out_parallel[33]), .Q(n64) );
  OAI22X3 U38 ( .A1(n59), .A2(n19), .B1(shift), .B2(n115), .Q(N102) );
  NOR2XL U39 ( .A(data_in[40]), .B(data_out_parallel[40]), .Q(n115) );
  OAI22X3 U40 ( .A1(n59), .A2(n32), .B1(shift), .B2(n70), .Q(N89) );
  NOR2XL U41 ( .A(data_in[27]), .B(data_out_parallel[27]), .Q(n70) );
  OAI22X3 U42 ( .A1(n59), .A2(n25), .B1(shift), .B2(n63), .Q(N96) );
  NOR2XL U43 ( .A(data_in[34]), .B(data_out_parallel[34]), .Q(n63) );
  OAI22X3 U44 ( .A1(n118), .A2(n45), .B1(shift), .B2(n83), .Q(N76) );
  NOR2XL U45 ( .A(data_in[14]), .B(data_out_parallel[14]), .Q(n83) );
  OAI22X3 U46 ( .A1(n59), .A2(n40), .B1(shift), .B2(n78), .Q(N81) );
  NOR2XL U47 ( .A(data_in[19]), .B(data_out_parallel[19]), .Q(n78) );
  OAI22X3 U48 ( .A1(n118), .A2(n28), .B1(shift), .B2(n66), .Q(N93) );
  NOR2XL U49 ( .A(data_in[31]), .B(data_out_parallel[31]), .Q(n66) );
  OAI22X3 U50 ( .A1(n59), .A2(n33), .B1(shift), .B2(n71), .Q(N88) );
  NOR2XL U51 ( .A(data_in[26]), .B(data_out_parallel[26]), .Q(n71) );
  OAI22X3 U52 ( .A1(n59), .A2(n31), .B1(shift), .B2(n69), .Q(N90) );
  NOR2XL U53 ( .A(data_in[28]), .B(data_out_parallel[28]), .Q(n69) );
  OAI22X3 U54 ( .A1(n59), .A2(n29), .B1(shift), .B2(n67), .Q(N92) );
  NOR2XL U55 ( .A(data_in[30]), .B(data_out_parallel[30]), .Q(n67) );
  OAI22X3 U56 ( .A1(n118), .A2(n39), .B1(shift), .B2(n77), .Q(N82) );
  NOR2XL U57 ( .A(data_in[20]), .B(data_out_parallel[20]), .Q(n77) );
  OAI22X3 U58 ( .A1(n59), .A2(n38), .B1(shift), .B2(n76), .Q(N83) );
  NOR2XL U59 ( .A(data_in[21]), .B(data_out_parallel[21]), .Q(n76) );
  OAI22X3 U60 ( .A1(n59), .A2(n18), .B1(shift), .B2(n114), .Q(N103) );
  NOR2XL U61 ( .A(data_in[41]), .B(data_out_parallel[41]), .Q(n114) );
  OAI22X3 U62 ( .A1(n118), .A2(n44), .B1(shift), .B2(n82), .Q(N77) );
  NOR2XL U63 ( .A(data_in[15]), .B(data_out_parallel[15]), .Q(n82) );
  OAI22X3 U64 ( .A1(n59), .A2(n24), .B1(shift), .B2(n62), .Q(N97) );
  NOR2XL U65 ( .A(data_in[35]), .B(data_out_parallel[35]), .Q(n62) );
  OAI22X3 U66 ( .A1(n59), .A2(n55), .B1(shift), .B2(n93), .Q(N66) );
  NOR2XL U67 ( .A(data_in[4]), .B(data_out_parallel[4]), .Q(n93) );
  OAI22X3 U68 ( .A1(n118), .A2(n13), .B1(shift), .B2(n109), .Q(N108) );
  NOR2XL U69 ( .A(data_in[46]), .B(data_out_parallel[46]), .Q(n109) );
  OAI22X3 U70 ( .A1(n118), .A2(n34), .B1(shift), .B2(n72), .Q(N87) );
  NOR2XL U71 ( .A(data_in[25]), .B(data_out_parallel[25]), .Q(n72) );
  OAI22X3 U72 ( .A1(n118), .A2(n49), .B1(shift), .B2(n87), .Q(N72) );
  NOR2XL U73 ( .A(data_in[10]), .B(data_out_parallel[10]), .Q(n87) );
  OAI22X3 U74 ( .A1(n59), .A2(n56), .B1(shift), .B2(n94), .Q(N65) );
  NOR2XL U75 ( .A(data_in[3]), .B(data_out_parallel[3]), .Q(n94) );
  OAI22X3 U76 ( .A1(n118), .A2(n50), .B1(shift), .B2(n88), .Q(N71) );
  NOR2XL U77 ( .A(data_in[9]), .B(data_out_parallel[9]), .Q(n88) );
  OAI22X3 U78 ( .A1(n118), .A2(n8), .B1(shift), .B2(n104), .Q(N113) );
  NOR2XL U79 ( .A(data_in[51]), .B(data_out_parallel[51]), .Q(n104) );
  OAI22X3 U80 ( .A1(n118), .A2(n3), .B1(shift), .B2(n99), .Q(N118) );
  NOR2XL U81 ( .A(data_in[56]), .B(data_out_parallel[56]), .Q(n99) );
  OAI22X3 U82 ( .A1(n118), .A2(n1), .B1(shift), .B2(n97), .Q(N120) );
  NOR2XL U83 ( .A(data_in[58]), .B(data_out_parallel[58]), .Q(n97) );
  OAI22X3 U84 ( .A1(n118), .A2(n5), .B1(shift), .B2(n101), .Q(N116) );
  NOR2XL U85 ( .A(data_in[54]), .B(data_out_parallel[54]), .Q(n101) );
  OAI22X3 U86 ( .A1(n118), .A2(n6), .B1(shift), .B2(n102), .Q(N115) );
  NOR2XL U87 ( .A(data_in[53]), .B(data_out_parallel[53]), .Q(n102) );
  OAI22X3 U88 ( .A1(n59), .A2(n14), .B1(shift), .B2(n110), .Q(N107) );
  NOR2XL U89 ( .A(data_in[45]), .B(data_out_parallel[45]), .Q(n110) );
  OAI22X3 U90 ( .A1(n118), .A2(n15), .B1(shift), .B2(n111), .Q(N106) );
  NOR2XL U91 ( .A(data_in[44]), .B(data_out_parallel[44]), .Q(n111) );
  OAI22X3 U92 ( .A1(n118), .A2(n16), .B1(shift), .B2(n112), .Q(N105) );
  NOR2XL U93 ( .A(data_in[43]), .B(data_out_parallel[43]), .Q(n112) );
  OAI22X3 U94 ( .A1(n59), .A2(n57), .B1(shift), .B2(n95), .Q(N64) );
  NOR2XL U95 ( .A(data_in[2]), .B(data_out_parallel[2]), .Q(n95) );
  OAI22X3 U96 ( .A1(n118), .A2(n58), .B1(shift), .B2(n96), .Q(N63) );
  NOR2XL U97 ( .A(data_in[1]), .B(data_out_parallel[1]), .Q(n96) );
  OAI22X3 U98 ( .A1(n118), .A2(n2), .B1(shift), .B2(n98), .Q(N119) );
  NOR2XL U99 ( .A(data_in[57]), .B(data_out_parallel[57]), .Q(n98) );
  OAI22X3 U100 ( .A1(n118), .A2(n7), .B1(shift), .B2(n103), .Q(N114) );
  NOR2XL U101 ( .A(data_in[52]), .B(data_out_parallel[52]), .Q(n103) );
  OAI22X3 U102 ( .A1(n118), .A2(n10), .B1(shift), .B2(n106), .Q(N111) );
  NOR2XL U103 ( .A(data_in[49]), .B(data_out_parallel[49]), .Q(n106) );
  OAI22X3 U104 ( .A1(n118), .A2(n11), .B1(shift), .B2(n107), .Q(N110) );
  NOR2XL U105 ( .A(data_in[48]), .B(data_out_parallel[48]), .Q(n107) );
  OAI22X3 U106 ( .A1(n118), .A2(n12), .B1(shift), .B2(n108), .Q(N109) );
  NOR2XL U107 ( .A(data_in[47]), .B(data_out_parallel[47]), .Q(n108) );
  OAI22X3 U108 ( .A1(n118), .A2(n17), .B1(shift), .B2(n113), .Q(N104) );
  NOR2XL U109 ( .A(data_in[42]), .B(data_out_parallel[42]), .Q(n113) );
  OAI22X3 U110 ( .A1(n118), .A2(n51), .B1(shift), .B2(n89), .Q(N70) );
  NOR2XL U111 ( .A(data_in[8]), .B(data_out_parallel[8]), .Q(n89) );
  OAI22X3 U112 ( .A1(n59), .A2(n52), .B1(shift), .B2(n90), .Q(N69) );
  NOR2XL U113 ( .A(data_in[7]), .B(data_out_parallel[7]), .Q(n90) );
  OAI22X3 U114 ( .A1(n118), .A2(n53), .B1(shift), .B2(n91), .Q(N68) );
  NOR2XL U115 ( .A(data_in[6]), .B(data_out_parallel[6]), .Q(n91) );
  OAI22X3 U116 ( .A1(n59), .A2(n54), .B1(shift), .B2(n92), .Q(N67) );
  NOR2XL U117 ( .A(data_in[5]), .B(data_out_parallel[5]), .Q(n92) );
  OAI22X3 U118 ( .A1(n118), .A2(n9), .B1(shift), .B2(n105), .Q(N112) );
  NOR2XL U119 ( .A(data_in[50]), .B(data_out_parallel[50]), .Q(n105) );
  OAI22X3 U120 ( .A1(n118), .A2(n4), .B1(shift), .B2(n100), .Q(N117) );
  NOR2XL U121 ( .A(data_in[55]), .B(data_out_parallel[55]), .Q(n100) );
  OA21X2 U122 ( .A1(data_in[0]), .A2(data_out_parallel[0]), .B1(n59), .Q(N62)
         );
endmodule



    module router_channel_DATA_WIDTH9_current_address5_Rxy_rst60_Cx_rst15_NoC_size4 (
        reset, clk, DCTS, DRTS, RTS, CTS, flit_type, destination_address,
        Grant_N_in, Grant_E_in, Grant_W_in, Grant_S_in, Grant_L_in, Req_N_in,
        Req_E_in, Req_W_in, Req_S_in, Req_L_in, fault_shift, fault_clk,
        fault_data_in_serial, fault_data_out_serial, Grant_N_out, Grant_E_out,
        Grant_W_out, Grant_S_out, Grant_L_out, Req_N_out, Req_E_out, Req_W_out,
        Req_S_out, Req_L_out, read_pointer_out, write_pointer_out,
        write_en_out, Xbar_sel, shift, checker_clk, error_signal_sync,
        error_signal_async, shift_serial_data );
  input [2:0] flit_type;
  input [3:0] destination_address;
  output [3:0] read_pointer_out;
  output [3:0] write_pointer_out;
  output [4:0] Xbar_sel;
  input reset, clk, DCTS, DRTS, Grant_N_in, Grant_E_in, Grant_W_in, Grant_S_in,
         Grant_L_in, Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in,
         fault_shift, fault_clk, fault_data_in_serial, shift, checker_clk;
  output RTS, CTS, fault_data_out_serial, Grant_N_out, Grant_E_out,
         Grant_W_out, Grant_S_out, Grant_L_out, Req_N_out, Req_E_out,
         Req_W_out, Req_S_out, Req_L_out, write_en_out, error_signal_sync,
         error_signal_async, shift_serial_data;
  wire   empty, fault_DO_serial_FIFO_2_LBDR, fault_DO_serial_LBDR_2_Arbiter,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44;
  wire   [58:0] shift_parallel_data;
  wire   [58:0] combined_error_signals;

  FIFO_DATA_WIDTH9 FIFO_unit ( .reset(reset), .clk(clk), .DRTS(DRTS),
        .read_en_N(Grant_N_in), .read_en_E(Grant_E_in), .read_en_W(Grant_W_in),
        .read_en_S(Grant_S_in), .read_en_L(Grant_L_in), .CTS(CTS), .empty_out(
        empty), .read_pointer_out(read_pointer_out), .write_pointer_out(
        write_pointer_out), .write_en_out(write_en_out), .shift(fault_shift),
        .fault_clk(fault_clk), .data_in_serial(fault_data_in_serial),
        .data_out_serial(fault_DO_serial_FIFO_2_LBDR),
        .err_write_en_write_pointer(combined_error_signals[10]),
        .err_not_write_en_write_pointer(combined_error_signals[9]),
        .err_read_pointer_write_pointer_not_empty(combined_error_signals[8]),
        .err_read_pointer_write_pointer_empty(combined_error_signals[7]),
        .err_read_pointer_write_pointer_not_full(combined_error_signals[6]),
        .err_read_pointer_write_pointer_full(combined_error_signals[5]),
        .err_read_pointer_increment(combined_error_signals[4]),
        .err_read_pointer_not_increment(combined_error_signals[3]),
        .err_write_en(combined_error_signals[2]), .err_not_CTS_in(
        combined_error_signals[1]), .err_read_en_mismatch(
        combined_error_signals[0]) );
  LBDR_cur_addr_rst5_Rxy_rst60_Cx_rst15_NoC_size4 LBDR_unit ( .reset(reset),
        .clk(clk), .empty(empty), .flit_type(flit_type), .dst_addr(
        destination_address), .Req_N(Req_N_out), .Req_E(Req_E_out), .Req_W(
        Req_W_out), .Req_S(Req_S_out), .Req_L(Req_L_out), .shift(shift),
        .fault_clk(fault_clk), .data_in_serial(fault_DO_serial_FIFO_2_LBDR),
        .data_out_serial(fault_DO_serial_LBDR_2_Arbiter),
        .err_header_empty_Requests_FF_Requests_in(combined_error_signals[58]),
        .err_tail_Requests_in_all_zero(combined_error_signals[57]),
        .err_header_tail_Requests_FF_Requests_in(combined_error_signals[56]),
        .err_dst_addr_cur_addr_N1(combined_error_signals[55]),
        .err_dst_addr_cur_addr_not_N1(combined_error_signals[54]),
        .err_dst_addr_cur_addr_E1(combined_error_signals[53]),
        .err_dst_addr_cur_addr_not_E1(combined_error_signals[52]),
        .err_dst_addr_cur_addr_W1(combined_error_signals[51]),
        .err_dst_addr_cur_addr_not_W1(combined_error_signals[50]),
        .err_dst_addr_cur_addr_S1(combined_error_signals[49]),
        .err_dst_addr_cur_addr_not_S1(combined_error_signals[48]),
        .err_dst_addr_cur_addr_not_Req_L_in(combined_error_signals[47]),
        .err_dst_addr_cur_addr_Req_L_in(combined_error_signals[46]),
        .err_header_not_empty_Req_N_in(combined_error_signals[45]),
        .err_header_not_empty_Req_E_in(combined_error_signals[44]),
        .err_header_not_empty_Req_W_in(combined_error_signals[43]),
        .err_header_not_empty_Req_S_in(combined_error_signals[42]) );
  Arbiter Arbiter_unit ( .reset(reset), .clk(clk), .Req_N(Req_N_in), .Req_E(
        Req_E_in), .Req_W(Req_W_in), .Req_S(Req_S_in), .Req_L(Req_L_in),
        .DCTS(DCTS), .Grant_N(Grant_N_out), .Grant_E(Grant_E_out), .Grant_W(
        Grant_W_out), .Grant_S(Grant_S_out), .Grant_L(Grant_L_out), .Xbar_sel(
        Xbar_sel), .RTS(RTS), .shift(shift), .fault_clk(fault_clk),
        .data_in_serial(fault_DO_serial_LBDR_2_Arbiter), .data_out_serial(
        fault_data_out_serial), .err_state_IDLE_xbar(
        combined_error_signals[41]), .err_state_not_IDLE_xbar(
        combined_error_signals[40]), .err_state_IDLE_RTS_FF_in(
        combined_error_signals[39]), .err_state_not_IDLE_RTS_FF_RTS_FF_in(
        combined_error_signals[38]),
        .err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in(combined_error_signals[37]),
        .err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in(
        combined_error_signals[36]), .err_RTS_FF_not_DCTS_state_state_in(
        combined_error_signals[35]), .err_not_RTS_FF_state_in_next_state(
        combined_error_signals[34]), .err_RTS_FF_DCTS_state_in_next_state(
        combined_error_signals[33]), .err_not_DCTS_Grants(
        combined_error_signals[32]), .err_DCTS_not_RTS_FF_Grants(
        combined_error_signals[31]), .err_DCTS_RTS_FF_IDLE_Grants(
        combined_error_signals[30]), .err_DCTS_RTS_FF_not_IDLE_Grants_onehot(
        combined_error_signals[29]), .err_Requests_next_state_IDLE(
        combined_error_signals[28]), .err_IDLE_Req_L(
        combined_error_signals[27]), .err_Local_Req_L(
        combined_error_signals[26]), .err_North_Req_N(
        combined_error_signals[25]), .err_IDLE_Req_N(
        combined_error_signals[24]), .err_Local_Req_N(
        combined_error_signals[23]), .err_South_Req_L(
        combined_error_signals[22]), .err_West_Req_L(
        combined_error_signals[21]), .err_South_Req_N(
        combined_error_signals[20]), .err_East_Req_L(
        combined_error_signals[19]), .err_West_Req_N(
        combined_error_signals[18]), .err_East_Req_N(
        combined_error_signals[17]), .err_next_state_onehot(
        combined_error_signals[16]), .err_state_in_onehot(
        combined_error_signals[15]), .err_state_north_xbar_sel(
        combined_error_signals[14]), .err_state_east_xbar_sel(
        combined_error_signals[13]), .err_state_west_xbar_sel(
        combined_error_signals[12]), .err_state_south_xbar_sel(
        combined_error_signals[11]) );
  shift_register_REG_WIDTH59 checker_shifter ( .clk(checker_clk), .reset(reset), .shift(shift), .data_in(combined_error_signals), .data_out_parallel(
        shift_parallel_data), .data_out_serial(shift_serial_data) );
  NOR4X3 U45 ( .A(combined_error_signals[31]), .B(combined_error_signals[30]),
        .C(combined_error_signals[2]), .D(combined_error_signals[29]), .Q(n35)
         );
  NOR4X3 U46 ( .A(combined_error_signals[15]), .B(combined_error_signals[14]),
        .C(combined_error_signals[13]), .D(combined_error_signals[12]), .Q(n30) );
  NOR4X3 U47 ( .A(combined_error_signals[45]), .B(combined_error_signals[44]),
        .C(combined_error_signals[43]), .D(combined_error_signals[42]), .Q(n39) );
  NOR4X3 U48 ( .A(combined_error_signals[5]), .B(combined_error_signals[58]),
        .C(combined_error_signals[57]), .D(combined_error_signals[56]), .Q(n43) );
  INVXL U49 ( .A(n24), .Q(error_signal_async) );
  NOR4X3 U50 ( .A(n25), .B(n26), .C(n27), .D(n28), .Q(n24) );
  NAND4X3 U51 ( .A(n41), .B(n42), .C(n43), .D(n44), .Q(n25) );
  NAND4X3 U52 ( .A(n37), .B(n38), .C(n39), .D(n40), .Q(n26) );
  NOR4X3 U53 ( .A(combined_error_signals[41]), .B(combined_error_signals[40]),
        .C(combined_error_signals[3]), .D(combined_error_signals[39]), .Q(n38)
         );
  NOR3X3 U54 ( .A(combined_error_signals[36]), .B(combined_error_signals[38]),
        .C(combined_error_signals[37]), .Q(n37) );
  NOR4X3 U55 ( .A(combined_error_signals[49]), .B(combined_error_signals[48]),
        .C(combined_error_signals[47]), .D(combined_error_signals[46]), .Q(n40) );
  NOR4X3 U56 ( .A(combined_error_signals[9]), .B(combined_error_signals[8]),
        .C(combined_error_signals[7]), .D(combined_error_signals[6]), .Q(n44)
         );
  NOR4X3 U57 ( .A(combined_error_signals[55]), .B(combined_error_signals[54]),
        .C(combined_error_signals[53]), .D(combined_error_signals[52]), .Q(n42) );
  NOR3X3 U58 ( .A(combined_error_signals[4]), .B(combined_error_signals[51]),
        .C(combined_error_signals[50]), .Q(n41) );
  NAND4X3 U59 ( .A(n29), .B(n30), .C(n31), .D(n32), .Q(n28) );
  NOR3X3 U60 ( .A(combined_error_signals[0]), .B(combined_error_signals[11]),
        .C(combined_error_signals[10]), .Q(n29) );
  NOR3X3 U61 ( .A(combined_error_signals[16]), .B(combined_error_signals[18]),
        .C(combined_error_signals[17]), .Q(n31) );
  NOR4X3 U62 ( .A(combined_error_signals[21]), .B(combined_error_signals[20]),
        .C(combined_error_signals[1]), .D(combined_error_signals[19]), .Q(n32)
         );
  NAND4X3 U63 ( .A(n33), .B(n34), .C(n35), .D(n36), .Q(n27) );
  NOR4X3 U64 ( .A(combined_error_signals[28]), .B(combined_error_signals[27]),
        .C(combined_error_signals[26]), .D(combined_error_signals[25]), .Q(n34) );
  NOR3X3 U65 ( .A(combined_error_signals[22]), .B(combined_error_signals[24]),
        .C(combined_error_signals[23]), .Q(n33) );
  NOR4X3 U66 ( .A(combined_error_signals[35]), .B(combined_error_signals[34]),
        .C(combined_error_signals[33]), .D(combined_error_signals[32]), .Q(n36) );
  INVXL U67 ( .A(n3), .Q(error_signal_sync) );
  NOR4X3 U68 ( .A(n4), .B(n5), .C(n6), .D(n7), .Q(n3) );
  NAND4X3 U69 ( .A(n20), .B(n21), .C(n22), .D(n23), .Q(n4) );
  NAND4X3 U70 ( .A(n16), .B(n17), .C(n18), .D(n19), .Q(n5) );
  NOR4X3 U71 ( .A(shift_parallel_data[21]), .B(shift_parallel_data[20]), .C(
        shift_parallel_data[1]), .D(shift_parallel_data[19]), .Q(n11) );
  NOR4X3 U72 ( .A(shift_parallel_data[35]), .B(shift_parallel_data[34]), .C(
        shift_parallel_data[33]), .D(shift_parallel_data[32]), .Q(n15) );
  NOR4X3 U73 ( .A(shift_parallel_data[49]), .B(shift_parallel_data[48]), .C(
        shift_parallel_data[47]), .D(shift_parallel_data[46]), .Q(n19) );
  NOR4X3 U74 ( .A(shift_parallel_data[9]), .B(shift_parallel_data[8]), .C(
        shift_parallel_data[7]), .D(shift_parallel_data[6]), .Q(n23) );
  NOR4X3 U75 ( .A(shift_parallel_data[45]), .B(shift_parallel_data[44]), .C(
        shift_parallel_data[43]), .D(shift_parallel_data[42]), .Q(n18) );
  NOR4X3 U76 ( .A(shift_parallel_data[5]), .B(shift_parallel_data[58]), .C(
        shift_parallel_data[57]), .D(shift_parallel_data[56]), .Q(n22) );
  NOR4X3 U77 ( .A(shift_parallel_data[41]), .B(shift_parallel_data[40]), .C(
        shift_parallel_data[3]), .D(shift_parallel_data[39]), .Q(n17) );
  NOR4X3 U78 ( .A(shift_parallel_data[55]), .B(shift_parallel_data[54]), .C(
        shift_parallel_data[53]), .D(shift_parallel_data[52]), .Q(n21) );
  NOR3X3 U79 ( .A(shift_parallel_data[36]), .B(shift_parallel_data[38]), .C(
        shift_parallel_data[37]), .Q(n16) );
  NOR3X3 U80 ( .A(shift_parallel_data[4]), .B(shift_parallel_data[51]), .C(
        shift_parallel_data[50]), .Q(n20) );
  NAND4X3 U81 ( .A(n8), .B(n9), .C(n10), .D(n11), .Q(n7) );
  NOR3X3 U82 ( .A(shift_parallel_data[0]), .B(shift_parallel_data[11]), .C(
        shift_parallel_data[10]), .Q(n8) );
  NOR3X3 U83 ( .A(shift_parallel_data[16]), .B(shift_parallel_data[18]), .C(
        shift_parallel_data[17]), .Q(n10) );
  NOR4X3 U84 ( .A(shift_parallel_data[15]), .B(shift_parallel_data[14]), .C(
        shift_parallel_data[13]), .D(shift_parallel_data[12]), .Q(n9) );
  NAND4X3 U85 ( .A(n12), .B(n13), .C(n14), .D(n15), .Q(n6) );
  NOR3X3 U86 ( .A(shift_parallel_data[22]), .B(shift_parallel_data[24]), .C(
        shift_parallel_data[23]), .Q(n12) );
  NOR4X3 U87 ( .A(shift_parallel_data[28]), .B(shift_parallel_data[27]), .C(
        shift_parallel_data[26]), .D(shift_parallel_data[25]), .Q(n13) );
  NOR4X3 U88 ( .A(shift_parallel_data[31]), .B(shift_parallel_data[30]), .C(
        shift_parallel_data[2]), .D(shift_parallel_data[29]), .Q(n14) );
endmodule

