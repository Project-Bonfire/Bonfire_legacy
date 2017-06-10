//  Copyright (C) 2016 Siavoosh Payandeh Azad, Behrad Niazmand
//  This design is based on the proposed method, discussed in the following publication:
//  "A Fault Prediction Module for a Fault Tolerant NoC Operation" 
//  by Silveira, J.; Bodin, M.; Ferreira, J.M.; Cadore Pinheiro, A.; Webber, T.; Marcon, C.

`define Healthy_state 3'b001
`define Intermittent_state 3'b010
`define Faulty_state 3'b100

module counter_threshold_classifier (  
									 reset,
									 clk,
									 faulty_packet, Healthy_packet,
									 Healthy, Intermittent, Faulty
            						);

parameter counter_depth = 8;
parameter healthy_counter_threshold = 4;
parameter faulty_counter_threshold = 4;

input reset, clk; 
input faulty_packet, Healthy_packet; 

output reg Healthy, Intermittent, Faulty;

reg [counter_depth-1 : 0] faulty_counter_in, faulty_counter_out;
reg [counter_depth-1 : 0] healthy_counter_in, healthy_counter_out;
reg NET; // no error threshold
reg DET; // detected error threshold
reg reset_counters;
reg [2:0] state, next_state; // Encoding FSM states as one-hot!



// Begin

// Sequential part 

always @(posedge clk) begin
	if (reset == 0) begin
		faulty_counter_out <=  { counter_depth {1'b0} }; // Make it all zeros!
		healthy_counter_out <=  { counter_depth {1'b0} }; // Make it all zeros!
		state <= `Healthy_state;
	end
	else begin 
		faulty_counter_out <= faulty_counter_in;
		healthy_counter_out <= healthy_counter_in;
		state <= next_state;
	end
end


// Combinational part

always @* begin
  if (reset_counters == 1) 
      faulty_counter_in <= { counter_depth {1'b0} }; // Make it all zeros!
  else if (faulty_packet == 1) 
      faulty_counter_in <= faulty_counter_out + 1;
  else
      faulty_counter_in <= faulty_counter_out;
end


always @* begin
  if (reset_counters == 1) 
      healthy_counter_in <= { counter_depth {1'b0} }; // Make it all zeros!
  else if (Healthy_packet == 1) 
      healthy_counter_in <= healthy_counter_out + 1;
  else
      healthy_counter_in <= healthy_counter_out;
end


always @* begin
  reset_counters <= 0;
  DET <= 0;
  NET <= 0;
  
  if (healthy_counter_out == healthy_counter_threshold) begin 
      NET <= 1;
      reset_counters <= 1;
  end

 if (faulty_counter_out == faulty_counter_threshold) begin 
      DET <= 1;
      reset_counters <= 1;
  end
end  


always @* begin
  Healthy <= 0; 
  Intermittent <= 0; 
  Faulty <= 0;
  case (state)
      `Healthy_state: begin
            if (NET == 1) 
              next_state <= `Healthy_state;
            else if (DET == 1) begin
              next_state <= `Intermittent_state;
              Intermittent <= 1; 
            end
            else
              next_state <= `Healthy_state;
      end

      `Intermittent_state: begin
            if (NET == 1)  begin
              next_state <= `Healthy_state;
              Healthy <= 1; 
            end
            else if (DET == 1) begin
              next_state <= `Faulty_state;
              Faulty <= 1;
            end
            else
              next_state <= `Intermittent_state; 
      end 
            
      `Faulty_state: begin
      		next_state <= `Faulty_state;
      end

      default: begin 
            next_state <= `Healthy_state;
            Healthy <= 1; 
      end

  endcase
end

endmodule // counter_threshold_classifier;
