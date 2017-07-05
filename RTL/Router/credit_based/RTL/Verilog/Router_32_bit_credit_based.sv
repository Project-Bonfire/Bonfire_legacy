/*
 * Copyright (C) 2016  Siavoosh Payandeh Azad
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module router_credit_based
  #(parameter DATA_WIDTH      = 32,
    parameter current_address =  0,
    parameter Cx_rst          = 10,
    parameter NoC_size        =  4
    )
   (input reset, input clk,

    input [7:0] Rxy_reconf,
    input Reconfig,

    input [DATA_WIDTH-1:0] RX_N, RX_E, RX_W, RX_S, RX_L,

    input  credit_in_N,  credit_in_E,  credit_in_W,  credit_in_S,  credit_in_L,
    input  valid_in_N,   valid_in_E,   valid_in_W,   valid_in_S,   valid_in_L,

    output valid_out_N,  valid_out_E,  valid_out_W,  valid_out_S,  valid_out_L,
    output credit_out_N, credit_out_E, credit_out_W, credit_out_S, credit_out_L,

    output [DATA_WIDTH-1:0] TX_N, TX_E, TX_W, TX_S, TX_L
    );

   wire [DATA_WIDTH-1:0] FIFO_D_out_N, FIFO_D_out_E, FIFO_D_out_W, FIFO_D_out_S, FIFO_D_out_L;

   // Grant_XY : Grant signal generated from Arbiter for output X connected to FIFO of input Y

   wire Grant_NN, Grant_NE, Grant_NW, Grant_NS, Grant_NL;
   wire Grant_EN, Grant_EE, Grant_EW, Grant_ES, Grant_EL;
   wire Grant_WN, Grant_WE, Grant_WW, Grant_WS, Grant_WL;
   wire Grant_SN, Grant_SE, Grant_SW, Grant_SS, Grant_SL;
   wire Grant_LN, Grant_LE, Grant_LW, Grant_LS, Grant_LL;

   wire Req_NN, Req_EN, Req_WN, Req_SN, Req_LN;
   wire Req_NE, Req_EE, Req_WE, Req_SE, Req_LE;
   wire Req_NW, Req_EW, Req_WW, Req_SW, Req_LW;
   wire Req_NS, Req_ES, Req_WS, Req_SS, Req_LS;
   wire Req_NL, Req_EL, Req_WL, Req_SL, Req_LL;

   wire empty_N, empty_E, empty_W, empty_S, empty_L;

   // all the Xbar select_signals
   wire [4:0] Xbar_sel_N = {     1'b0, Grant_NE, Grant_NW, Grant_NS, Grant_NL };
   wire [4:0] Xbar_sel_E = { Grant_EN,     1'b0, Grant_EW, Grant_ES, Grant_EL };
   wire [4:0] Xbar_sel_W = { Grant_WN, Grant_WE,     1'b0, Grant_WS, Grant_WL };
   wire [4:0] Xbar_sel_S = { Grant_SN, Grant_SE, Grant_SW,     1'b0, Grant_SL };
   wire [4:0] Xbar_sel_L = { Grant_LN, Grant_LE, Grant_LW, Grant_LS,     1'b0 };


   // all the FIFOs
   FIFO_credit_based #(.DATA_WIDTH(DATA_WIDTH)) FIFO_N
     (.reset(reset), .clk(clk), .RX(RX_N), .valid_in(valid_in_N),
      .read_en_N(1'b0), .read_en_E(Grant_EN), .read_en_W(Grant_WN), .read_en_S(Grant_SN), .read_en_L(Grant_LN),
      .credit_out(credit_out_N), .empty_out(empty_N), .Data_out(FIFO_D_out_N));

   FIFO_credit_based #(.DATA_WIDTH(DATA_WIDTH)) FIFO_E
     (.reset(reset), .clk(clk), .RX(RX_E), .valid_in(valid_in_E),
      .read_en_N(Grant_NE), .read_en_E(1'b0), .read_en_W(Grant_WE), .read_en_S(Grant_SE), .read_en_L(Grant_LE),
      .credit_out(credit_out_E), .empty_out(empty_E), .Data_out(FIFO_D_out_E));

   FIFO_credit_based #(.DATA_WIDTH(DATA_WIDTH)) FIFO_W
     (.reset(reset), .clk(clk), .RX(RX_W), .valid_in(valid_in_W),
      .read_en_N(Grant_NW), .read_en_E(Grant_EW), .read_en_W(1'b0), .read_en_S(Grant_SW), .read_en_L(Grant_LW),
      .credit_out(credit_out_W), .empty_out(empty_W), .Data_out(FIFO_D_out_W));

   FIFO_credit_based #(.DATA_WIDTH(DATA_WIDTH)) FIFO_S
     (.reset(reset), .clk(clk), .RX(RX_S), .valid_in(valid_in_S),
      .read_en_N(Grant_NS), .read_en_E(Grant_ES), .read_en_W(Grant_WS), .read_en_S(1'b0), .read_en_L(Grant_LS),
      .credit_out(credit_out_S), .empty_out(empty_S), .Data_out(FIFO_D_out_S));

   FIFO_credit_based #(.DATA_WIDTH(DATA_WIDTH)) FIFO_L
     (.reset(reset), .clk(clk), .RX(RX_L), .valid_in(valid_in_L),
      .read_en_N(Grant_NL), .read_en_E(Grant_EL), .read_en_W(Grant_WL), .read_en_S(Grant_SL), .read_en_L(1'b0),
      .credit_out(credit_out_L), .empty_out(empty_L), .Data_out(FIFO_D_out_L));

   // -----------------------------------------------------------------
   // -----------------------------------------------------------------
   // -----------------------------------------------------------------

   // all the LBDRs
   LBDR #(.cur_addr_rst(current_address), .Cx_rst(Cx_rst), .NoC_size(NoC_size)) LBDR_N
     (.reset(reset), .clk(clk), .empty(empty_N), .Rxy_reconf(Rxy_reconf), .Reconfig(Reconfig),
      .flit_type(FIFO_D_out_N[DATA_WIDTH-1:DATA_WIDTH-3]), .dst_addr(FIFO_D_out_N[DATA_WIDTH-19+NoC_size-1:DATA_WIDTH-19]),
      .grant_N(1'b0), .grant_E(Grant_EN), .grant_W(Grant_WN), .grant_S(Grant_SN), .grant_L(Grant_LN),
      .Req_N(Req_NN), .Req_E(Req_NE), .Req_W(Req_NW), .Req_S(Req_NS), .Req_L(Req_NL));

   LBDR #(.cur_addr_rst(current_address), .Cx_rst(Cx_rst), .NoC_size(NoC_size)) LBDR_E
     (.reset(reset), .clk(clk), .empty(empty_E), .Rxy_reconf(Rxy_reconf), .Reconfig(Reconfig),
      .flit_type(FIFO_D_out_E[DATA_WIDTH-1:DATA_WIDTH-3]), .dst_addr(FIFO_D_out_E[DATA_WIDTH-19+NoC_size-1:DATA_WIDTH-19]),
      .grant_N(Grant_NE), .grant_E(1'b0), .grant_W(Grant_WE), .grant_S(Grant_SE), .grant_L(Grant_LE),
      .Req_N(Req_EN), .Req_E(Req_EE), .Req_W(Req_EW), .Req_S(Req_ES), .Req_L(Req_EL));

   LBDR #(.cur_addr_rst(current_address), .Cx_rst(Cx_rst), .NoC_size(NoC_size)) LBDR_W
     (.reset(reset), .clk(clk), .empty(empty_W),  .Rxy_reconf(Rxy_reconf), .Reconfig(Reconfig),
      .flit_type(FIFO_D_out_W[DATA_WIDTH-1:DATA_WIDTH-3]), .dst_addr(FIFO_D_out_W[DATA_WIDTH-19+NoC_size-1:DATA_WIDTH-19]),
      .grant_N(Grant_NW), .grant_E(Grant_EW), .grant_W(1'b0), .grant_S(Grant_SW), .grant_L(Grant_LW),
      .Req_N(Req_WN), .Req_E(Req_WE), .Req_W(Req_WW), .Req_S(Req_WS), .Req_L(Req_WL));

   LBDR #(.cur_addr_rst(current_address), .Cx_rst(Cx_rst), .NoC_size(NoC_size)) LBDR_S
     (.reset(reset), .clk(clk), .empty(empty_S), .Rxy_reconf(Rxy_reconf), .Reconfig(Reconfig),
      .flit_type(FIFO_D_out_S[DATA_WIDTH-1:DATA_WIDTH-3]), .dst_addr(FIFO_D_out_S[DATA_WIDTH-19+NoC_size-1:DATA_WIDTH-19]),
      .grant_N(Grant_NS), .grant_E(Grant_ES), .grant_W(Grant_WS), .grant_S(1'b0), .grant_L(Grant_LS),
      .Req_N(Req_SN), .Req_E(Req_SE), .Req_W(Req_SW), .Req_S(Req_SS), .Req_L(Req_SL));

   LBDR #(.cur_addr_rst(current_address), .Cx_rst(Cx_rst), .NoC_size(NoC_size)) LBDR_L
     (.reset(reset), .clk(clk), .empty(empty_L), .Rxy_reconf(Rxy_reconf), .Reconfig(Reconfig),
      .flit_type(FIFO_D_out_L[DATA_WIDTH-1:DATA_WIDTH-3]), .dst_addr(FIFO_D_out_L[DATA_WIDTH-19+NoC_size-1:DATA_WIDTH-19]),
      .grant_N(Grant_NL), .grant_E(Grant_EL), .grant_W(Grant_WL),.grant_S(Grant_SL), .grant_L(1'b0),
      .Req_N(Req_LN), .Req_E(Req_LE), .Req_W(Req_LW), .Req_S(Req_LS), .Req_L(Req_LL));

   // -----------------------------------------------------------------
   // -----------------------------------------------------------------
   // -----------------------------------------------------------------

   // switch allocator
   allocator allocator_unit (.reset(reset), .clk(clk),
     // flow control
     .credit_in_N(credit_in_N), .credit_in_E(credit_in_E), .credit_in_W(credit_in_W), .credit_in_S(credit_in_S), .credit_in_L(credit_in_L),
     // requests from the LBDRS
     .req_N_N(1'b0),        .req_N_E(Req_NE),      .req_N_W(Req_NW),      .req_N_S(Req_NS),      .req_N_L(Req_NL),
     .req_E_N(Req_EN),      .req_E_E(1'b0),        .req_E_W(Req_EW),      .req_E_S(Req_ES),      .req_E_L(Req_EL),
     .req_W_N(Req_WN),      .req_W_E(Req_WE),      .req_W_W(1'b0),        .req_W_S(Req_WS),      .req_W_L(Req_WL),
     .req_S_N(Req_SN),      .req_S_E(Req_SE),      .req_S_W(Req_SW),      .req_S_S(1'b0),        .req_S_L(Req_SL),
     .req_L_N(Req_LN),      .req_L_E(Req_LE),      .req_L_W(Req_LW),      .req_L_S(Req_LS),      .req_L_L(1'b0),
     .empty_N(empty_N),     .empty_E(empty_E),     .empty_W(empty_W),     .empty_S(empty_S),     .empty_L(empty_L),
     .valid_N(valid_out_N), .valid_E(valid_out_E), .valid_W(valid_out_W), .valid_S(valid_out_S), .valid_L(valid_out_L),
     // grant_X_Y means the grant for X output port towards Y input port
     // this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
     .grant_N_N(Grant_NN), .grant_N_E(Grant_NE), .grant_N_W(Grant_NW), .grant_N_S(Grant_NS), .grant_N_L(Grant_NL),
     .grant_E_N(Grant_EN), .grant_E_E(Grant_EE), .grant_E_W(Grant_EW), .grant_E_S(Grant_ES), .grant_E_L(Grant_EL),
     .grant_W_N(Grant_WN), .grant_W_E(Grant_WE), .grant_W_W(Grant_WW), .grant_W_S(Grant_WS), .grant_W_L(Grant_WL),
     .grant_S_N(Grant_SN), .grant_S_E(Grant_SE), .grant_S_W(Grant_SW), .grant_S_S(Grant_SS), .grant_S_L(Grant_SL),
     .grant_L_N(Grant_LN), .grant_L_E(Grant_LE), .grant_L_W(Grant_LW), .grant_L_S(Grant_LS), .grant_L_L(Grant_LL)
   );

   // -----------------------------------------------------------------
   // -----------------------------------------------------------------
   // -----------------------------------------------------------------

   // all the Xbars
   xbar #(.DATA_WIDTH(DATA_WIDTH)) XBAR_N
     (.North_in(FIFO_D_out_N), .East_in(FIFO_D_out_E), .West_in(FIFO_D_out_W), .South_in(FIFO_D_out_S), .Local_in(FIFO_D_out_L),
      .sel(Xbar_sel_N),  .Data_out(TX_N));
   xbar #(.DATA_WIDTH(DATA_WIDTH)) XBAR_E
     (.North_in(FIFO_D_out_N), .East_in(FIFO_D_out_E), .West_in(FIFO_D_out_W), .South_in(FIFO_D_out_S), .Local_in(FIFO_D_out_L),
      .sel(Xbar_sel_E),  .Data_out(TX_E));
   xbar #(.DATA_WIDTH(DATA_WIDTH)) XBAR_W
     (.North_in(FIFO_D_out_N), .East_in(FIFO_D_out_E), .West_in(FIFO_D_out_W), .South_in(FIFO_D_out_S), .Local_in(FIFO_D_out_L),
      .sel(Xbar_sel_W),  .Data_out(TX_W));
   xbar #(.DATA_WIDTH(DATA_WIDTH)) XBAR_S
     (.North_in(FIFO_D_out_N), .East_in(FIFO_D_out_E), .West_in(FIFO_D_out_W), .South_in(FIFO_D_out_S), .Local_in(FIFO_D_out_L),
      .sel(Xbar_sel_S),  .Data_out(TX_S));
   xbar #(.DATA_WIDTH(DATA_WIDTH)) XBAR_L
     (.North_in(FIFO_D_out_N), .East_in(FIFO_D_out_E), .West_in(FIFO_D_out_W), .South_in(FIFO_D_out_S), .Local_in(FIFO_D_out_L),
      .sel(Xbar_sel_L),  .Data_out(TX_L));

endmodule
