--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO_credit_based is
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

            -- Checker outputs

            -- Functional checkers
            err_empty_full, 
            err_empty_read_en, 
            err_full_write_en, 
            err_state_in_onehot, 
            err_read_pointer_in_onehot, 
            err_write_pointer_in_onehot, 

            -- Structural checkers
            err_write_en_write_pointer, 
            err_not_write_en_write_pointer, 
            err_read_pointer_write_pointer_not_empty, 
            err_read_pointer_write_pointer_empty, 
            err_read_pointer_write_pointer_not_full, 
            err_read_pointer_write_pointer_full, 
            err_read_pointer_increment, 
            err_read_pointer_not_increment, 
            err_write_en, 
            err_not_write_en, 
            err_not_write_en1, 
            err_not_write_en2, 
            err_read_en_mismatch, 
            err_read_en_mismatch1, 

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
end FIFO_credit_based;

architecture behavior of FIFO_credit_based is

component FIFO_credit_based_control_part_checkers is
    port (  valid_in: in std_logic;
            read_en_N : in std_logic;
            read_en_E : in std_logic;            
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            read_pointer: in std_logic_vector(3 downto 0);
            read_pointer_in: in std_logic_vector(3 downto 0);
            write_pointer: in std_logic_vector(3 downto 0); 
            write_pointer_in: in std_logic_vector(3 downto 0); 
            credit_out: in std_logic;
            empty_out: in std_logic;
            full_out: in std_logic;
            read_en_out: in std_logic;
            write_en_out: in std_logic; 
            fake_credit: in std_logic;
            fake_credit_counter: in std_logic_vector(1 downto 0);
            fake_credit_counter_in: in std_logic_vector(1 downto 0);  
            state_out: in std_logic_vector(4 downto 0);
            state_in: in std_logic_vector(4 downto 0);
            fault_info: in std_logic;                             
            fault_info_out: in std_logic;                         
            fault_info_in: in std_logic;     
            health_info: in std_logic;
            faulty_packet_out: in std_logic;                      
            faulty_packet_in: in std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            fault_out: in std_logic;
            write_fake_flit: in std_logic;

            -- Functional checkers
            err_empty_full, 
            err_empty_read_en, 
            err_full_write_en, 
            err_state_in_onehot, 
            err_read_pointer_in_onehot, 
            err_write_pointer_in_onehot, 

            -- Structural checkers
            err_write_en_write_pointer, 
            err_not_write_en_write_pointer, 
            err_read_pointer_write_pointer_not_empty, 
            err_read_pointer_write_pointer_empty, 
            err_read_pointer_write_pointer_not_full, 
            err_read_pointer_write_pointer_full, 
            err_read_pointer_increment, 
            err_read_pointer_not_increment, 
            err_write_en, 
            err_not_write_en, 
            err_not_write_en1, 
            err_not_write_en2, 
            err_read_en_mismatch, 
            err_read_en_mismatch1, 

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
end component;


   signal read_pointer, read_pointer_in,  write_pointer, write_pointer_in: std_logic_vector(3 downto 0);
   signal full, empty: std_logic;
   signal read_en, write_en: std_logic;

   signal FIFO_MEM_1, FIFO_MEM_1_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_2, FIFO_MEM_2_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_3, FIFO_MEM_3_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_4, FIFO_MEM_4_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   constant fake_tail :  std_logic_vector := "10000000000000000000000000000001";
   
   -- Packet Dropping FSM states encoded as one-hot (because of checkers for one-bit error detection)
   CONSTANT Idle: std_logic_vector (4 downto 0) := "00001";
   CONSTANT Header_flit: std_logic_vector (4 downto 0) := "00010";
   CONSTANT Body_flit: std_logic_vector (4 downto 0) := "00100";
   CONSTANT Tail_flit: std_logic_vector (4 downto 0) := "01000";
   CONSTANT Packet_drop: std_logic_vector (4 downto 0) := "10000";

   --alias  flit_type :  std_logic_vector(2 downto 0) is RX(DATA_WIDTH-1 downto DATA_WIDTH-3); 
   signal fault_info_in, fault_info_out: std_logic;
   signal faulty_packet_in, faulty_packet_out: std_logic;
   signal xor_all, fault_out: std_logic;
   --type   state_type is (Idle, Header_flit, Body_flit, Tail_flit, Packet_drop);
   --signal state_out, state_in : state_type;
   signal state_out, state_in : std_logic_vector(4 downto 0); --  : state_type;
   signal fake_credit, credit_in, write_fake_flit: std_logic;
   signal fake_credit_counter, fake_credit_counter_in: std_logic_vector(1 downto 0);

   -- Signal(s) needed for FIFO control part checkers

   signal fault_info_sig, health_info_sig : std_logic; 

begin
 --------------------------------------------------------------------------------------------
--                           block diagram of the FIFO!


 --------------------------------------------------------------------------------------------
--  circular buffer structure
--                                   <--- WriteP    
--              ---------------------------------
--              |   3   |   2   |   1   |   0   |
--              ---------------------------------
--                                   <--- readP   
 --------------------------------------------------------------------------------------------
-- Packet drop state machine 
--                            +---+ No                     +---+  No                      
--                            |   | Flit                   |   |  Flit                    
--                            |   v                        |   v                          
--                 healthy  +--------+                  +--------+                        
--             +---header-->|        |                  |        |-------------------+    
--             |         +->| Header |---Healthy body-->| Body   |------------+      |    
--             |         |  +--------+                  +--------+            |      |    
--             |         |     | ^  |              Healthy |   ^            Healthy  |    
--             |         |     | |  |               body   |   |              Tail   |    
--             |         |     | |  |                      +---+              |      |    
--             |         |     | |  |                                         v      |    
--         +--------+    |     | |  |                                    +--------+  |    
-- No  +-->|        |    |     | |  +-----------------Healthy Tail------>|        |  |    
-- Flit|   |  IDLE  |    |     | |                                       | Tail   |--)--+ 
--     +---|        |    |     | +-----------Healthy Header--------------|        |  |  | 
--         +--------+    |     |                                         +--------+  |  | 
--           ^  |  ^     |     Faulty            No    Faulty                        |  | 
--           |  |  |     |     Flit             Flit   Flit                          |  | 
--           |  |  |     |     +------------+   +---+  +---+                         |  | 
--           |  |  |     + --Healthy------+ |   |   |  |   |                         |  | 
--           |  |  |          header      | v   |   v  |   v                         |  | 
--           |  |  |                     +------------------+                        |  | 
--           |  |  +----Healthy Tail-----|     Packet       |                        |  | 
--           |  +-------Faulty Flit----->|      Drop        |<-----------------------+  | 
--           |                           +------------------+                           | 
--           +-------------------------------------------------No Flit------------------+ 
--                                                                                               	
------------------------------------------------------------------------------------------------
	
