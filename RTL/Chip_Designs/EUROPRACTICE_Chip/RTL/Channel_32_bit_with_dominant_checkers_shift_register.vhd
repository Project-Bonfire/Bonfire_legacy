--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_misc.all;

entity router_channel is
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
        Req_N_in ,  Req_E_in , Req_W_in , Req_S_in , Req_L_in :in  std_logic;
        
        -- fault injector signals
        fault_shift: in std_logic;
        fault_clk: in std_logic;
        fault_data_in_serial: in std_logic;
        fault_data_out_serial: out std_logic;

        Grant_N_out, Grant_E_out, Grant_W_out, Grant_S_out, Grant_L_out: out std_logic;
        Req_N_out , Req_E_out, Req_W_out, Req_S_out, Req_L_out:out std_logic;
        read_pointer_out, write_pointer_out: out std_logic_vector(3 downto 0);
        write_en_out :out std_logic;
        Xbar_sel: out std_logic_vector(4 downto 0);
        
        -- the checker output shift register
        shift : in std_logic;
        checker_clk: in std_logic;
        error_signal_sync: out std_logic;     -- this is the or of all outputs of the shift register
        error_signal_async: out std_logic;    -- this is the or of all outputs of the checkers 
        shift_serial_data: out std_logic
    ); 
end router_channel; 

