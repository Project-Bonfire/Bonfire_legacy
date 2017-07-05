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

// Some info: https://github.com/Project-Bonfire/Bonfire/wiki/XBAR-%28Crossbar-switch%29-%28for-passing-data-to-output%29

module xbar #(parameter DATA_WIDTH = 8)
   (
    input        [DATA_WIDTH-1:0] North_in,
    input        [DATA_WIDTH-1:0] East_in,
    input        [DATA_WIDTH-1:0] West_in,
    input        [DATA_WIDTH-1:0] South_in,
    input        [DATA_WIDTH-1:0] Local_in,
    input                   [4:0] sel,
    output logic [DATA_WIDTH-1:0] Data_out
    );

   always_comb begin
      case (sel)
        'b00001: Data_out <= Local_in;
        'b00010: Data_out <= South_in;
        'b00100: Data_out <= West_in;
        'b01000: Data_out <= East_in;
        default: Data_out <= North_in;
      endcase;
   end
endmodule
