// Copyright (C) 2016 Siavoosh Payandeh Azad

module XBAR (
             North_in,
             East_in, 
             West_in, 
             South_in,
             Local_in,
             sel,
             Data_out
            );

    parameter DATA_WIDTH = 8;

    input [DATA_WIDTH-1 : 0] North_in, East_in, West_in, South_in, Local_in;
    input [4:0] sel;

    output reg [DATA_WIDTH-1 : 0] Data_out;

    always @* begin
        case (sel) 
        	5'b00001:  Data_out <= Local_in;
        	5'b00010:  Data_out <= South_in;
        	5'b00100:  Data_out <= West_in;
        	5'b01000:  Data_out <= East_in;
        	default:   Data_out <= North_in;	
        endcase
    end

endmodule