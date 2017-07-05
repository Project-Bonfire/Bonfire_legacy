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

module LBDR
  #(parameter cur_addr_rst = 8,
    parameter Cx_rst       = 8,
    parameter NoC_size     = 4
    )

   (input reset, input clk,
    input [7:0]  Rxy_reconf,
    input        Reconfig,

    input empty,
    input [2:0] flit_type,
    input [NoC_size-1:0] dst_addr,

    input grant_N, grant_E, grant_W, grant_S, grant_L,
    output Req_N, Req_E, Req_W, Req_S, Req_L
    );

   wire  [3:0] Cx = Cx_rst;
   logic [7:0] Rxy, Rxy_in;

   wire [NoC_size-1:0] cur_addr = cur_addr_rst;
   wire N1 = dst_addr[NoC_size-1:NoC_size/2] < cur_addr[NoC_size-1:NoC_size/2] ? 1 : 0;
   wire E1 = cur_addr[(NoC_size/2)-1:0]      < dst_addr[(NoC_size/2)-1:0]      ? 1 : 0;
   wire W1 = dst_addr[(NoC_size/2)-1:0]      < cur_addr[(NoC_size/2)-1:0]      ? 1 : 0;
   wire S1 = cur_addr[NoC_size-1:NoC_size/2] < dst_addr[NoC_size-1:NoC_size/2] ? 1 : 0;

   logic Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in;
   logic Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF;
   wire grants = grant_N | grant_E | grant_W | grant_S | grant_L;

   logic ReConf_FF_in, ReConf_FF_out;


   always_ff @(posedge clk, negedge reset) begin
      if (!reset) begin
         Rxy <= Rxy_reconf;
         Req_N_FF <= 0;
         Req_E_FF <= 0;
         Req_W_FF <= 0;
         Req_S_FF <= 0;
         Req_L_FF <= 0;
         ReConf_FF_out <= 0;
      end else begin
         Rxy <= Rxy_in;
         Req_N_FF <= Req_N_in;
         Req_E_FF <= Req_E_in;
         Req_W_FF <= Req_W_in;
         Req_S_FF <= Req_S_in;
         Req_L_FF <= Req_L_in;
         ReConf_FF_out <= ReConf_FF_in;
      end
   end

   always_comb begin
      if (ReConf_FF_out && flit_type == 'b100 && !empty && grants) begin
         Rxy_in <= Rxy_reconf;
         ReConf_FF_in <= 0;
      end else begin
         Rxy_in <= Rxy;
         ReConf_FF_in <= Reconfig ? 1 : ReConf_FF_out;
      end
   end

   // TODO If so, why do we even need Req_N?
   assign Req_N = Req_N_FF;
   assign Req_E = Req_E_FF;
   assign Req_W = Req_W_FF;
   assign Req_S = Req_S_FF;
   assign Req_L = Req_L_FF;

   always_comb begin
      if (flit_type == 'b001 && !empty) begin
         Req_N_in <= ((N1 & ~E1 & ~W1) | (N1 & E1 & Rxy[0]) | (N1 & W1 & Rxy[1])) & Cx[0];
         Req_E_in <= ((E1 & ~N1 & ~S1) | (E1 & N1 & Rxy[2]) | (E1 & S1 & Rxy[3])) & Cx[1];
         Req_W_in <= ((W1 & ~N1 & ~S1) | (W1 & N1 & Rxy[4]) | (W1 & S1 & Rxy[5])) & Cx[2];
         Req_S_in <= ((S1 & ~E1 & ~W1) | (S1 & E1 & Rxy[6]) | (S1 & W1 & Rxy[7])) & Cx[3];
         Req_L_in <= ~N1 & ~E1 & ~W1 & ~S1;
      end else if (flit_type == 'b100 & !empty & grants) begin
         Req_N_in <= 0;
         Req_E_in <= 0;
         Req_W_in <= 0;
         Req_S_in <= 0;
         Req_L_in <= 0;
      end else begin
         Req_N_in <= Req_N_FF;
         Req_E_in <= Req_E_FF;
         Req_W_in <= Req_W_FF;
         Req_S_in <= Req_S_FF;
         Req_L_in <= Req_L_FF;
      end
   end
endmodule