architecture behavior of router_channel is
  
  COMPONENT FIFO is
    generic (
        DATA_WIDTH: integer := 32
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            DRTS: in std_logic;  
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            CTS: out std_logic; 
            empty_out: out std_logic; 
            read_pointer_out, write_pointer_out: out std_logic_vector(3 downto 0);
            write_en_out :out std_logic;
            -- fault injector signals
            shift: in std_logic;
            fault_clk: in std_logic;
            data_in_serial: in std_logic;
            data_out_serial: out std_logic;
            -- Checker outputs
            err_write_en_write_pointer, 
            err_not_write_en_write_pointer, 
            err_read_pointer_write_pointer_not_empty, 
            err_read_pointer_write_pointer_empty, 
            err_read_pointer_write_pointer_not_full, 
            err_read_pointer_write_pointer_full, 
            err_read_pointer_increment, 
            err_read_pointer_not_increment, 
            --err_CTS_in, 
            err_write_en, 
            err_not_CTS_in, 
            --err_not_write_en, 
            err_read_en_mismatch : out std_logic
        );
    end COMPONENT;


    COMPONENT Arbiter   
 	 
    port (reset: in  std_logic;
          clk: in  std_logic;
          Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic; -- From LBDR modules
          DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the next router/NI (for hand-shaking)

          Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
          Xbar_sel : out std_logic_vector(4 downto 0); -- select lines for XBAR
          RTS: out std_logic; -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid
          -- fault injector signals
            shift: in std_logic;
            fault_clk: in std_logic;
            data_in_serial: in std_logic;
            data_out_serial: out std_logic;
          -- Checker outputs
          err_state_IDLE_xbar,
          err_state_not_IDLE_xbar,
          err_state_IDLE_RTS_FF_in, 
          err_state_not_IDLE_RTS_FF_RTS_FF_in,
          err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in, 
          err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in, 
          err_RTS_FF_not_DCTS_state_state_in, 
          err_not_RTS_FF_state_in_next_state, 
          err_RTS_FF_DCTS_state_in_next_state, 
          err_not_DCTS_Grants, 
          err_DCTS_not_RTS_FF_Grants, 
          err_DCTS_RTS_FF_IDLE_Grants, 
          err_DCTS_RTS_FF_not_IDLE_Grants_onehot, 
          err_Requests_next_state_IDLE, 
          err_IDLE_Req_L, 
          err_Local_Req_L,
          err_North_Req_N, 
          err_IDLE_Req_N, 
          err_Local_Req_N,      
          err_South_Req_L, 
          err_West_Req_L,
          err_South_Req_N,
          err_East_Req_L,
          err_West_Req_N,
          err_East_Req_N,
          err_next_state_onehot, 
          err_state_in_onehot, 
          err_state_north_xbar_sel, 
          err_state_east_xbar_sel, 
          err_state_west_xbar_sel, 
          err_state_south_xbar_sel : out std_logic 
          );
	end COMPONENT;

	COMPONENT LBDR is
    generic (
        cur_addr_rst: integer := 5;
        Rxy_rst: integer := 60;
        Cx_rst: integer := 15;
        NoC_size: integer := 4
    );
    port (reset: in  std_logic;
          clk: in  std_logic;
          empty: in  std_logic;
          flit_type: in std_logic_vector(2 downto 0);
          dst_addr: in std_logic_vector(NoC_size-1 downto 0);
          Req_N, Req_E, Req_W, Req_S, Req_L:out std_logic;
          -- fault injector signals
            shift: in std_logic;
            fault_clk: in std_logic;
            data_in_serial: in std_logic;
            data_out_serial: out std_logic;
          -- Checker outputs
          --err_header_not_empty_Requests_in_onehot, 
          err_header_empty_Requests_FF_Requests_in, 
          err_tail_Requests_in_all_zero, 
          err_header_tail_Requests_FF_Requests_in, 
          err_dst_addr_cur_addr_N1,
          err_dst_addr_cur_addr_not_N1,
          err_dst_addr_cur_addr_E1,
          err_dst_addr_cur_addr_not_E1,
          err_dst_addr_cur_addr_W1,
          err_dst_addr_cur_addr_not_W1,
          err_dst_addr_cur_addr_S1,
          err_dst_addr_cur_addr_not_S1, 
          err_dst_addr_cur_addr_not_Req_L_in, 
          err_dst_addr_cur_addr_Req_L_in, 
          err_header_not_empty_Req_N_in,
          err_header_not_empty_Req_E_in,
          err_header_not_empty_Req_W_in,
          err_header_not_empty_Req_S_in : out std_logic
          );
	end COMPONENT;

  COMPONENT shift_register is
    generic (
        REG_WIDTH: integer := 8
    );
    port (
        clk, reset : in std_logic;
        shift: in std_logic;
        data_in: in std_logic_vector(REG_WIDTH-1 downto 0);
        data_out_parallel: in std_logic_vector(REG_WIDTH-1 downto 0);
        data_out_serial: out std_logic
    );
  end COMPONENT;
 
    -- Grant_XY : Grant signal generated from Arbiter for output X connected to FIFO of input Y

  signal empty: std_logic; 
   
  signal combined_error_signals: std_logic_vector(58 downto 0);
  signal shift_parallel_data: std_logic_vector(58 downto 0);
 
  -- Signals related to Checkers
  -- LBDR Checkers signals
  signal err_header_empty_Requests_FF_Requests_in, err_tail_Requests_in_all_zero, 
         err_header_tail_Requests_FF_Requests_in, err_dst_addr_cur_addr_N1,
         err_dst_addr_cur_addr_not_N1, err_dst_addr_cur_addr_E1,
         err_dst_addr_cur_addr_not_E1, err_dst_addr_cur_addr_W1,
         err_dst_addr_cur_addr_not_W1, err_dst_addr_cur_addr_S1,
         err_dst_addr_cur_addr_not_S1, err_dst_addr_cur_addr_not_Req_L_in, 
         err_dst_addr_cur_addr_Req_L_in, err_header_not_empty_Req_N_in,
         err_header_not_empty_Req_E_in, err_header_not_empty_Req_W_in,
         err_header_not_empty_Req_S_in : std_logic;

  -- Arbiter Checkers signals
  signal err_state_IDLE_xbar, err_state_not_IDLE_xbar,
         err_state_IDLE_RTS_FF_in, err_state_not_IDLE_RTS_FF_RTS_FF_in,
         err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in, err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in, 
         err_RTS_FF_not_DCTS_state_state_in, err_not_RTS_FF_state_in_next_state, 
         err_RTS_FF_DCTS_state_in_next_state, err_not_DCTS_Grants, 
         err_DCTS_not_RTS_FF_Grants, err_DCTS_RTS_FF_IDLE_Grants, 
         err_DCTS_RTS_FF_not_IDLE_Grants_onehot, err_Requests_next_state_IDLE, 
         err_IDLE_Req_L, err_Local_Req_L, err_North_Req_N, err_IDLE_Req_N, err_Local_Req_N,      
         err_South_Req_L, err_West_Req_L, err_South_Req_N, err_East_Req_L,
         err_West_Req_N, err_East_Req_N, err_next_state_onehot, err_state_in_onehot, 
         err_state_north_xbar_sel, err_state_east_xbar_sel, 
         err_state_west_xbar_sel, err_state_south_xbar_sel : std_logic; 
 
  -- FIFO Control Part Checkers signals
  signal err_write_en_write_pointer, err_not_write_en_write_pointer, 
         err_read_pointer_write_pointer_not_empty, err_read_pointer_write_pointer_empty, 
         err_read_pointer_write_pointer_not_full, err_read_pointer_write_pointer_full, 
         err_read_pointer_increment, err_read_pointer_not_increment, 
         err_write_en, err_not_CTS_in, err_read_en_mismatch : std_logic;

  signal fault_DO_serial_FIFO_2_LBDR, fault_DO_serial_LBDR_2_Arbiter: std_logic;
       
