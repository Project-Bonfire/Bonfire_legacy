//Copyright (C) 2016 Siavoosh Payandeh Azad

`define IDLE  6'b000001
`define North 6'b000010
`define East  6'b000100
`define West  6'b001000
`define South 6'b010000
`define Local 6'b100000

module arbiter_out ( reset,
        			 clk,
            		 X_N_Y, X_E_Y, X_W_Y, X_S_Y, X_L_Y, // From Arbiter_in modules
            		 credit, 
            		 grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L // Grants given to Arbiter_in requests (encoded as one-hot)
            	   );

input reset, clk;
input X_N_Y, X_E_Y, X_W_Y, X_S_Y, X_L_Y;
input [1:0] credit;

output reg grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L;

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
    grant_Y_N <= 0;
    grant_Y_E <= 0;
    grant_Y_W <= 0;
    grant_Y_S <= 0;
    grant_Y_L <= 0;
    
    case (state) 
      `IDLE: begin	   // In the arbiter for hand-shaking FC router, L had the  highest priority (L, N, E, W, S)
      			 	   // Here it seems N has the higest priority, is it fine ? 
      	if (X_N_Y == 1) 
      		state_in <= `North;
	    else if (X_E_Y == 1)
	    	state_in <= `East;
	    else if (X_W_Y == 1)
	    	state_in <= `West;
	    else if (X_S_Y == 1)
	    	state_in <= `South;
	    else if (X_L_Y == 1)
	    	state_in <= `Local;
	    else
	    	state_in <= `IDLE;
	  end

      `North: begin
      	if (credit != 2'b00 && X_N_Y == 1)
            grant_Y_N <= 1;

      	if (X_N_Y == 1)
      		state_in <= `North;
	    else if (X_E_Y == 1)
	    	state_in <= `East;
	    else if (X_W_Y == 1)
	    	state_in <= `West;
	    else if (X_S_Y == 1)
	    	state_in <= `South;
	    else if (X_L_Y == 1)
	    	state_in <= `Local;
	    else
	    	state_in <= `IDLE;
	  end 

      `East: begin
      	if (credit != 2'b00 && X_E_Y == 1)
            grant_Y_E <= 1;

	    if (X_E_Y == 1)
	    	state_in <= `East;
	    else if (X_W_Y == 1)
	    	state_in <= `West;
	    else if (X_S_Y == 1)
	    	state_in <= `South;
	    else if (X_L_Y == 1)
	    	state_in <= `Local;
	    else if (X_N_Y == 1 )
      		state_in <= `North;
	    else
	    	state_in <= `IDLE;
	  end

      `West: begin
      	if (credit != 2'b00 && X_W_Y == 1)
            grant_Y_W <= 1;

	    if (X_W_Y == 1)
	    	state_in <= `West;
	    else if (X_S_Y == 1)
	    	state_in <= `South;
	    else if (X_L_Y == 1)
	    	state_in <= `Local;
	    else if (X_N_Y == 1)
      		state_in <= `North;
        else if (X_E_Y == 1)
	    	state_in <= `East;
	    else
	    	state_in <= `IDLE;
	  end

      `South: begin
      	if (credit != 2'b00 && X_S_Y == 1)
            grant_Y_S <= 1;

	    if (X_S_Y == 1)
	    	state_in <= `South;
	    else if (X_L_Y == 1)
	    	state_in <= `Local;
	    else if (X_N_Y == 1)
      		state_in <= `North;
        else if (X_E_Y == 1)
	    	state_in <= `East;
	    else if (X_W_Y == 1)
	    	state_in <= `West;
	    else
	    	state_in <= `IDLE;
	  end

      default: begin // Including Local and invalid cases
      	if (credit != 2'b00 && X_L_Y == 1)
            grant_Y_L <= 1;

	    if (X_L_Y == 1)
	    	state_in <= `Local;
	    else if (X_N_Y == 1)
      		state_in <= `North;
        else if (X_E_Y == 1)
	    	state_in <= `East;
	    else if (X_W_Y == 1)
	    	state_in <= `West;
	    else if (X_S_Y == 1)
	    	state_in <= `South;
	    else
	    	state_in <= `IDLE;
	  end
	    
    endcase // End of case

end // End of process

endmodule
