// Copyright (C) 2016 Siavoosh Payandeh Azad

// Constant value
`define fake_tail 32'b10000000000000000000000000000001

// FSM states are enoded as one-hot!
`define Idle 5'b00001
`define Header_flit 5'b00010
`define Body_flit 5'b00100
`define Tail_flit 5'b01000
`define Packet_drop 5'b10000

module FIFO_credit_based (
                          reset,
                          clk,
                          RX,
                          valid_in ,
                          read_en_N,
                          read_en_E,
                          read_en_W,
                          read_en_S,
                          read_en_L,
                          credit_out,
                          empty_out,
                          Data_out,

                          fault_info, health_info
                         );

parameter DATA_WIDTH = 32;

input reset, clk;
input [DATA_WIDTH-1 : 0] RX;
input valid_in;
input read_en_N, read_en_E, read_en_W, read_en_S, read_en_L;

output reg credit_out;
output empty_out;
output reg [DATA_WIDTH-1 : 0] Data_out;
output fault_info;
output reg health_info;


reg [3:0] read_pointer, read_pointer_in,  write_pointer, write_pointer_in;
reg full, empty;
wire read_en;
reg write_en;

reg [DATA_WIDTH-1 : 0] FIFO_MEM_1, FIFO_MEM_1_in;
reg [DATA_WIDTH-1 : 0] FIFO_MEM_2, FIFO_MEM_2_in;
reg [DATA_WIDTH-1 : 0] FIFO_MEM_3, FIFO_MEM_3_in;
reg [DATA_WIDTH-1 : 0] FIFO_MEM_4, FIFO_MEM_4_in;

reg fault_info_in, fault_info_out;
reg faulty_packet_in, faulty_packet_out;
reg xor_all, fault_out;
reg [4:0] state_out, state_in; // FSM states are enoded as one-hot!
reg fake_credit, credit_in, write_fake_flit;
reg [1:0] fake_credit_counter, fake_credit_counter_in;
wire [DATA_WIDTH-2 : 0] xor_reduce_RX = RX[DATA_WIDTH-1 : 1];

// --------------------------------------------------------------------------------------------
//                           block diagram of the FIFO!


