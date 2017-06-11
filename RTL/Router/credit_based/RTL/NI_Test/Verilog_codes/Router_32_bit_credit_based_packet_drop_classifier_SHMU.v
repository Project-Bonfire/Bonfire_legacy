// Copyright (C) 2016 Siavoosh Payandeh Azad


// Credit-based Router with fault classifier and packet-dropping
module router_credit_based_PD_C_SHMU  (
									    reset, clk,

									    RX_N, RX_E, RX_W, RX_S, RX_L,
									    credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L,
									    valid_in_N, valid_in_E, valid_in_W, valid_in_S, valid_in_L,
									    valid_out_N, valid_out_E, valid_out_W, valid_out_S, valid_out_L,
									    credit_out_N, credit_out_E, credit_out_W, credit_out_S, credit_out_L,
									    TX_N, TX_E, TX_W, TX_S, TX_L,

									    Faulty_N_in, Faulty_E_in, Faulty_W_in, Faulty_S_in,
									    Faulty_N_out, Faulty_E_out, Faulty_W_out, Faulty_S_out,

									    // should be connected to NI
									    link_faults,
									    turn_faults,

									    Rxy_reconf_PE,
									    Cx_reconf_PE,
									    Reconfig_command
									  ); 


    parameter DATA_WIDTH = 32;
    parameter current_address = 5;
    parameter Rxy_rst = 60;
    parameter Cx_rst = 15;
    parameter healthy_counter_threshold = 8;
    parameter faulty_counter_threshold = 2;
    parameter counter_depth = 4;
    parameter NoC_size = 4;

    input reset, clk;
    input [DATA_WIDTH-1 : 0] RX_N, RX_E, RX_W, RX_S, RX_L;
    input credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L;
    input valid_in_N, valid_in_E, valid_in_W, valid_in_S, valid_in_L;
	input Faulty_N_in, Faulty_E_in, Faulty_W_in, Faulty_S_in;
	input [7:0] Rxy_reconf_PE;
	input [3:0] Cx_reconf_PE;
	input Reconfig_command;

    output valid_out_N, valid_out_E, valid_out_W, valid_out_S, valid_out_L; 
    output credit_out_N, credit_out_E, credit_out_W, credit_out_S, credit_out_L;
    output [DATA_WIDTH-1 : 0] TX_N, TX_E, TX_W, TX_S, TX_L;       
	output Faulty_N_out, Faulty_E_out, Faulty_W_out, Faulty_S_out;
	output [4:0]  link_faults;
	output [19:0] turn_faults;

  	wire [DATA_WIDTH-1 : 0] FIFO_D_out_N, FIFO_D_out_E, FIFO_D_out_W, FIFO_D_out_S, FIFO_D_out_L;

    // Grant_XY : Grant signal generated from Arbiter for output X connected to FIFO of input Y
 	wire Grant_NN, Grant_NE, Grant_NW, Grant_NS, Grant_NL;
 	wire Grant_EN, Grant_EE, Grant_EW, Grant_ES, Grant_EL;
 	wire Grant_WN, Grant_WE, Grant_WW, Grant_WS, Grant_WL;
 	wire Grant_SN, Grant_SE, Grant_SW, Grant_SS, Grant_SL;
 	wire Grant_LN, Grant_LE, Grant_LW, Grant_LS, Grant_LL;

 	wire Req_NN, Req_EN, Req_WN, Req_SN, Req_LN;
 	wire Req_NE, Req_EE, Req_WE, Req_SE, Req_LE;
 	wire Req_NW, Req_EW, Req_WW, Req_SW, Req_LW;
 	wire Req_NS, Req_ES, Req_WS, Req_SS, Req_LS;
 	wire Req_NL, Req_EL, Req_WL, Req_SL, Req_LL;

    wire empty_N, empty_E, empty_W, empty_S, empty_L; 

 	wire [4:0] Xbar_sel_N, Xbar_sel_E, Xbar_sel_W, Xbar_sel_S, Xbar_sel_L;

    wire LBDR_Fault_N, LBDR_Fault_E, LBDR_Fault_W, LBDR_Fault_S, LBDR_Fault_L;
    
    wire faulty_packet_N, faulty_packet_E, faulty_packet_W, faulty_packet_S, faulty_packet_L;
    wire healthy_packet_N, healthy_packet_E, healthy_packet_W, healthy_packet_S, healthy_packet_L;

    wire packet_drop_order_N, packet_drop_order_E, packet_drop_order_W, packet_drop_order_S, packet_drop_order_L;

    wire healthy_link_N, healthy_link_E, healthy_link_W, healthy_link_S, healthy_link_L;
    wire sig_Faulty_N_out, sig_Faulty_E_out, sig_Faulty_W_out, sig_Faulty_S_out, faulty_link_L;
    wire intermittent_link_N, intermittent_link_E, intermittent_link_W, intermittent_link_S, intermittent_link_L;

	
	assign turn_faults = 20'b00000000000000000000;
	assign link_faults = { sig_Faulty_N_out, sig_Faulty_E_out, sig_Faulty_W_out, sig_Faulty_S_out, faulty_link_L };
	//link_faults  <= { faulty_packet_N, faulty_packet_E, faulty_packet_W, faulty_packet_S, faulty_packet_L };

	assign Faulty_N_out = sig_Faulty_N_out;
	assign Faulty_E_out = sig_Faulty_E_out;
	assign Faulty_W_out = sig_Faulty_W_out;
	assign Faulty_S_out = sig_Faulty_S_out;


	// all the counter_threshold modules
	counter_threshold_classifier  #(.counter_depth (counter_depth), .healthy_counter_threshold (healthy_counter_threshold), .faulty_counter_threshold (faulty_counter_threshold) )
				CT_N  (.reset (reset), .clk (clk), .faulty_packet (faulty_packet_N), .Healthy_packet (healthy_packet_N),
	                   .Healthy (healthy_link_N), .Intermittent (intermittent_link_N), .Faulty (sig_Faulty_N_out) );

	counter_threshold_classifier  #(.counter_depth (counter_depth), .healthy_counter_threshold (healthy_counter_threshold), .faulty_counter_threshold (faulty_counter_threshold) )
				CT_E  (.reset (reset), .clk (clk), .faulty_packet (faulty_packet_E), .Healthy_packet (healthy_packet_E),
	                   .Healthy (healthy_link_E), .Intermittent (intermittent_link_E), .Faulty (sig_Faulty_E_out) );

	counter_threshold_classifier  #(.counter_depth (counter_depth), .healthy_counter_threshold (healthy_counter_threshold), .faulty_counter_threshold (faulty_counter_threshold) )
				CT_W  (.reset (reset), .clk (clk), .faulty_packet (faulty_packet_W), .Healthy_packet (healthy_packet_W),
	                   .Healthy (healthy_link_W), .Intermittent (intermittent_link_W), .Faulty (sig_Faulty_W_out) );

	counter_threshold_classifier  #(.counter_depth (counter_depth), .healthy_counter_threshold (healthy_counter_threshold), .faulty_counter_threshold (faulty_counter_threshold) )
				CT_S  (.reset (reset), .clk (clk), .faulty_packet (faulty_packet_S), .Healthy_packet (healthy_packet_S),
	                   .Healthy (healthy_link_S), .Intermittent (intermittent_link_S), .Faulty (sig_Faulty_S_out) );

	counter_threshold_classifier  #(.counter_depth (counter_depth), .healthy_counter_threshold (healthy_counter_threshold), .faulty_counter_threshold (faulty_counter_threshold) )
				CT_L  (.reset (reset), .clk (clk), .faulty_packet (faulty_packet_L), .Healthy_packet (healthy_packet_L),
	                   .Healthy (healthy_link_L), .Intermittent (intermittent_link_L), .Faulty (faulty_link_L) );

	// all the FIFOs
	FIFO_credit_based   #( .DATA_WIDTH (DATA_WIDTH) )
	     FIFO_N ( .reset (reset), .clk (clk), .RX (RX_N), .valid_in (valid_in_N),  
	              .read_en_N (packet_drop_order_N), .read_en_E (Grant_EN), .read_en_W (Grant_WN), .read_en_S (Grant_SN), .read_en_L (Grant_LN), 
	              .credit_out (credit_out_N), .empty_out (empty_N), .Data_out (FIFO_D_out_N), .fault_info (faulty_packet_N), .health_info (healthy_packet_N) );

	FIFO_credit_based   #( .DATA_WIDTH (DATA_WIDTH) )
	     FIFO_E ( .reset (reset), .clk (clk), .RX (RX_E), .valid_in (valid_in_E),  
	              .read_en_N (Grant_NE), .read_en_E (packet_drop_order_E), .read_en_W (Grant_WE), .read_en_S (Grant_SE), .read_en_L (Grant_LE), 
	              .credit_out (credit_out_E), .empty_out (empty_E), .Data_out (FIFO_D_out_E), .fault_info (faulty_packet_E), .health_info (healthy_packet_E) );

	FIFO_credit_based   #( .DATA_WIDTH (DATA_WIDTH) )
	     FIFO_W ( .reset (reset), .clk (clk), .RX (RX_W), .valid_in (valid_in_W),  
	              .read_en_N (Grant_NW), .read_en_E (Grant_EW), .read_en_W (packet_drop_order_W), .read_en_S (Grant_SW), .read_en_L (Grant_LW), 
	              .credit_out (credit_out_W), .empty_out (empty_W), .Data_out (FIFO_D_out_W), .fault_info (faulty_packet_W), .health_info (healthy_packet_W) );

	FIFO_credit_based   #( .DATA_WIDTH (DATA_WIDTH) )
	     FIFO_S ( .reset (reset), .clk (clk), .RX (RX_S), .valid_in (valid_in_S),  
	              .read_en_N (Grant_NS), .read_en_E (Grant_ES), .read_en_W (Grant_WS), .read_en_S (packet_drop_order_S), .read_en_L (Grant_LS),  
	              .credit_out (credit_out_S), .empty_out (empty_S), .Data_out (FIFO_D_out_S), .fault_info (faulty_packet_S), .health_info (healthy_packet_S) );

	FIFO_credit_based   #( .DATA_WIDTH (DATA_WIDTH) )
	     FIFO_L ( .reset (reset), .clk (clk), .RX (RX_L), .valid_in (valid_in_L),  
	              .read_en_N (Grant_NL), .read_en_E (Grant_EL), .read_en_W (Grant_WL), .read_en_S (Grant_SL), .read_en_L (packet_drop_order_L),
	              .credit_out (credit_out_L), .empty_out (empty_L), .Data_out (FIFO_D_out_L), .fault_info (faulty_packet_L), .health_info (healthy_packet_L) );

