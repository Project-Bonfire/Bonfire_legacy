
library ieee;
use ieee.std_logic_1164.all;

package component_pack is
  
  CONSTANT IDLE: std_logic_vector (5 downto 0) := "000001";
  CONSTANT Local: std_logic_vector (5 downto 0) := "000010";
  CONSTANT North: std_logic_vector (5 downto 0) := "000100";
  CONSTANT East: std_logic_vector (5 downto 0) := "001000";
  CONSTANT West: std_logic_vector (5 downto 0) := "010000";
  CONSTANT South: std_logic_vector (5 downto 0) := "100000";

  COMPONENT counter_threshold_classifier is
    generic (
        counter_depth: integer := 8;
        healthy_counter_threshold: integer := 4;
        faulty_counter_threshold: integer := 4
     );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            faulty_packet, Healthy_packet: in  std_logic;
            Healthy, intermittent, Faulty: out std_logic
            );
  end COMPONENT;
  
  COMPONENT checkers_counter_threshold_classifier is
        generic (
            counter_depth: integer := 8;
            healthy_counter_threshold: integer := 4;
            faulty_counter_threshold: integer := 4
         );
        port (  reset: in  std_logic;
                clk: in  std_logic;
                data_input: in  std_logic;
                Healthy, Intermittent, Faulty: out std_logic
                );
  end COMPONENT;

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

                fault_info, health_info: out  std_logic;

                -- fault injector shift register with serial input signals
                TCK: in std_logic;  
                SE: in std_logic;       -- shift enable 
                UE: in std_logic;       -- update enable
                SI: in std_logic;       -- serial Input
                SO: out std_logic;      -- serial output

                -- Checker outputs
                -- Functional checkers
                err_empty_full, err_empty_read_en, err_full_write_en, err_state_in_onehot, 
                err_read_pointer_in_onehot, err_write_pointer_in_onehot, 

                -- Structural checkers
                err_write_en_write_pointer, 
                err_not_write_en_write_pointer, 
                err_read_pointer_write_pointer_not_empty, 
                err_read_pointer_write_pointer_empty, 
                err_read_pointer_write_pointer_not_full, 
                err_read_pointer_write_pointer_full, 
                err_read_pointer_increment, 
                err_read_pointer_not_increment, 
                err_write_en, err_not_write_en, err_not_write_en1, err_not_write_en2, 
                err_read_en_mismatch, err_read_en_mismatch1, 

                -- Newly added checkers for FIFO with packet drop and fault classifier support!
                err_fake_credit_read_en_fake_credit_counter_in_increment, 
                err_not_fake_credit_not_read_en_fake_credit_counter_not_zero_fake_credit_counter_in_decrement, 
                err_not_fake_credit_read_en_fake_credit_counter_in_not_change, 
                err_fake_credit_not_read_en_fake_credit_counter_in_not_change, 
                err_not_fake_credit_not_read_en_fake_credit_counter_zero_fake_credit_counter_in_not_change, 
                err_fake_credit_read_en_credit_out, 
                err_not_fake_credit_not_read_en_fake_credit_counter_not_zero_credit_out, 
                err_not_fake_credit_not_read_en_fake_credit_counter_zero_not_credit_out, 

                -- Checkers for Packet Dropping FSM of FIFO
                err_state_out_Idle_not_fault_out_valid_in_state_in_Header_flit, 
                err_state_out_Idle_not_fault_out_valid_in_state_in_not_change, 
                err_state_out_Idle_not_fault_out_not_fake_credit, 
                err_state_out_Idle_not_fault_out_not_fault_info_in, 
                err_state_out_Idle_not_fault_out_faulty_packet_in_faulty_packet_out_equal, 
                err_state_out_Idle_fault_out_fake_credit, 
                err_state_out_Idle_fault_out_state_in_Packet_drop, 
                err_state_out_Idle_fault_out_fault_info_in, 
                err_state_out_Idle_fault_out_faulty_packet_in, 
                err_state_out_Idle_not_health_info, 
                err_state_out_Idle_not_write_fake_flit, 

                err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Body_state_in_Body_flit, 
                err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Tail_state_in_Tail_flit, 
                err_state_out_Header_flit_valid_in_not_fault_out_not_write_fake_flit, 
                err_state_out_Header_flit_valid_in_not_fault_out_not_fault_info_in, 
                err_state_out_Header_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change, 
                err_state_out_Header_flit_valid_in_fault_out_write_fake_flit, 
                err_state_out_Header_flit_valid_in_fault_out_state_in_Packet_drop, 
                err_state_out_Header_flit_valid_in_fault_out_fault_info_in, 
                err_state_out_Header_flit_valid_in_fault_out_faulty_packet_in, 
                err_state_out_Header_flit_not_valid_in_state_in_state_out_not_change, 
                err_state_out_Header_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change, 
                err_state_out_Header_flit_not_valid_in_not_fault_info_in, 
                err_state_out_Header_flit_not_valid_in_not_write_fake_flit, 
                err_state_out_Header_flit_or_Body_flit_not_fake_credit, 

                err_state_out_Body_flit_valid_in_not_fault_out_state_in_state_out_not_change, 
                err_state_out_Body_flit_valid_in_not_fault_out_state_in_Tail_flit, 
                err_state_out_Body_flit_valid_in_not_fault_out_health_info, 
                err_state_out_Body_flit_valid_in_not_fault_out_not_write_fake_flit, 
                err_state_out_Body_flit_valid_in_not_fault_out_fault_info_in, 
                err_state_out_Body_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change, 
                err_state_out_Body_flit_valid_in_fault_out_write_fake_flit, 
                err_state_out_Body_flit_valid_in_fault_out_state_in_Packet_drop, 
                err_state_out_Body_flit_valid_in_fault_out_fault_info_in, 
                err_state_out_Body_flit_valid_in_fault_out_faulty_packet_in, 
                err_state_out_Body_flit_not_valid_in_state_in_state_out_not_change, 
                err_state_out_Body_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change, 
                err_state_out_Body_flit_not_valid_in_not_fault_info_in, 
                err_state_out_Body_flit_valid_in_not_fault_out_flit_type_not_tail_not_health_info, 
                err_state_out_Body_flit_valid_in_fault_out_not_health_info, 
                err_state_out_Body_flit_valid_in_not_health_info, 
                err_state_out_Body_flit_not_fake_credit, 
                err_state_out_Body_flit_not_valid_in_not_write_fake_flit, 

                err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_Header_state_in_Header_flit, 
                err_state_out_Tail_flit_valid_in_not_fault_out_not_fake_credit, 
                err_state_out_Tail_flit_valid_in_not_fault_out_not_fault_info_in, 
                err_state_out_Tail_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change, 
                err_state_out_Tail_flit_valid_in_fault_out_fake_credit, 
                err_state_out_Tail_flit_valid_in_fault_out_state_in_Packet_drop, 
                err_state_out_Tail_flit_valid_in_fault_out_fault_info_in, 
                err_state_out_Tail_flit_valid_in_fault_out_faulty_packet_in, 
                err_state_out_Tail_flit_not_valid_in_state_in_Idle, 
                err_state_out_Tail_flit_not_valid_in_faulty_packet_in_faulty_packet_in_not_change, 
                err_state_out_Tail_flit_not_valid_in_not_fault_info_in, 
                err_state_out_Tail_flit_not_valid_in_not_fake_credit, 
                err_state_out_Tail_flit_not_write_fake_flit, 

                err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_not_fake_credit, 
                err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_not_faulty_packet_in, 
                err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_state_in_Header_flit, 
                err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_write_fake_flit, 
                err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_not_faulty_packet_in, 
                err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_not_state_in_Idle, 
                err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_fake_credit, 
                err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_invalid_fault_out_fake_credit, 
                err_state_out_Packet_drop_faulty_packet_out_not_valid_in_flit_type_body_or_invalid_fault_out_faulty_packet_in_faulty_packet_out_not_change, 
                err_state_out_Packet_drop_faulty_packet_out_flit_type_invalid_fault_out_state_in_state_out_not_change, 
                err_state_out_Packet_drop_faulty_packet_out_not_valid_in_faulty_packet_in_faulty_packet_out_equal, 
                err_state_out_Packet_drop_faulty_packet_out_not_valid_in_state_in_state_out_not_change, 
                err_state_out_Packet_drop_faulty_packet_out_not_valid_in_not_write_fake_flit, 
                err_state_out_Packet_drop_faulty_packet_out_not_valid_in_not_fake_credit, 
                err_state_out_Packet_drop_not_faulty_packet_out_state_in_state_out_not_change, 
                err_state_out_Packet_drop_not_faulty_packet_out_faulty_packet_in_faulty_packet_out_not_change, 
                err_state_out_Packet_drop_not_faulty_packet_out_not_fake_credit, 
                err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_or_fault_out_not_write_fake_flit, 
                err_state_out_Packet_drop_not_faulty_packet_out_not_write_fake_flit, 
                err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_fault_out_state_in_state_out_not_change, 
                err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_fault_out_state_in_state_out_not_change, 

                err_fault_info_fault_info_out_equal, 
                err_state_out_Packet_drop_not_valid_in_state_in_state_out_equal, 
                err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_not_Header_state_in_state_out_equal, 

                err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_info_in, 
                err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_Header_not_not_fault_info_in : out std_logic
    );
    end COMPONENT;

  COMPONENT parity_checker_for_LBDR is 
    generic(DATA_WIDTH : integer := 32);
    port(
        RX: in std_logic_vector(DATA_WIDTH-1 downto 0);
        empty: in std_logic;
        faulty: out std_logic
        );
  end COMPONENT;

  COMPONENT LBDR_packet_drop is
    generic (
        cur_addr_rst: integer := 8;
        Rxy_rst: integer := 8;
        Cx_rst: integer := 8;
        NoC_size: integer := 4
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            
            Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S: in std_logic;

            empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            faulty: in std_logic;
            packet_drop_order: out std_logic;
            grant_N, grant_E, grant_W, grant_S, grant_L: in std_logic;
            Req_N, Req_E, Req_W, Req_S, Req_L:out std_logic;

            Rxy_reconf_PE: in  std_logic_vector(7 downto 0);
            Cx_reconf_PE: in  std_logic_vector(3 downto 0);
            Reconfig_command : in std_logic; 

            -- fault injector shift register with serial input signals
            TCK: in std_logic;  
            SE: in std_logic;       -- shift enable 
            UE: in std_logic;       -- update enable
            SI: in std_logic;       -- serial Input
            SO: out std_logic;      -- serial output

            -- Checker outputs
            -- Routing part checkers            
            err_header_empty_Requests_FF_Requests_in, 
            err_tail_Requests_in_all_zero, 
            err_tail_empty_Requests_FF_Requests_in, 
            err_tail_not_empty_not_grants_Requests_FF_Requests_in,
            err_grants_onehot,
            err_grants_mismatch, 
            err_header_tail_Requests_FF_Requests_in, 
            err_dst_addr_cur_addr_N1,
            err_dst_addr_cur_addr_not_N1,
            err_dst_addr_cur_addr_E1,
            err_dst_addr_cur_addr_not_E1,
            err_dst_addr_cur_addr_W1,
            err_dst_addr_cur_addr_not_W1,
            err_dst_addr_cur_addr_S1,
            err_dst_addr_cur_addr_not_S1, 
            err_dst_addr_cur_addr_Req_L_in, 
            err_dst_addr_cur_addr_not_Req_L_in, 
            err_header_not_empty_faulty_drop_packet_in, -- added according to new design
            err_header_not_empty_not_faulty_drop_packet_in_packet_drop_not_change, -- added according to new design
            err_header_not_empty_faulty_Req_in_all_zero, -- added according to new design
            --err_header_not_empty_Req_L_in, -- added according to new design
            err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in, 
            err_header_empty_packet_drop_in_packet_drop_equal, 
            err_tail_not_empty_packet_drop_not_packet_drop_in, 
            err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal, 
            err_invalid_or_body_flit_packet_drop_in_packet_drop_equal, 
            err_packet_drop_order, 

            -- Cx_Reconf checkers
            err_reconfig_cx_flit_type_Tail_not_empty_grants_Cx_in_Temp_Cx_equal, 
            err_reconfig_cx_flit_type_Tail_not_empty_grants_not_reconfig_cx_in, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Cx_in_Cx_equal, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_reconfig_cx_in, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_Temp_Cx_in, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Reconfig_command_reconfig_cx_in, 
            err_reconfig_cx_flit_type_Tail_not_empty_grants_Temp_Cx_in_Temp_Cx_equal, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Temp_Cx_in_Cx_reconf_PE_equal, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_reconfig_cx_in_reconfig_cx_equal, -- Added 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_Temp_Cx_in_Temp_Cx_equal, -- Added

            -- Rxy_Reconf checkers
            err_ReConf_FF_out_flit_type_Tail_not_empty_grants_Rxy_in_Rxy_tmp, 
            err_ReConf_FF_out_flit_type_Tail_not_empty_grants_not_ReConf_FF_in, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Rxy_in_Rxy_equal, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_ReConf_FF_in, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_Rxy_tmp_in_Rxy_reconf_PE_equal, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_Rxy_tmp_in_Rxy_tmp_equal, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_ReConf_FF_in_ReConf_FF_out_equal : out std_logic            
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

  component fault_injector  
    generic(
      DATA_WIDTH : integer := 32; 
      ADDRESS_WIDTH : integer := 5
      );
    port(
      data_in: in std_logic_vector (DATA_WIDTH-1 downto 0);
      address: in std_logic_vector (ADDRESS_WIDTH-1 downto 0);
      sta_0: in std_logic;
      sta_1: in std_logic;
      data_out: out std_logic_vector (DATA_WIDTH-1 downto 0)
      );
  end component;

  component shift_register_serial_in
    generic (
        REG_WIDTH: integer := 32
    );
    port (
        TCK, reset : in std_logic;  
        SE: in std_logic;       -- shift enable 
        UE: in std_logic;       -- update enable
        SI: in std_logic;       -- serial Input
        SO: out std_logic;      -- serial output
        data_out_parallel: out std_logic_vector(REG_WIDTH-1 downto 0)
    );
  end component;

  component Arbiter_in 
    port (  reset: in std_logic;
            clk: in std_logic;
            Req_X_N, Req_X_E, Req_X_W, Req_X_S, Req_X_L: in std_logic; -- From LBDR modules

            X_N, X_E, X_W, X_S, X_L: out std_logic; -- Grants given to LBDR requests (encoded as one-hot)

            -- fault injector shift register with serial input signals
          TCK: in std_logic;  
          SE: in std_logic;       -- shift enable 
          UE: in std_logic;       -- update enable
          SI: in std_logic;       -- serial Input
          SO: out std_logic;      -- serial output

            -- Checker outputs
      err_Requests_state_in_state_not_equal, 

      err_IDLE_Req_N, err_IDLE_grant_N,err_North_Req_N, err_North_grant_N, err_East_Req_E, err_East_grant_E, 
      err_West_Req_W, err_West_grant_W, err_South_Req_S,err_South_grant_S,err_Local_Req_L, err_Local_grant_L,

      err_IDLE_Req_E, err_IDLE_grant_E, err_North_Req_E, err_North_grant_E, err_East_Req_W, err_East_grant_W, 
      err_West_Req_S, err_West_grant_S, err_South_Req_L, err_South_grant_L, err_Local_Req_N, err_Local_grant_N,

      err_IDLE_Req_W, err_IDLE_grant_W, err_North_Req_W, err_North_grant_W, err_East_Req_S, err_East_grant_S, 
      err_West_Req_L, err_West_grant_L, err_South_Req_N,  err_South_grant_N, err_Local_Req_E, err_Local_grant_E, 

      err_IDLE_Req_S, err_IDLE_grant_S, err_North_Req_S, err_North_grant_S, err_East_Req_L, err_East_grant_L, 
      err_West_Req_N, err_West_grant_N, err_South_Req_E, err_South_grant_E, err_Local_Req_W, err_Local_grant_W, 

      err_IDLE_Req_L, err_IDLE_grant_L, err_North_Req_L, err_North_grant_L, err_East_Req_N, err_East_grant_N, 
      err_West_Req_E, err_West_grant_E, err_South_Req_W, err_South_grant_W, err_Local_Req_S, err_Local_grant_S, 

      err_state_in_onehot, err_no_request_grants, err_request_no_grants, 

      err_no_Req_N_grant_N, err_no_Req_E_grant_E, err_no_Req_W_grant_W, err_no_Req_S_grant_S, err_no_Req_L_grant_L : out std_logic
          );
end component;


  component Arbiter_in_one_hot_checkers 
      port (  
        req_X_N, req_X_E, req_X_W, req_X_S, req_X_L :in std_logic;
        state: in std_logic_vector (5 downto 0);
        state_in: in std_logic_vector (5 downto 0);
        X_N, X_E, X_W, X_S, X_L :in std_logic;

            -- Checker outputs
        err_Requests_state_in_state_not_equal, 

        err_IDLE_Req_N, err_IDLE_grant_N,err_North_Req_N, err_North_grant_N, err_East_Req_E, err_East_grant_E, 
        err_West_Req_W, err_West_grant_W, err_South_Req_S,err_South_grant_S,err_Local_Req_L, err_Local_grant_L,

        err_IDLE_Req_E, err_IDLE_grant_E, err_North_Req_E, err_North_grant_E, err_East_Req_W, err_East_grant_W,
        err_West_Req_S, err_West_grant_S, err_South_Req_L, err_South_grant_L, err_Local_Req_N, err_Local_grant_N,

        err_IDLE_Req_W, err_IDLE_grant_W, err_North_Req_W, err_North_grant_W, err_East_Req_S, err_East_grant_S,
        err_West_Req_L, err_West_grant_L, err_South_Req_N,  err_South_grant_N, err_Local_Req_E, err_Local_grant_E, 

        err_IDLE_Req_S, err_IDLE_grant_S, err_North_Req_S, err_North_grant_S, err_East_Req_L, err_East_grant_L, 
        err_West_Req_N, err_West_grant_N, err_South_Req_E, err_South_grant_E, err_Local_Req_W, err_Local_grant_W, 

        err_IDLE_Req_L, err_IDLE_grant_L, err_North_Req_L, err_North_grant_L, err_East_Req_N, err_East_grant_N, 
        err_West_Req_E, err_West_grant_E, err_South_Req_W, err_South_grant_W, err_Local_Req_S, err_Local_grant_S, 

        err_state_in_onehot, err_no_request_grants, err_request_no_grants, err_no_Req_N_grant_N,
        err_no_Req_E_grant_E, err_no_Req_W_grant_W, err_no_Req_S_grant_S, err_no_Req_L_grant_L : out std_logic
        );
  end component;

  component Arbiter_out_one_hot_pseudo_checkers 
    port (  credit: in std_logic_vector(1 downto 0);
        req_X_N, req_X_E, req_X_W, req_X_S, req_X_L :in std_logic; -- From LBDR modules
        state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter_out's FSM

        grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L : in std_logic; -- Grants given to LBDR requests (encoded as one-hot)
        state_in: in std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM

        -- Checker outputs
        err_Requests_state_in_state_not_equal, 
        err_IDLE_req_X_N, err_North_req_X_N, err_North_credit_not_zero_req_X_N_grant_N, 
        err_North_credit_zero_or_not_req_X_N_not_grant_N, 
        err_East_req_X_E, err_East_credit_not_zero_req_X_E_grant_E, err_East_credit_zero_or_not_req_X_E_not_grant_E, 
        err_West_req_X_W, err_West_credit_not_zero_req_X_W_grant_W, err_West_credit_zero_or_not_req_X_W_not_grant_W, 
        err_South_req_X_S, err_South_credit_not_zero_req_X_S_grant_S, err_South_credit_zero_or_not_req_X_S_not_grant_S, 
        err_Local_req_X_L, err_Local_credit_not_zero_req_X_L_grant_L, err_Local_credit_zero_or_not_req_X_L_not_grant_L, 
        err_IDLE_req_X_E, err_North_req_X_E, err_East_req_X_W, err_West_req_X_S, err_South_req_X_L, err_Local_req_X_N, 
        err_IDLE_req_X_W, err_North_req_X_W, err_East_req_X_S, err_West_req_X_L, err_South_req_X_N, err_Local_req_X_E, 
        err_IDLE_req_X_S, err_North_req_X_S, err_East_req_X_L, err_West_req_X_N, err_South_req_X_E, err_Local_req_X_W, 
        err_IDLE_req_X_L, err_North_req_X_L, err_East_req_X_N, err_West_req_X_E, err_South_req_X_W, err_Local_req_X_S, 
        err_state_in_onehot, err_no_request_grants, err_request_IDLE_state, 
        err_request_IDLE_not_Grants, err_state_North_Invalid_Grant, err_state_East_Invalid_Grant, 
        err_state_West_Invalid_Grant, err_state_South_Invalid_Grant, err_state_Local_Invalid_Grant, 
        err_Grants_onehot_or_all_zero : out std_logic             
        );
  end component;

  component arbiter_out port (  
        reset: in  std_logic;
        clk: in  std_logic;
        X_N_Y, X_E_Y, X_W_Y, X_S_Y, X_L_Y :in std_logic; -- From LBDR modules
        credit: in std_logic_vector(1 downto 0);
        grant_Y_N, grant_Y_E, grant_Y_W, grant_Y_S, grant_Y_L : out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
        -- fault injector shift register with serial input signals
        TCK: in std_logic;  
        SE: in std_logic;       -- shift enable 
        UE: in std_logic;       -- update enable
        SI: in std_logic;       -- serial Input
        SO: out std_logic;      -- serial output

        -- Checker outputs
        err_Requests_state_in_state_not_equal,
        err_IDLE_req_X_N, err_North_req_X_N, err_North_credit_not_zero_req_X_N_grant_N,
        err_North_credit_zero_or_not_req_X_N_not_grant_N, 
        err_East_req_X_E, err_East_credit_not_zero_req_X_E_grant_E, 
        err_East_credit_zero_or_not_req_X_E_not_grant_E, 
        err_West_req_X_W, err_West_credit_not_zero_req_X_W_grant_W, 
        err_West_credit_zero_or_not_req_X_W_not_grant_W, 
        err_South_req_X_S, err_South_credit_not_zero_req_X_S_grant_S, 
        err_South_credit_zero_or_not_req_X_S_not_grant_S, 
        err_Local_req_X_L, err_Local_credit_not_zero_req_X_L_grant_L, 
        err_Local_credit_zero_or_not_req_X_L_not_grant_L, 
        err_IDLE_req_X_E, err_North_req_X_E, err_East_req_X_W, err_West_req_X_S, err_South_req_X_L, err_Local_req_X_N, 
        err_IDLE_req_X_W, err_North_req_X_W, err_East_req_X_S, err_West_req_X_L, err_South_req_X_N, err_Local_req_X_E, 
        err_IDLE_req_X_S, err_North_req_X_S, err_East_req_X_L, err_West_req_X_N, err_South_req_X_E, err_Local_req_X_W, 
        err_IDLE_req_X_L, err_North_req_X_L, err_East_req_X_N, err_West_req_X_E, err_South_req_X_W, err_Local_req_X_S, 
        err_state_in_onehot, err_no_request_grants, err_request_IDLE_state, 
        err_request_IDLE_not_Grants, err_state_North_Invalid_Grant, err_state_East_Invalid_Grant, 
        err_state_West_Invalid_Grant, err_state_South_Invalid_Grant, err_state_Local_Invalid_Grant, 
        err_Grants_onehot_or_all_zero : out std_logic );
  end component;

  component allocator_logic_pseudo_checkers 
    port (  
            -- grant_X_Y means the grant for X output port towards Y input port
            -- this means for any X in [N, E, W, S, L] then set grant_X_Y is one hot!
            empty_N, empty_E, empty_W, empty_S, empty_L: in std_logic;            
            grant_N_N_sig, grant_N_E_sig, grant_N_W_sig, grant_N_S_sig, grant_N_L_sig: in std_logic;
            grant_E_N_sig, grant_E_E_sig, grant_E_W_sig, grant_E_S_sig, grant_E_L_sig: in std_logic;
            grant_W_N_sig, grant_W_E_sig, grant_W_W_sig, grant_W_S_sig, grant_W_L_sig: in std_logic;
            grant_S_N_sig, grant_S_E_sig, grant_S_W_sig, grant_S_S_sig, grant_S_L_sig: in std_logic;
            grant_L_N_sig, grant_L_E_sig, grant_L_W_sig, grant_L_S_sig, grant_L_L_sig: in std_logic;

            valid_N, valid_E, valid_W, valid_S, valid_L : in std_logic;
            grant_N_N, grant_N_E, grant_N_W, grant_N_S, grant_N_L: in std_logic;
            grant_E_N, grant_E_E, grant_E_W, grant_E_S, grant_E_L: in std_logic;
            grant_W_N, grant_W_E, grant_W_W, grant_W_S, grant_W_L: in std_logic;
            grant_S_N, grant_S_E, grant_S_W, grant_S_S, grant_S_L: in std_logic;
            grant_L_N, grant_L_E, grant_L_W, grant_L_S, grant_L_L: in std_logic;
            grant_N, grant_E, grant_W, grant_S, grant_L : in std_logic;

            -- Checker outputs
            err_grant_N_N_sig_not_empty_N_grant_N_N, err_not_grant_N_N_sig_or_empty_N_not_grant_N_N, 
            err_grant_N_E_sig_not_empty_E_grant_N_E, err_not_grant_N_E_sig_or_empty_E_not_grant_N_E, 
            err_grant_N_W_sig_not_empty_W_grant_N_W, err_not_grant_N_W_sig_or_empty_W_not_grant_N_W, 
            err_grant_N_S_sig_not_empty_S_grant_N_S, err_not_grant_N_S_sig_or_empty_S_not_grant_N_S, 
            err_grant_N_L_sig_not_empty_L_grant_N_L, err_not_grant_N_L_sig_or_empty_L_not_grant_N_L, 

            err_grant_E_N_sig_not_empty_N_grant_E_N, err_not_grant_E_N_sig_or_empty_N_not_grant_E_N, 
            err_grant_E_E_sig_not_empty_E_grant_E_E, err_not_grant_E_E_sig_or_empty_E_not_grant_E_E, 
            err_grant_E_W_sig_not_empty_W_grant_E_W, err_not_grant_E_W_sig_or_empty_W_not_grant_E_W, 
            err_grant_E_S_sig_not_empty_S_grant_E_S, err_not_grant_E_S_sig_or_empty_S_not_grant_E_S, 
            err_grant_E_L_sig_not_empty_L_grant_E_L, err_not_grant_E_L_sig_or_empty_L_not_grant_E_L, 

            err_grant_W_N_sig_not_empty_N_grant_W_N, err_not_grant_W_N_sig_or_empty_N_not_grant_W_N, 
            err_grant_W_E_sig_not_empty_E_grant_W_E, err_not_grant_W_E_sig_or_empty_E_not_grant_W_E, 
            err_grant_W_W_sig_not_empty_W_grant_W_W, err_not_grant_W_W_sig_or_empty_W_not_grant_W_W, 
            err_grant_W_S_sig_not_empty_S_grant_W_S, err_not_grant_W_S_sig_or_empty_S_not_grant_W_S, 
            err_grant_W_L_sig_not_empty_L_grant_W_L, err_not_grant_W_L_sig_or_empty_L_not_grant_W_L, 

            err_grant_S_N_sig_not_empty_N_grant_S_N, err_not_grant_S_N_sig_or_empty_N_not_grant_S_N, 
            err_grant_S_E_sig_not_empty_E_grant_S_E, err_not_grant_S_E_sig_or_empty_E_not_grant_S_E, 
            err_grant_S_W_sig_not_empty_W_grant_S_W, err_not_grant_S_W_sig_or_empty_W_not_grant_S_W, 
            err_grant_S_S_sig_not_empty_S_grant_S_S, err_not_grant_S_S_sig_or_empty_S_not_grant_S_S, 
            err_grant_S_L_sig_not_empty_L_grant_S_L, err_not_grant_S_L_sig_or_empty_L_not_grant_S_L, 

            err_grant_L_N_sig_not_empty_N_grant_L_N, err_not_grant_L_N_sig_or_empty_N_not_grant_L_N, 
            err_grant_L_E_sig_not_empty_E_grant_L_E, err_not_grant_L_E_sig_or_empty_E_not_grant_L_E, 
            err_grant_L_W_sig_not_empty_W_grant_L_W, err_not_grant_L_W_sig_or_empty_W_not_grant_L_W, 
            err_grant_L_S_sig_not_empty_S_grant_L_S, err_not_grant_L_S_sig_or_empty_S_not_grant_L_S, 
            err_grant_L_L_sig_not_empty_L_grant_L_L, err_not_grant_L_L_sig_or_empty_L_not_grant_L_L, 

            err_grant_signals_not_empty_grant_N, err_not_grant_signals_empty_not_grant_N, 
            err_grant_signals_not_empty_grant_E, err_not_grant_signals_empty_not_grant_E, 
            err_grant_signals_not_empty_grant_W, err_not_grant_signals_empty_not_grant_W, 
            err_grant_signals_not_empty_grant_S, err_not_grant_signals_empty_not_grant_S, 
            err_grant_signals_not_empty_grant_L, err_not_grant_signals_empty_not_grant_L, 

            err_grants_valid_not_match : out std_logic
         );
end component;



  component allocator_credit_counter_logic_pseudo_checkers 
    port (  
            -- flow control
            credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L: in std_logic;
            credit_counter_N_out, credit_counter_E_out, credit_counter_W_out, credit_counter_S_out, credit_counter_L_out : in std_logic_vector(1 downto 0);            
            valid_N, valid_E, valid_W, valid_S, valid_L: in std_logic; -- ?? Not sure yet ! grant or valid !

            credit_counter_N_in, credit_counter_E_in, credit_counter_W_in, credit_counter_S_in, credit_counter_L_in : in std_logic_vector(1 downto 0);

            -- Checker outputs
            err_credit_in_N_grant_N_credit_counter_N_in_credit_counter_N_out_equal, 
            err_credit_in_N_credit_counter_N_out_increment, 
            err_not_credit_in_N_credit_counter_N_out_max_credit_counter_N_in_not_change, 
            err_grant_N_credit_counter_N_out_decrement, 
            err_not_grant_N_or_credit_counter_N_out_zero_credit_counter_N_in_not_change,             
            err_not_credit_in_N_not_grant_N_credit_counter_N_in_credit_counter_N_out_equal, 

            err_credit_in_E_grant_E_credit_counter_E_in_credit_counter_E_out_equal, 
            err_credit_in_E_credit_counter_E_out_increment, 
            err_not_credit_in_E_credit_counter_E_out_max_credit_counter_E_in_not_change, 
            err_grant_E_credit_counter_E_out_decrement, 
            err_not_grant_E_or_credit_counter_E_out_zero_credit_counter_E_in_not_change,             
            err_not_credit_in_E_not_grant_E_credit_counter_E_in_credit_counter_E_out_equal, 

            err_credit_in_W_grant_W_credit_counter_W_in_credit_counter_W_out_equal, 
            err_credit_in_W_credit_counter_W_out_increment, 
            err_not_credit_in_W_credit_counter_W_out_max_credit_counter_W_in_not_change, 
            err_grant_W_credit_counter_W_out_decrement, 
            err_not_grant_W_or_credit_counter_W_out_zero_credit_counter_W_in_not_change,             
            err_not_credit_in_W_not_grant_W_credit_counter_W_in_credit_counter_W_out_equal, 

            err_credit_in_S_grant_S_credit_counter_S_in_credit_counter_S_out_equal, 
            err_credit_in_S_credit_counter_S_out_increment, 
            err_not_credit_in_S_credit_counter_S_out_max_credit_counter_S_in_not_change, 
            err_grant_S_credit_counter_S_out_decrement, 
            err_not_grant_S_or_credit_counter_S_out_zero_credit_counter_S_in_not_change,             
            err_not_credit_in_S_not_grant_S_credit_counter_S_in_credit_counter_S_out_equal, 

            err_credit_in_L_grant_L_credit_counter_L_in_credit_counter_L_out_equal, 
            err_credit_in_L_credit_counter_L_out_increment, 
            err_not_credit_in_L_credit_counter_L_out_max_credit_counter_L_in_not_change, 
            err_grant_L_credit_counter_L_out_decrement, 
            err_not_grant_L_or_credit_counter_L_out_zero_credit_counter_L_in_not_change, 
            err_not_credit_in_L_not_grant_L_credit_counter_L_in_credit_counter_L_out_equal : out std_logic
         );
  end component;

  component allocator       
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
          grant_L_N, grant_L_E, grant_L_W, grant_L_S, grant_L_L: out std_logic;

          -- fault injector shift register with serial input signals
          TCK: in std_logic;  
          SE: in std_logic;       -- shift enable 
          UE: in std_logic;       -- update enable
          SI: in std_logic;       -- serial Input
          SO: out std_logic;      -- serial output

          -- Allocator logic checker outputs
          err_grant_N_N_sig_not_empty_N_grant_N_N,         err_not_grant_N_N_sig_or_empty_N_not_grant_N_N,   err_grant_N_E_sig_not_empty_E_grant_N_E, 
          err_not_grant_N_E_sig_or_empty_E_not_grant_N_E,  err_grant_N_W_sig_not_empty_W_grant_N_W,          err_not_grant_N_W_sig_or_empty_W_not_grant_N_W, 
          err_grant_N_S_sig_not_empty_S_grant_N_S,         err_not_grant_N_S_sig_or_empty_S_not_grant_N_S,   err_grant_N_L_sig_not_empty_L_grant_N_L, 
          err_not_grant_N_L_sig_or_empty_L_not_grant_N_L, 

          err_grant_E_N_sig_not_empty_N_grant_E_N,         err_not_grant_E_N_sig_or_empty_N_not_grant_E_N,   err_grant_E_E_sig_not_empty_E_grant_E_E, 
          err_not_grant_E_E_sig_or_empty_E_not_grant_E_E,  err_grant_E_W_sig_not_empty_W_grant_E_W,          err_not_grant_E_W_sig_or_empty_W_not_grant_E_W, 
          err_grant_E_S_sig_not_empty_S_grant_E_S,         err_not_grant_E_S_sig_or_empty_S_not_grant_E_S,   err_grant_E_L_sig_not_empty_L_grant_E_L, 
          err_not_grant_E_L_sig_or_empty_L_not_grant_E_L, 

          err_grant_W_N_sig_not_empty_N_grant_W_N,         err_not_grant_W_N_sig_or_empty_N_not_grant_W_N,   err_grant_W_E_sig_not_empty_E_grant_W_E, 
          err_not_grant_W_E_sig_or_empty_E_not_grant_W_E,  err_grant_W_W_sig_not_empty_W_grant_W_W,          err_not_grant_W_W_sig_or_empty_W_not_grant_W_W, 
          err_grant_W_S_sig_not_empty_S_grant_W_S,         err_not_grant_W_S_sig_or_empty_S_not_grant_W_S,   err_grant_W_L_sig_not_empty_L_grant_W_L, 
          err_not_grant_W_L_sig_or_empty_L_not_grant_W_L, 

          err_grant_S_N_sig_not_empty_N_grant_S_N,         err_not_grant_S_N_sig_or_empty_N_not_grant_S_N,   err_grant_S_E_sig_not_empty_E_grant_S_E, 
          err_not_grant_S_E_sig_or_empty_E_not_grant_S_E,  err_grant_S_W_sig_not_empty_W_grant_S_W,          err_not_grant_S_W_sig_or_empty_W_not_grant_S_W, 
          err_grant_S_S_sig_not_empty_S_grant_S_S,         err_not_grant_S_S_sig_or_empty_S_not_grant_S_S,   err_grant_S_L_sig_not_empty_L_grant_S_L, 
          err_not_grant_S_L_sig_or_empty_L_not_grant_S_L, 

          err_grant_L_N_sig_not_empty_N_grant_L_N,         err_not_grant_L_N_sig_or_empty_N_not_grant_L_N,   err_grant_L_E_sig_not_empty_E_grant_L_E, 
          err_not_grant_L_E_sig_or_empty_E_not_grant_L_E,  err_grant_L_W_sig_not_empty_W_grant_L_W,          err_not_grant_L_W_sig_or_empty_W_not_grant_L_W, 
          err_grant_L_S_sig_not_empty_S_grant_L_S,         err_not_grant_L_S_sig_or_empty_S_not_grant_L_S,   err_grant_L_L_sig_not_empty_L_grant_L_L, 
          err_not_grant_L_L_sig_or_empty_L_not_grant_L_L, 

          err_grant_signals_not_empty_grant_N,             err_not_grant_signals_empty_not_grant_N,          err_grant_signals_not_empty_grant_E,             
          err_not_grant_signals_empty_not_grant_E,         err_grant_signals_not_empty_grant_W,              err_not_grant_signals_empty_not_grant_W, 
          err_grant_signals_not_empty_grant_S,             err_not_grant_signals_empty_not_grant_S,          err_grant_signals_not_empty_grant_L, 
          err_not_grant_signals_empty_not_grant_L, 

          err_grants_valid_not_match, 

          -- Allocator credit counter logic checker outputs
          err_credit_in_N_grant_N_credit_counter_N_in_credit_counter_N_out_equal, err_credit_in_N_credit_counter_N_out_increment, 
          err_not_credit_in_N_credit_counter_N_out_max_credit_counter_N_in_not_change, err_grant_N_credit_counter_N_out_decrement, 
          err_not_grant_N_or_credit_counter_N_out_zero_credit_counter_N_in_not_change,             
          err_not_credit_in_N_not_grant_N_credit_counter_N_in_credit_counter_N_out_equal, 

          err_credit_in_E_grant_E_credit_counter_E_in_credit_counter_E_out_equal, err_credit_in_E_credit_counter_E_out_increment, 
          err_not_credit_in_E_credit_counter_E_out_max_credit_counter_E_in_not_change, err_grant_E_credit_counter_E_out_decrement, 
          err_not_grant_E_or_credit_counter_E_out_zero_credit_counter_E_in_not_change,             
          err_not_credit_in_E_not_grant_E_credit_counter_E_in_credit_counter_E_out_equal, 

          err_credit_in_W_grant_W_credit_counter_W_in_credit_counter_W_out_equal, err_credit_in_W_credit_counter_W_out_increment, 
          err_not_credit_in_W_credit_counter_W_out_max_credit_counter_W_in_not_change, err_grant_W_credit_counter_W_out_decrement, 
          err_not_grant_W_or_credit_counter_W_out_zero_credit_counter_W_in_not_change,             
          err_not_credit_in_W_not_grant_W_credit_counter_W_in_credit_counter_W_out_equal, 

          err_credit_in_S_grant_S_credit_counter_S_in_credit_counter_S_out_equal, err_credit_in_S_credit_counter_S_out_increment, 
          err_not_credit_in_S_credit_counter_S_out_max_credit_counter_S_in_not_change, err_grant_S_credit_counter_S_out_decrement, 
          err_not_grant_S_or_credit_counter_S_out_zero_credit_counter_S_in_not_change,             
          err_not_credit_in_S_not_grant_S_credit_counter_S_in_credit_counter_S_out_equal, 

          err_credit_in_L_grant_L_credit_counter_L_in_credit_counter_L_out_equal, err_credit_in_L_credit_counter_L_out_increment, 
          err_not_credit_in_L_credit_counter_L_out_max_credit_counter_L_in_not_change, err_grant_L_credit_counter_L_out_decrement, 
          err_not_grant_L_or_credit_counter_L_out_zero_credit_counter_L_in_not_change, 
          err_not_credit_in_L_not_grant_L_credit_counter_L_in_credit_counter_L_out_equal, 
          -- Arbiter_in checker outputs
          -- North Arbiter_in checker outputs
          N_err_Requests_state_in_state_not_equal, 

          N_err_IDLE_Req_N, N_err_IDLE_grant_N, N_err_North_Req_N,  N_err_North_grant_N, N_err_East_Req_E, N_err_East_grant_E, 
          N_err_West_Req_W, N_err_West_grant_W, N_err_South_Req_S,N_err_South_grant_S,N_err_Local_Req_L, N_err_Local_grant_L,
          N_err_IDLE_Req_E, N_err_IDLE_grant_E, N_err_North_Req_E, N_err_North_grant_E, N_err_East_Req_W, N_err_East_grant_W,
          N_err_West_Req_S, N_err_West_grant_S, N_err_South_Req_L, N_err_South_grant_L, N_err_Local_Req_N, N_err_Local_grant_N,
          N_err_IDLE_Req_W, N_err_IDLE_grant_W, N_err_North_Req_W, N_err_North_grant_W, N_err_East_Req_S, N_err_East_grant_S,
          N_err_West_Req_L, N_err_West_grant_L, N_err_South_Req_N, N_err_South_grant_N, N_err_Local_Req_E, N_err_Local_grant_E, 
          N_err_IDLE_Req_S, N_err_IDLE_grant_S, N_err_North_Req_S, N_err_North_grant_S, N_err_East_Req_L, N_err_East_grant_L, 
          N_err_West_Req_N, N_err_West_grant_N, N_err_South_Req_E, N_err_South_grant_E, N_err_Local_Req_W, N_err_Local_grant_W, 
          N_err_IDLE_Req_L, N_err_IDLE_grant_L, N_err_North_Req_L, N_err_North_grant_L, N_err_East_Req_N, N_err_East_grant_N, 
          N_err_West_Req_E, N_err_West_grant_E, N_err_South_Req_W, N_err_South_grant_W, N_err_Local_Req_S, N_err_Local_grant_S, 

          N_err_state_in_onehot, N_err_no_request_grants, N_err_request_no_grants, 

          N_err_no_Req_N_grant_N, N_err_no_Req_E_grant_E, N_err_no_Req_W_grant_W, N_err_no_Req_S_grant_S, N_err_no_Req_L_grant_L, 

          -- East Arbiter_in checker outputs
          E_err_Requests_state_in_state_not_equal, 

          E_err_IDLE_Req_N, E_err_IDLE_grant_N, E_err_North_Req_N, E_err_North_grant_N, E_err_East_Req_E,  E_err_East_grant_E, 
          E_err_West_Req_W, E_err_West_grant_W, E_err_South_Req_S, E_err_South_grant_S, E_err_Local_Req_L, E_err_Local_grant_L,
          E_err_IDLE_Req_E, E_err_IDLE_grant_E, E_err_North_Req_E, E_err_North_grant_E, E_err_East_Req_W, E_err_East_grant_W,
          E_err_West_Req_S, E_err_West_grant_S, E_err_South_Req_L, E_err_South_grant_L, E_err_Local_Req_N, E_err_Local_grant_N,
          E_err_IDLE_Req_W, E_err_IDLE_grant_W, E_err_North_Req_W, E_err_North_grant_W, E_err_East_Req_S, E_err_East_grant_S,
          E_err_West_Req_L, E_err_West_grant_L, E_err_South_Req_N,  E_err_South_grant_N, E_err_Local_Req_E, E_err_Local_grant_E, 
          E_err_IDLE_Req_S, E_err_IDLE_grant_S, E_err_North_Req_S, E_err_North_grant_S, E_err_East_Req_L, E_err_East_grant_L, 
          E_err_West_Req_N, E_err_West_grant_N, E_err_South_Req_E, E_err_South_grant_E, E_err_Local_Req_W, E_err_Local_grant_W, 
          E_err_IDLE_Req_L, E_err_IDLE_grant_L, E_err_North_Req_L, E_err_North_grant_L, E_err_East_Req_N, E_err_East_grant_N, 
          E_err_West_Req_E, E_err_West_grant_E, E_err_South_Req_W, E_err_South_grant_W, E_err_Local_Req_S, E_err_Local_grant_S, 

          E_err_state_in_onehot, E_err_no_request_grants, E_err_request_no_grants, 

          E_err_no_Req_N_grant_N, E_err_no_Req_E_grant_E, E_err_no_Req_W_grant_W, E_err_no_Req_S_grant_S, E_err_no_Req_L_grant_L, 

          -- West Arbiter_in checker outputs
          W_err_Requests_state_in_state_not_equal, 

          W_err_IDLE_Req_N, W_err_IDLE_grant_N, W_err_North_Req_N, W_err_North_grant_N, W_err_East_Req_E, W_err_East_grant_E, 
          W_err_West_Req_W, W_err_West_grant_W, W_err_South_Req_S, W_err_South_grant_S, W_err_Local_Req_L, W_err_Local_grant_L,
          W_err_IDLE_Req_E, W_err_IDLE_grant_E, W_err_North_Req_E, W_err_North_grant_E, W_err_East_Req_W, W_err_East_grant_W,
          W_err_West_Req_S, W_err_West_grant_S, W_err_South_Req_L, W_err_South_grant_L, W_err_Local_Req_N, W_err_Local_grant_N,
          W_err_IDLE_Req_W, W_err_IDLE_grant_W, W_err_North_Req_W, W_err_North_grant_W, W_err_East_Req_S, W_err_East_grant_S,
          W_err_West_Req_L, W_err_West_grant_L, W_err_South_Req_N,  W_err_South_grant_N, W_err_Local_Req_E, W_err_Local_grant_E, 
          W_err_IDLE_Req_S, W_err_IDLE_grant_S, W_err_North_Req_S, W_err_North_grant_S, W_err_East_Req_L, W_err_East_grant_L, 
          W_err_West_Req_N, W_err_West_grant_N, W_err_South_Req_E, W_err_South_grant_E, W_err_Local_Req_W, W_err_Local_grant_W, 
          W_err_IDLE_Req_L, W_err_IDLE_grant_L, W_err_North_Req_L, W_err_North_grant_L, W_err_East_Req_N, W_err_East_grant_N, 
          W_err_West_Req_E, W_err_West_grant_E, W_err_South_Req_W, W_err_South_grant_W, W_err_Local_Req_S, W_err_Local_grant_S, 

          W_err_state_in_onehot, W_err_no_request_grants, W_err_request_no_grants, 

          W_err_no_Req_N_grant_N, W_err_no_Req_E_grant_E, W_err_no_Req_W_grant_W, W_err_no_Req_S_grant_S, W_err_no_Req_L_grant_L, 

          -- South Arbiter_in checker outputs
          S_err_Requests_state_in_state_not_equal, 

          S_err_IDLE_Req_N, S_err_IDLE_grant_N, S_err_North_Req_N, S_err_North_grant_N, S_err_East_Req_E,  S_err_East_grant_E, 
          S_err_West_Req_W, S_err_West_grant_W, S_err_South_Req_S,S_err_South_grant_S,S_err_Local_Req_L, S_err_Local_grant_L,
          S_err_IDLE_Req_E, S_err_IDLE_grant_E, S_err_North_Req_E, S_err_North_grant_E, S_err_East_Req_W, S_err_East_grant_W,
          S_err_West_Req_S, S_err_West_grant_S, S_err_South_Req_L, S_err_South_grant_L, S_err_Local_Req_N, S_err_Local_grant_N,
          S_err_IDLE_Req_W, S_err_IDLE_grant_W, S_err_North_Req_W, S_err_North_grant_W, S_err_East_Req_S, S_err_East_grant_S,
          S_err_West_Req_L, S_err_West_grant_L, S_err_South_Req_N,  S_err_South_grant_N, S_err_Local_Req_E, S_err_Local_grant_E, 
          S_err_IDLE_Req_S, S_err_IDLE_grant_S, S_err_North_Req_S, S_err_North_grant_S, S_err_East_Req_L, S_err_East_grant_L, 
          S_err_West_Req_N, S_err_West_grant_N, S_err_South_Req_E, S_err_South_grant_E, S_err_Local_Req_W, S_err_Local_grant_W, 
          S_err_IDLE_Req_L, S_err_IDLE_grant_L, S_err_North_Req_L, S_err_North_grant_L, S_err_East_Req_N, S_err_East_grant_N, 
          S_err_West_Req_E, S_err_West_grant_E, S_err_South_Req_W, S_err_South_grant_W, S_err_Local_Req_S, S_err_Local_grant_S, 

          S_err_state_in_onehot, S_err_no_request_grants, S_err_request_no_grants, 

          S_err_no_Req_N_grant_N, S_err_no_Req_E_grant_E, S_err_no_Req_W_grant_W, S_err_no_Req_S_grant_S, S_err_no_Req_L_grant_L, 

          -- Local Arbiter_in checker outputs
          L_err_Requests_state_in_state_not_equal, 

          L_err_IDLE_Req_N, L_err_IDLE_grant_N, L_err_North_Req_N, L_err_North_grant_N, L_err_East_Req_E,  L_err_East_grant_E, 
          L_err_West_Req_W, L_err_West_grant_W, L_err_South_Req_S, L_err_South_grant_S, L_err_Local_Req_L, L_err_Local_grant_L,
          L_err_IDLE_Req_E, L_err_IDLE_grant_E, L_err_North_Req_E, L_err_North_grant_E, L_err_East_Req_W, L_err_East_grant_W,
          L_err_West_Req_S, L_err_West_grant_S, L_err_South_Req_L, L_err_South_grant_L, L_err_Local_Req_N, L_err_Local_grant_N,
          L_err_IDLE_Req_W, L_err_IDLE_grant_W, L_err_North_Req_W, L_err_North_grant_W, L_err_East_Req_S, L_err_East_grant_S,
          L_err_West_Req_L, L_err_West_grant_L, L_err_South_Req_N, L_err_South_grant_N, L_err_Local_Req_E, L_err_Local_grant_E, 
          L_err_IDLE_Req_S, L_err_IDLE_grant_S, L_err_North_Req_S, L_err_North_grant_S, L_err_East_Req_L, L_err_East_grant_L, 
          L_err_West_Req_N, L_err_West_grant_N, L_err_South_Req_E, L_err_South_grant_E, L_err_Local_Req_W, L_err_Local_grant_W, 
          L_err_IDLE_Req_L, L_err_IDLE_grant_L, L_err_North_Req_L, L_err_North_grant_L, L_err_East_Req_N, L_err_East_grant_N, 
          L_err_West_Req_E, L_err_West_grant_E, L_err_South_Req_W, L_err_South_grant_W, L_err_Local_Req_S, L_err_Local_grant_S, 

          L_err_state_in_onehot, L_err_no_request_grants, L_err_request_no_grants, 

          L_err_no_Req_N_grant_N, L_err_no_Req_E_grant_E, L_err_no_Req_W_grant_W, L_err_no_Req_S_grant_S, L_err_no_Req_L_grant_L, 

          -- Arbiter_out checker outputs
          -- North Arbiter_out checker outputs
          N_arbiter_out_err_Requests_state_in_state_not_equal, 
       
          N_err_IDLE_req_X_N,  N_err_North_req_X_N, N_err_North_credit_not_zero_req_X_N_grant_N, N_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
          N_err_East_req_X_E,  N_err_East_credit_not_zero_req_X_E_grant_E,  N_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
          N_err_West_req_X_W,  N_err_West_credit_not_zero_req_X_W_grant_W,  N_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
          N_err_South_req_X_S, N_err_South_credit_not_zero_req_X_S_grant_S, N_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
          N_err_Local_req_X_L, N_err_Local_credit_not_zero_req_X_L_grant_L, N_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

          N_err_IDLE_req_X_E, N_err_North_req_X_E, N_err_East_req_X_W, N_err_West_req_X_S, N_err_South_req_X_L, N_err_Local_req_X_N, 
          N_err_IDLE_req_X_W, N_err_North_req_X_W, N_err_East_req_X_S, N_err_West_req_X_L, N_err_South_req_X_N, N_err_Local_req_X_E, 
          N_err_IDLE_req_X_S, N_err_North_req_X_S, N_err_East_req_X_L, N_err_West_req_X_N, N_err_South_req_X_E, N_err_Local_req_X_W, 
          N_err_IDLE_req_X_L, N_err_North_req_X_L, N_err_East_req_X_N, N_err_West_req_X_E, N_err_South_req_X_W, N_err_Local_req_X_S, 
       
          N_arbiter_out_err_state_in_onehot, N_arbiter_out_err_no_request_grants, N_err_request_IDLE_state, 

          N_err_request_IDLE_not_Grants,   N_err_state_North_Invalid_Grant, N_err_state_East_Invalid_Grant, N_err_state_West_Invalid_Grant, 
          N_err_state_South_Invalid_Grant, N_err_state_Local_Invalid_Grant, N_err_Grants_onehot_or_all_zero,              

          -- East Arbiter_out checker outputs
          E_arbiter_out_err_Requests_state_in_state_not_equal, 
       
          E_err_IDLE_req_X_N,  E_err_North_req_X_N, E_err_North_credit_not_zero_req_X_N_grant_N, E_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
          E_err_East_req_X_E,  E_err_East_credit_not_zero_req_X_E_grant_E,  E_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
          E_err_West_req_X_W,  E_err_West_credit_not_zero_req_X_W_grant_W,  E_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
          E_err_South_req_X_S, E_err_South_credit_not_zero_req_X_S_grant_S, E_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
          E_err_Local_req_X_L, E_err_Local_credit_not_zero_req_X_L_grant_L, E_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

          E_err_IDLE_req_X_E, E_err_North_req_X_E, E_err_East_req_X_W, E_err_West_req_X_S, E_err_South_req_X_L, E_err_Local_req_X_N, 
          E_err_IDLE_req_X_W, E_err_North_req_X_W, E_err_East_req_X_S, E_err_West_req_X_L, E_err_South_req_X_N, E_err_Local_req_X_E, 
          E_err_IDLE_req_X_S, E_err_North_req_X_S, E_err_East_req_X_L, E_err_West_req_X_N, E_err_South_req_X_E, E_err_Local_req_X_W, 
          E_err_IDLE_req_X_L, E_err_North_req_X_L, E_err_East_req_X_N, E_err_West_req_X_E, E_err_South_req_X_W, E_err_Local_req_X_S, 
       
          E_arbiter_out_err_state_in_onehot, E_arbiter_out_err_no_request_grants, E_err_request_IDLE_state, 

          E_err_request_IDLE_not_Grants,   E_err_state_North_Invalid_Grant,E_err_state_East_Invalid_Grant, E_err_state_West_Invalid_Grant, 
          E_err_state_South_Invalid_Grant, E_err_state_Local_Invalid_Grant, E_err_Grants_onehot_or_all_zero,

          -- West Arbiter_out checker outputs
          W_arbiter_out_err_Requests_state_in_state_not_equal, 
       
          W_err_IDLE_req_X_N,  W_err_North_req_X_N,  W_err_North_credit_not_zero_req_X_N_grant_N,  W_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
          W_err_East_req_X_E,  W_err_East_credit_not_zero_req_X_E_grant_E,  W_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
          W_err_West_req_X_W,  W_err_West_credit_not_zero_req_X_W_grant_W,  W_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
          W_err_South_req_X_S, W_err_South_credit_not_zero_req_X_S_grant_S, W_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
          W_err_Local_req_X_L, W_err_Local_credit_not_zero_req_X_L_grant_L, W_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

          W_err_IDLE_req_X_E, W_err_North_req_X_E, W_err_East_req_X_W, W_err_West_req_X_S, W_err_South_req_X_L, W_err_Local_req_X_N, 
          W_err_IDLE_req_X_W, W_err_North_req_X_W, W_err_East_req_X_S, W_err_West_req_X_L, W_err_South_req_X_N, W_err_Local_req_X_E, 
          W_err_IDLE_req_X_S, W_err_North_req_X_S, W_err_East_req_X_L, W_err_West_req_X_N, W_err_South_req_X_E, W_err_Local_req_X_W, 
          W_err_IDLE_req_X_L, W_err_North_req_X_L, W_err_East_req_X_N, W_err_West_req_X_E, W_err_South_req_X_W, W_err_Local_req_X_S, 
       
          W_arbiter_out_err_state_in_onehot, W_arbiter_out_err_no_request_grants, W_err_request_IDLE_state, 

          W_err_request_IDLE_not_Grants,   W_err_state_North_Invalid_Grant, W_err_state_East_Invalid_Grant, W_err_state_West_Invalid_Grant, 
          W_err_state_South_Invalid_Grant, W_err_state_Local_Invalid_Grant, W_err_Grants_onehot_or_all_zero,

          -- South Arbiter_out checker outputs
          S_arbiter_out_err_Requests_state_in_state_not_equal, 
       
          S_err_IDLE_req_X_N,  S_err_North_req_X_N, S_err_North_credit_not_zero_req_X_N_grant_N, S_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
          S_err_East_req_X_E,  S_err_East_credit_not_zero_req_X_E_grant_E,  S_err_East_credit_zero_or_not_req_X_E_not_grant_E, 
          S_err_West_req_X_W,  S_err_West_credit_not_zero_req_X_W_grant_W,  S_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
          S_err_South_req_X_S, S_err_South_credit_not_zero_req_X_S_grant_S, S_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
          S_err_Local_req_X_L, S_err_Local_credit_not_zero_req_X_L_grant_L, S_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

          S_err_IDLE_req_X_E, S_err_North_req_X_E, S_err_East_req_X_W, S_err_West_req_X_S, S_err_South_req_X_L, S_err_Local_req_X_N, 
          S_err_IDLE_req_X_W, S_err_North_req_X_W, S_err_East_req_X_S, S_err_West_req_X_L, S_err_South_req_X_N, S_err_Local_req_X_E, 
          S_err_IDLE_req_X_S, S_err_North_req_X_S, S_err_East_req_X_L, S_err_West_req_X_N, S_err_South_req_X_E, S_err_Local_req_X_W, 
          S_err_IDLE_req_X_L, S_err_North_req_X_L, S_err_East_req_X_N, S_err_West_req_X_E, S_err_South_req_X_W, S_err_Local_req_X_S, 
       
          S_arbiter_out_err_state_in_onehot, S_arbiter_out_err_no_request_grants, S_err_request_IDLE_state, 
          S_err_request_IDLE_not_Grants, S_err_state_North_Invalid_Grant, S_err_state_East_Invalid_Grant,  S_err_state_West_Invalid_Grant, 
          S_err_state_South_Invalid_Grant, S_err_state_Local_Invalid_Grant, S_err_Grants_onehot_or_all_zero,

          -- Local Arbiter_out checker outputs
          L_arbiter_out_err_Requests_state_in_state_not_equal, 
       
          L_err_IDLE_req_X_N, L_err_North_req_X_N, L_err_North_credit_not_zero_req_X_N_grant_N, L_err_North_credit_zero_or_not_req_X_N_not_grant_N, 
          L_err_East_req_X_E, L_err_East_credit_not_zero_req_X_E_grant_E, L_err_East_credit_zero_or_not_req_X_E_not_grant_E, L_err_West_req_X_W, 
          L_err_West_credit_not_zero_req_X_W_grant_W, L_err_West_credit_zero_or_not_req_X_W_not_grant_W, 
          L_err_South_req_X_S, L_err_South_credit_not_zero_req_X_S_grant_S, L_err_South_credit_zero_or_not_req_X_S_not_grant_S, 
          L_err_Local_req_X_L, L_err_Local_credit_not_zero_req_X_L_grant_L, L_err_Local_credit_zero_or_not_req_X_L_not_grant_L, 

          L_err_IDLE_req_X_E, L_err_North_req_X_E, L_err_East_req_X_W, L_err_West_req_X_S, L_err_South_req_X_L, L_err_Local_req_X_N, 
          L_err_IDLE_req_X_W, L_err_North_req_X_W, L_err_East_req_X_S, L_err_West_req_X_L, L_err_South_req_X_N, L_err_Local_req_X_E, 
          L_err_IDLE_req_X_S, L_err_North_req_X_S, L_err_East_req_X_L, L_err_West_req_X_N, L_err_South_req_X_E, L_err_Local_req_X_W, 
          L_err_IDLE_req_X_L, L_err_North_req_X_L, L_err_East_req_X_N, L_err_West_req_X_E, L_err_South_req_X_W, L_err_Local_req_X_S, 
       
          L_arbiter_out_err_state_in_onehot, L_arbiter_out_err_no_request_grants, L_err_request_IDLE_state, 

          L_err_request_IDLE_not_Grants, L_err_state_North_Invalid_Grant, L_err_state_East_Invalid_Grant, L_err_state_West_Invalid_Grant, 
          L_err_state_South_Invalid_Grant, L_err_state_Local_Invalid_Grant, L_err_Grants_onehot_or_all_zero : out std_logic
          );
  end component;

end; --package body


