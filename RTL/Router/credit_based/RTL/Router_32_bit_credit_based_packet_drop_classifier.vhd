--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity router_credit_based_PD_C is  --fault classifier plus packet-dropping
	generic (
        DATA_WIDTH: integer := 32;
        current_address : integer := 0;
        Cx_rst : integer := 10;
        healthy_counter_threshold : integer := 8;
        faulty_counter_threshold: integer := 2;
        counter_depth: integer := 4;
        NoC_size: integer := 4
    );
    port (
    reset, clk: in std_logic;

    Rxy_reconf: in  std_logic_vector(7 downto 0);
    Reconfig : in std_logic;

    RX_N, RX_E, RX_W, RX_S, RX_L : in std_logic_vector (DATA_WIDTH-1 downto 0);
    credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L: in std_logic;
    valid_in_N, valid_in_E, valid_in_W, valid_in_S, valid_in_L : in std_logic;
    valid_out_N, valid_out_E, valid_out_W, valid_out_S, valid_out_L : out std_logic;
    credit_out_N, credit_out_E, credit_out_W, credit_out_S, credit_out_L: out std_logic;
    TX_N, TX_E, TX_W, TX_S, TX_L: out std_logic_vector (DATA_WIDTH-1 downto 0);

    Faulty_N_in, Faulty_E_in, Faulty_W_in, Faulty_S_in: in std_logic;
    Faulty_N_out, Faulty_E_out, Faulty_W_out, Faulty_S_out: out std_logic

 );
end router_credit_based_PD_C;

architecture behavior of router_credit_based_PD_C is


  COMPONENT FIFO_credit_based is
    generic (
        DATA_WIDTH: integer := 32
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            RX: in std_logic_vector(DATA_WIDTH-1 downto 0);
            valid_in: in std_logic;
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            credit_out: out std_logic;
            empty_out: out std_logic;
            Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0);

            fault_info, health_info: out  std_logic
    );
    end COMPONENT;

    COMPONENT counter_threshold_classifier is
    generic (
        counter_depth: integer := 8;
        healthy_counter_threshold: integer := 4;
        faulty_counter_threshold: integer := 4
     );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            faulty_packet, Healthy_packet: in  std_logic;
            Healthy, intermittent, Faulty:out std_logic
            );
    end COMPONENT;


  COMPONENT allocator is

    port (  reset: in  std_logic;
            clk: in  std_logic;
            -- flow control
            credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L: in std_logic;

            req_N_N, req_N_E, req_N_W, req_N_S, req_N_L: in std_logic;
            req_E_N, req_E_E, req_E_W, req_E_S, req_E_L: in std_logic;
            req_W_N, req_W_E, req_W_W, req_W_S, req_W_L: in std_logic;
            req_S_N, req_S_E, req_S_W, req_S_S, req_S_L: in std_logic;
            req_L_N, req_L_E, req_L_W, req_L_S, req_L_L: in std_logic;
            empty_N, empty_E, empty_W, empty_S, empty_L: in std_logic;
            -- grant_X_Y means the grant for X output port towards Y input port
            -- this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
            valid_N, valid_E, valid_W, valid_S, valid_L : out std_logic;

            grant_N_N, grant_N_E, grant_N_W, grant_N_S, grant_N_L: out std_logic;
            grant_E_N, grant_E_E, grant_E_W, grant_E_S, grant_E_L: out std_logic;
            grant_W_N, grant_W_E, grant_W_W, grant_W_S, grant_W_L: out std_logic;
            grant_S_N, grant_S_E, grant_S_W, grant_S_S, grant_S_L: out std_logic;
            grant_L_N, grant_L_E, grant_L_W, grant_L_S, grant_L_L: out std_logic
            );
