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

module arbiter_in(input reset, input clk,
                  input Req_X_N, Req_X_E, Req_X_W, Req_X_S, Req_X_L, // From LBDR modules
                  output logic X_N, X_E, X_W, X_S, X_L // Grants given to LBDR requests (encoded as one-hot)
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
      X_N <= 0;
      X_E <= 0;
      X_W <= 0;
      X_S <= 0;
      X_L <= 0;

      case (state)
        `IDLE: begin
           if      (Req_X_N) begin state_in <= `North; X_N <= 1; end
           else if (Req_X_E) begin state_in <= `East;  X_E <= 1; end
           else if (Req_X_W) begin state_in <= `West;  X_W <= 1; end
           else if (Req_X_S) begin state_in <= `South; X_S <= 1; end
           else if (Req_X_L) begin state_in <= `Local; X_L <= 1; end
           else                    state_in <= state;
        end

        `North: begin
           if      (Req_X_N) begin state_in <= `North; X_N <= 1; end
           else if (Req_X_E) begin state_in <= `East;  X_E <= 1; end
           else if (Req_X_W) begin state_in <= `West;  X_W <= 1; end
           else if (Req_X_S) begin state_in <= `South; X_S <= 1; end
           else if (Req_X_L) begin state_in <= `Local; X_L <= 1; end
           else                    state_in <= state;
        end

        `East: begin
           if      (Req_X_E) begin state_in <= `East;  X_E <= 1; end
           else if (Req_X_W) begin state_in <= `West;  X_W <= 1; end
           else if (Req_X_S) begin state_in <= `South; X_S <= 1; end
           else if (Req_X_L) begin state_in <= `Local; X_L <= 1; end
           else if (Req_X_N) begin state_in <= `North; X_N <= 1; end
           else                    state_in <= state;
        end

        `West: begin
           if      (Req_X_W) begin state_in <= `West;  X_W <= 1; end
           else if (Req_X_S) begin state_in <= `South; X_S <= 1; end
           else if (Req_X_L) begin state_in <= `Local; X_L <= 1; end
           else if (Req_X_N) begin state_in <= `North; X_N <= 1; end
           else if (Req_X_E) begin state_in <= `East;  X_E <= 1; end
           else                    state_in <= state;
        end

        `South: begin
           if      (Req_X_S) begin state_in <= `South; X_S <= 1; end
           else if (Req_X_L) begin state_in <= `Local; X_L <= 1; end
           else if (Req_X_N) begin state_in <= `North; X_N <= 1; end
           else if (Req_X_E) begin state_in <= `East;  X_E <= 1; end
           else if (Req_X_W) begin state_in <= `West;  X_W <= 1; end
           else                    state_in <= state;
        end

        default: begin // `Local or anything else
           if      (Req_X_L) begin state_in <= `Local; X_L <= 1; end
           else if (Req_X_N) begin state_in <= `North; X_N <= 1; end
           else if (Req_X_E) begin state_in <= `East;  X_E <= 1; end
           else if (Req_X_W) begin state_in <= `West;  X_W <= 1; end
           else if (Req_X_S) begin state_in <= `South; X_S <= 1; end
           else                    state_in <= state;
        end
      endcase
   end
endmodule
