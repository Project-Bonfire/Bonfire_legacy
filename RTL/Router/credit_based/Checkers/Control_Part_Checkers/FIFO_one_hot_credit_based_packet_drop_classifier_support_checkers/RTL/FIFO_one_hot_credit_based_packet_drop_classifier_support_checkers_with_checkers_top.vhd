--Copyright (C) 2016 Siavoosh Payandeh Azad and Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity FIFO_credit_based_control_part_with_checkers_top is
    port (  valid_in  : in std_logic;
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            read_pointer: in std_logic_vector(3 downto 0);
            write_pointer: in std_logic_vector(3 downto 0);
            state_out: in std_logic_vector(4 downto 0);
            faulty_packet_out: in std_logic;
            fake_credit_counter: in std_logic_vector(1 downto 0);
            flit_type: in std_logic_vector(2 downto 0);
            fault_out: in std_logic;

            credit_out: out std_logic;
            empty_out: out std_logic;
            full_out: out std_logic;
            fault_info: out  std_logic;
            health_info: out  std_logic;
            read_en_out: out std_logic;
            write_en_out: out std_logic;
            read_pointer_in: out std_logic_vector(3 downto 0);
            write_pointer_in: out std_logic_vector(3 downto 0);
            state_in: out std_logic_vector(4 downto 0);
            faulty_packet_in: out std_logic;
            fake_credit_out: out std_logic;
            write_fake_flit_out: out std_logic;
            fake_credit_counter_in: out std_logic_vector(1 downto 0);

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
            --err_fake_credit_read_en_fake_credit_counter_zero_not_credit_out,
            --err_valid_in_state_out_state_in_not_change,

            -- Checkers for Packet Dropping FSM of FIFO
            err_state_out_Idle_not_fault_out_valid_in_state_in_Header_flit,
            err_state_out_Idle_not_fault_out_valid_in_state_in_not_change,
            err_state_out_Idle_not_fault_out_not_fake_credit,
            err_state_out_Idle_not_fault_out_not_fault_info,
            err_state_out_Idle_not_fault_out_faulty_packet_in_faulty_packet_out_equal,
            err_state_out_Idle_fault_out_fake_credit,
            err_state_out_Idle_fault_out_state_in_Packet_drop,
            err_state_out_Idle_fault_out_fault_info,
            err_state_out_Idle_fault_out_faulty_packet_in,
            err_state_out_Idle_not_health_info,
            err_state_out_Idle_not_write_fake_flit,

            err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Body_state_in_Body_flit,
            err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Tail_state_in_Tail_flit,
            --err_state_out_Header_flit_valid_in_not_fault_out_flit_type_invalid_state_in_state_out_not_change,
            err_state_out_Header_flit_valid_in_not_fault_out_not_write_fake_flit,
            err_state_out_Header_flit_valid_in_not_fault_out_not_fault_info,
            err_state_out_Header_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change,
            err_state_out_Header_flit_valid_in_fault_out_write_fake_flit,
            err_state_out_Header_flit_valid_in_fault_out_state_in_Packet_drop,
            err_state_out_Header_flit_valid_in_fault_out_fault_info,
            err_state_out_Header_flit_valid_in_fault_out_faulty_packet_in,
            err_state_out_Header_flit_not_valid_in_state_in_state_out_not_change,
            err_state_out_Header_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change,
            err_state_out_Header_flit_not_valid_in_not_fault_info,
            err_state_out_Header_flit_not_valid_in_not_write_fake_flit,
            err_state_out_Header_flit_or_Body_flit_not_fake_credit,

            err_state_out_Body_flit_valid_in_not_fault_out_state_in_state_out_not_change,
            err_state_out_Body_flit_valid_in_not_fault_out_state_in_Tail_flit,
            err_state_out_Body_flit_valid_in_not_fault_out_health_info,
            --err_state_out_Body_flit_valid_in_not_fault_out_flit_type_invalid_state_in_state_out_not_change,
            err_state_out_Body_flit_valid_in_not_fault_out_not_write_fake_flit,
            err_state_out_Body_flit_valid_in_not_fault_out_fault_info,
            err_state_out_Body_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change,
            err_state_out_Body_flit_valid_in_fault_out_write_fake_flit,
            err_state_out_Body_flit_valid_in_fault_out_state_in_Packet_drop,
            err_state_out_Body_flit_valid_in_fault_out_fault_info,
            err_state_out_Body_flit_valid_in_fault_out_faulty_packet_in,
            err_state_out_Body_flit_not_valid_in_state_in_state_out_not_change,
            err_state_out_Body_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change,
            err_state_out_Body_flit_not_valid_in_not_fault_info,
            err_state_out_Body_flit_valid_in_not_fault_out_flit_type_not_tail_not_health_info,
            err_state_out_Body_flit_valid_in_fault_out_not_health_info,
            err_state_out_Body_flit_valid_in_not_health_info,
            err_state_out_Body_flit_not_fake_credit,
            err_state_out_Body_flit_not_valid_in_not_write_fake_flit,

            err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_Header_state_in_Header_flit,
            --err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_invalid_state_in_state_out_not_change,
            err_state_out_Tail_flit_valid_in_not_fault_out_not_fake_credit,
            err_state_out_Tail_flit_valid_in_not_fault_out_not_fault_info,
            err_state_out_Tail_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change,
            err_state_out_Tail_flit_valid_in_fault_out_fake_credit,
            err_state_out_Tail_flit_valid_in_fault_out_state_in_Packet_drop,
            err_state_out_Tail_flit_valid_in_fault_out_fault_info,
            err_state_out_Tail_flit_valid_in_fault_out_faulty_packet_in,
            err_state_out_Tail_flit_not_valid_in_state_in_Idle,
            err_state_out_Tail_flit_not_valid_in_faulty_packet_in_faulty_packet_in_not_change,
            err_state_out_Tail_flit_not_valid_in_not_fault_info,
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
            err_state_out_Packet_drop_not_fault_info,
            err_state_out_Packet_drop_not_faulty_packet_out_not_fake_credit,
            err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_or_fault_out_not_write_fake_flit,
            err_state_out_Packet_drop_not_faulty_packet_out_not_write_fake_flit,
            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_fault_out_state_in_state_out_not_change,
            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_fault_out_state_in_state_out_not_change : out std_logic
            --err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_and_tail_or_fault_out_state_in_state_out_not_change
            --err_state_out_invalid_state_in_state_out_not_change,
            --err_state_out_invalid_not_fault_info,
            --err_state_out_invalid_not_health_info,
            --err_state_out_invalid_not_fake_credit,
            --err_state_out_invalid_not_write_fake_flit,
            --err_state_out_invalid_faulty_packet_in_faulty_packet_out_not_change: out std_logic
    );