end COMPONENT;

	COMPONENT LBDR_packet_drop is
    generic (
        cur_addr_rst: integer := 0;
        Cx_rst: integer := 8;
        NoC_size: integer := 4
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;

            Rxy_reconf: in  std_logic_vector(7 downto 0);
            Reconfig : in std_logic;

            Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S: in std_logic;

            empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            packet_drop_order: out std_logic;
	    	grant_N, grant_E, grant_W, grant_S, grant_L: in std_logic;
            Req_N, Req_E, Req_W, Req_S, Req_L:out std_logic
            );
	end COMPONENT;

 	COMPONENT XBAR is
    generic (
        DATA_WIDTH: integer := 32
    );
    port (
        North_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        East_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        West_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        South_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        Local_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        sel: in std_logic_vector (4 downto 0);
        Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
	end COMPONENT;

  	signal FIFO_D_out_N, FIFO_D_out_E, FIFO_D_out_W, FIFO_D_out_S, FIFO_D_out_L: std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Grant_XY : Grant signal generated from Arbiter for output X connected to FIFO of input Y

 	signal Grant_NN, Grant_NE, Grant_NW, Grant_NS, Grant_NL: std_logic;
 	signal Grant_EN, Grant_EE, Grant_EW, Grant_ES, Grant_EL: std_logic;
 	signal Grant_WN, Grant_WE, Grant_WW, Grant_WS, Grant_WL: std_logic;
 	signal Grant_SN, Grant_SE, Grant_SW, Grant_SS, Grant_SL: std_logic;
 	signal Grant_LN, Grant_LE, Grant_LW, Grant_LS, Grant_LL: std_logic;

 	signal Req_NN, Req_EN, Req_WN, Req_SN, Req_LN: std_logic;
 	signal Req_NE, Req_EE, Req_WE, Req_SE, Req_LE: std_logic;
 	signal Req_NW, Req_EW, Req_WW, Req_SW, Req_LW: std_logic;
 	signal Req_NS, Req_ES, Req_WS, Req_SS, Req_LS: std_logic;
 	signal Req_NL, Req_EL, Req_WL, Req_SL, Req_LL: std_logic;

    signal empty_N, empty_E, empty_W, empty_S, empty_L: std_logic;

 	signal Xbar_sel_N, Xbar_sel_E, Xbar_sel_W, Xbar_sel_S, Xbar_sel_L: std_logic_vector(4 downto 0);

    signal faulty_packet_N, faulty_packet_E, faulty_packet_W, faulty_packet_S, faulty_packet_L:  std_logic;
    signal healthy_packet_N, healthy_packet_E, healthy_packet_W, healthy_packet_S, healthy_packet_L:  std_logic;

    signal packet_drop_order_N, packet_drop_order_E, packet_drop_order_W, packet_drop_order_S, packet_drop_order_L:  std_logic;

    signal healthy_link_N, healthy_link_E, healthy_link_W, healthy_link_S, healthy_link_L:  std_logic;
    signal sig_Faulty_N_out, sig_Faulty_E_out, sig_Faulty_W_out, sig_Faulty_S_out, faulty_link_L:  std_logic;
    signal intermittent_link_N, intermittent_link_E, intermittent_link_W, intermittent_link_S, intermittent_link_L:  std_logic;

begin

Faulty_N_out <= sig_Faulty_N_out;
Faulty_E_out <= sig_Faulty_E_out;
Faulty_W_out <= sig_Faulty_W_out;
Faulty_S_out <= sig_Faulty_S_out;


-- all the counter_threshold modules
CT_N:  counter_threshold_classifier  generic map(counter_depth => counter_depth, healthy_counter_threshold => healthy_counter_threshold, faulty_counter_threshold => faulty_counter_threshold)
    port map(reset => reset, clk => clk, faulty_packet => faulty_packet_N, Healthy_packet => healthy_packet_N,
             Healthy => healthy_link_N, intermittent=> intermittent_link_N, Faulty => sig_Faulty_N_out);

CT_E:  counter_threshold_classifier  generic map(counter_depth => counter_depth, healthy_counter_threshold => healthy_counter_threshold, faulty_counter_threshold => faulty_counter_threshold)
    port map(reset => reset, clk => clk, faulty_packet => faulty_packet_E, Healthy_packet => healthy_packet_E,
             Healthy => healthy_link_E, intermittent=> intermittent_link_E, Faulty => sig_Faulty_E_out);

CT_W:  counter_threshold_classifier  generic map(counter_depth => counter_depth, healthy_counter_threshold => healthy_counter_threshold, faulty_counter_threshold => faulty_counter_threshold)
    port map(reset => reset, clk => clk, faulty_packet => faulty_packet_W, Healthy_packet => healthy_packet_W,
             Healthy => healthy_link_W, intermittent=> intermittent_link_W, Faulty => sig_Faulty_W_out);

CT_S:  counter_threshold_classifier  generic map(counter_depth => counter_depth, healthy_counter_threshold => healthy_counter_threshold, faulty_counter_threshold => faulty_counter_threshold)
    port map(reset => reset, clk => clk, faulty_packet => faulty_packet_S, Healthy_packet => healthy_packet_S,
             Healthy => healthy_link_S, intermittent=> intermittent_link_S, Faulty => sig_Faulty_S_out);

CT_L:  counter_threshold_classifier  generic map(counter_depth => counter_depth, healthy_counter_threshold => healthy_counter_threshold, faulty_counter_threshold => faulty_counter_threshold)
    port map(reset => reset, clk => clk, faulty_packet => faulty_packet_L, Healthy_packet => healthy_packet_L,
             Healthy => healthy_link_L, intermittent=> intermittent_link_L, Faulty => faulty_link_L);

-- all the FIFOs
FIFO_N: FIFO_credit_based
    generic map ( DATA_WIDTH => DATA_WIDTH)
    port map ( reset => reset, clk => clk, RX => RX_N, valid_in => valid_in_N,
            read_en_N => packet_drop_order_N, read_en_E =>Grant_EN, read_en_W =>Grant_WN, read_en_S =>Grant_SN, read_en_L =>Grant_LN,
            credit_out => credit_out_N, empty_out => empty_N, Data_out => FIFO_D_out_N, fault_info=> faulty_packet_N, health_info=>healthy_packet_N);
FIFO_E: FIFO_credit_based
    generic map ( DATA_WIDTH => DATA_WIDTH)
    port map ( reset => reset, clk => clk, RX => RX_E, valid_in => valid_in_E,
            read_en_N => Grant_NE, read_en_E =>packet_drop_order_E, read_en_W =>Grant_WE, read_en_S =>Grant_SE, read_en_L =>Grant_LE,
            credit_out => credit_out_E, empty_out => empty_E, Data_out => FIFO_D_out_E, fault_info=> faulty_packet_E, health_info=>healthy_packet_E);
FIFO_W: FIFO_credit_based
    generic map ( DATA_WIDTH => DATA_WIDTH)
    port map ( reset => reset, clk => clk, RX => RX_W, valid_in => valid_in_W,
            read_en_N => Grant_NW, read_en_E =>Grant_EW, read_en_W =>packet_drop_order_W, read_en_S =>Grant_SW, read_en_L =>Grant_LW,
            credit_out => credit_out_W, empty_out => empty_W, Data_out => FIFO_D_out_W, fault_info=> faulty_packet_W, health_info=>healthy_packet_W);

FIFO_S: FIFO_credit_based
    generic map ( DATA_WIDTH => DATA_WIDTH)
    port map ( reset => reset, clk => clk, RX => RX_S, valid_in => valid_in_S,
            read_en_N => Grant_NS, read_en_E =>Grant_ES, read_en_W =>Grant_WS, read_en_S =>packet_drop_order_S, read_en_L =>Grant_LS,
            credit_out => credit_out_S, empty_out => empty_S, Data_out => FIFO_D_out_S, fault_info=> faulty_packet_S, health_info=>healthy_packet_S);

FIFO_L: FIFO_credit_based
    generic map ( DATA_WIDTH => DATA_WIDTH)
    port map ( reset => reset, clk => clk, RX => RX_L, valid_in => valid_in_L,
            read_en_N => Grant_NL, read_en_E =>Grant_EL, read_en_W =>Grant_WL, read_en_S => Grant_SL, read_en_L =>packet_drop_order_L,
            credit_out => credit_out_L, empty_out => empty_L, Data_out => FIFO_D_out_L, fault_info=> faulty_packet_L, health_info=>healthy_packet_L);
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

--- all the LBDRs
LBDR_N: LBDR_packet_drop generic map (cur_addr_rst => current_address, Cx_rst => Cx_rst, NoC_size => NoC_size)
       PORT MAP (reset => reset, clk => clk, empty => empty_N, Rxy_reconf => Rxy_reconf, Reconfig => Reconfig,
       		 Faulty_C_N => Faulty_N_in, Faulty_C_E => Faulty_E_in, Faulty_C_W => Faulty_W_in, Faulty_C_S => Faulty_S_in,
             flit_type => FIFO_D_out_N(DATA_WIDTH-1 downto DATA_WIDTH-3), dst_addr=> FIFO_D_out_N(NoC_size  downto 1) ,
             packet_drop_order => packet_drop_order_N,
             grant_N => '0', grant_E =>Grant_EN, grant_W => Grant_WN, grant_S=>Grant_SN, grant_L =>Grant_LN,
             Req_N=> Req_NN, Req_E=>Req_NE, Req_W=>Req_NW, Req_S=>Req_NS, Req_L=>Req_NL);

LBDR_E: LBDR_packet_drop generic map (cur_addr_rst => current_address, Cx_rst => Cx_rst, NoC_size => NoC_size)
   PORT MAP (reset =>  reset, clk => clk, empty => empty_E, Rxy_reconf => Rxy_reconf, Reconfig => Reconfig,
   	 		 Faulty_C_N => Faulty_N_in, Faulty_C_E => Faulty_E_in, Faulty_C_W => Faulty_W_in, Faulty_C_S => Faulty_S_in,
             flit_type => FIFO_D_out_E(DATA_WIDTH-1 downto DATA_WIDTH-3), dst_addr=> FIFO_D_out_E(NoC_size  downto 1) ,
             packet_drop_order => packet_drop_order_E,
             grant_N => Grant_NE, grant_E =>'0', grant_W => Grant_WE, grant_S=>Grant_SE, grant_L =>Grant_LE,
             Req_N=> Req_EN, Req_E=>Req_EE, Req_W=>Req_EW, Req_S=>Req_ES, Req_L=>Req_EL);

LBDR_W: LBDR_packet_drop generic map (cur_addr_rst => current_address, Cx_rst => Cx_rst, NoC_size => NoC_size)
   PORT MAP (reset =>  reset, clk => clk, empty => empty_W,  Rxy_reconf => Rxy_reconf, Reconfig => Reconfig,
   			 Faulty_C_N => Faulty_N_in, Faulty_C_E => Faulty_E_in, Faulty_C_W => Faulty_W_in, Faulty_C_S => Faulty_S_in,
             flit_type => FIFO_D_out_W(DATA_WIDTH-1 downto DATA_WIDTH-3), dst_addr=> FIFO_D_out_W(NoC_size  downto 1) ,
             packet_drop_order => packet_drop_order_W,
             grant_N => Grant_NW, grant_E =>Grant_EW, grant_W =>'0' ,grant_S=>Grant_SW, grant_L =>Grant_LW,
             Req_N=> Req_WN, Req_E=>Req_WE, Req_W=>Req_WW, Req_S=>Req_WS, Req_L=>Req_WL);

LBDR_S: LBDR_packet_drop generic map (cur_addr_rst => current_address, Cx_rst => Cx_rst, NoC_size => NoC_size)
   PORT MAP (reset =>  reset, clk => clk, empty => empty_S, Rxy_reconf => Rxy_reconf, Reconfig => Reconfig,
   			 Faulty_C_N => Faulty_N_in, Faulty_C_E => Faulty_E_in, Faulty_C_W => Faulty_W_in, Faulty_C_S => Faulty_S_in,
             flit_type => FIFO_D_out_S(DATA_WIDTH-1 downto DATA_WIDTH-3), dst_addr=> FIFO_D_out_S(NoC_size  downto 1) ,
             packet_drop_order => packet_drop_order_S,
             grant_N => Grant_NS, grant_E =>Grant_ES, grant_W =>Grant_WS ,grant_S=>'0', grant_L =>Grant_LS,
             Req_N=> Req_SN, Req_E=>Req_SE, Req_W=>Req_SW, Req_S=>Req_SS, Req_L=>Req_SL);

LBDR_L: LBDR_packet_drop generic map (cur_addr_rst => current_address, Cx_rst => Cx_rst, NoC_size => NoC_size)
   PORT MAP (reset =>  reset, clk => clk, empty => empty_L, Rxy_reconf => Rxy_reconf, Reconfig => Reconfig,
   			 Faulty_C_N => Faulty_N_in, Faulty_C_E => Faulty_E_in, Faulty_C_W => Faulty_W_in, Faulty_C_S => Faulty_S_in,
             flit_type => FIFO_D_out_L(DATA_WIDTH-1 downto DATA_WIDTH-3), dst_addr=> FIFO_D_out_L(NoC_size  downto 1) ,
             packet_drop_order => packet_drop_order_L,
             grant_N => Grant_NL, grant_E =>Grant_EL, grant_W => Grant_WL,grant_S=>Grant_SL, grant_L =>'0',
             Req_N=> Req_LN, Req_E=>Req_LE, Req_W=>Req_LW, Req_S=>Req_LS, Req_L=>Req_LL);

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- switch allocator

allocator_unit: allocator port map ( reset => reset, clk => clk,
            -- flow control
            credit_in_N => credit_in_N, credit_in_E => credit_in_E, credit_in_W => credit_in_W, credit_in_S => credit_in_S, credit_in_L => credit_in_L,

            -- requests from the LBDRS
            req_N_N => '0', req_N_E => Req_NE, req_N_W => Req_NW, req_N_S => Req_NS, req_N_L => Req_NL,
            req_E_N => Req_EN, req_E_E => '0', req_E_W => Req_EW, req_E_S => Req_ES, req_E_L => Req_EL,
            req_W_N => Req_WN, req_W_E => Req_WE, req_W_W => '0', req_W_S => Req_WS, req_W_L => Req_WL,
            req_S_N => Req_SN, req_S_E => Req_SE, req_S_W => Req_SW, req_S_S => '0', req_S_L => Req_SL,
            req_L_N => Req_LN, req_L_E => Req_LE, req_L_W => Req_LW, req_L_S => Req_LS, req_L_L => '0',
            empty_N => empty_N, empty_E => empty_E, empty_w => empty_W, empty_S => empty_S, empty_L => empty_L,
            valid_N => valid_out_N, valid_E => valid_out_E, valid_W => valid_out_W, valid_S => valid_out_S, valid_L => valid_out_L,
            -- grant_X_Y means the grant for X output port towards Y input port
            -- this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
            grant_N_N => Grant_NN, grant_N_E => Grant_NE, grant_N_W => Grant_NW, grant_N_S => Grant_NS, grant_N_L => Grant_NL,
            grant_E_N => Grant_EN, grant_E_E => Grant_EE, grant_E_W => Grant_EW, grant_E_S => Grant_ES, grant_E_L => Grant_EL,
            grant_W_N => Grant_WN, grant_W_E => Grant_WE, grant_W_W => Grant_WW, grant_W_S => Grant_WS, grant_W_L => Grant_WL,
            grant_S_N => Grant_SN, grant_S_E => Grant_SE, grant_S_W => Grant_SW, grant_S_S => Grant_SS, grant_S_L => Grant_SL,
            grant_L_N => Grant_LN, grant_L_E => Grant_LE, grant_L_W => Grant_LW, grant_L_S => Grant_LS, grant_L_L => Grant_LL
            );

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
-- all the Xbar select_signals

Xbar_sel_N <= '0' & Grant_NE & Grant_NW & Grant_NS & Grant_NL;
Xbar_sel_E <= Grant_EN & '0' & Grant_EW & Grant_ES & Grant_EL;
Xbar_sel_W <= Grant_WN & Grant_WE & '0' & Grant_WS & Grant_WL;
Xbar_sel_S <= Grant_SN & Grant_SE & Grant_SW & '0' & Grant_SL;
Xbar_sel_L <= Grant_LN & Grant_LE & Grant_LW & Grant_LS & '0';


------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
 -- all the Xbars
XBAR_N: XBAR generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, South_in => FIFO_D_out_S, Local_in => FIFO_D_out_L,
        sel => Xbar_sel_N,  Data_out=> TX_N);
XBAR_E: XBAR generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, South_in => FIFO_D_out_S, Local_in => FIFO_D_out_L,
        sel => Xbar_sel_E,  Data_out=> TX_E);
XBAR_W: XBAR generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, South_in => FIFO_D_out_S, Local_in => FIFO_D_out_L,
        sel => Xbar_sel_W,  Data_out=> TX_W);
XBAR_S: XBAR generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, South_in => FIFO_D_out_S, Local_in => FIFO_D_out_L,
        sel => Xbar_sel_S,  Data_out=> TX_S);
XBAR_L: XBAR generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, South_in => FIFO_D_out_S, Local_in => FIFO_D_out_L,
        sel => Xbar_sel_L,  Data_out=> TX_L);

end;
