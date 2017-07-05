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

// Some info: https://github.com/Project-Bonfire/Bonfire/wiki/Allocator-%28for-arbitration%29

`define IDLE  'b000001
`define North 'b000010
`define East  'b000100
`define West  'b001000
`define South 'b010000
`define Local 'b100000

module arbiter_out(input reset, input clk,
                   input X_N_Y, X_E_Y, X_W_Y, X_S_Y, X_L_Y, // From LBDR modules
                   input [1:0] credit,
                   // Grants given to LBDR requests (encoded as one-hot)
                   output logic grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L
                   );

   logic [5:0] state    = `IDLE;
   logic [5:0] state_in = `IDLE;

   always_ff @(posedge clk, negedge reset) begin
      if (!reset)
        state <= `IDLE;
      else
        state <= state_in;
   end

   always_comb begin
      grant_Y_N <= 0;
      grant_Y_E <= 0;
      grant_Y_W <= 0;
      grant_Y_S <= 0;
      grant_Y_L <= 0;

      case (state)
        `IDLE: begin
           if      (X_N_Y) state_in <= `North;
           else if (X_E_Y) state_in <= `East;
           else if (X_W_Y) state_in <= `West;
           else if (X_S_Y) state_in <= `South;
           else if (X_L_Y) state_in <= `Local;
           else            state_in <= `IDLE;
        end

        `North: begin
           if (credit && X_N_Y)
             grant_Y_N <= 1;

           if      (X_N_Y) state_in <= `North;
           else if (X_E_Y) state_in <= `East;
           else if (X_W_Y) state_in <= `West;
           else if (X_S_Y) state_in <= `South;
           else if (X_L_Y) state_in <= `Local;
           else            state_in <= `IDLE;
        end

        `East: begin
           if (credit && X_E_Y)
             grant_Y_E <= 1;

           if      (X_E_Y) state_in <= `East;
           else if (X_W_Y) state_in <= `West;
           else if (X_S_Y) state_in <= `South;
           else if (X_L_Y) state_in <= `Local;
           else if (X_N_Y) state_in <= `North;
           else            state_in <= `IDLE;
        end

        `West: begin
           if (credit && X_W_Y)
             grant_Y_W <= 1;

           if      (X_W_Y) state_in <= `West;
           else if (X_S_Y) state_in <= `South;
           else if (X_L_Y) state_in <= `Local;
           else if (X_N_Y) state_in <= `North;
           else if (X_E_Y) state_in <= `East;
           else            state_in <= `IDLE;
        end

        `South: begin
           if (credit && X_S_Y)
             grant_Y_S <= 1;

           if      (X_S_Y) state_in <= `South;
           else if (X_L_Y) state_in <= `Local;
           else if (X_N_Y) state_in <= `North;
           else if (X_E_Y) state_in <= `East;
           else if (X_W_Y) state_in <= `West;
           else            state_in <= `IDLE;
        end

        default: begin // `Local or anything else
           if (credit && X_L_Y)
             grant_Y_L <= 1;

           if      (X_L_Y) state_in <= `Local;
           else if (X_N_Y) state_in <= `North;
           else if (X_E_Y) state_in <= `East;
           else if (X_W_Y) state_in <= `West;
           else if (X_S_Y) state_in <= `South;
           else            state_in <= `IDLE;
        end
      endcase
   end
endmodule