//-------------------------------------------------------------------------------------------
//  circular buffer structure
//                                   <--- WriteP
//              ---------------------------------
//              |   3   |   2   |   1   |   0   |
//              ---------------------------------
//                                   <--- readP
//-------------------------------------------------------------------------------------------
// Packet drop state machine
//                            +---+ No                     +---+  No
//                            |   | Flit                   |   |  Flit
//                            |   v                        |   v
//                 healthy  +--------+                  +--------+
//             +---header-->|        |                  |        |-------------------+
//             |         +->| Header |---Healthy body-->| Body   |------------+      |
//             |         |  +--------+                  +--------+            |      |
//             |         |     | ^  |              Healthy |   ^            Healthy  |
//             |         |     | |  |               body   |   |              Tail   |
//             |         |     | |  |                      +---+              |      |
//             |         |     | |  |                                         v      |
//         +--------+    |     | |  |                                    +--------+  |
// No  +-->|        |    |     | |  +-----------------Healthy Tail------>|        |  |
// Flit|   |  IDLE  |    |     | |                                       | Tail   |--)--+
//     +---|        |    |     | +-----------Healthy Header--------------|        |  |  |
//         +--------+    |     |                                         +--------+  |  |
//           ^  |  ^     |     Faulty            No    Faulty                        |  |
//           |  |  |     |     Flit             Flit   Flit                          |  |
//           |  |  |     |     +------------+   +---+  +---+                         |  |
//           |  |  |     + --Healthy------+ |   |   |  |   |                         |  |
//           |  |  |          header      | v   |   v  |   v                         |  |
//           |  |  |                     +------------------+                        |  |
//           |  |  +----Healthy Tail-----|     Packet       |                        |  |
//           |  +-------Faulty Flit----->|      Drop        |<-----------------------+  |
//           |                           +------------------+                           |
//           +-------------------------------------------------No Flit------------------+
//
//----------------------------------------------------------------------------------------------

   // Sequential part

   always @(posedge clk) begin
        if (reset == 0) begin
            read_pointer  <= 4'b0001;
            write_pointer <= 4'b0001;

            FIFO_MEM_1 <= { DATA_WIDTH {1'b0} }; // Make it all zeros!
            FIFO_MEM_2 <= { DATA_WIDTH {1'b0} }; // Make it all zeros!
            FIFO_MEM_3 <= { DATA_WIDTH {1'b0} }; // Make it all zeros!
            FIFO_MEM_4 <= { DATA_WIDTH {1'b0} }; // Make it all zeros!

            fake_credit_counter <= 2'b00;
            faulty_packet_out <= 0;
            credit_out <= 0;
            state_out <= `Idle;
            fault_info_out <= 0;
        end
        else begin
            write_pointer <= write_pointer_in;
            read_pointer <= read_pointer_in;
            state_out <= state_in;

            faulty_packet_out <= faulty_packet_in;
            credit_out <= credit_in;
            fake_credit_counter <= fake_credit_counter_in;

            if (write_en == 1) begin
                // write into the memory
                  FIFO_MEM_1 <= FIFO_MEM_1_in;
                  FIFO_MEM_2 <= FIFO_MEM_2_in;
                  FIFO_MEM_3 <= FIFO_MEM_3_in;
                  FIFO_MEM_4 <= FIFO_MEM_4_in;
            end

            fault_info_out <= fault_info_in;
        end
    end

 // Anything below here is pure combinational

 // Combinational part

assign fault_info = fault_info_out;

always @* begin
  fake_credit_counter_in <= fake_credit_counter;
  credit_in <= 0;

    if (fake_credit == 1 && read_en == 1)
        fake_credit_counter_in <= fake_credit_counter + 1 ;

    if (fake_credit == 1 || read_en == 1)
        credit_in <= 1;

    if (fake_credit == 0 && read_en == 0 && fake_credit_counter > 0) begin
        fake_credit_counter_in <= fake_credit_counter - 1 ;
        credit_in <= 1;
    end
end


always @* begin
  if (valid_in == 1)
    xor_all <= ^xor_reduce_RX; // XOR_REDUCE(RX(DATA_WIDTH-1 downto 1));
  else
    xor_all <= 0;
end

always @* begin
  fault_out <= 0;

  if (valid_in == 1 && xor_all != RX[0])
    fault_out <= 1;
end


    always @* begin
      // This is the default value of the memory!
      case ( write_pointer )
          4'b0001 : begin
                    FIFO_MEM_1_in <= RX;         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                    end
          4'b0010 : begin
                    FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= RX;         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                    end
          4'b0100 : begin
                    FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= RX;         FIFO_MEM_4_in <= FIFO_MEM_4;
                    end
          4'b1000 : begin
                    FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= RX;
                    end
          default : begin
                    FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                    end
      endcase

     // Some default values
     fault_info_in <= 0;
     health_info <= 0;
     fake_credit <= 0;
     state_in <= state_out;
     faulty_packet_in <= faulty_packet_out;
     write_fake_flit <= 0;

      case (state_out)
          `Idle :
            if (fault_out == 0) begin
                if (valid_in == 1)
                  state_in <= `Header_flit;
                else
                  state_in <= state_out;
            end
            else begin
              fake_credit <= 1;
              FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
              state_in <= `Packet_drop;
              fault_info_in <= 1;
              faulty_packet_in <= 1;
            end

          `Header_flit :
              if (valid_in == 1)
                if (fault_out == 0) begin
                    if (RX[DATA_WIDTH-1 : DATA_WIDTH-3] == 3'b010)
                        state_in <= `Body_flit;
                    else if (RX[DATA_WIDTH-1 : DATA_WIDTH-3] == 3'b100)
                        state_in <= `Tail_flit;
                    else
                        // We should not be here!
                        state_in <= state_out;
                end
                else begin// fault_out = 1
                    write_fake_flit <= 1;

                    case( write_pointer )
                        4'b0001 : begin
                                  FIFO_MEM_1_in <= `fake_tail;  FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                                  end
                        4'b0010 : begin
                                  FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in  <= `fake_tail; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                                  end
                        4'b0100 : begin
                                  FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in  <= FIFO_MEM_2; FIFO_MEM_3_in <= `fake_tail; FIFO_MEM_4_in <= FIFO_MEM_4;
                                  end
                        4'b1000 : begin
                                  FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in  <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= `fake_tail;
                                  end
                        default : begin
                                  FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in  <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                                  end
                    endcase

                    state_in <= `Packet_drop;
                    fault_info_in <= 1;
                    faulty_packet_in <= 1;
                end
              else
                  state_in <= state_out;

          `Body_flit :
              if (valid_in == 1)
                  if (fault_out == 0)
                        if (RX[DATA_WIDTH-1 : DATA_WIDTH-3] == 3'b010)
                            state_in <= state_out;
                        else if (RX[DATA_WIDTH-1 : DATA_WIDTH-3] == 3'b100) begin
                            state_in <= `Tail_flit;
                            health_info <= 1;
                        end
                        else
                            // We should not be here!
                            state_in <= state_out;

                else begin // fault_out = 1
                    write_fake_flit <= 1;

                    case( write_pointer )
                        4'b0001 : begin
                                    FIFO_MEM_1_in <= `fake_tail;  FIFO_MEM_2_in <= FIFO_MEM_2;  FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in  <= FIFO_MEM_4;
                                  end
                        4'b0010 : begin
                                    FIFO_MEM_1_in <=  FIFO_MEM_1; FIFO_MEM_2_in <= `fake_tail;  FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in  <= FIFO_MEM_4;
                                  end
                        4'b0100 : begin
                                    FIFO_MEM_1_in <=  FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2;  FIFO_MEM_3_in <= `fake_tail;  FIFO_MEM_4_in <= FIFO_MEM_4;
                                  end
                        4'b1000:  begin
                                    FIFO_MEM_1_in <=  FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2;  FIFO_MEM_3_in <= FIFO_MEM_3;  FIFO_MEM_4_in <= `fake_tail;
                                  end
                        default : begin
                                  FIFO_MEM_1_in <=  FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2;  FIFO_MEM_3_in <= FIFO_MEM_3;  FIFO_MEM_4_in <= FIFO_MEM_4;
                                end
                    endcase

                    state_in <= `Packet_drop;
                    fault_info_in <= 1;
                    faulty_packet_in <= 1;

                end
              else
                  state_in <= state_out;

          `Tail_flit :
              if (valid_in == 1) begin
                  if (fault_out == 0)
                      if (RX[DATA_WIDTH-1 : DATA_WIDTH-3] == 3'b001)
                          state_in <= `Header_flit;
                      else
                          state_in <= state_out;
                  else begin // fault_out = 1
                      fake_credit <= 1;
                      FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                      state_in <= `Packet_drop;
                      fault_info_in <= 1;
                      faulty_packet_in <= 1;
                  end
              end
              else
                  state_in <= `Idle;

          `Packet_drop :
            if (faulty_packet_out == 1) begin
               if (valid_in == 1 && RX[DATA_WIDTH-1 : DATA_WIDTH-3] == 3'b001 && fault_out == 0) begin
                    faulty_packet_in <= 0;
                    state_in <= `Header_flit;
                    write_fake_flit <= 1;

                    case( write_pointer )
                        4'b0001 : begin
                                  FIFO_MEM_1_in <= RX;         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                                end
                        4'b0010 : begin
                                  FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= RX;         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                                end
                        4'b0100 : begin
                                  FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= RX;         FIFO_MEM_4_in <= FIFO_MEM_4;
                                end
                        4'b1000 : begin
                                  FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= RX;
                                end
                        default : begin
                                  FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                                end
                    endcase

               end
               else if (valid_in == 1 && RX[DATA_WIDTH-1 : DATA_WIDTH-3] == 3'b100 && fault_out == 0) begin
                    FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                    faulty_packet_in <= 0;
                    state_in <= `Idle;
                    fake_credit <= 1;
               end
               else begin// fault_out might have been 1
                  if (valid_in == 1 && RX[DATA_WIDTH-1 : DATA_WIDTH-3] == 3'b001)
                      fault_info_in <= 1;

                  if (valid_in == 1)
                      fake_credit <= 1;

                  FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
                  state_in <= state_out;
               end
            end
            else
              // we should not be here!
              state_in <= state_out;

       default : state_in <= state_out;

      endcase

    end // end process


  always @* begin
    case( read_pointer )
        4'b0001 : Data_out <= FIFO_MEM_1;
        4'b0010 : Data_out <= FIFO_MEM_2;
        4'b0100 : Data_out <= FIFO_MEM_3;
        4'b1000 : Data_out <= FIFO_MEM_4;
        default : Data_out <= FIFO_MEM_1;
    endcase
  end

  assign read_en = (read_en_N | read_en_E | read_en_W | read_en_S | read_en_L) & ~empty;
  assign empty_out = empty;


  always @* begin
    if (write_en == 1)
       write_pointer_in <= {write_pointer[2 : 0], write_pointer[3]};
    else
       write_pointer_in <= write_pointer;
  end

  always @* begin
     if (read_en == 1 && empty == 0)
         read_pointer_in <= {read_pointer[2 : 0], read_pointer[3]};
     else
         read_pointer_in <= read_pointer;
  end

  always @* begin
     if ( valid_in == 1 && ((faulty_packet_out == 0 && fault_out == 0) || write_fake_flit == 1) && full == 0 )
         write_en <= 1;
     else
         write_en <= 0;
  end

  always @* begin
      if (read_pointer == write_pointer)
              empty <= 1;
      else
              empty <= 0;

      //      if write_pointer = read_pointer >> 1 then
      if ( write_pointer == {read_pointer[0], read_pointer[3 : 1]} )
              full <= 1;
      else
              full <= 0;
  end

endmodule // FIFO_credit_based