-- FIFO control part with packet drop and fault classifier support checkers instantiation
FIFO_control_part_checkers: FIFO_credit_based_control_part_checkers 
                                                port map (
                                                            valid_in => valid_in, 
                                                            read_en_N => read_en_N, 
                                                            read_en_E => read_en_E, 
                                                            read_en_W => read_en_W, 
                                                            read_en_S => read_en_S, 
                                                            read_en_L => read_en_L, 
                                                            read_pointer => read_pointer, 
                                                            read_pointer_in => read_pointer_in, 
                                                            write_pointer => write_pointer, 
                                                            write_pointer_in => write_pointer_in, 
                                                            credit_out => credit_in, -- correct ?
                                                            empty_out => empty, 
                                                            full_out => full, 
                                                            read_en_out => read_en, 
                                                            write_en_out => write_en, 
                                                            fake_credit => fake_credit, 
                                                            fake_credit_counter => fake_credit_counter, 
                                                            fake_credit_counter_in => fake_credit_counter_in, 
                                                            state_out => state_out, 
                                                            state_in => state_in, 
                                                            fault_info => fault_info_sig, -- connected to signal   
                                                            fault_info_out => fault_info_out, 
                                                            fault_info_in => fault_info_in,
                                                            health_info => health_info_sig, -- connected to signal
                                                            faulty_packet_out => faulty_packet_out, 
                                                            faulty_packet_in => faulty_packet_in, 
                                                            flit_type => RX(DATA_WIDTH-1 downto DATA_WIDTH-3), 
                                                            fault_out => fault_out, 
                                                            write_fake_flit => write_fake_flit, 

                                                            -- Functional checkers
                                                            err_empty_full => err_empty_full, 
                                                            err_empty_read_en => err_empty_read_en, 
                                                            err_full_write_en => err_full_write_en, 
                                                            err_state_in_onehot => err_state_in_onehot, 
                                                            err_read_pointer_in_onehot => err_read_pointer_in_onehot, 
                                                            err_write_pointer_in_onehot => err_write_pointer_in_onehot, 

                                                            -- Structural checkers
                                                            err_write_en_write_pointer => err_write_en_write_pointer, 
                                                            err_not_write_en_write_pointer => err_not_write_en_write_pointer, 
                                                            err_read_pointer_write_pointer_not_empty => err_read_pointer_write_pointer_not_empty, 
                                                            err_read_pointer_write_pointer_empty => err_read_pointer_write_pointer_empty, 
                                                            err_read_pointer_write_pointer_not_full => err_read_pointer_write_pointer_not_full, 
                                                            err_read_pointer_write_pointer_full => err_read_pointer_write_pointer_full, 
                                                            err_read_pointer_increment => err_read_pointer_increment, 
                                                            err_read_pointer_not_increment => err_read_pointer_not_increment, 
                                                            err_write_en => err_write_en, 
                                                            err_not_write_en => err_not_write_en, 
                                                            err_not_write_en1 => err_not_write_en1, 
                                                            err_not_write_en2 => err_not_write_en2, 
                                                            err_read_en_mismatch => err_read_en_mismatch, 
                                                            err_read_en_mismatch1 => err_read_en_mismatch1, 

                                                            -- Newly added checkers for FIFO with packet drop and fault classifier support!
                                                            err_fake_credit_read_en_fake_credit_counter_in_increment => err_fake_credit_read_en_fake_credit_counter_in_increment, 
                                                            err_not_fake_credit_not_read_en_fake_credit_counter_not_zero_fake_credit_counter_in_decrement => err_not_fake_credit_not_read_en_fake_credit_counter_not_zero_fake_credit_counter_in_decrement, 
                                                            err_not_fake_credit_read_en_fake_credit_counter_in_not_change => err_not_fake_credit_read_en_fake_credit_counter_in_not_change, 
                                                            err_fake_credit_not_read_en_fake_credit_counter_in_not_change => err_fake_credit_not_read_en_fake_credit_counter_in_not_change, 
                                                            err_not_fake_credit_not_read_en_fake_credit_counter_zero_fake_credit_counter_in_not_change => err_not_fake_credit_not_read_en_fake_credit_counter_zero_fake_credit_counter_in_not_change, 
                                                            err_fake_credit_read_en_credit_out => err_fake_credit_read_en_credit_out, 
                                                            err_not_fake_credit_not_read_en_fake_credit_counter_not_zero_credit_out => err_not_fake_credit_not_read_en_fake_credit_counter_not_zero_credit_out, 
                                                            err_not_fake_credit_not_read_en_fake_credit_counter_zero_not_credit_out => err_not_fake_credit_not_read_en_fake_credit_counter_zero_not_credit_out, 

                                                            -- Checkers for Packet Dropping FSM of FIFO
                                                            err_state_out_Idle_not_fault_out_valid_in_state_in_Header_flit => err_state_out_Idle_not_fault_out_valid_in_state_in_Header_flit, 
                                                            err_state_out_Idle_not_fault_out_valid_in_state_in_not_change => err_state_out_Idle_not_fault_out_valid_in_state_in_not_change, 
                                                            err_state_out_Idle_not_fault_out_not_fake_credit => err_state_out_Idle_not_fault_out_not_fake_credit, 
                                                            err_state_out_Idle_not_fault_out_not_fault_info_in => err_state_out_Idle_not_fault_out_not_fault_info_in, 
                                                            err_state_out_Idle_not_fault_out_faulty_packet_in_faulty_packet_out_equal => err_state_out_Idle_not_fault_out_faulty_packet_in_faulty_packet_out_equal, 
                                                            err_state_out_Idle_fault_out_fake_credit => err_state_out_Idle_fault_out_fake_credit, 
                                                            err_state_out_Idle_fault_out_state_in_Packet_drop => err_state_out_Idle_fault_out_state_in_Packet_drop, 
                                                            err_state_out_Idle_fault_out_fault_info_in => err_state_out_Idle_fault_out_fault_info_in, 
                                                            err_state_out_Idle_fault_out_faulty_packet_in => err_state_out_Idle_fault_out_faulty_packet_in, 
                                                            err_state_out_Idle_not_health_info => err_state_out_Idle_not_health_info, 
                                                            err_state_out_Idle_not_write_fake_flit => err_state_out_Idle_not_write_fake_flit, 

                                                            err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Body_state_in_Body_flit => err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Body_state_in_Body_flit, 
                                                            err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Tail_state_in_Tail_flit => err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Tail_state_in_Tail_flit, 
                                                            err_state_out_Header_flit_valid_in_not_fault_out_not_write_fake_flit => err_state_out_Header_flit_valid_in_not_fault_out_not_write_fake_flit, 
                                                            err_state_out_Header_flit_valid_in_not_fault_out_not_fault_info_in => err_state_out_Header_flit_valid_in_not_fault_out_not_fault_info_in, 
                                                            err_state_out_Header_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change => err_state_out_Header_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change, 
                                                            err_state_out_Header_flit_valid_in_fault_out_write_fake_flit => err_state_out_Header_flit_valid_in_fault_out_write_fake_flit, 
                                                            err_state_out_Header_flit_valid_in_fault_out_state_in_Packet_drop => err_state_out_Header_flit_valid_in_fault_out_state_in_Packet_drop, 
                                                            err_state_out_Header_flit_valid_in_fault_out_fault_info_in => err_state_out_Header_flit_valid_in_fault_out_fault_info_in, 
                                                            err_state_out_Header_flit_valid_in_fault_out_faulty_packet_in => err_state_out_Header_flit_valid_in_fault_out_faulty_packet_in, 
                                                            err_state_out_Header_flit_not_valid_in_state_in_state_out_not_change => err_state_out_Header_flit_not_valid_in_state_in_state_out_not_change, 
                                                            err_state_out_Header_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change => err_state_out_Header_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change, 
                                                            err_state_out_Header_flit_not_valid_in_not_fault_info_in => err_state_out_Header_flit_not_valid_in_not_fault_info_in, 
                                                            err_state_out_Header_flit_not_valid_in_not_write_fake_flit => err_state_out_Header_flit_not_valid_in_not_write_fake_flit, 
                                                            err_state_out_Header_flit_or_Body_flit_not_fake_credit => err_state_out_Header_flit_or_Body_flit_not_fake_credit, 

                                                            err_state_out_Body_flit_valid_in_not_fault_out_state_in_state_out_not_change => err_state_out_Body_flit_valid_in_not_fault_out_state_in_state_out_not_change, 
                                                            err_state_out_Body_flit_valid_in_not_fault_out_state_in_Tail_flit => err_state_out_Body_flit_valid_in_not_fault_out_state_in_Tail_flit, 
                                                            err_state_out_Body_flit_valid_in_not_fault_out_health_info => err_state_out_Body_flit_valid_in_not_fault_out_health_info, 
                                                            err_state_out_Body_flit_valid_in_not_fault_out_not_write_fake_flit => err_state_out_Body_flit_valid_in_not_fault_out_not_write_fake_flit, 
                                                            err_state_out_Body_flit_valid_in_not_fault_out_fault_info_in => err_state_out_Body_flit_valid_in_not_fault_out_fault_info_in, 
                                                            err_state_out_Body_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change => err_state_out_Body_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change, 
                                                            err_state_out_Body_flit_valid_in_fault_out_write_fake_flit => err_state_out_Body_flit_valid_in_fault_out_write_fake_flit, 
                                                            err_state_out_Body_flit_valid_in_fault_out_state_in_Packet_drop => err_state_out_Body_flit_valid_in_fault_out_state_in_Packet_drop, 
                                                            err_state_out_Body_flit_valid_in_fault_out_fault_info_in => err_state_out_Body_flit_valid_in_fault_out_fault_info_in, 
                                                            err_state_out_Body_flit_valid_in_fault_out_faulty_packet_in => err_state_out_Body_flit_valid_in_fault_out_faulty_packet_in, 
                                                            err_state_out_Body_flit_not_valid_in_state_in_state_out_not_change => err_state_out_Body_flit_not_valid_in_state_in_state_out_not_change, 
                                                            err_state_out_Body_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change => err_state_out_Body_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change, 
                                                            err_state_out_Body_flit_not_valid_in_not_fault_info_in => err_state_out_Body_flit_not_valid_in_not_fault_info_in, 
                                                            err_state_out_Body_flit_valid_in_not_fault_out_flit_type_not_tail_not_health_info => err_state_out_Body_flit_valid_in_not_fault_out_flit_type_not_tail_not_health_info, 
                                                            err_state_out_Body_flit_valid_in_fault_out_not_health_info => err_state_out_Body_flit_valid_in_fault_out_not_health_info, 
                                                            err_state_out_Body_flit_valid_in_not_health_info => err_state_out_Body_flit_valid_in_not_health_info, 
                                                            err_state_out_Body_flit_not_fake_credit => err_state_out_Body_flit_not_fake_credit, 
                                                            err_state_out_Body_flit_not_valid_in_not_write_fake_flit => err_state_out_Body_flit_not_valid_in_not_write_fake_flit, 

                                                            err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_Header_state_in_Header_flit => err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_Header_state_in_Header_flit, 
                                                            err_state_out_Tail_flit_valid_in_not_fault_out_not_fake_credit => err_state_out_Tail_flit_valid_in_not_fault_out_not_fake_credit, 
                                                            err_state_out_Tail_flit_valid_in_not_fault_out_not_fault_info_in => err_state_out_Tail_flit_valid_in_not_fault_out_not_fault_info_in, 
                                                            err_state_out_Tail_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change => err_state_out_Tail_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change, 
                                                            err_state_out_Tail_flit_valid_in_fault_out_fake_credit => err_state_out_Tail_flit_valid_in_fault_out_fake_credit, 
                                                            err_state_out_Tail_flit_valid_in_fault_out_state_in_Packet_drop => err_state_out_Tail_flit_valid_in_fault_out_state_in_Packet_drop, 
                                                            err_state_out_Tail_flit_valid_in_fault_out_fault_info_in => err_state_out_Tail_flit_valid_in_fault_out_fault_info_in, 
                                                            err_state_out_Tail_flit_valid_in_fault_out_faulty_packet_in => err_state_out_Tail_flit_valid_in_fault_out_faulty_packet_in, 
                                                            err_state_out_Tail_flit_not_valid_in_state_in_Idle => err_state_out_Tail_flit_not_valid_in_state_in_Idle, 
                                                            err_state_out_Tail_flit_not_valid_in_faulty_packet_in_faulty_packet_in_not_change => err_state_out_Tail_flit_not_valid_in_faulty_packet_in_faulty_packet_in_not_change, 
                                                            err_state_out_Tail_flit_not_valid_in_not_fault_info_in => err_state_out_Tail_flit_not_valid_in_not_fault_info_in, 
                                                            err_state_out_Tail_flit_not_valid_in_not_fake_credit => err_state_out_Tail_flit_not_valid_in_not_fake_credit, 
                                                            err_state_out_Tail_flit_not_write_fake_flit => err_state_out_Tail_flit_not_write_fake_flit, 
                                                            
                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_not_fake_credit => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_not_fake_credit, 
                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_not_faulty_packet_in => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_not_faulty_packet_in, 
                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_state_in_Header_flit => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_state_in_Header_flit, 
                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_write_fake_flit => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_write_fake_flit, 
                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_not_faulty_packet_in => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_not_faulty_packet_in, 
                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_not_state_in_Idle => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_not_state_in_Idle, 
                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_fake_credit => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_fake_credit, 
                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_invalid_fault_out_fake_credit => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_invalid_fault_out_fake_credit, 
                                                            err_state_out_Packet_drop_faulty_packet_out_not_valid_in_flit_type_body_or_invalid_fault_out_faulty_packet_in_faulty_packet_out_not_change => err_state_out_Packet_drop_faulty_packet_out_not_valid_in_flit_type_body_or_invalid_fault_out_faulty_packet_in_faulty_packet_out_not_change, 
                                                            err_state_out_Packet_drop_faulty_packet_out_flit_type_invalid_fault_out_state_in_state_out_not_change => err_state_out_Packet_drop_faulty_packet_out_flit_type_invalid_fault_out_state_in_state_out_not_change, 
                                                            err_state_out_Packet_drop_faulty_packet_out_not_valid_in_faulty_packet_in_faulty_packet_out_equal => err_state_out_Packet_drop_faulty_packet_out_not_valid_in_faulty_packet_in_faulty_packet_out_equal, 
                                                            err_state_out_Packet_drop_faulty_packet_out_not_valid_in_state_in_state_out_not_change => err_state_out_Packet_drop_faulty_packet_out_not_valid_in_state_in_state_out_not_change, 
                                                            err_state_out_Packet_drop_faulty_packet_out_not_valid_in_not_write_fake_flit => err_state_out_Packet_drop_faulty_packet_out_not_valid_in_not_write_fake_flit, 
                                                            err_state_out_Packet_drop_faulty_packet_out_not_valid_in_not_fake_credit => err_state_out_Packet_drop_faulty_packet_out_not_valid_in_not_fake_credit, 
                                                            err_state_out_Packet_drop_not_faulty_packet_out_state_in_state_out_not_change => err_state_out_Packet_drop_not_faulty_packet_out_state_in_state_out_not_change, 
                                                            err_state_out_Packet_drop_not_faulty_packet_out_faulty_packet_in_faulty_packet_out_not_change => err_state_out_Packet_drop_not_faulty_packet_out_faulty_packet_in_faulty_packet_out_not_change, 
                                                            err_state_out_Packet_drop_not_faulty_packet_out_not_fake_credit => err_state_out_Packet_drop_not_faulty_packet_out_not_fake_credit, 
                                                            err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_or_fault_out_not_write_fake_flit => err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_or_fault_out_not_write_fake_flit, 
                                                            err_state_out_Packet_drop_not_faulty_packet_out_not_write_fake_flit => err_state_out_Packet_drop_not_faulty_packet_out_not_write_fake_flit, 
                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_fault_out_state_in_state_out_not_change => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_fault_out_state_in_state_out_not_change, 
                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_fault_out_state_in_state_out_not_change => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_fault_out_state_in_state_out_not_change, 

                                                            err_fault_info_fault_info_out_equal => err_fault_info_fault_info_out_equal, 
                                                            err_state_out_Packet_drop_not_valid_in_state_in_state_out_equal => err_state_out_Packet_drop_not_valid_in_state_in_state_out_equal, 
                                                            err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_not_Header_state_in_state_out_equal => err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_not_Header_state_in_state_out_equal, 

                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_info_in => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_info_in, 
                                                            err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_Header_not_not_fault_info_in => err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_Header_not_not_fault_info_in
                                                         );

   fault_info  <= fault_info_sig; -- Not sure yet ?!
   health_info <= health_info_sig;

   -- Sequential part

   process (clk, reset)begin
        if reset = '0' then
            read_pointer  <= "0001";
            write_pointer <= "0001";

            FIFO_MEM_1 <= (others=>'0');
            FIFO_MEM_2 <= (others=>'0');
            FIFO_MEM_3 <= (others=>'0');
            FIFO_MEM_4 <= (others=>'0');

            fake_credit_counter <= (others=>'0');
            faulty_packet_out <= '0';
            credit_out <= '0';
            state_out <= Idle;
            fault_info_out <= '0';
        elsif clk'event and clk = '1' then
            write_pointer <= write_pointer_in;
            read_pointer  <=  read_pointer_in;
            state_out <= state_in;
            
            faulty_packet_out <=  faulty_packet_in;
            credit_out <= credit_in;
            fake_credit_counter <= fake_credit_counter_in;   

            if write_en = '1' then 
                --write into the memory
                  FIFO_MEM_1 <= FIFO_MEM_1_in;
                  FIFO_MEM_2 <= FIFO_MEM_2_in;
                  FIFO_MEM_3 <= FIFO_MEM_3_in;
                  FIFO_MEM_4 <= FIFO_MEM_4_in;                   
            end if;

            fault_info_out <= fault_info_in;

        end if;
    end process;

 -- anything below here is pure combinational
 
   -- combinatorial part 