end FIFO_credit_based_control_part_with_checkers_top;

architecture behavior of FIFO_credit_based_control_part_with_checkers_top is

component FIFO_credit_based_pseudo is
    port (  valid_in: in std_logic;
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            read_pointer: in std_logic_vector(3 downto 0);
            write_pointer: in std_logic_vector(3 downto 0);
            state_out: in std_logic_vector(4 downto 0);
            faulty_packet_out: in std_logic;
            fake_credit_counter: in std_logic_vector(1 downto 0);
            flit_type: in std_logic_vector(2 downto 0);
            fault_out: in std_logic;

            credit_out: out std_logic; -- credit_out removed due to creation of pseudo-combinational register, credit_out directly taken to the output interface.
            empty_out: out std_logic;
            full_out: out std_logic;
            fault_info: out  std_logic;
            health_info: out  std_logic;
            read_en_out: out std_logic;
            write_en_out: out std_logic;
            read_pointer_in: out std_logic_vector(3 downto 0);
            write_pointer_in: out std_logic_vector(3 downto 0);
            state_in: out std_logic_vector(4 downto 0);
            faulty_packet_in: out std_logic;
            fake_credit_out: out std_logic;
            write_fake_flit_out: out std_logic;
            fake_credit_counter_in: out std_logic_vector(1 downto 0)
    );
