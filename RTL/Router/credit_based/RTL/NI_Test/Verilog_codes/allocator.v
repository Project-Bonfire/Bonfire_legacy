// Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

`include "arbiter_in.v"
`include "arbiter_out.v"

module allocator (      
                  reset, 
                  clk, 
                  // Flow control
                  credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L, 

                  Req_N_N, Req_N_E, Req_N_W, Req_N_S, Req_N_L, 
                  Req_E_N, Req_E_E, Req_E_W, Req_E_S, Req_E_L, 
                  Req_W_N, Req_W_E, Req_W_W, Req_W_S, Req_W_L, 
                  Req_S_N, Req_S_E, Req_S_W, Req_S_S, Req_S_L, 
                  Req_L_N, Req_L_E, Req_L_W, Req_L_S, Req_L_L, 

                  empty_N, empty_E, empty_W, empty_S, empty_L, 
                  // grant_X_Y means the grant for X output port towards Y input port
                  // this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
                  valid_N, valid_E, valid_W, valid_S, valid_L, 

                  grant_N_N, grant_N_E, grant_N_W, grant_N_S, grant_N_L, 
                  grant_E_N, grant_E_E, grant_E_W, grant_E_S, grant_E_L, 
                  grant_W_N, grant_W_E, grant_W_W, grant_W_S, grant_W_L, 
                  grant_S_N, grant_S_E, grant_S_W, grant_S_S, grant_S_L, 
                  grant_L_N, grant_L_E, grant_L_W, grant_L_S, grant_L_L
                 );

input reset, clk;
input credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L;
input Req_N_N, Req_N_E, Req_N_W, Req_N_S, Req_N_L;
input Req_E_N, Req_E_E, Req_E_W, Req_E_S, Req_E_L;
input Req_W_N, Req_W_E, Req_W_W, Req_W_S, Req_W_L;
input Req_S_N, Req_S_E, Req_S_W, Req_S_S, Req_S_L;
input Req_L_N, Req_L_E, Req_L_W, Req_L_S, Req_L_L;
input empty_N, empty_E, empty_W, empty_S, empty_L;

output valid_N, valid_E, valid_W, valid_S, valid_L; 
output grant_N_N, grant_N_E, grant_N_W, grant_N_S, grant_N_L;
output grant_E_N, grant_E_E, grant_E_W, grant_E_S, grant_E_L;
output grant_W_N, grant_W_E, grant_W_W, grant_W_S, grant_W_L;
output grant_S_N, grant_S_E, grant_S_W, grant_S_S, grant_S_L;
output grant_L_N, grant_L_E, grant_L_W, grant_L_S, grant_L_L;


// So the idea is that we should have counters that keep track of credit!
reg [1:0] credit_counter_N_in, credit_counter_N_out;
reg [1:0] credit_counter_E_in, credit_counter_E_out;
reg [1:0] credit_counter_W_in, credit_counter_W_out;
reg [1:0] credit_counter_S_in, credit_counter_S_out;
reg [1:0] credit_counter_L_in, credit_counter_L_out;

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

  
// Sequential part
always @(posedge clk)
begin
	if (reset == 0) begin 
		// we start with all full cradit
	 	credit_counter_N_out <= 2'b11;
		credit_counter_E_out <= 2'b11;
		credit_counter_W_out <= 2'b11;
		credit_counter_S_out <= 2'b11;
		credit_counter_L_out <= 2'b11;
  end 
	else begin 
		credit_counter_N_out <= credit_counter_N_in;
		credit_counter_E_out <= credit_counter_E_in;
		credit_counter_W_out <= credit_counter_W_in;
		credit_counter_S_out <= credit_counter_S_in;
		credit_counter_L_out <= credit_counter_L_in;
	end
end
 
// Combinational part

// Output grants get value here!
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


assign grant_N =  (grant_N_N_sig & ~empty_N ) | (grant_N_E_sig & ~empty_E) | (grant_N_W_sig & ~empty_W) | (grant_N_S_sig & ~empty_S) | (grant_N_L_sig & ~empty_L);
assign grant_E =  (grant_E_N_sig & ~empty_N ) | (grant_E_E_sig & ~empty_E) | (grant_E_W_sig & ~empty_W) | (grant_E_S_sig & ~empty_S) | (grant_E_L_sig & ~empty_L);
assign grant_W =  (grant_W_N_sig & ~empty_N ) | (grant_W_E_sig & ~empty_E) | (grant_W_W_sig & ~empty_W) | (grant_W_S_sig & ~empty_S) | (grant_W_L_sig & ~empty_L);
assign grant_S =  (grant_S_N_sig & ~empty_N ) | (grant_S_E_sig & ~empty_E) | (grant_S_W_sig & ~empty_W) | (grant_S_S_sig & ~empty_S) | (grant_S_L_sig & ~empty_L);
assign grant_L =  (grant_L_N_sig & ~empty_N ) | (grant_L_E_sig & ~empty_E) | (grant_L_W_sig & ~empty_W) | (grant_L_S_sig & ~empty_S) | (grant_L_L_sig & ~empty_L);