fault_info_sig <= fault_info_out;

process(fake_credit, read_en, fake_credit_counter) begin
	fake_credit_counter_in <= fake_credit_counter;
	credit_in <= '0';

	  if fake_credit = '1' and read_en = '1' then
        fake_credit_counter_in <= fake_credit_counter + 1 ;
    end if; 
     
    if fake_credit = '1' or read_en ='1' then
        credit_in <= '1';
    end if;      

    if fake_credit = '0' and read_en = '0' and fake_credit_counter > 0 then 
        fake_credit_counter_in <= fake_credit_counter - 1 ;
        credit_in <= '1';
    end if;
end process;

process(valid_in, RX) begin
  if valid_in = '1' then 
    xor_all <= XOR_REDUCE(RX(DATA_WIDTH-1 downto 1));
  else
    xor_all <= '0';
  end if;
end process;

process(valid_in, RX, xor_all)begin 
  fault_out <= '0';
  if valid_in = '1' and   xor_all /= RX(0) then 
    fault_out <= '1';
  end if;
end process;
 
    process(RX, faulty_packet_out, fault_out, write_pointer, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4, state_out, valid_in) begin
      -- this is the default value of the memory!
      case( write_pointer ) is
          when "0001" => FIFO_MEM_1_in <= RX;         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
          when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= RX;         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
          when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= RX;         FIFO_MEM_4_in <= FIFO_MEM_4; 
          when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= RX;                  
          when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
      end case ;
     
     --some defaults 
     fault_info_in <= '0';
     health_info_sig <= '0';
     fake_credit <= '0';
     state_in <= state_out;
     faulty_packet_in <= faulty_packet_out;
     write_fake_flit <= '0';

      case(state_out) is
      	  when Idle => 
            if fault_out = '0' then
                if valid_in = '1' then 
                  state_in <= Header_flit;
                else
                  state_in <= state_out;
                end if;   
            else
              fake_credit <= '1';
              FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
              state_in <= Packet_drop;
              fault_info_in <= '1';
              faulty_packet_in <= '1';
            end if;           
      	  when Header_flit => 
      	  		if valid_in = '1' then 
	              if fault_out = '0' then

                    if RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "010" then   
                       state_in <= Body_flit;
                    elsif RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "100" then
                        state_in <= Tail_flit;
                    else
                        -- we should not be here!
                        state_in <= state_out;
                    end if; 
	              else -- fault_out = '1'
      			        write_fake_flit <= '1';
      			        case( write_pointer ) is
      			            when "0001" => FIFO_MEM_1_in <= fake_tail;  FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
      			            when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= fake_tail;  FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
      			            when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= fake_tail;  FIFO_MEM_4_in <= FIFO_MEM_4; 
      			            when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= fake_tail;                  
      			            when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
      			        end case ;
      			        state_in <= Packet_drop;
                                fault_info_in <= '1';
      			        faulty_packet_in <= '1';                
	              end if;  
	            else
	                state_in <= state_out;   	       
	            end if;  
      	  when Body_flit => 
      	  		if valid_in = '1' then 
	              	if fault_out = '0' then
	                   
	                      if RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "010" then
	                          state_in <= state_out;
	                      elsif RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "100" then 
	                          state_in <= Tail_flit;
                                health_info_sig <= '1';
	                      else
	                          -- we should not be here!
	                          state_in <= state_out;
	                      end if;
	              else -- fault_out = '1'
	                  write_fake_flit <= '1';
	                  case( write_pointer ) is
	                      when "0001" => FIFO_MEM_1_in <= fake_tail;  FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
	                      when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= fake_tail;  FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
	                      when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= fake_tail;  FIFO_MEM_4_in <= FIFO_MEM_4; 
	                      when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= fake_tail;                  
	                      when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
	                  end case ;
	                  state_in <= Packet_drop;
                        fault_info_in <= '1';
	                  faulty_packet_in <= '1'; 
	 				 
	              end if;
	            else
	                state_in <= state_out;   	       
	            end if; 
      	  when Tail_flit => 
              if valid_in = '1' then 
                  if fault_out = '0' then
                      if RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "001" then
                          state_in <= Header_flit;
                      else 
                          state_in <= state_out;
                      end if;
                  else -- fault_out = '1'
                      fake_credit <= '1';
                      FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
                      state_in <= Packet_drop;
                      fault_info_in <= '1';
                      faulty_packet_in <= '1';        
                  end if;   
              else
                      state_in <= Idle;
              end if;

          when Packet_drop => 
            if faulty_packet_out = '1' then
               if valid_in = '1' and RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "001"  and fault_out = '0' then
                    faulty_packet_in <= '0';
                    state_in <= Header_flit;
                    write_fake_flit <= '1';
                    case( write_pointer ) is
                        when "0001" => FIFO_MEM_1_in <= RX;         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
                        when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= RX;         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
                        when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= RX;         FIFO_MEM_4_in <= FIFO_MEM_4; 
                        when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= RX;                  
                        when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
                    end case ;
 
               elsif valid_in = '1' and RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "100" and fault_out = '0' then
                    FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
                    faulty_packet_in <= '0';
                    state_in <= Idle;
                    fake_credit <= '1';
               else -- fault_out might have been '1'
                  if valid_in = '1' and RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "001" then 
                      fault_info_in <= '1';
                  end if;
                  if valid_in = '1' then 
                      fake_credit <= '1';
                  end if;
                  FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
                  state_in <= state_out;
               end if;
            else
              -- we should not be here!
              state_in <= state_out;
            end if;
	     when others => state_in <= state_out;
       end case;
    end process;

 

  process(read_pointer, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4)begin
    case( read_pointer ) is
        when "0001" => Data_out <= FIFO_MEM_1;
        when "0010" => Data_out <= FIFO_MEM_2;
        when "0100" => Data_out <= FIFO_MEM_3;
        when "1000" => Data_out <= FIFO_MEM_4;
        when others => Data_out <= FIFO_MEM_1; 
    end case ;
  end process;

  read_en <= (read_en_N or read_en_E or read_en_W or read_en_S or read_en_L) and not empty; 
  empty_out <= empty;
  

  process(write_en, write_pointer)begin
    if write_en = '1' then
       write_pointer_in <= write_pointer(2 downto 0)&write_pointer(3); 
    else
       write_pointer_in <= write_pointer; 
    end if;
  end process;

  process(read_en, empty, read_pointer)begin
       if (read_en = '1' and empty = '0') then
           read_pointer_in <= read_pointer(2 downto 0)&read_pointer(3); 
       else 
           read_pointer_in <= read_pointer; 
       end if;
  end process;

  process(full, valid_in, write_fake_flit, faulty_packet_out, fault_out) begin
     if valid_in = '1' and ((faulty_packet_out = '0' and fault_out = '0') or write_fake_flit = '1') and full ='0' then
         write_en <= '1';
     else
         write_en <= '0';
     end if;        
  end process;
                        
  process(write_pointer, read_pointer) begin
      if read_pointer = write_pointer  then
              empty <= '1';
      else
              empty <= '0';
      end if;
      --      if write_pointer = read_pointer>>1 then
      if write_pointer = read_pointer(0)&read_pointer(3 downto 1) then
              full <= '1';
      else
              full <= '0'; 
      end if; 
  end process;

end;