end component;

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
            --err_fake_credit_read_en_fake_credit_counter_zero_not_credit_out,
            --err_valid_in_state_out_state_in_not_change,

            -- Checkers for Packet Dropping FSM of FIFO
            err_state_out_Idle_not_fault_out_valid_in_state_in_Header_flit,
            err_state_out_Idle_not_fault_out_valid_in_state_in_not_change,
            err_state_out_Idle_not_fault_out_not_fake_credit,
            err_state_out_Idle_not_fault_out_not_fault_info,
            err_state_out_Idle_not_fault_out_faulty_packet_in_faulty_packet_out_equal,
            err_state_out_Idle_fault_out_fake_credit,
            err_state_out_Idle_fault_out_state_in_Packet_drop,
            err_state_out_Idle_fault_out_fault_info,
            err_state_out_Idle_fault_out_faulty_packet_in,
            err_state_out_Idle_not_health_info,
            err_state_out_Idle_not_write_fake_flit,

            err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Body_state_in_Body_flit,
            err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Tail_state_in_Tail_flit,
            --err_state_out_Header_flit_valid_in_not_fault_out_flit_type_invalid_state_in_state_out_not_change,
            err_state_out_Header_flit_valid_in_not_fault_out_not_write_fake_flit,
            err_state_out_Header_flit_valid_in_not_fault_out_not_fault_info,
            err_state_out_Header_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change,
            err_state_out_Header_flit_valid_in_fault_out_write_fake_flit,
            err_state_out_Header_flit_valid_in_fault_out_state_in_Packet_drop,
            err_state_out_Header_flit_valid_in_fault_out_fault_info,
            err_state_out_Header_flit_valid_in_fault_out_faulty_packet_in,
            err_state_out_Header_flit_not_valid_in_state_in_state_out_not_change,
            err_state_out_Header_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change,
            err_state_out_Header_flit_not_valid_in_not_fault_info,
            err_state_out_Header_flit_not_valid_in_not_write_fake_flit,
            err_state_out_Header_flit_or_Body_flit_not_fake_credit,

            err_state_out_Body_flit_valid_in_not_fault_out_state_in_state_out_not_change,
            err_state_out_Body_flit_valid_in_not_fault_out_state_in_Tail_flit,
            err_state_out_Body_flit_valid_in_not_fault_out_health_info,
            --err_state_out_Body_flit_valid_in_not_fault_out_flit_type_invalid_state_in_state_out_not_change,
            err_state_out_Body_flit_valid_in_not_fault_out_not_write_fake_flit,
            err_state_out_Body_flit_valid_in_not_fault_out_fault_info,
            err_state_out_Body_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change,
            err_state_out_Body_flit_valid_in_fault_out_write_fake_flit,
            err_state_out_Body_flit_valid_in_fault_out_state_in_Packet_drop,
            err_state_out_Body_flit_valid_in_fault_out_fault_info,
            err_state_out_Body_flit_valid_in_fault_out_faulty_packet_in,
            err_state_out_Body_flit_not_valid_in_state_in_state_out_not_change,
            err_state_out_Body_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change,
            err_state_out_Body_flit_not_valid_in_not_fault_info,
            err_state_out_Body_flit_valid_in_not_fault_out_flit_type_not_tail_not_health_info,
            err_state_out_Body_flit_valid_in_fault_out_not_health_info,
            err_state_out_Body_flit_valid_in_not_health_info,
            err_state_out_Body_flit_not_fake_credit,
            err_state_out_Body_flit_not_valid_in_not_write_fake_flit,

            err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_Header_state_in_Header_flit,
            --err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_invalid_state_in_state_out_not_change,
            err_state_out_Tail_flit_valid_in_not_fault_out_not_fake_credit,
            err_state_out_Tail_flit_valid_in_not_fault_out_not_fault_info,
            err_state_out_Tail_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change,
            err_state_out_Tail_flit_valid_in_fault_out_fake_credit,
            err_state_out_Tail_flit_valid_in_fault_out_state_in_Packet_drop,
            err_state_out_Tail_flit_valid_in_fault_out_fault_info,
            err_state_out_Tail_flit_valid_in_fault_out_faulty_packet_in,
            err_state_out_Tail_flit_not_valid_in_state_in_Idle,
            err_state_out_Tail_flit_not_valid_in_faulty_packet_in_faulty_packet_in_not_change,
            err_state_out_Tail_flit_not_valid_in_not_fault_info,
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
            err_state_out_Packet_drop_not_fault_info,
            err_state_out_Packet_drop_not_faulty_packet_out_not_fake_credit,
            err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_or_fault_out_not_write_fake_flit,
            err_state_out_Packet_drop_not_faulty_packet_out_not_write_fake_flit,
            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_fault_out_state_in_state_out_not_change,
            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_fault_out_state_in_state_out_not_change : out std_logic
            --err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_and_tail_or_fault_out_state_in_state_out_not_change
            --err_state_out_invalid_state_in_state_out_not_change,
            --err_state_out_invalid_not_fault_info,
            --err_state_out_invalid_not_health_info,
            --err_state_out_invalid_not_fake_credit,
            --err_state_out_invalid_not_write_fake_flit,
            --err_state_out_invalid_faulty_packet_in_faulty_packet_out_not_change: out std_logic
            );
