//Copyright (C) 2016 Siavoosh Payandeh Azad


`define IDLE  6'b000001
`define North 6'b000010
`define East  6'b000100
`define West  6'b001000
`define South 6'b010000
`define Local 6'b100000

// Is this like the old arbiter in the router with handshaking FC ??
module arbiter_in ( reset,
        			clk,
            		req_X_N, req_X_E, req_X_W, req_X_S, req_X_L, // From LBDR modules
            		X_N, X_E, X_W, X_S, X_L // Grants given to LBDR requests (encoded as one-hot)
            	  );

input reset, clk;
input req_X_N, req_X_E, req_X_W, req_X_S, req_X_L;

output reg X_N, X_E, X_W, X_S, X_L;

// Declaring the `Local variables
reg [5:0] state = `IDLE;
reg [5:0] state_in = `IDLE; // encoded as one-hot

// Sequential part  

always @(posedge clk) begin
	if (reset == 0)
		state <= `IDLE;
	else 
		state <= state_in;
end

// Anything below here is pure combinational

always @* begin
    X_N <= 0;
    X_E <= 0;
    X_W <= 0;
    X_S <= 0;
    X_L <= 0;
    
    case (state) 
      `IDLE: begin	   // In the arbiter for hand-shaking FC router, L had the  highest priority (L, N, E, W, S)
      			 	   // Here it seems N has the higest priority, is it fine ? 
      	if (req_X_N == 1) begin
      		state_in <= `North;
        	X_N <= 1;
        end
	    else if (req_X_E == 1) begin
	    	state_in <= `East;
	        X_E <= 1;
        end
	    else if (req_X_W == 1) begin
	    	state_in <= `West;
	        X_W <= 1;
        end
	    else if (req_X_S == 1) begin
	    	state_in <= `South;
	        X_S <= 1;
        end
	    else if (req_X_L == 1) begin
	    	state_in <= `Local;
	        X_L <= 1;
	    end
	    else
	    	state_in <= state;
	  end

      `North: begin
      	if (req_X_N == 1) begin
      		state_in <= `North;
        	X_N <= 1;
        end        	
	    else if (req_X_E == 1) begin
	    	state_in <= `East;
	        X_E <= 1;
        end
	    else if (req_X_W == 1) begin
	    	state_in <= `West;
	        X_W <= 1;
        end
	    else if (req_X_S == 1) begin
	    	state_in <= `South;
	        X_S <= 1;
        end
	    else if (req_X_L == 1) begin
	    	state_in <= `Local;
	        X_L <= 1;
	    end
	    else
	    	state_in <= state;
	  end 

      `East: begin
	    if (req_X_E == 1) begin
	    	state_in <= `East;
	        X_E <= 1;
	    end
	    else if (req_X_W == 1) begin
	    	state_in <= `West;
	        X_W <= 1;
	    end
	    else if (req_X_S == 1) begin
	    	state_in <= `South;
	        X_S <= 1;
	    end
	    else if (req_X_L == 1) begin
	    	state_in <= `Local;
	        X_L <= 1;
	    end
	    else if (req_X_N == 1 ) begin
      		state_in <= `North;
        	X_N <= 1;
	    end
	    else
	    	state_in <= state;
	  end

      `West: begin
	    if (req_X_W == 1) begin
	    	state_in <= `West;
	        X_W <= 1;
	    end
	    else if (req_X_S == 1) begin
	    	state_in <= `South;
	        X_S <= 1;
	    end
	    else if (req_X_L == 1) begin
	    	state_in <= `Local;
	        X_L <= 1;
	    end
	    else if (req_X_N == 1) begin
      		state_in <= `North;
        	X_N <= 1;
	    end
        else if (req_X_E == 1) begin
	    	state_in <= `East;
	        X_E <= 1;
	    end
	    else
	    	state_in <= state;
	  end

      `South: begin
	    if (req_X_S == 1) begin
	    	state_in <= `South;
	        X_S <= 1;
	    end
	    else if (req_X_L == 1) begin
	    	state_in <= `Local;
	        X_L <= 1;
	    end
	    else if (req_X_N == 1) begin
      		state_in <= `North;
        	X_N <= 1;
	    end
        else if (req_X_E == 1) begin
	    	state_in <= `East;
	        X_E <= 1;
	    end
	    else if (req_X_W == 1) begin
	    	state_in <= `West;
	        X_W <= 1;
	    end
	    else
	    	state_in <= state;
	  end

      default: begin // Including Local and invalid cases
	    if (req_X_L == 1) begin
	    	state_in <= `Local;
	        X_L <= 1;
	    end
	    else if (req_X_N == 1) begin
      		state_in <= `North;
        	X_N <= 1;
	    end
        else if (req_X_E == 1) begin
	    	state_in <= `East;
	        X_E <= 1;
	    end
	    else if (req_X_W == 1) begin
	    	state_in <= `West;
	        X_W <= 1;
	    end
	    else if (req_X_S == 1) begin
	    	state_in <= `South;
	        X_S <= 1;
	    end
	    else
	    	state_in <= state;
	  end
	    
    endcase // End of case

end // End of process

endmodule
