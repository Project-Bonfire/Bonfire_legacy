--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity router_LV is
	generic (
        DATA_WIDTH: integer := 11;
        current_address : integer := 0;
        Rxy_rst : integer := 60;
        Cx_rst : integer := 10;
        NoC_size: integer := 4
    );
    port (
    reset, clk: in std_logic;

    RX_E, RX_W, RX_L : in std_logic_vector (DATA_WIDTH-1 downto 0); 

    credit_in_E, credit_in_W, credit_in_L: in std_logic;
    valid_in_E, valid_in_W, valid_in_L : in std_logic;

    valid_out_E, valid_out_W, valid_out_L : out std_logic;
    credit_out_E, credit_out_W, credit_out_L: out std_logic;

    TX_E, TX_W, TX_L: out std_logic_vector (DATA_WIDTH-1 downto 0)
    ); 
end router_LV; 

architecture behavior of router_LV is

  COMPONENT FIFO_LV   
 	generic (
        DATA_WIDTH: integer := 11
            );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            RX: in std_logic_vector(DATA_WIDTH-1 downto 0); 
            valid_in: in std_logic;  
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_L : in std_logic;
            credit_out: out std_logic; 
            empty_out: out std_logic; 
            Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
	end COMPONENT;

  COMPONENT allocator_LV is 
     
    port (  reset: in  std_logic;
            clk: in  std_logic;
            -- flow control
            credit_in_E, credit_in_W, credit_in_L: in std_logic;

            req_E_E, req_E_W, req_E_L: in std_logic;
            req_W_E, req_W_W, req_W_L: in std_logic;
            req_L_E, req_L_W, req_L_L: in std_logic;
            empty_E, empty_W, empty_L: in std_logic;
            -- grant_X_Y means the grant for X output port towards Y input port
            -- this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
            valid_E, valid_W, valid_L : out std_logic;
            
            grant_E_E, grant_E_W, grant_E_L: out std_logic;
            grant_W_E, grant_W_W, grant_W_L: out std_logic;
            grant_L_E, grant_L_W, grant_L_L: out std_logic
            );
    end COMPONENT;

	COMPONENT LBDR_LV is
    generic (
        cur_addr_rst: integer := 0;
        Rxy_rst: integer := 60;
        Cx_rst: integer := 8;
        NoC_size: integer := 4
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            empty: in  std_logic; 
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            packet_info: in std_logic;
            flit_type: in std_logic_vector(2 downto 0);
	        grant_E, grant_W, grant_L: in std_logic;
            Req_E, Req_W, Req_L:out std_logic
            );
	end COMPONENT;

 	COMPONENT XBAR_LV is
    generic (
        DATA_WIDTH: integer := 11
    );
    port (
        East_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        West_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        Local_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        sel: in std_logic_vector (2 downto 0);
        Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
	end COMPONENT;

  	signal FIFO_D_out_E, FIFO_D_out_W, FIFO_D_out_L: std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Grant_XY : Grant signal generated from Arbiter for output X connected to FIFO of input Y


 	signal Grant_EE, Grant_EW, Grant_EL: std_logic;
 	signal Grant_WE, Grant_WW, Grant_WL: std_logic;
 	signal Grant_LE, Grant_LW, Grant_LL: std_logic;

 	signal Req_EE, Req_WE, Req_LE: std_logic;
 	signal Req_EW, Req_WW, Req_LW: std_logic;
 	signal Req_EL, Req_WL, Req_LL: std_logic;

    signal empty_E, empty_W, empty_L: std_logic; 

 	signal Xbar_sel_E, Xbar_sel_W, Xbar_sel_L: std_logic_vector(2 downto 0); -- Changed from 5 to 3 bits!
begin


-------------------------------------------------------------------------------------------
--Packet format
--                                                packet info__      __________flit type
--               ______________________________________________|____|__
--              |________4_________|__________4__________|_1_|_1_|__3__|
--                  source address        destination      |
--                                          address        |____healthy/faulty
--                                                                          
-------------------------------------------------------------------------------------------



FIFO_E: FIFO_LV 
    generic map ( DATA_WIDTH => DATA_WIDTH)
    port map ( reset => reset, clk => clk, RX => RX_E, valid_in => valid_in_E,  
            read_en_E =>'0', read_en_W =>Grant_WE, read_en_L =>Grant_LE, 
            credit_out => credit_out_E, empty_out => empty_E, Data_out => FIFO_D_out_E);
FIFO_W: FIFO_LV 
    generic map ( DATA_WIDTH => DATA_WIDTH)
    port map ( reset => reset, clk => clk, RX => RX_W, valid_in => valid_in_W,  
            read_en_E =>Grant_EW, read_en_W =>'0', read_en_L =>Grant_LW, 
            credit_out => credit_out_W, empty_out => empty_W, Data_out => FIFO_D_out_W);

FIFO_L: FIFO_LV 
    generic map ( DATA_WIDTH => DATA_WIDTH)
    port map ( reset => reset, clk => clk, RX => RX_L, valid_in => valid_in_L,  
            read_en_E =>Grant_EL, read_en_W =>Grant_WL, read_en_L => Grant_LL,
            credit_out => credit_out_L, empty_out => empty_L, Data_out => FIFO_D_out_L);
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- all the LBDRs

LBDR_E: LBDR_LV generic map (cur_addr_rst => current_address, Rxy_rst => Rxy_rst, Cx_rst => Cx_rst, NoC_size => NoC_size)
   PORT MAP (reset =>  reset, clk => clk, empty => empty_E, dst_addr=> FIFO_D_out_E(3+NoC_size-1 downto 3) , packet_info => FIFO_D_out_E(3), flit_type=> FIFO_D_out_E(2 downto 0),
             grant_E =>'0', grant_W => Grant_WE, grant_L =>Grant_LE,
             Req_E=>Req_EE, Req_W=>Req_EW, Req_L=>Req_EL);

LBDR_W: LBDR_LV generic map (cur_addr_rst => current_address, Rxy_rst => Rxy_rst, Cx_rst => Cx_rst, NoC_size => NoC_size)
   PORT MAP (reset =>  reset, clk => clk, empty => empty_W,  dst_addr=> FIFO_D_out_W(3+NoC_size-1 downto 3) , packet_info => FIFO_D_out_W(3), flit_type=> FIFO_D_out_W(2 downto 0),
             grant_E =>Grant_EW, grant_W =>'0', grant_L =>Grant_LW,
             Req_E=>Req_WE, Req_W=>Req_WW, Req_L=>Req_WL);

LBDR_L: LBDR_LV generic map (cur_addr_rst => current_address, Rxy_rst => Rxy_rst, Cx_rst => Cx_rst, NoC_size => NoC_size)
   PORT MAP (reset =>  reset, clk => clk, empty => empty_L, dst_addr=> FIFO_D_out_L(3+NoC_size-1 downto 3) , packet_info => FIFO_D_out_L(3), flit_type=> FIFO_D_out_L(2 downto 0),
             grant_E =>Grant_EL, grant_W => Grant_WL, grant_L => Grant_LL,
             Req_E=>Req_LE, Req_W=>Req_LW, Req_L=>Req_LL);

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- switch allocator
 
allocator_unit: allocator_LV port map ( reset => reset, clk => clk,
            -- flow control
            credit_in_E => credit_in_E, credit_in_W => credit_in_W, credit_in_L => credit_in_L,

            -- requests from the LBDRS
            req_E_E => '0', req_E_W => Req_EW, req_E_L => Req_EL,
            req_W_E => Req_WE, req_W_W => '0', req_W_L => Req_WL,
            req_L_E => Req_LE, req_L_W => Req_LW, req_L_L => Req_LL,
            empty_E => empty_E, empty_w => empty_W, empty_L => empty_L, 
            valid_E => valid_out_E, valid_W => valid_out_W, valid_L => valid_out_L,
            -- grant_X_Y means the grant for X output port towards Y input port
            -- this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!

            grant_E_E => Grant_EE, grant_E_W => Grant_EW, grant_E_L => Grant_EL,
            grant_W_E => Grant_WE, grant_W_W => Grant_WW, grant_W_L => Grant_WL,
            grant_L_E => Grant_LE, grant_L_W => Grant_LW, grant_L_L => Grant_LL            
            );

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
-- all the Xbar select_signals

Xbar_sel_E <= '0' & Grant_EW & Grant_EL;
Xbar_sel_W <= Grant_WE & '0' & Grant_WL;
Xbar_sel_L <= Grant_LE & Grant_LW & Grant_LL;


------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
 -- all the Xbars

XBAR_E: XBAR_LV generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, Local_in => FIFO_D_out_L,
             sel => Xbar_sel_E,  Data_out=> TX_E);
XBAR_W: XBAR_LV generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, Local_in => FIFO_D_out_L,
             sel => Xbar_sel_W,  Data_out=> TX_W);
XBAR_L: XBAR_LV generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, Local_in => FIFO_D_out_L,
             sel => Xbar_sel_L,  Data_out=> TX_L);

end;