end component;

signal credit_out_sig: std_logic;
signal empty_out_sig, full_out_sig, fault_info_sig, health_info_sig, read_en_out_sig, write_en_out_sig: std_logic;
signal read_pointer_in_sig, write_pointer_in_sig: std_logic_vector(3 downto 0);
signal state_in_sig: std_logic_vector(4 downto 0);
signal faulty_packet_in_sig: std_logic;
signal fake_credit_out_sig: std_logic;
signal write_fake_flit_out_sig: std_logic;
signal fake_credit_counter_in_sig: std_logic_vector(1 downto 0);

begin

credit_out <= credit_out_sig;
empty_out <= empty_out_sig;
full_out <= full_out_sig;
fault_info <= fault_info_sig;
health_info <= health_info_sig;
read_en_out <= read_en_out_sig;
write_en_out <= write_en_out_sig;
read_pointer_in <= read_pointer_in_sig;
write_pointer_in <= write_pointer_in_sig;
state_in <= state_in_sig;
faulty_packet_in <= faulty_packet_in_sig;
fake_credit_out <= fake_credit_out_sig;
write_fake_flit_out <= write_fake_flit_out_sig;
fake_credit_counter_in <= fake_credit_counter_in_sig;

-- Credit-Based FIFO Control Part with Packet dropping instantiation
FIFO_CREDIT_BASED_CONTROL_PART_PSEUDO: FIFO_credit_based_pseudo port map  ( valid_in => valid_in,
                                                                            read_en_N => read_en_N,
                                                                            read_en_E => read_en_E,
                                                                            read_en_W => read_en_W,
                                                                            read_en_S => read_en_S,
                                                                            read_en_L => read_en_L,
                                                                            read_pointer => read_pointer,
                                                                            write_pointer => write_pointer,
                                                                            state_out => state_out,
                                                                            faulty_packet_out => faulty_packet_out,
                                                                            fake_credit_counter => fake_credit_counter,
                                                                            flit_type => flit_type,
                                                                            fault_out => fault_out,

                                                                            credit_out => credit_out_sig,
                                                                            empty_out => empty_out_sig,
                                                                            full_out => full_out_sig,
                                                                            fault_info => fault_info_sig,
                                                                            health_info => health_info_sig,
                                                                            read_en_out => read_en_out_sig,
                                                                            write_en_out => write_en_out_sig,
                                                                            read_pointer_in => read_pointer_in_sig,
                                                                            write_pointer_in => write_pointer_in_sig,
                                                                            state_in => state_in_sig,
                                                                            faulty_packet_in => faulty_packet_in_sig,
                                                                            fake_credit_out => fake_credit_out_sig,
                                                                            write_fake_flit_out => write_fake_flit_out_sig,
                                                                            fake_credit_counter_in => fake_credit_counter_in_sig
                         						              );