//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------

	parity_checker_for_LBDR   #(DATA_WIDTH)  parity_LBDR_N (FIFO_D_out_N, empty_N, LBDR_Fault_N);
	parity_checker_for_LBDR   #(DATA_WIDTH)  parity_LBDR_E (FIFO_D_out_E, empty_E, LBDR_Fault_E);
	parity_checker_for_LBDR   #(DATA_WIDTH)  parity_LBDR_W (FIFO_D_out_W, empty_W, LBDR_Fault_W);
	parity_checker_for_LBDR   #(DATA_WIDTH)  parity_LBDR_S (FIFO_D_out_S, empty_S, LBDR_Fault_S);
	parity_checker_for_LBDR   #(DATA_WIDTH)  parity_LBDR_L (FIFO_D_out_L, empty_L, LBDR_Fault_L);

//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------

	// all the LBDRs
	LBDR_packet_drop  #( .cur_addr_rst (current_address), .Cx_rst (Cx_rst), .Rxy_rst (Rxy_rst), .NoC_size (NoC_size) )
       	 LBDR_N (.reset (reset), .clk (clk), .empty (empty_N), 
	       		 .Faulty_C_N (Faulty_N_in), .Faulty_C_E (Faulty_E_in), .Faulty_C_W (Faulty_W_in), .Faulty_C_S (Faulty_S_in),  
	             .flit_type (FIFO_D_out_N[DATA_WIDTH-1 : DATA_WIDTH-3]), .dst_addr (FIFO_D_out_N[DATA_WIDTH-19+NoC_size-1 : DATA_WIDTH-19]) ,
	             .faulty (LBDR_Fault_N),
	             .packet_drop_order (packet_drop_order_N),
	             .grant_N (1'b0), .grant_E (Grant_EN), .grant_W (Grant_WN), .grant_S (Grant_SN), .grant_L (Grant_LN),
	             .Req_N (Req_NN), .Req_E (Req_NE), .Req_W (Req_NW), .Req_S (Req_NS), .Req_L (Req_NL),
	             .Rxy_reconf_PE (Rxy_reconf_PE), .Cx_reconf_PE (Cx_reconf_PE), .Reconfig_command (Reconfig_command) );
	       
	LBDR_packet_drop  #( .cur_addr_rst (current_address), .Cx_rst (Cx_rst), .Rxy_rst (Rxy_rst), .NoC_size (NoC_size) )
	   	 LBDR_E (.reset (reset), .clk (clk), .empty (empty_E), 
	   	 		 .Faulty_C_N (Faulty_N_in), .Faulty_C_E (Faulty_E_in), .Faulty_C_W (Faulty_W_in), .Faulty_C_S (Faulty_S_in),  
	             .flit_type (FIFO_D_out_E[DATA_WIDTH-1 : DATA_WIDTH-3]), .dst_addr (FIFO_D_out_E[DATA_WIDTH-19+NoC_size-1 : DATA_WIDTH-19]) ,
	             .faulty (LBDR_Fault_E),
	             .packet_drop_order (packet_drop_order_E),
	             .grant_N (Grant_NE), .grant_E (1'b0), .grant_W (Grant_WE), .grant_S(Grant_SE), .grant_L (Grant_LE),
	             .Req_N (Req_EN), .Req_E (Req_EE), .Req_W (Req_EW), .Req_S (Req_ES), .Req_L (Req_EL),
	             .Rxy_reconf_PE (Rxy_reconf_PE), .Cx_reconf_PE (Cx_reconf_PE), .Reconfig_command (Reconfig_command) );

	LBDR_packet_drop  #( .cur_addr_rst (current_address), .Cx_rst (Cx_rst), .Rxy_rst (Rxy_rst), .NoC_size (NoC_size) )
	   	 LBDR_W (.reset (reset), .clk (clk), .empty (empty_W),  
	   			 .Faulty_C_N (Faulty_N_in), .Faulty_C_E (Faulty_E_in), .Faulty_C_W (Faulty_W_in), .Faulty_C_S (Faulty_S_in),   
	             .flit_type (FIFO_D_out_W[DATA_WIDTH-1 : DATA_WIDTH-3]), .dst_addr (FIFO_D_out_W[DATA_WIDTH-19+NoC_size-1 : DATA_WIDTH-19]) ,
	             .faulty (LBDR_Fault_W),
	             .packet_drop_order (packet_drop_order_W),
	             .grant_N (Grant_NW), .grant_E (Grant_EW), .grant_W (1'b0), .grant_S(Grant_SW), .grant_L (Grant_LW),
	             .Req_N (Req_WN), .Req_E (Req_WE), .Req_W (Req_WW), .Req_S (Req_WS), .Req_L (Req_WL),
	             .Rxy_reconf_PE (Rxy_reconf_PE), .Cx_reconf_PE (Cx_reconf_PE), .Reconfig_command (Reconfig_command) );

	LBDR_packet_drop  #( .cur_addr_rst (current_address), .Cx_rst (Cx_rst), .Rxy_rst (Rxy_rst), .NoC_size (NoC_size) )
	   	 LBDR_S (.reset (reset), .clk (clk), .empty (empty_S), 
	   			 .Faulty_C_N (Faulty_N_in), .Faulty_C_E (Faulty_E_in), .Faulty_C_W (Faulty_W_in), .Faulty_C_S (Faulty_S_in),    
	             .flit_type (FIFO_D_out_S[DATA_WIDTH-1 : DATA_WIDTH-3]), .dst_addr (FIFO_D_out_S[DATA_WIDTH-19+NoC_size-1 : DATA_WIDTH-19]) ,
	             .faulty (LBDR_Fault_S),
	             .packet_drop_order (packet_drop_order_S),
	             .grant_N (Grant_NS), .grant_E (Grant_ES), .grant_W (Grant_WS), .grant_S(1'b0), .grant_L (Grant_LS),
	             .Req_N (Req_SN), .Req_E (Req_SE), .Req_W (Req_SW), .Req_S (Req_SS), .Req_L (Req_SL),
	             .Rxy_reconf_PE (Rxy_reconf_PE), .Cx_reconf_PE (Cx_reconf_PE), .Reconfig_command (Reconfig_command) );

	LBDR_packet_drop  #( .cur_addr_rst (current_address), .Cx_rst (Cx_rst), .Rxy_rst (Rxy_rst), .NoC_size (NoC_size) )
	   	 LBDR_L (.reset (reset), .clk (clk), .empty (empty_L), 
	   			 .Faulty_C_N (Faulty_N_in), .Faulty_C_E (Faulty_E_in), .Faulty_C_W (Faulty_W_in), .Faulty_C_S (Faulty_S_in),  
	             .flit_type (FIFO_D_out_L[DATA_WIDTH-1 : DATA_WIDTH-3]), .dst_addr (FIFO_D_out_L[DATA_WIDTH-19+NoC_size-1 : DATA_WIDTH-19]) ,
	             .faulty (LBDR_Fault_L),
	             .packet_drop_order (packet_drop_order_L),
	             .grant_N (Grant_NL), .grant_E (Grant_EL), .grant_W (Grant_WL), .grant_S (Grant_SL), .grant_L (1'b0),
	             .Req_N (Req_LN), .Req_E (Req_LE), .Req_W (Req_LW), .Req_S (Req_LS), .Req_L (Req_LL),
	             .Rxy_reconf_PE (Rxy_reconf_PE), .Cx_reconf_PE (Cx_reconf_PE), .Reconfig_command (Reconfig_command) );

//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------

	// switch allocator
 
	allocator   allocator_unit  ( .reset (reset), .clk (clk),
	            // flow control
	            .credit_in_N (credit_in_N), .credit_in_E (credit_in_E), .credit_in_W (credit_in_W), .credit_in_S (credit_in_S), .credit_in_L (credit_in_L),

	            // requests from the LBDRS
	            .Req_N_N (1'b0),   .Req_N_E (Req_NE), .Req_N_W (Req_NW), .Req_N_S (Req_NS), .Req_N_L (Req_NL),
	            .Req_E_N (Req_EN), .Req_E_E (1'b0),   .Req_E_W (Req_EW), .Req_E_S (Req_ES), .Req_E_L (Req_EL),
	            .Req_W_N (Req_WN), .Req_W_E (Req_WE), .Req_W_W (1'b0),   .Req_W_S (Req_WS), .Req_W_L (Req_WL),
	            .Req_S_N (Req_SN), .Req_S_E (Req_SE), .Req_S_W (Req_SW), .Req_S_S (1'b0),   .Req_S_L (Req_SL),
	            .Req_L_N (Req_LN), .Req_L_E (Req_LE), .Req_L_W (Req_LW), .Req_L_S (Req_LS), .Req_L_L (1'b0),

	            .empty_N (empty_N), .empty_E (empty_E), .empty_W (empty_W), .empty_S (empty_S), .empty_L (empty_L), 
	            .valid_N (valid_out_N), .valid_E (valid_out_E), .valid_W (valid_out_W), .valid_S (valid_out_S), .valid_L (valid_out_L),
	            // grant_X_Y means the grant for X output port towards Y input port
	            // this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
	            .grant_N_N (Grant_NN), .grant_N_E (Grant_NE), .grant_N_W (Grant_NW), .grant_N_S (Grant_NS), .grant_N_L (Grant_NL),
	            .grant_E_N (Grant_EN), .grant_E_E (Grant_EE), .grant_E_W (Grant_EW), .grant_E_S (Grant_ES), .grant_E_L (Grant_EL),
	            .grant_W_N (Grant_WN), .grant_W_E (Grant_WE), .grant_W_W (Grant_WW), .grant_W_S (Grant_WS), .grant_W_L (Grant_WL),
	            .grant_S_N (Grant_SN), .grant_S_E (Grant_SE), .grant_S_W (Grant_SW), .grant_S_S (Grant_SS), .grant_S_L (Grant_SL),
	            .grant_L_N (Grant_LN), .grant_L_E (Grant_LE), .grant_L_W (Grant_LW), .grant_L_S (Grant_LS), .grant_L_L (Grant_LL)            
	            );

//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------
	// all the Xbar select_signals

	assign Xbar_sel_N = { 1'b0, Grant_NE, Grant_NW, Grant_NS,  Grant_NL };
	assign Xbar_sel_E = { Grant_EN, 1'b0, Grant_EW, Grant_ES,  Grant_EL };
	assign Xbar_sel_W = { Grant_WN, Grant_WE, 1'b0, Grant_WS,  Grant_WL };
	assign Xbar_sel_S = { Grant_SN, Grant_SE, Grant_SW, 1'b0,  Grant_SL };
	assign Xbar_sel_L = { Grant_LN, Grant_LE, Grant_LW, Grant_LS,  1'b0 };

//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------

	// all the Xbars

	XBAR   #( .DATA_WIDTH (DATA_WIDTH) )
	   XBAR_N (.North_in (FIFO_D_out_N), .East_in (FIFO_D_out_E), .West_in (FIFO_D_out_W), .South_in (FIFO_D_out_S), .Local_in (FIFO_D_out_L),
	           .sel (Xbar_sel_N), .Data_out (TX_N) );
	XBAR   #( .DATA_WIDTH (DATA_WIDTH) )
	   XBAR_E (.North_in (FIFO_D_out_N), .East_in (FIFO_D_out_E), .West_in (FIFO_D_out_W), .South_in (FIFO_D_out_S), .Local_in (FIFO_D_out_L),
	           .sel (Xbar_sel_E), .Data_out (TX_E) );
	XBAR   #( .DATA_WIDTH (DATA_WIDTH) )
	   XBAR_W (.North_in (FIFO_D_out_N), .East_in (FIFO_D_out_E), .West_in (FIFO_D_out_W), .South_in (FIFO_D_out_S), .Local_in (FIFO_D_out_L),
	           .sel (Xbar_sel_W), .Data_out (TX_W) );
	XBAR   #( .DATA_WIDTH (DATA_WIDTH) )
	   XBAR_S (.North_in (FIFO_D_out_N), .East_in (FIFO_D_out_E), .West_in (FIFO_D_out_W), .South_in (FIFO_D_out_S), .Local_in (FIFO_D_out_L),
	           .sel (Xbar_sel_S), .Data_out (TX_S) );
	XBAR   #( .DATA_WIDTH (DATA_WIDTH) )
	   XBAR_L (.North_in (FIFO_D_out_N), .East_in (FIFO_D_out_E), .West_in (FIFO_D_out_W), .South_in (FIFO_D_out_S), .Local_in (FIFO_D_out_L),
	           .sel (Xbar_sel_L), .Data_out (TX_L) );

endmodule
