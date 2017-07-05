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

// TODO this file has exactly the same code copy-pasted five
// times. Perhaps we can use a submodule instead.

module allocator(input reset, input clk,
                 // Flow control
                 input  credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L,

                 input  req_N_N, req_N_E, req_N_W, req_N_S, req_N_L,
                 input  req_E_N, req_E_E, req_E_W, req_E_S, req_E_L,
                 input  req_W_N, req_W_E, req_W_W, req_W_S, req_W_L,
                 input  req_S_N, req_S_E, req_S_W, req_S_S, req_S_L,
                 input  req_L_N, req_L_E, req_L_W, req_L_S, req_L_L,

                 input  empty_N, empty_E, empty_W, empty_S, empty_L,
                 // grant_X_Y means the grant for X output port towards Y input port
                 // this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
                 output valid_N, valid_E, valid_W, valid_S, valid_L,

                 output grant_N_N, grant_N_E, grant_N_W, grant_N_S, grant_N_L,
                 output grant_E_N, grant_E_E, grant_E_W, grant_E_S, grant_E_L,
                 output grant_W_N, grant_W_E, grant_W_W, grant_W_S, grant_W_L,
                 output grant_S_N, grant_S_E, grant_S_W, grant_S_S, grant_S_L,
                 output grant_L_N, grant_L_E, grant_L_W, grant_L_S, grant_L_L
                 );


   // so the idea is that we should have counters that keep track of credit!
   logic [1:0] credit_counter_N_in, credit_counter_N_out;
   logic [1:0] credit_counter_E_in, credit_counter_E_out;
   logic [1:0] credit_counter_W_in, credit_counter_W_out;
   logic [1:0] credit_counter_S_in, credit_counter_S_out;
   logic [1:0] credit_counter_L_in, credit_counter_L_out;

   wire grant_N, grant_E, grant_W, grant_S, grant_L;

   wire X_N_N, X_N_E, X_N_W, X_N_S, X_N_L;
   wire X_E_N, X_E_E, X_E_W, X_E_S, X_E_L;
   wire X_W_N, X_W_E, X_W_W, X_W_S, X_W_L;
   wire X_S_N, X_S_E, X_S_W, X_S_S, X_S_L;
   wire X_L_N, X_L_E, X_L_W, X_L_S, X_L_L;

   wire grant_N_N_sig, grant_N_E_sig, grant_N_W_sig, grant_N_S_sig, grant_N_L_sig;
   wire grant_E_N_sig, grant_E_E_sig, grant_E_W_sig, grant_E_S_sig, grant_E_L_sig;
   wire grant_W_N_sig, grant_W_E_sig, grant_W_W_sig, grant_W_S_sig, grant_W_L_sig;
   wire grant_S_N_sig, grant_S_E_sig, grant_S_W_sig, grant_S_S_sig, grant_S_L_sig;
   wire grant_L_N_sig, grant_L_E_sig, grant_L_W_sig, grant_L_S_sig, grant_L_L_sig;

   always_ff @(posedge clk, negedge reset) begin
      if (!reset) begin
         // we start with all full credit
         credit_counter_N_out <= ~0;
         credit_counter_E_out <= ~0;
         credit_counter_W_out <= ~0;
         credit_counter_S_out <= ~0;
         credit_counter_L_out <= ~0;
      end else begin
         credit_counter_N_out <= credit_counter_N_in;
         credit_counter_E_out <= credit_counter_E_in;
         credit_counter_W_out <= credit_counter_W_in;
         credit_counter_S_out <= credit_counter_S_in;
         credit_counter_L_out <= credit_counter_L_in;
      end
   end

   assign grant_N_N = grant_N_N_sig & ~empty_N;
   assign grant_N_E = grant_N_E_sig & ~empty_E;
   assign grant_N_W = grant_N_W_sig & ~empty_W;
   assign grant_N_S = grant_N_S_sig & ~empty_S;
   assign grant_N_L = grant_N_L_sig & ~empty_L;

   assign grant_E_N = grant_E_N_sig & ~empty_N;
   assign grant_E_E = grant_E_E_sig & ~empty_E;
   assign grant_E_W = grant_E_W_sig & ~empty_W;
   assign grant_E_S = grant_E_S_sig & ~empty_S;
   assign grant_E_L = grant_E_L_sig & ~empty_L;

   assign grant_W_N = grant_W_N_sig & ~empty_N;
   assign grant_W_E = grant_W_E_sig & ~empty_E;
   assign grant_W_W = grant_W_W_sig & ~empty_W;
   assign grant_W_S = grant_W_S_sig & ~empty_S;
   assign grant_W_L = grant_W_L_sig & ~empty_L;

   assign grant_S_N = grant_S_N_sig & ~empty_N;
   assign grant_S_E = grant_S_E_sig & ~empty_E;
   assign grant_S_W = grant_S_W_sig & ~empty_W;
   assign grant_S_S = grant_S_S_sig & ~empty_S;
   assign grant_S_L = grant_S_L_sig & ~empty_L;

   assign grant_L_N = grant_L_N_sig & ~empty_N;
   assign grant_L_E = grant_L_E_sig & ~empty_E;
   assign grant_L_W = grant_L_W_sig & ~empty_W;
   assign grant_L_S = grant_L_S_sig & ~empty_S;
   assign grant_L_L = grant_L_L_sig & ~empty_L;

   assign grant_N = (grant_N_N_sig & ~empty_N)
     |              (grant_N_E_sig & ~empty_E)
       |            (grant_N_W_sig & ~empty_W)
         |          (grant_N_S_sig & ~empty_S)
           |        (grant_N_L_sig & ~empty_L);
   assign grant_E = (grant_E_N_sig & ~empty_N)
     |              (grant_E_E_sig & ~empty_E)
       |            (grant_E_W_sig & ~empty_W)
         |          (grant_E_S_sig & ~empty_S)
           |        (grant_E_L_sig & ~empty_L);
   assign grant_W = (grant_W_N_sig & ~empty_N)
     |              (grant_W_E_sig & ~empty_E)
       |            (grant_W_W_sig & ~empty_W)
         |          (grant_W_S_sig & ~empty_S)
           |        (grant_W_L_sig & ~empty_L);
   assign grant_S = (grant_S_N_sig & ~empty_N)
     |              (grant_S_E_sig & ~empty_E)
       |            (grant_S_W_sig & ~empty_W)
         |          (grant_S_S_sig & ~empty_S)
           |        (grant_S_L_sig & ~empty_L);
   assign grant_L = (grant_L_N_sig & ~empty_N)
     |              (grant_L_E_sig & ~empty_E)
       |            (grant_L_W_sig & ~empty_W)
         |          (grant_L_S_sig & ~empty_S)
           |        (grant_L_L_sig & ~empty_L);

   always_comb begin
      // this handles the credit counters!
      credit_counter_N_in <= credit_counter_N_out;
      credit_counter_E_in <= credit_counter_E_out;
      credit_counter_W_in <= credit_counter_W_out;
      credit_counter_S_in <= credit_counter_S_out;
      credit_counter_L_in <= credit_counter_L_out;

      if      (credit_in_N && grant_N)
        credit_counter_N_in <= credit_counter_N_out;
      else if (credit_in_N  && credit_counter_N_out < 3)
        credit_counter_N_in <= credit_counter_N_out + 1;
      else if (grant_N && credit_counter_N_out > 0)
        credit_counter_N_in <= credit_counter_N_out - 1;

      if      (credit_in_E && grant_E)
        credit_counter_E_in <= credit_counter_E_out;
      else if (credit_in_E && credit_counter_E_out < 3)
        credit_counter_E_in <= credit_counter_E_out + 1;
      else if (grant_E && credit_counter_E_out > 0)
        credit_counter_E_in <= credit_counter_E_out - 1;

      if      (credit_in_W && grant_W)
        credit_counter_W_in <= credit_counter_W_out;
      else if (credit_in_W && credit_counter_W_out < 3)
        credit_counter_W_in <= credit_counter_W_out + 1;
      else if (grant_W && credit_counter_W_out > 0)
        credit_counter_W_in <= credit_counter_W_out - 1;

      if      (credit_in_S && grant_S)
        credit_counter_S_in <= credit_counter_S_out;
      else if (credit_in_S && credit_counter_S_out < 3)
        credit_counter_S_in <= credit_counter_S_out + 1;
      else if (grant_S && credit_counter_S_out > 0)
        credit_counter_S_in <= credit_counter_S_out - 1;

      if      (credit_in_L && grant_L)
        credit_counter_L_in <= credit_counter_L_out;
      else if (credit_in_L && credit_counter_L_out < 3)
        credit_counter_L_in <= credit_counter_L_out + 1;
      else if (grant_L && credit_counter_L_out > 0)
        credit_counter_L_in <= credit_counter_L_out - 1;
   end

   arbiter_in arb_N_X(.reset(reset), .clk(clk),
                      .Req_X_N(req_N_N), .Req_X_E(req_N_E), .Req_X_W(req_N_W), .Req_X_S(req_N_S), .Req_X_L(req_N_L),
                      .X_N(X_N_N), .X_E(X_N_E), .X_W(X_N_W), .X_S(X_N_S), .X_L(X_N_L));
   arbiter_in arb_E_X(.reset(reset), .clk(clk),
                      .Req_X_N(req_E_N), .Req_X_E(req_E_E), .Req_X_W(req_E_W), .Req_X_S(req_E_S), .Req_X_L(req_E_L),
                      .X_N(X_E_N), .X_E(X_E_E), .X_W(X_E_W), .X_S(X_E_S), .X_L(X_E_L));
   arbiter_in arb_W_X(.reset(reset), .clk(clk),
                      .Req_X_N(req_W_N), .Req_X_E(req_W_E), .Req_X_W(req_W_W), .Req_X_S(req_W_S), .Req_X_L(req_W_L),
                      .X_N(X_W_N), .X_E(X_W_E), .X_W(X_W_W), .X_S(X_W_S), .X_L(X_W_L));
   arbiter_in arb_S_X(.reset(reset), .clk(clk),
                      .Req_X_N(req_S_N), .Req_X_E(req_S_E), .Req_X_W(req_S_W), .Req_X_S(req_S_S), .Req_X_L(req_S_L),
                      .X_N(X_S_N), .X_E(X_S_E), .X_W(X_S_W), .X_S(X_S_S), .X_L(X_S_L));
   arbiter_in arb_L_X(.reset(reset), .clk(clk),
                      .Req_X_N(req_L_N), .Req_X_E(req_L_E), .Req_X_W(req_L_W), .Req_X_S(req_L_S), .Req_X_L(req_L_L),
                      .X_N(X_L_N), .X_E(X_L_E), .X_W(X_L_W), .X_S(X_L_S), .X_L(X_L_L));

   // Y is N now
   arbiter_out arb_X_N(.reset(reset), .clk(clk),
                       .X_N_Y(X_N_N), .X_E_Y(X_E_N), .X_W_Y(X_W_N), .X_S_Y(X_S_N), .X_L_Y(X_L_N),
                       .credit(credit_counter_N_out),
                       .grant_Y_N(grant_N_N_sig), .grant_Y_E(grant_N_E_sig), .grant_Y_W(grant_N_W_sig),
                       .grant_Y_S(grant_N_S_sig), .grant_Y_L(grant_N_L_sig));
   // Y is E now
   arbiter_out arb_X_E(.reset(reset), .clk(clk),
                       .X_N_Y(X_N_E), .X_E_Y(X_E_E), .X_W_Y(X_W_E), .X_S_Y(X_S_E), .X_L_Y(X_L_E),
                       .credit(credit_counter_E_out), .grant_Y_N(grant_E_N_sig), .grant_Y_E(grant_E_E_sig),
                       .grant_Y_W(grant_E_W_sig), .grant_Y_S(grant_E_S_sig), .grant_Y_L(grant_E_L_sig));
   // Y is W now
   arbiter_out arb_X_W(.reset(reset), .clk(clk),
                       .X_N_Y(X_N_W), .X_E_Y(X_E_W), .X_W_Y(X_W_W), .X_S_Y(X_S_W), .X_L_Y(X_L_W),
                       .credit(credit_counter_W_out), .grant_Y_N(grant_W_N_sig), .grant_Y_E(grant_W_E_sig),
                       .grant_Y_W(grant_W_W_sig), .grant_Y_S(grant_W_S_sig), .grant_Y_L(grant_W_L_sig));
   // Y is S now
   arbiter_out arb_X_S(.reset(reset), .clk(clk),
                       .X_N_Y(X_N_S), .X_E_Y(X_E_S), .X_W_Y(X_W_S), .X_S_Y(X_S_S), .X_L_Y(X_L_S),
                       .credit(credit_counter_S_out), .grant_Y_N(grant_S_N_sig), .grant_Y_E(grant_S_E_sig),
                       .grant_Y_W(grant_S_W_sig), .grant_Y_S(grant_S_S_sig), .grant_Y_L(grant_S_L_sig));
   // Y is L now
   arbiter_out arb_X_L(.reset(reset), .clk(clk),
                       .X_N_Y(X_N_L), .X_E_Y(X_E_L), .X_W_Y(X_W_L), .X_S_Y(X_S_L), .X_L_Y(X_L_L),
                       .credit(credit_counter_L_out), .grant_Y_N(grant_L_N_sig), .grant_Y_E(grant_L_E_sig),
                       .grant_Y_W(grant_L_W_sig), .grant_Y_S(grant_L_S_sig), .grant_Y_L(grant_L_L_sig));

   assign valid_N = grant_N;
   assign valid_E = grant_E;
   assign valid_W = grant_W;
   assign valid_S = grant_S;
   assign valid_L = grant_L;

endmodule