// This process handles the credit counters!
always @*
begin
    credit_counter_N_in <= credit_counter_N_out;
    credit_counter_E_in <= credit_counter_E_out;
    credit_counter_W_in <= credit_counter_W_out;
    credit_counter_S_in <= credit_counter_S_out;
    credit_counter_L_in <= credit_counter_L_out;

    if (credit_in_N == 1 && grant_N == 1) 
        credit_counter_N_in <= credit_counter_N_out; 
    else if (credit_in_N == 1  && credit_counter_N_out < 3)
        credit_counter_N_in <= credit_counter_N_out + 1;
    else if (grant_N == 1 && credit_counter_N_out > 0)
        credit_counter_N_in <= credit_counter_N_out - 1;


    if (credit_in_E == 1 && grant_E == 1) 
        credit_counter_E_in <= credit_counter_E_out; 
    else if (credit_in_E == 1 && credit_counter_E_out < 3) 
        credit_counter_E_in <= credit_counter_E_out + 1;
    else if (grant_E == 1 && credit_counter_E_out > 0)
        credit_counter_E_in <= credit_counter_E_out - 1;

    if (credit_in_W == 1 && grant_W == 1) 
        credit_counter_W_in <= credit_counter_W_out; 
    else if (credit_in_W == 1 && credit_counter_W_out < 3) 
        credit_counter_W_in <= credit_counter_W_out + 1;
    else if (grant_W == 1 && credit_counter_W_out > 0)
        credit_counter_W_in <= credit_counter_W_out - 1;

    if (credit_in_S == 1 && grant_S == 1) 
        credit_counter_S_in <= credit_counter_S_out; 
    else if (credit_in_S == 1 && credit_counter_S_out < 3) 
        credit_counter_S_in <= credit_counter_S_out + 1;
    else if (grant_S == 1 && credit_counter_S_out > 0)
        credit_counter_S_in <= credit_counter_S_out - 1;

    if (credit_in_L == 1 && grant_L == 1) 
        credit_counter_L_in <= credit_counter_L_out; 
    else if (credit_in_L == 1 && credit_counter_L_out < 3) 
        credit_counter_L_in <= credit_counter_L_out + 1;
    else if (grant_L == 1 && credit_counter_L_out > 0)
        credit_counter_L_in <= credit_counter_L_out - 1;
end


// Arbiter_in modules instantiation
arbiter_in    arb_N_X (reset, clk, 
				       Req_N_N, Req_N_E, Req_N_W, Req_N_S, Req_N_L,
                       X_N_N, X_N_E, X_N_W, X_N_S, X_N_L);

arbiter_in    arb_E_X (reset, clk,
				       Req_E_N, Req_E_E, Req_E_W, Req_E_S, Req_E_L,
                       X_E_N, X_E_E, X_E_W, X_E_S, X_E_L);

arbiter_in    arb_W_X (reset, clk,
                       Req_W_N, Req_W_E, Req_W_W, Req_W_S, Req_W_L,
                       X_W_N, X_W_E, X_W_W, X_W_S, X_W_L);

arbiter_in    arb_S_X (reset, clk,
                       Req_S_N, Req_S_E, Req_S_W, Req_S_S, Req_S_L,
                       X_S_N, X_S_E, X_S_W, X_S_S, X_S_L);

arbiter_in    arb_L_X (reset, clk,
                       Req_L_N, Req_L_E, Req_L_W, Req_L_S, Req_L_L,
                       X_L_N, X_L_E, X_L_W, X_L_S, X_L_L);


// Arbiter_out modules instantiation
// Y is N now
arbiter_out     arb_X_N (reset, clk,
                         X_N_N, X_E_N, X_W_N, X_S_N, X_L_N, 
                         credit_counter_N_out,
                         grant_N_N_sig, 
                         grant_N_E_sig, 
                         grant_N_W_sig, 
                         grant_N_S_sig, 
                         grant_N_L_sig);

// Y is E now
arbiter_out     arb_X_E (reset, clk,
                         X_N_E, X_E_E, X_W_E, X_S_E, X_L_E, 
                         credit_counter_E_out,
                         grant_E_N_sig, 
                         grant_E_E_sig, 
                         grant_E_W_sig, 
                         grant_E_S_sig, 
                         grant_E_L_sig);

// Y is W now
arbiter_out     arb_X_W (reset, clk,
                         X_N_W, X_E_W, X_W_W, X_S_W, X_L_W, 
                         credit_counter_W_out,
                         grant_W_N_sig, 
                         grant_W_E_sig, 
                         grant_W_W_sig, 
                         grant_W_S_sig, 
                         grant_W_L_sig);

// Y is S now
arbiter_out     arb_X_S (reset, clk, 
                         X_N_S, X_E_S, X_W_S, X_S_S, X_L_S, 
                         credit_counter_S_out,
                         grant_S_N_sig, 
                         grant_S_E_sig, 
                         grant_S_W_sig, 
                         grant_S_S_sig, 
                         grant_S_L_sig);

// Y is L now
arbiter_out     arb_X_L (reset, clk, 
                         X_N_L, X_E_L, X_W_L, X_S_L, X_L_L, 
                         credit_counter_L_out,
                         grant_L_N_sig, 
                         grant_L_E_sig, 
                         grant_L_W_sig, 
                         grant_L_S_sig, 
                         grant_L_L_sig);

// Valid output ports

assign valid_N = grant_N;
assign valid_E = grant_E;
assign valid_W = grant_W;
assign valid_S = grant_S;
assign valid_L = grant_L;
 
endmodule