begin


  -- OR of checker outputs
  error_signal_sync  <= OR_REDUCE(shift_parallel_data);
  error_signal_async <= OR_REDUCE(combined_error_signals);
  -- making the shift register input signal
  -- please keep this like this, used this for counting the number of the signals.
  combined_error_signals <=   err_header_empty_Requests_FF_Requests_in &
                              err_tail_Requests_in_all_zero &
                              err_header_tail_Requests_FF_Requests_in &
                              err_dst_addr_cur_addr_N1 &
                              err_dst_addr_cur_addr_not_N1 &
                              err_dst_addr_cur_addr_E1 &
                              err_dst_addr_cur_addr_not_E1 &
                              err_dst_addr_cur_addr_W1 &
                              err_dst_addr_cur_addr_not_W1 &
                              err_dst_addr_cur_addr_S1 &
                              err_dst_addr_cur_addr_not_S1 &
                              err_dst_addr_cur_addr_not_Req_L_in &
                              err_dst_addr_cur_addr_Req_L_in &
                              err_header_not_empty_Req_N_in &
                              err_header_not_empty_Req_E_in &
                              err_header_not_empty_Req_W_in &
                              err_header_not_empty_Req_S_in &
                              err_state_IDLE_xbar &
                              err_state_not_IDLE_xbar &
                              err_state_IDLE_RTS_FF_in &
                              err_state_not_IDLE_RTS_FF_RTS_FF_in &
                              err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in &
                              err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in & 
                              err_RTS_FF_not_DCTS_state_state_in &
                              err_not_RTS_FF_state_in_next_state &
                              err_RTS_FF_DCTS_state_in_next_state &
                              err_not_DCTS_Grants &
                              err_DCTS_not_RTS_FF_Grants &
                              err_DCTS_RTS_FF_IDLE_Grants &
                              err_DCTS_RTS_FF_not_IDLE_Grants_onehot &
                              err_Requests_next_state_IDLE &
                              err_IDLE_Req_L &
                              err_Local_Req_L &
                              err_North_Req_N &
                              err_IDLE_Req_N &
                              err_Local_Req_N &
                              err_South_Req_L &
                              err_West_Req_L &
                              err_South_Req_N &
                              err_East_Req_L &
                              err_West_Req_N &
                              err_East_Req_N &
                              err_next_state_onehot &
                              err_state_in_onehot &
                              err_state_north_xbar_sel &
                              err_state_east_xbar_sel &
                              err_state_west_xbar_sel &
                              err_state_south_xbar_sel &
                              err_write_en_write_pointer & 
                              err_not_write_en_write_pointer &
                              err_read_pointer_write_pointer_not_empty &
                              err_read_pointer_write_pointer_empty &
                              err_read_pointer_write_pointer_not_full &
                              err_read_pointer_write_pointer_full &
                              err_read_pointer_increment &
                              err_read_pointer_not_increment &
                              err_write_en &
                              err_not_CTS_in &
                              err_read_en_mismatch;