-- Checkers instantiation
CHECKERS: FIFO_credit_based_control_part_checkers port map (
                                                            valid_in => valid_in,
                                                            read_en_N => read_en_N,
                                                            read_en_E => read_en_E,
                                                            read_en_W => read_en_W,
                                                            read_en_S => read_en_S,
                                                            read_en_L => read_en_L,
                                                            read_pointer => read_pointer,
                                                            read_pointer_in => read_pointer_in_sig,
                                                            write_pointer => write_pointer,
                                                            write_pointer_in => write_pointer_in_sig,
                                                            credit_out => credit_out_sig,
                                                            empty_out => empty_out_sig,
                                                            full_out => full_out_sig,
                                                            read_en_out => read_en_out_sig,
                                                            write_en_out => write_en_out_sig,
                                                            fake_credit => fake_credit_out_sig,
                                                            fake_credit_counter => fake_credit_counter,
                                                            fake_credit_counter_in => fake_credit_counter_in_sig,
                                                            state_out => state_out,
                                                            state_in => state_in_sig,
                                                            fault_info => fault_info_sig,
                                                            health_info => health_info_sig,
                                                            faulty_packet_out => faulty_packet_out,
                                                            faulty_packet_in => faulty_packet_in_sig,
                                                            flit_type => flit_type,
                                                            fault_out => fault_out,
                                                            write_fake_flit => write_fake_flit_out_sig,

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
                                                            --err_fake_credit_read_en_fake_credit_counter_zero_not_credit_out,
                                                            --err_valid_in_state_out_state_in_not_change => err_valid_in_state_out_state_in_not_change,

                                                            -- Checkers for Packet Dropping FSM of FIFO
                                                            err_state_out_Idle_not_fault_out_valid_in_state_in_Header_flit => err_state_out_Idle_not_fault_out_valid_in_state_in_Header_flit,
                                                            err_state_out_Idle_not_fault_out_valid_in_state_in_not_change => err_state_out_Idle_not_fault_out_valid_in_state_in_not_change,
                                                            err_state_out_Idle_not_fault_out_not_fake_credit => err_state_out_Idle_not_fault_out_not_fake_credit,
                                                            err_state_out_Idle_not_fault_out_not_fault_info => err_state_out_Idle_not_fault_out_not_fault_info,
                                                            err_state_out_Idle_not_fault_out_faulty_packet_in_faulty_packet_out_equal => err_state_out_Idle_not_fault_out_faulty_packet_in_faulty_packet_out_equal,
                                                            err_state_out_Idle_fault_out_fake_credit => err_state_out_Idle_fault_out_fake_credit,
                                                            err_state_out_Idle_fault_out_state_in_Packet_drop => err_state_out_Idle_fault_out_state_in_Packet_drop,
                                                            err_state_out_Idle_fault_out_fault_info => err_state_out_Idle_fault_out_fault_info,
                                                            err_state_out_Idle_fault_out_faulty_packet_in => err_state_out_Idle_fault_out_faulty_packet_in,
                                                            err_state_out_Idle_not_health_info => err_state_out_Idle_not_health_info,
                                                            err_state_out_Idle_not_write_fake_flit => err_state_out_Idle_not_write_fake_flit,

                                                            err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Body_state_in_Body_flit => err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Body_state_in_Body_flit,
                                                            err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Tail_state_in_Tail_flit => err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Tail_state_in_Tail_flit,
                                                            --err_state_out_Header_flit_valid_in_not_fault_out_flit_type_invalid_state_in_state_out_not_change => err_state_out_Header_flit_valid_in_not_fault_out_flit_type_invalid_state_in_state_out_not_change,
                                                            err_state_out_Header_flit_valid_in_not_fault_out_not_write_fake_flit => err_state_out_Header_flit_valid_in_not_fault_out_not_write_fake_flit,
                                                            err_state_out_Header_flit_valid_in_not_fault_out_not_fault_info => err_state_out_Header_flit_valid_in_not_fault_out_not_fault_info,
                                                            err_state_out_Header_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change => err_state_out_Header_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change,
                                                            err_state_out_Header_flit_valid_in_fault_out_write_fake_flit => err_state_out_Header_flit_valid_in_fault_out_write_fake_flit,
                                                            err_state_out_Header_flit_valid_in_fault_out_state_in_Packet_drop => err_state_out_Header_flit_valid_in_fault_out_state_in_Packet_drop,
                                                            err_state_out_Header_flit_valid_in_fault_out_fault_info => err_state_out_Header_flit_valid_in_fault_out_fault_info,
                                                            err_state_out_Header_flit_valid_in_fault_out_faulty_packet_in => err_state_out_Header_flit_valid_in_fault_out_faulty_packet_in,
                                                            err_state_out_Header_flit_not_valid_in_state_in_state_out_not_change => err_state_out_Header_flit_not_valid_in_state_in_state_out_not_change,
                                                            err_state_out_Header_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change => err_state_out_Header_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change,
                                                            err_state_out_Header_flit_not_valid_in_not_fault_info => err_state_out_Header_flit_not_valid_in_not_fault_info,
                                                            err_state_out_Header_flit_not_valid_in_not_write_fake_flit => err_state_out_Header_flit_not_valid_in_not_write_fake_flit,
                                                            err_state_out_Header_flit_or_Body_flit_not_fake_credit => err_state_out_Header_flit_or_Body_flit_not_fake_credit,

                                                            err_state_out_Body_flit_valid_in_not_fault_out_state_in_state_out_not_change => err_state_out_Body_flit_valid_in_not_fault_out_state_in_state_out_not_change,
                                                            err_state_out_Body_flit_valid_in_not_fault_out_state_in_Tail_flit => err_state_out_Body_flit_valid_in_not_fault_out_state_in_Tail_flit,
                                                            err_state_out_Body_flit_valid_in_not_fault_out_health_info => err_state_out_Body_flit_valid_in_not_fault_out_health_info,
                                                            --err_state_out_Body_flit_valid_in_not_fault_out_flit_type_invalid_state_in_state_out_not_change => err_state_out_Body_flit_valid_in_not_fault_out_flit_type_invalid_state_in_state_out_not_change,
                                                            err_state_out_Body_flit_valid_in_not_fault_out_not_write_fake_flit => err_state_out_Body_flit_valid_in_not_fault_out_not_write_fake_flit,
                                                            err_state_out_Body_flit_valid_in_not_fault_out_fault_info => err_state_out_Body_flit_valid_in_not_fault_out_fault_info,
                                                            err_state_out_Body_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change => err_state_out_Body_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change,
                                                            err_state_out_Body_flit_valid_in_fault_out_write_fake_flit => err_state_out_Body_flit_valid_in_fault_out_write_fake_flit,
                                                            err_state_out_Body_flit_valid_in_fault_out_state_in_Packet_drop => err_state_out_Body_flit_valid_in_fault_out_state_in_Packet_drop,
                                                            err_state_out_Body_flit_valid_in_fault_out_fault_info => err_state_out_Body_flit_valid_in_fault_out_fault_info,
                                                            err_state_out_Body_flit_valid_in_fault_out_faulty_packet_in => err_state_out_Body_flit_valid_in_fault_out_faulty_packet_in,
                                                            err_state_out_Body_flit_not_valid_in_state_in_state_out_not_change => err_state_out_Body_flit_not_valid_in_state_in_state_out_not_change,
                                                            err_state_out_Body_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change => err_state_out_Body_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change,
                                                            err_state_out_Body_flit_not_valid_in_not_fault_info => err_state_out_Body_flit_not_valid_in_not_fault_info,
                                                            err_state_out_Body_flit_valid_in_not_fault_out_flit_type_not_tail_not_health_info => err_state_out_Body_flit_valid_in_not_fault_out_flit_type_not_tail_not_health_info,
                                                            err_state_out_Body_flit_valid_in_fault_out_not_health_info => err_state_out_Body_flit_valid_in_fault_out_not_health_info,
                                                            err_state_out_Body_flit_valid_in_not_health_info => err_state_out_Body_flit_valid_in_not_health_info,
                                                            err_state_out_Body_flit_not_fake_credit => err_state_out_Body_flit_not_fake_credit,
                                                            err_state_out_Body_flit_not_valid_in_not_write_fake_flit => err_state_out_Body_flit_not_valid_in_not_write_fake_flit,

                                                            err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_Header_state_in_Header_flit => err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_Header_state_in_Header_flit,
                                                            --err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_invalid_state_in_state_out_not_change => err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_invalid_state_in_state_out_not_change,
                                                            err_state_out_Tail_flit_valid_in_not_fault_out_not_fake_credit => err_state_out_Tail_flit_valid_in_not_fault_out_not_fake_credit,
                                                            err_state_out_Tail_flit_valid_in_not_fault_out_not_fault_info => err_state_out_Tail_flit_valid_in_not_fault_out_not_fault_info,
                                                            err_state_out_Tail_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change => err_state_out_Tail_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change,
                                                            err_state_out_Tail_flit_valid_in_fault_out_fake_credit => err_state_out_Tail_flit_valid_in_fault_out_fake_credit,
                                                            err_state_out_Tail_flit_valid_in_fault_out_state_in_Packet_drop => err_state_out_Tail_flit_valid_in_fault_out_state_in_Packet_drop,
                                                            err_state_out_Tail_flit_valid_in_fault_out_fault_info => err_state_out_Tail_flit_valid_in_fault_out_fault_info,
                                                            err_state_out_Tail_flit_valid_in_fault_out_faulty_packet_in => err_state_out_Tail_flit_valid_in_fault_out_faulty_packet_in,
                                                            err_state_out_Tail_flit_not_valid_in_state_in_Idle => err_state_out_Tail_flit_not_valid_in_state_in_Idle,
                                                            err_state_out_Tail_flit_not_valid_in_faulty_packet_in_faulty_packet_in_not_change => err_state_out_Tail_flit_not_valid_in_faulty_packet_in_faulty_packet_in_not_change,
                                                            err_state_out_Tail_flit_not_valid_in_not_fault_info => err_state_out_Tail_flit_not_valid_in_not_fault_info,
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
                                                            err_state_out_Packet_drop_not_fault_info => err_state_out_Packet_drop_not_fault_info,
                                                            err_state_out_Packet_drop_not_faulty_packet_out_not_fake_credit => err_state_out_Packet_drop_not_faulty_packet_out_not_fake_credit,
                                                            err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_or_fault_out_not_write_fake_flit => err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_or_fault_out_not_write_fake_flit,
                                                            err_state_out_Packet_drop_not_faulty_packet_out_not_write_fake_flit => err_state_out_Packet_drop_not_faulty_packet_out_not_write_fake_flit,
                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_fault_out_state_in_state_out_not_change => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_fault_out_state_in_state_out_not_change,
                                                            err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_fault_out_state_in_state_out_not_change => err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_fault_out_state_in_state_out_not_change
                                                            --err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_and_tail_or_fault_out_state_in_state_out_not_change => err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_and_tail_or_fault_out_state_in_state_out_not_change,
                                                            --err_state_out_invalid_state_in_state_out_not_change => err_state_out_invalid_state_in_state_out_not_change,
                                                            --err_state_out_invalid_not_fault_info => err_state_out_invalid_not_fault_info,
                                                            --err_state_out_invalid_not_health_info => err_state_out_invalid_not_health_info,
                                                            --err_state_out_invalid_not_fake_credit => err_state_out_invalid_not_fake_credit,
                                                            --err_state_out_invalid_not_write_fake_flit  => err_state_out_invalid_not_write_fake_flit,
                                                            --err_state_out_invalid_faulty_packet_in_faulty_packet_out_not_change => err_state_out_invalid_faulty_packet_in_faulty_packet_out_not_change
                                                           );

end behavior;