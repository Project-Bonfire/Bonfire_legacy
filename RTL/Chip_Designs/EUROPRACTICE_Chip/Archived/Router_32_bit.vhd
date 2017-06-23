--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity router  is
	generic (
        DATA_WIDTH: integer := 32;
        current_address : integer := 5;
        Rxy_rst : integer := 60;
        Cx_rst : integer := 15;
        NoC_size: integer := 4
    );
    port (  reset, clk: in std_logic;
            DCTS_N, DCTS_E, DCTS_w, DCTS_S, DCTS_L: in std_logic;
            DRTS_N, DRTS_E, DRTS_W, DRTS_S, DRTS_L: in std_logic;
            RX_N, RX_E, RX_W, RX_S, RX_L : in std_logic_vector (DATA_WIDTH-1 downto 0);
            RTS_N, RTS_E, RTS_W, RTS_S, RTS_L: out std_logic;
            CTS_N, CTS_E, CTS_w, CTS_S, CTS_L: out std_logic;
            TX_N, TX_E, TX_W, TX_S, TX_L: out std_logic_vector (DATA_WIDTH-1 downto 0)
    );
end router;

architecture behavior of router is

    COMPONENT router_channel is
        generic (
            DATA_WIDTH: integer := 32;
            current_address : integer := 5;
            Rxy_rst : integer := 60;
            Cx_rst : integer := 15;
            NoC_size: integer := 4
        );
        port (
            reset, clk: in std_logic;
            DCTS : in std_logic;
            DRTS : in std_logic;
            RTS : out std_logic;
            CTS : out std_logic;
            flit_type : in std_logic_vector(2 downto 0);
            destination_address : in std_logic_vector(NoC_size-1 downto 0);
            Grant_N_in , Grant_E_in , Grant_W_in , Grant_S_in , Grant_L_in : in  std_logic;
            Grant_N_out, Grant_E_out, Grant_W_out, Grant_S_out, Grant_L_out: out std_logic;
            Req_N_in ,  Req_E_in , Req_W_in , Req_S_in , Req_L_in :in  std_logic;
            Req_N_out , Req_E_out, Req_W_out, Req_S_out, Req_L_out:out std_logic;
            read_pointer_out, write_pointer_out: out std_logic_vector(3 downto 0);
            write_en_out :out std_logic;

            Xbar_sel: out std_logic_vector(4 downto 0)
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


    COMPONENT FIFO_data_path is
        generic (
           DATA_WIDTH: integer := 32
       );
        port (
                reset: in  std_logic;
                clk: in  std_logic;
                RX: in std_logic_vector(DATA_WIDTH-1 downto 0);
                read_pointer, write_pointer: in std_logic_vector(3 downto 0);
                write_en : in std_logic;
                Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
                );

    end COMPONENT;

    signal FIFO_D_out_N, FIFO_D_out_E, FIFO_D_out_W, FIFO_D_out_S, FIFO_D_out_L: std_logic_vector(DATA_WIDTH-1 downto 0);
    signal Xbar_sel_N, Xbar_sel_E, Xbar_sel_W, Xbar_sel_S, Xbar_sel_L: std_logic_vector(4 downto 0);

    signal write_pointer_out_N, write_pointer_out_E, write_pointer_out_W, write_pointer_out_S, write_pointer_out_L: std_logic_vector(3 downto 0);
    signal read_pointer_out_N, read_pointer_out_E, read_pointer_out_W, read_pointer_out_S, read_pointer_out_L: std_logic_vector(3 downto 0);
    signal write_en_out_N, write_en_out_E, write_en_out_W, write_en_out_S, write_en_out_L: std_logic;

    signal Grant_N_N, Grant_N_E, Grant_N_W, Grant_N_S, Grant_N_L: std_logic;
    signal Grant_E_N, Grant_E_E, Grant_E_W, Grant_E_S, Grant_E_L: std_logic;
    signal Grant_W_N, Grant_W_E, Grant_W_W, Grant_W_S, Grant_W_L: std_logic;
    signal Grant_S_N, Grant_S_E, Grant_S_W, Grant_S_S, Grant_S_L: std_logic;
    signal Grant_L_N, Grant_L_E, Grant_L_W, Grant_L_S, Grant_L_L: std_logic;

    signal Req_N_N, Req_E_N, Req_W_N, Req_S_N, Req_L_N: std_logic;
    signal Req_N_E, Req_E_E, Req_W_E, Req_S_E, Req_L_E: std_logic;
    signal Req_N_W, Req_E_W, Req_W_W, Req_S_W, Req_L_W: std_logic;
    signal Req_N_S, Req_E_S, Req_W_S, Req_S_S, Req_L_S: std_logic;
    signal Req_N_L, Req_E_L, Req_W_L, Req_S_L, Req_L_L: std_logic;

begin



Channel_N: router_channel  generic map (DATA_WIDTH => DATA_WIDTH, current_address =>current_address, Rxy_rst =>Rxy_rst, Cx_rst =>Cx_rst, NoC_size => NoC_size)
           port map (reset=> reset, clk => clk, DCTS => DCTS_N, DRTS => DRTS_N, RTS=>RTS_N, CTS=>CTS_N, flit_type => FIFO_D_out_N(DATA_WIDTH-1 downto DATA_WIDTH-3), destination_address=> FIFO_D_out_N(DATA_WIDTH-19+NoC_size-1 downto DATA_WIDTH-19),
                     Grant_N_in => '0' , Grant_E_in => Grant_E_N , Grant_W_in => Grant_W_N , Grant_S_in => Grant_S_N , Grant_L_in => Grant_L_N , Grant_N_out => Grant_N_N, Grant_E_out => Grant_N_E, Grant_W_out => Grant_N_W, Grant_S_out => Grant_N_S, Grant_L_out => Grant_N_L,
                     Req_N_in => '0' ,  Req_E_in => Req_E_N , Req_W_in => Req_W_N , Req_S_in => Req_S_N , Req_L_in => Req_L_N , Req_N_out => Req_N_N , Req_E_out => Req_N_E , Req_W_out => Req_N_W , Req_S_out => Req_N_S , Req_L_out => Req_N_L ,
                     read_pointer_out => read_pointer_out_N, write_pointer_out => write_pointer_out_N, write_en_out=>write_en_out_N, Xbar_sel=>Xbar_sel_N);


Channel_E: router_channel  generic map (DATA_WIDTH => DATA_WIDTH, current_address =>current_address, Rxy_rst =>Rxy_rst, Cx_rst =>Cx_rst, NoC_size => NoC_size)
           port map (reset=> reset, clk => clk, DCTS => DCTS_E, DRTS => DRTS_E, RTS=>RTS_E, CTS=>CTS_E, flit_type => FIFO_D_out_E(DATA_WIDTH-1 downto DATA_WIDTH-3), destination_address=> FIFO_D_out_E(DATA_WIDTH-19+NoC_size-1 downto DATA_WIDTH-19),
                     Grant_N_in => Grant_N_E , Grant_E_in => '0' , Grant_W_in => Grant_W_E , Grant_S_in => Grant_S_E , Grant_L_in => Grant_L_E , Grant_N_out => Grant_E_N, Grant_E_out => Grant_E_E, Grant_W_out => Grant_E_W, Grant_S_out => Grant_E_S, Grant_L_out => Grant_E_L,
                     Req_N_in => Req_N_E ,  Req_E_in => '0' , Req_W_in => Req_W_E , Req_S_in => Req_S_E , Req_L_in => Req_L_E , Req_N_out => Req_E_N , Req_E_out => Req_E_E , Req_W_out => Req_E_W , Req_S_out => Req_E_S , Req_L_out => Req_E_L ,
                     read_pointer_out => read_pointer_out_E, write_pointer_out => write_pointer_out_E, write_en_out=>write_en_out_E, Xbar_sel=>Xbar_sel_E);


Channel_W: router_channel  generic map (DATA_WIDTH => DATA_WIDTH, current_address =>current_address, Rxy_rst =>Rxy_rst, Cx_rst =>Cx_rst, NoC_size => NoC_size)
           port map (reset=> reset, clk => clk, DCTS => DCTS_W, DRTS => DRTS_W, RTS=>RTS_W, CTS=>CTS_W, flit_type => FIFO_D_out_W(DATA_WIDTH-1 downto DATA_WIDTH-3), destination_address=> FIFO_D_out_W(DATA_WIDTH-19+NoC_size-1 downto DATA_WIDTH-19),
                     Grant_N_in => Grant_N_W , Grant_E_in => Grant_E_W , Grant_W_in => '0' , Grant_S_in => Grant_S_W , Grant_L_in => Grant_L_W , Grant_N_out => Grant_W_N, Grant_E_out => Grant_W_E, Grant_W_out => Grant_W_W, Grant_S_out => Grant_W_S, Grant_L_out => Grant_W_L,
                     Req_N_in => Req_N_W ,  Req_E_in => Req_E_W , Req_W_in => '0' , Req_S_in => Req_S_W , Req_L_in => Req_L_W , Req_N_out => Req_W_N , Req_E_out => Req_W_E , Req_W_out => Req_W_W , Req_S_out => Req_W_S , Req_L_out => Req_W_L ,
                     read_pointer_out => read_pointer_out_W, write_pointer_out => write_pointer_out_W, write_en_out=>write_en_out_W, Xbar_sel=>Xbar_sel_W);



Channel_S: router_channel  generic map (DATA_WIDTH => DATA_WIDTH, current_address =>current_address, Rxy_rst =>Rxy_rst, Cx_rst =>Cx_rst, NoC_size => NoC_size)
           port map (reset=> reset, clk => clk, DCTS => DCTS_S, DRTS => DRTS_S, RTS=>RTS_S, CTS=>CTS_S, flit_type => FIFO_D_out_S(DATA_WIDTH-1 downto DATA_WIDTH-3), destination_address=> FIFO_D_out_S(DATA_WIDTH-19+NoC_size-1 downto DATA_WIDTH-19),
                      Grant_N_in => Grant_N_S , Grant_E_in => Grant_E_S , Grant_W_in => Grant_W_S , Grant_S_in => '0' , Grant_L_in => Grant_L_S , Grant_N_out => Grant_S_N, Grant_E_out => Grant_S_E, Grant_W_out => Grant_S_W, Grant_S_out => Grant_S_S, Grant_L_out => Grant_S_L,
                      Req_N_in => Req_N_S ,  Req_E_in => Req_E_S , Req_W_in => Req_W_S , Req_S_in => '0' , Req_L_in => Req_L_S , Req_N_out => Req_S_N , Req_E_out => Req_S_E , Req_W_out => Req_S_W , Req_S_out => Req_S_S , Req_L_out => Req_S_L ,
                     read_pointer_out => read_pointer_out_S, write_pointer_out => write_pointer_out_S, write_en_out=>write_en_out_S, Xbar_sel=>Xbar_sel_S);


Channel_L: router_channel  generic map (DATA_WIDTH => DATA_WIDTH, current_address =>current_address, Rxy_rst =>Rxy_rst, Cx_rst =>Cx_rst, NoC_size => NoC_size)
           port map (reset=> reset, clk => clk, DCTS => DCTS_L, DRTS => DRTS_L, RTS=>RTS_L, CTS=>CTS_L, flit_type => FIFO_D_out_L(DATA_WIDTH-1 downto DATA_WIDTH-3), destination_address=> FIFO_D_out_L(DATA_WIDTH-19+NoC_size-1 downto DATA_WIDTH-19),
                     Grant_N_in => Grant_N_L , Grant_E_in => Grant_E_L , Grant_W_in => Grant_W_L , Grant_S_in => Grant_S_L , Grant_L_in => '0' , Grant_N_out => Grant_L_N, Grant_E_out => Grant_L_E, Grant_W_out => Grant_L_W, Grant_S_out => Grant_L_S, Grant_L_out => Grant_L_L,
                     Req_N_in => Req_N_L ,  Req_E_in => Req_E_L , Req_W_in => Req_W_L , Req_S_in => Req_S_L , Req_L_in => '0' , Req_N_out => Req_L_N , Req_E_out => Req_L_E , Req_W_out => Req_L_W , Req_S_out => Req_L_S , Req_L_out => Req_L_L ,
                     read_pointer_out => read_pointer_out_L, write_pointer_out => write_pointer_out_L, write_en_out=>write_en_out_L, Xbar_sel=>Xbar_sel_L);

xbar_N: XBAR generic map(DATA_WIDTH => DATA_WIDTH) port map (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in=> FIFO_D_out_W, South_in=> FIFO_D_out_S, Local_in=> FIFO_D_out_L, sel=>Xbar_sel_N, Data_out=> TX_N);
xbar_E: XBAR generic map(DATA_WIDTH => DATA_WIDTH) port map (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in=> FIFO_D_out_W, South_in=> FIFO_D_out_S, Local_in=> FIFO_D_out_L, sel=>Xbar_sel_E, Data_out=> TX_E);
xbar_W: XBAR generic map(DATA_WIDTH => DATA_WIDTH) port map (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in=> FIFO_D_out_W, South_in=> FIFO_D_out_S, Local_in=> FIFO_D_out_L, sel=>Xbar_sel_W, Data_out=> TX_W);
xbar_S: XBAR generic map(DATA_WIDTH => DATA_WIDTH) port map (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in=> FIFO_D_out_W, South_in=> FIFO_D_out_S, Local_in=> FIFO_D_out_L, sel=>Xbar_sel_S, Data_out=> TX_S);
xbar_L: XBAR generic map(DATA_WIDTH => DATA_WIDTH) port map (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in=> FIFO_D_out_W, South_in=> FIFO_D_out_S, Local_in=> FIFO_D_out_L, sel=>Xbar_sel_L, Data_out=> TX_L);


FIFO_N: FIFO_data_path generic map(DATA_WIDTH => DATA_WIDTH) port map(clk => clk, reset => reset, RX => RX_N, read_pointer => read_pointer_out_N, write_pointer => write_pointer_out_N, write_en => write_en_out_N, Data_out => FIFO_D_out_N);
FIFO_E: FIFO_data_path generic map(DATA_WIDTH => DATA_WIDTH) port map(clk => clk, reset => reset, RX => RX_E, read_pointer => read_pointer_out_E, write_pointer => write_pointer_out_E, write_en => write_en_out_E, Data_out => FIFO_D_out_E);
FIFO_W: FIFO_data_path generic map(DATA_WIDTH => DATA_WIDTH) port map(clk => clk, reset => reset, RX => RX_W, read_pointer => read_pointer_out_W, write_pointer => write_pointer_out_W, write_en => write_en_out_W, Data_out => FIFO_D_out_W);
FIFO_S: FIFO_data_path generic map(DATA_WIDTH => DATA_WIDTH) port map(clk => clk, reset => reset, RX => RX_S, read_pointer => read_pointer_out_S, write_pointer => write_pointer_out_S, write_en => write_en_out_S, Data_out => FIFO_D_out_S);
FIFO_L: FIFO_data_path generic map(DATA_WIDTH => DATA_WIDTH) port map(clk => clk, reset => reset, RX => RX_L, read_pointer => read_pointer_out_L, write_pointer => write_pointer_out_L, write_en => write_en_out_L, Data_out => FIFO_D_out_L);


end;