---------------------------------------------------------------------------------------------------------------------------

 FIFO_unit: FIFO generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (reset => reset, clk => clk, DRTS => DRTS, 
   			read_en_N => Grant_N_in, read_en_E =>Grant_E_in, read_en_W =>Grant_W_in, read_en_S =>Grant_S_in, read_en_L =>Grant_L_in, 
   			CTS => CTS, empty_out => empty,  

            read_pointer_out => read_pointer_out, write_pointer_out => write_pointer_out,
            write_en_out => write_en_out, 

            shift=>fault_shift, fault_clk=>fault_clk, data_in_serial=> fault_data_in_serial, data_out_serial=>fault_DO_serial_FIFO_2_LBDR,
            
        err_write_en_write_pointer => err_write_en_write_pointer,
        err_not_write_en_write_pointer => err_not_write_en_write_pointer,
        err_read_pointer_write_pointer_not_empty => err_read_pointer_write_pointer_not_empty,
        err_read_pointer_write_pointer_empty => err_read_pointer_write_pointer_empty,
        err_read_pointer_write_pointer_not_full => err_read_pointer_write_pointer_not_full,
        err_read_pointer_write_pointer_full => err_read_pointer_write_pointer_full,
        err_read_pointer_increment => err_read_pointer_increment,
        err_read_pointer_not_increment => err_read_pointer_not_increment,
        err_write_en => err_write_en,
        err_not_CTS_in => err_not_CTS_in,
        err_read_en_mismatch => err_read_en_mismatch
        );      

  
------------------------------------------------------------------------------------------------------------------------------

LBDR_unit: LBDR generic map (cur_addr_rst => current_address, Rxy_rst => Rxy_rst, Cx_rst => Cx_rst, NoC_size => NoC_size)
	   PORT MAP (reset => reset, clk => clk, empty => empty, flit_type => flit_type, dst_addr=> destination_address,
   		 	 Req_N=> Req_N_out, Req_E=>Req_E_out, Req_W=>Req_W_out, Req_S=>Req_S_out, Req_L=>Req_L_out, 

         shift=>shift, fault_clk=>fault_clk, data_in_serial=> fault_DO_serial_FIFO_2_LBDR, data_out_serial=>fault_DO_serial_LBDR_2_Arbiter,

         err_header_empty_Requests_FF_Requests_in => err_header_empty_Requests_FF_Requests_in,
         err_tail_Requests_in_all_zero => err_tail_Requests_in_all_zero,
         err_header_tail_Requests_FF_Requests_in => err_header_tail_Requests_FF_Requests_in,
         err_dst_addr_cur_addr_N1 => err_dst_addr_cur_addr_N1,
         err_dst_addr_cur_addr_not_N1 => err_dst_addr_cur_addr_not_N1,
         err_dst_addr_cur_addr_E1 => err_dst_addr_cur_addr_E1,
         err_dst_addr_cur_addr_not_E1 => err_dst_addr_cur_addr_not_E1,
         err_dst_addr_cur_addr_W1 => err_dst_addr_cur_addr_W1,
         err_dst_addr_cur_addr_not_W1 => err_dst_addr_cur_addr_not_W1,
         err_dst_addr_cur_addr_S1 => err_dst_addr_cur_addr_S1,
         err_dst_addr_cur_addr_not_S1 => err_dst_addr_cur_addr_not_S1,
         err_dst_addr_cur_addr_not_Req_L_in => err_dst_addr_cur_addr_not_Req_L_in,
         err_dst_addr_cur_addr_Req_L_in => err_dst_addr_cur_addr_Req_L_in,
         err_header_not_empty_Req_N_in => err_header_not_empty_Req_N_in,
         err_header_not_empty_Req_E_in => err_header_not_empty_Req_E_in,
         err_header_not_empty_Req_W_in => err_header_not_empty_Req_W_in,
         err_header_not_empty_Req_S_in => err_header_not_empty_Req_S_in
         );

 

