/********************
* Filename:	    LBDR_packet_drop.v
* Description:  LBDR with packet dropping
*
* $Revision:
* $Id:
* $Date:
* $Author:
*********************/


module LBDR_packet_drop (reset,
						 clk,

			             Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S,

			             empty,
			             flit_type,
			             dst_addr,
			             faulty,
			             packet_drop_order,
			             grant_N, grant_E, grant_W, grant_S, grant_L,
			             Req_N, Req_E, Req_W, Req_S, Req_L,

			             Rxy_reconf_PE,
			             Cx_reconf_PE,
			             Reconfig_command
			            );

  parameter cur_addr_rst = 8;
  parameter Rxy_rst = 60;
  parameter Cx_rst = 15;
  parameter NoC_size = 2;

  input reset, clk;
  input Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S;
  input empty;
  input [2:0] flit_type;
  input [NoC_size-1 : 0] dst_addr;
  input faulty;
  input grant_N, grant_E, grant_W, grant_S, grant_L;
  input [7:0] Rxy_reconf_PE;
  input [3:0] Cx_reconf_PE;
  input Reconfig_command;

  output packet_drop_order;
  output Req_N, Req_E, Req_W, Req_S, Req_L;

  // Declaring the local variables
  // Not sure, but if something gets a value in a process, make it reg !
  reg [3:0] Cx, Cx_in;
  reg [3:0] Temp_Cx, Temp_Cx_in;

  reg reconfig_cx, reconfig_cx_in;
  reg ReConf_FF_in, ReConf_FF_out;

  reg [7:0] Rxy, Rxy_in;
  reg [7:0] Rxy_tmp, Rxy_tmp_in;

  reg Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in;
  reg Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF;
  reg packet_drop, packet_drop_in;

  // Actual code starts from here

  wire grants = grant_N | grant_E | grant_W | grant_S | grant_L;

  wire [NoC_size-1 : 0] cur_addr = cur_addr_rst;

  wire N1 = ( dst_addr[NoC_size-1 : NoC_size/2] < cur_addr[NoC_size-1 : NoC_size/2] ) ? 1'b1 : 1'b0;
  wire E1 = ( cur_addr[(NoC_size/2)-1 : 0] < dst_addr[(NoC_size/2)-1 : 0] ) ? 1'b1 : 1'b0;
  wire W1 = ( dst_addr[(NoC_size/2)-1 : 0] < cur_addr[(NoC_size/2)-1 : 0] ) ? 1'b1 : 1'b0;
  wire S1 = ( cur_addr[NoC_size-1 : NoC_size/2] < dst_addr[NoC_size-1 : NoC_size/2] ) ? 1'b1 : 1'b0;


  // Sequential part

	always @(posedge clk) begin
	  if (reset == 0) begin
	  	  Rxy <= Rxy_rst;
	  	  Rxy_tmp <= { 8 {1'b0} };

	  	  Req_N_FF <= 0;
	  	  Req_E_FF <= 0;
	  	  Req_W_FF <= 0;
	  	  Req_S_FF <= 0;
	  	  Req_L_FF <= 0;
	  	  Cx <= Cx_rst;
	  	  Temp_Cx <= { 4 {1'b0} }; // Make it all zeros!
	  	  ReConf_FF_out <= 0;
	  	  reconfig_cx <= 0;
	  	  packet_drop <= 0;
	  end
	  else begin
	  	  Rxy <= Rxy_in;
	  	  Rxy_tmp <=  Rxy_tmp_in;

	  	  Req_N_FF <= Req_N_in;
	  	  Req_E_FF <= Req_E_in;
	  	  Req_W_FF <= Req_W_in;
	  	  Req_S_FF <= Req_S_in;
	  	  Req_L_FF <= Req_L_in;
	  	  ReConf_FF_out <= ReConf_FF_in;
	  	  Cx <= Cx_in;
	  	  reconfig_cx <= reconfig_cx_in;
	  	  Temp_Cx <= Temp_Cx_in;
	  	  packet_drop <= packet_drop_in;
	  end
	end

	//Anything below is combinational

	always @* begin
	  if (ReConf_FF_out == 1 && flit_type == 3'b001 && empty == 0 && grants == 1) begin // Header flit
		  	Rxy_in <= Rxy_tmp;
		  	ReConf_FF_in <= 0;
	  end
	  else begin
		Rxy_in <= Rxy;
		if (Reconfig_command == 1) begin
			Rxy_tmp_in <= Rxy_reconf_PE;
			ReConf_FF_in <= 1;
		end
		else begin
		    Rxy_tmp_in <= Rxy_tmp;
			ReConf_FF_in <= ReConf_FF_out;
		end
	  end
	end


	always @* begin
	  Temp_Cx_in <= Temp_Cx;
	  if (reconfig_cx == 1 && flit_type == 3'b100 && empty == 0 && grants == 1) begin
	    Cx_in <= Temp_Cx;
	    reconfig_cx_in <= 0;
	  end
	  else begin
	    Cx_in <= Cx;
	    if ( (Faulty_C_N | Faulty_C_E | Faulty_C_W | Faulty_C_S) == 1 ) begin
	      reconfig_cx_in <= 1;
	      Temp_Cx_in <= (~{Faulty_C_S, Faulty_C_W, Faulty_C_E, Faulty_C_N}) & Cx;
	    end
	    else if (Reconfig_command == 1) begin
			reconfig_cx_in <= 1;
			Temp_Cx_in <= Cx_reconf_PE;
	    end
	    else
	    	reconfig_cx_in <= reconfig_cx;
	  end
	end

	assign Req_N = Req_N_FF;
	assign Req_E = Req_E_FF;
	assign Req_W = Req_W_FF;
	assign Req_S = Req_S_FF;
	assign Req_L = Req_L_FF;

	always @* begin
 		packet_drop_in <= packet_drop;
 		if (flit_type == 3'b001 && empty == 0) begin
	        Req_N_in <= ((N1 & ~E1 & ~W1) | (N1 & E1 & Rxy[0]) | (N1 & W1 & Rxy[1])) & Cx[0];
	        Req_E_in <= ((E1 & ~N1 & ~S1) | (E1 & N1 & Rxy[2]) | (E1 & S1 & Rxy[3])) & Cx[1];
	        Req_W_in <= ((W1 & ~N1 & ~S1) | (W1 & N1 & Rxy[4]) | (W1 & S1 & Rxy[5])) & Cx[2];
	        Req_S_in <= ((S1 & ~E1 & ~W1) | (S1 & E1 & Rxy[6]) | (S1 & W1 & Rxy[7])) & Cx[3];

	        if (dst_addr == cur_addr)
				Req_L_in <= 1;
	        else
				Req_L_in <= 0; //  Added to remove latch possibility. Correct ??

			if ( faulty == 1 || ( ((((N1 & ~E1 & ~W1) | (N1 & E1 & Rxy[0]) | (N1 & W1 & Rxy[1])) & Cx[0]) == 0) &&
			                      ((((E1 & ~N1 & ~S1) | (E1 & N1 & Rxy[2]) | (E1 & S1 & Rxy[3])) & Cx[1]) == 0) &&
			                      ((((W1 & ~N1 & ~S1) | (W1 & N1 & Rxy[4]) | (W1 & S1 & Rxy[5])) & Cx[2]) == 0) &&
			                      ((((S1 & ~E1 & ~W1) | (S1 & E1 & Rxy[6]) | (S1 & W1 & Rxy[7])) & Cx[3]) == 0) &&
			                      (dst_addr != cur_addr) ) ) begin
				packet_drop_in <= 1;
				Req_N_in <= 0;
				Req_E_in <= 0;
				Req_W_in <= 0;
				Req_S_in <= 0;
				Req_L_in <= 0;
		 	end
	    end
		else if (flit_type == 3'b100 && empty == 0 && grants == 1) begin
	        Req_N_in <= 0;
	        Req_E_in <= 0;
	        Req_W_in <= 0;
	        Req_S_in <= 0;
	        Req_L_in <= 0;
	    end
		else begin
		    Req_N_in <= Req_N_FF;
		    Req_E_in <= Req_E_FF;
		    Req_W_in <= Req_W_FF;
		    Req_S_in <= Req_S_FF;
		    Req_L_in <= Req_L_FF;
		end

		if (flit_type == 3'b100 && empty == 0) begin
			if (packet_drop == 1)
				packet_drop_in <= 0;
		end
	end // End of process

	assign packet_drop_order = packet_drop;

endmodule