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

module FIFO_credit_based
  #(parameter DATA_WIDTH = 32)
   (input reset, input clk,
    input [DATA_WIDTH-1:0] RX,
    input valid_in,
    input read_en_N,
    input read_en_E,
    input read_en_W,
    input read_en_S,
    input read_en_L,
    output logic credit_out,
    output empty_out,
    output logic [DATA_WIDTH-1:0] Data_out
    );

   logic [3:0] read_pointer, read_pointer_in,  write_pointer, write_pointer_in;
   logic       full, empty;
   wire        read_en;
   logic       write_en;

   logic [DATA_WIDTH-1:0] FIFO_MEM_1, FIFO_MEM_1_in;
   logic [DATA_WIDTH-1:0] FIFO_MEM_2, FIFO_MEM_2_in;
   logic [DATA_WIDTH-1:0] FIFO_MEM_3, FIFO_MEM_3_in;
   logic [DATA_WIDTH-1:0] FIFO_MEM_4, FIFO_MEM_4_in;


   /*
    * ------------------------------------------------------------------------------------------
    *                            block diagram of the FIFO!
    * ------------------------------------------------------------------------------------------
    *   circular buffer structure
    *                                    <--- WriteP
    *               ---------------------------------
    *               |   3   |   2   |   1   |   0   |
    *               ---------------------------------
    *                                    <--- readP
    * ------------------------------------------------------------------------------------------
    */
   always_ff @(posedge clk, negedge reset) begin
      if (!reset) begin
         read_pointer  <= 'b0001;
         write_pointer <= 'b0001;

         FIFO_MEM_1 <= 0;
         FIFO_MEM_2 <= 0;
         FIFO_MEM_3 <= 0;
         FIFO_MEM_4 <= 0;

         credit_out <= 0;
      end else begin
         write_pointer <= write_pointer_in;
         read_pointer  <= read_pointer_in;
         credit_out <= 0;
         if (write_en) begin
            // write into the memory
            FIFO_MEM_1 <= FIFO_MEM_1_in;
            FIFO_MEM_2 <= FIFO_MEM_2_in;
            FIFO_MEM_3 <= FIFO_MEM_3_in;
            FIFO_MEM_4 <= FIFO_MEM_4_in;
         end
      end
      if (read_en)
        credit_out <= 1;
   end


   always_comb begin
      case (write_pointer)
        'b0001:  begin FIFO_MEM_1_in <= RX;         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; end
        'b0010:  begin FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= RX;         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; end
        'b0100:  begin FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= RX;         FIFO_MEM_4_in <= FIFO_MEM_4; end
        'b1000:  begin FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= RX;         end
        default: begin FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; end
      endcase
   end

   always_comb begin
      case (read_pointer)
        'b0001:  Data_out <= FIFO_MEM_1;
        'b0010:  Data_out <= FIFO_MEM_2;
        'b0100:  Data_out <= FIFO_MEM_3;
        'b1000:  Data_out <= FIFO_MEM_4;
        default: Data_out <= FIFO_MEM_1;
      endcase
   end

   assign read_en = (read_en_N | read_en_E | read_en_W | read_en_S | read_en_L) & ~empty;
   assign empty_out = empty;


   always_comb begin
      if (write_en)
        write_pointer_in <= {write_pointer[2:0], write_pointer[3]};
      else
        write_pointer_in <= write_pointer;
   end

   always_comb begin
      if (read_en && !empty)
        read_pointer_in <= {read_pointer[2:0], read_pointer[3]};
      else
        read_pointer_in <= read_pointer;
   end

   always_comb begin
      if (valid_in && !full)
        write_en <= 1;
      else
        write_en <= 0;
   end

   always_comb begin
      if (read_pointer == write_pointer)
        empty <= 1;
      else
        empty <= 0;

      // if write_pointer == read_pointer >> 1 then
      if (write_pointer == {read_pointer[0], read_pointer[3:1]})
        full <= 1;
      else
        full <= 0;
   end

endmodule