------------------------------------------------------------------------------------------------------------------------------

Arbiter_unit: Arbiter 
   PORT MAP (reset => reset, clk => clk,
          Req_N => Req_N_in , Req_E => Req_E_in, Req_W => Req_W_in, Req_S => Req_S_in, Req_L => Req_L_in,
          DCTS => DCTS, Grant_N => Grant_N_out, Grant_E => Grant_E_out, Grant_W => Grant_W_out, Grant_S => Grant_S_out, Grant_L => Grant_L_out,
          Xbar_sel => Xbar_sel, 
          RTS =>  RTS, 

          shift=>shift, fault_clk=>fault_clk, data_in_serial=> fault_DO_serial_LBDR_2_Arbiter, data_out_serial=> fault_data_out_serial,

          err_state_IDLE_xbar => err_state_IDLE_xbar ,
          err_state_not_IDLE_xbar => err_state_not_IDLE_xbar ,
          err_state_IDLE_RTS_FF_in => err_state_IDLE_RTS_FF_in ,
          err_state_not_IDLE_RTS_FF_RTS_FF_in => err_state_not_IDLE_RTS_FF_RTS_FF_in ,
          err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in => err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in ,
          err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in => err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in ,
          err_RTS_FF_not_DCTS_state_state_in => err_RTS_FF_not_DCTS_state_state_in ,
          err_not_RTS_FF_state_in_next_state => err_not_RTS_FF_state_in_next_state ,
          err_RTS_FF_DCTS_state_in_next_state => err_RTS_FF_DCTS_state_in_next_state ,
          err_not_DCTS_Grants => err_not_DCTS_Grants ,
          err_DCTS_not_RTS_FF_Grants => err_DCTS_not_RTS_FF_Grants ,
          err_DCTS_RTS_FF_IDLE_Grants => err_DCTS_RTS_FF_IDLE_Grants ,
          err_DCTS_RTS_FF_not_IDLE_Grants_onehot => err_DCTS_RTS_FF_not_IDLE_Grants_onehot ,
          err_Requests_next_state_IDLE => err_Requests_next_state_IDLE ,
          err_IDLE_Req_L => err_IDLE_Req_L ,
          err_Local_Req_L => err_Local_Req_L ,
          err_North_Req_N => err_North_Req_N ,
          err_IDLE_Req_N => err_IDLE_Req_N ,
          err_Local_Req_N => err_Local_Req_N ,
          err_South_Req_L => err_South_Req_L ,
          err_West_Req_L => err_West_Req_L ,
          err_South_Req_N => err_South_Req_N ,
          err_East_Req_L => err_East_Req_L ,
          err_West_Req_N => err_West_Req_N ,
          err_East_Req_N => err_East_Req_N ,
          err_next_state_onehot => err_next_state_onehot ,
          err_state_in_onehot => err_state_in_onehot ,
          err_state_north_xbar_sel => err_state_north_xbar_sel ,
          err_state_east_xbar_sel => err_state_east_xbar_sel ,
          err_state_west_xbar_sel => err_state_west_xbar_sel ,
          err_state_south_xbar_sel => err_state_south_xbar_sel
        );     

 checker_shifter: shift_register generic map (REG_WIDTH => 59)
    port map (
        clk => checker_clk, reset => reset,
        shift => shift,
        data_in => combined_error_signals, 
        data_out_parallel => shift_parallel_data,
        data_out_serial => shift_serial_data
    );


end;
