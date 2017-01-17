--Copyright (C) 2016 Siavoosh Payandeh Azad and Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity FIFO_credit_based_control_part_checkers is
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
			err_state_out_Packet_drop_not_fault_info_in, 
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
end FIFO_credit_based_control_part_checkers;

architecture behavior of FIFO_credit_based_control_part_checkers is

CONSTANT Idle: std_logic_vector (4 downto 0) := "00001";
CONSTANT Header_flit: std_logic_vector (4 downto 0) := "00010";
CONSTANT Body_flit: std_logic_vector (4 downto 0) := "00100";
CONSTANT Tail_flit: std_logic_vector (4 downto 0) := "01000";
CONSTANT Packet_drop: std_logic_vector (4 downto 0) := "10000";

begin 

-- Functional Checkers (Might cover or be covered by some of the structural checkers)

-- Empty and full cannot be high at the same time!
process (empty_out, full_out)
begin
	if (empty_out = '1' and full_out = '1') then
		err_empty_full <= '1';
	else
		err_empty_full <= '0';
	end if;
end process;

-- Reading from an empty FIFO is not possible!
process (empty_out, read_en_out)
begin
	if (empty_out = '1' and read_en_out = '1') then
		err_empty_read_en <= '1';
	else
		err_empty_read_en <= '0';
	end if;
end process;

-- Writing to a full FIFO is not possible!
process (full_out, write_en_out)
begin
	if (full_out = '1' and write_en_out = '1') then
		err_full_write_en <= '1';
	else
		err_full_write_en <= '0';
	end if;
end process;

-- The states of the packet dropping FSM of FIFO must always be one-hot (state_in)!
process (state_in)
begin
	if (state_in /= Idle and state_in /= Header_flit and state_in /= Body_flit and state_in /= Tail_flit and state_in /= Packet_drop) then
		err_state_in_onehot <= '1';
	else
		err_state_in_onehot <= '0';
	end if;
end process;

-- Read pointer must always be one-hot! 
process (read_pointer_in)
begin
	if (read_pointer_in /= "0001" and read_pointer_in /= "0010" and read_pointer_in /= "0100" and read_pointer_in /= "1000") then
		err_read_pointer_in_onehot <= '1';
	else
		err_read_pointer_in_onehot <= '0';
	end if;
end process;

-- Write pointer must always be one-hot!
process (write_pointer_in)
begin
	if (write_pointer_in /= "0001" and write_pointer_in /= "0010" and write_pointer_in /= "0100" and write_pointer_in /= "1000") then
		err_write_pointer_in_onehot <= '1';
	else
		err_write_pointer_in_onehot <= '0';
	end if;
end process;


---------------------------------------------------------------------------------------------------------

-- Structural Checkers

-- Write pointer and Read pointer checkers

process (write_en_out, write_pointer_in, write_pointer)
begin
	if (write_en_out = '1' and write_pointer_in /= (write_pointer(2 downto 0) & write_pointer(3)) ) then
		err_write_en_write_pointer <= '1';
	else
		err_write_en_write_pointer <= '0';
	end if;
end process;

-- Checked !

process (write_en_out, write_pointer_in, write_pointer)
begin
	if (write_en_out = '0' and write_pointer_in /= write_pointer ) then
		err_not_write_en_write_pointer <= '1';
	else
		err_not_write_en_write_pointer <= '0';
	end if;
end process;

-- Checked !

process (read_pointer, write_pointer, empty_out)
begin
	if (read_pointer = write_pointer and empty_out = '0' ) then
		err_read_pointer_write_pointer_not_empty <= '1';
	else
		err_read_pointer_write_pointer_not_empty <= '0';
	end if;
end process;

-- Checked !

process (read_pointer, write_pointer, empty_out)
begin
	if (read_pointer /= write_pointer and empty_out = '1' ) then
		err_read_pointer_write_pointer_empty <= '1';
	else
		err_read_pointer_write_pointer_empty <= '0';
	end if;
end process;

-- Checked !

process (write_pointer, read_pointer, full_out)
begin
	if (write_pointer = (read_pointer(0)&read_pointer(3 downto 1)) and full_out = '0' ) then
		err_read_pointer_write_pointer_not_full <= '1';
	else
		err_read_pointer_write_pointer_not_full <= '0';
	end if;
end process;

-- Checked !

process (write_pointer, read_pointer, full_out)
begin
	if (write_pointer /= (read_pointer(0)&read_pointer(3 downto 1)) and full_out = '1' ) then
		err_read_pointer_write_pointer_full <= '1';
	else
		err_read_pointer_write_pointer_full <= '0';
	end if;
end process;

-- Checked !

process (read_en_out, empty_out, read_pointer_in, read_pointer)
begin
	if (read_en_out = '1' and empty_out = '0' and read_pointer_in /= (read_pointer(2 downto 0)&read_pointer(3)) ) then
		 err_read_pointer_increment <= '1';
	else
		 err_read_pointer_increment <= '0';
	end if;
end process;

-- Checked !

process (read_en_out, empty_out, read_pointer_in, read_pointer)
begin
	if ( (read_en_out = '0' or empty_out = '1') and read_pointer_in /= read_pointer ) then
		 err_read_pointer_not_increment <= '1';
	else
		 err_read_pointer_not_increment <= '0';
	end if;
end process;

-- Checked !


process (valid_in, faulty_packet_out, fault_out, write_fake_flit, full_out, write_en_out)
begin
	if (valid_in = '1' and ((faulty_packet_out = '0' and fault_out = '0') or write_fake_flit = '1') and full_out ='0' and write_en_out = '0') then
		 err_write_en <= '1';
	else
		 err_write_en <= '0';
	end if;
end process;

-- Updated !

process (valid_in, faulty_packet_out, fault_out, write_fake_flit, full_out, write_en_out)
begin
	if ( (valid_in = '0' or (((faulty_packet_out = '1' or fault_out = '1') and write_fake_flit = '0')) or full_out = '1') and write_en_out = '1') then
		 err_not_write_en <= '1';
	else
		 err_not_write_en <= '0';
	end if;
end process;

process (valid_in, faulty_packet_out, fault_out, write_fake_flit, full_out, write_en_out)
begin
	if ( valid_in = '1' and ((faulty_packet_out = '1' or fault_out = '1') and write_fake_flit = '0') and write_en_out = '1') then
		 err_not_write_en1 <= '1';
	else
		 err_not_write_en1 <= '0';
	end if;
end process;

process (valid_in, faulty_packet_out, fault_out, write_fake_flit, full_out, write_en_out)
begin
	if ( valid_in = '1' and ((faulty_packet_out = '0' and fault_out = '0') or write_fake_flit = '1') and full_out = '1' and write_en_out = '1') then
		 err_not_write_en2 <= '1';
	else
		 err_not_write_en2 <= '0';
	end if;
end process;

-- Updated !

process (read_en_N, read_en_E, read_en_W, read_en_S, read_en_L, empty_out, read_en_out)
begin
	if ( (read_en_N = '1' or read_en_E = '1' or read_en_W = '1' or read_en_S = '1' or read_en_L = '1') and empty_out = '0' and read_en_out = '0' ) then
		 err_read_en_mismatch <= '1';
	else
		 err_read_en_mismatch <= '0';
	end if;
end process;

process (read_en_N, read_en_E, read_en_W, read_en_S, read_en_L, empty_out, read_en_out)
begin
	if ( ((read_en_N = '0' and read_en_E = '0' and read_en_W = '0' and read_en_S = '0' and read_en_L = '0') or empty_out = '1') and read_en_out = '1' ) then
		 err_read_en_mismatch1 <= '1';
	else
		 err_read_en_mismatch1 <= '0';
	end if;
end process;

-- Newly added checkers for FIFO with packet drop and fault classifier support!

process (fake_credit, read_en_out, fake_credit_counter_in, fake_credit_counter)
begin
	if (fake_credit = '1' and read_en_out = '1' and fake_credit_counter_in /= fake_credit_counter + 1) then
		 err_fake_credit_read_en_fake_credit_counter_in_increment <= '1';
	else
		 err_fake_credit_read_en_fake_credit_counter_in_increment <= '0';
	end if;
end process;


process (fake_credit, read_en_out, fake_credit_counter, fake_credit_counter_in)
begin
	if (fake_credit = '0' and read_en_out = '0' and fake_credit_counter > 0 and fake_credit_counter_in /= fake_credit_counter - 1 ) then
		 err_not_fake_credit_not_read_en_fake_credit_counter_not_zero_fake_credit_counter_in_decrement <= '1';
	else
		 err_not_fake_credit_not_read_en_fake_credit_counter_not_zero_fake_credit_counter_in_decrement <= '0';
	end if;
end process;

process (fake_credit, read_en_out, fake_credit_counter_in, fake_credit_counter)
begin
	if (fake_credit = '0' and read_en_out = '1' and fake_credit_counter_in /= fake_credit_counter) then
		 err_not_fake_credit_read_en_fake_credit_counter_in_not_change <= '1';
	else
		 err_not_fake_credit_read_en_fake_credit_counter_in_not_change <= '0';
	end if;
end process;

process (fake_credit, read_en_out, fake_credit_counter_in, fake_credit_counter)
begin
	if (fake_credit = '1' and read_en_out = '0' and fake_credit_counter_in /= fake_credit_counter) then
		 err_fake_credit_not_read_en_fake_credit_counter_in_not_change <= '1';
	else
		 err_fake_credit_not_read_en_fake_credit_counter_in_not_change <= '0';
	end if;
end process;

process (fake_credit, read_en_out, fake_credit_counter, fake_credit_counter_in)
begin
	if (fake_credit = '0' and read_en_out = '0' and fake_credit_counter <= 0 and fake_credit_counter_in /= fake_credit_counter) then
		 err_not_fake_credit_not_read_en_fake_credit_counter_zero_fake_credit_counter_in_not_change <= '1';
	else
		 err_not_fake_credit_not_read_en_fake_credit_counter_zero_fake_credit_counter_in_not_change <= '0';
	end if;
end process;

process (fake_credit, read_en_out, credit_out)
begin
	if ((fake_credit = '1' or read_en_out ='1') and credit_out = '0') then
		 err_fake_credit_read_en_credit_out <= '1';
	else
		 err_fake_credit_read_en_credit_out <= '0';
	end if;
end process;

process (fake_credit, read_en_out, fake_credit_counter, credit_out)
begin
	if (fake_credit = '0' and read_en_out = '0' and fake_credit_counter > 0 and credit_out = '0') then
		 err_not_fake_credit_not_read_en_fake_credit_counter_not_zero_credit_out <= '1';
	else
		 err_not_fake_credit_not_read_en_fake_credit_counter_not_zero_credit_out <= '0';
	end if;
end process;

process (fake_credit, read_en_out, fake_credit_counter, credit_out)
begin
	if (fake_credit = '0' and read_en_out = '0' and fake_credit_counter <= 0 and credit_out = '1') then
		 err_not_fake_credit_not_read_en_fake_credit_counter_zero_not_credit_out <= '1';
	else
		 err_not_fake_credit_not_read_en_fake_credit_counter_zero_not_credit_out <= '0';
	end if;
end process;

--------------------------------------------------------------------------------------------------

-- Idle state

-- fault_out = '0'
--------------------------------------------------------------------------------------------------

process (state_out, fault_out, valid_in, state_in)
begin
	if (state_out = Idle and fault_out = '0' and valid_in = '1' and state_in /= Header_flit) then
		 err_state_out_Idle_not_fault_out_valid_in_state_in_Header_flit <= '1';
	else
		 err_state_out_Idle_not_fault_out_valid_in_state_in_Header_flit <= '0';
	end if;
end process;

process (state_out, fault_out, valid_in, state_in, state_out)
begin
	if (state_out = Idle and fault_out = '0' and valid_in = '0' and state_in /= state_out) then
		 err_state_out_Idle_not_fault_out_valid_in_state_in_not_change <= '1';
	else
		 err_state_out_Idle_not_fault_out_valid_in_state_in_not_change <= '0';
	end if;
end process;

process (state_out, fault_out, fake_credit)
begin
	if (state_out = Idle and fault_out = '0' and fake_credit = '1') then
		 err_state_out_Idle_not_fault_out_not_fake_credit <= '1';
	else
		 err_state_out_Idle_not_fault_out_not_fake_credit <= '0';
	end if;
end process;

process (state_out, fault_out, fault_info_in)
begin
	if (state_out = Idle and fault_out = '0' and fault_info_in = '1') then
		 err_state_out_Idle_not_fault_out_not_fault_info_in <= '1';
	else
		 err_state_out_Idle_not_fault_out_not_fault_info_in <= '0';
	end if;
end process;

process (state_out, fault_out, faulty_packet_in, faulty_packet_out)
begin
	if (state_out = Idle and fault_out = '0' and faulty_packet_in /= faulty_packet_out) then
		 err_state_out_Idle_not_fault_out_faulty_packet_in_faulty_packet_out_equal <= '1';
	else
		 err_state_out_Idle_not_fault_out_faulty_packet_in_faulty_packet_out_equal <= '0';
	end if;
end process;


-- fault_out = '1'
--------------------------------------------------------------------------------------------------

process (state_out, fault_out, fake_credit)
begin
	if (state_out = Idle and fault_out = '1' and fake_credit = '0') then
		 err_state_out_Idle_fault_out_fake_credit <= '1';
	else
		 err_state_out_Idle_fault_out_fake_credit <= '0';
	end if;
end process;

process (state_out, fault_out, state_in)
begin
	if (state_out = Idle and fault_out = '1' and state_in /= Packet_drop) then
		 err_state_out_Idle_fault_out_state_in_Packet_drop <= '1';
	else
		 err_state_out_Idle_fault_out_state_in_Packet_drop <= '0';
	end if;
end process;

process (state_out, fault_out, fault_info_in)
begin
	if (state_out = Idle and fault_out = '1' and fault_info_in = '0') then
		 err_state_out_Idle_fault_out_fault_info_in <= '1';
	else
		 err_state_out_Idle_fault_out_fault_info_in <= '0';
	end if;
end process;

process (state_out, fault_out, faulty_packet_in)
begin
	if (state_out = Idle and fault_out = '1' and faulty_packet_in /= '1') then
		 err_state_out_Idle_fault_out_faulty_packet_in <= '1';
	else
		 err_state_out_Idle_fault_out_faulty_packet_in <= '0';
	end if;
end process;

process (state_out, write_fake_flit)
begin
	if (state_out = Idle and write_fake_flit = '1') then
		 err_state_out_Idle_not_write_fake_flit <= '1';
	else
		 err_state_out_Idle_not_write_fake_flit <= '0';
	end if;
end process;


-- Other properties for Idle state
--------------------------------------------------------------------------------------------------

process (state_out, health_info)
begin
	if ( (state_out = Idle or state_out = Header_flit or state_out = Tail_flit or state_out = Packet_drop) and health_info = '1') then
		 err_state_out_Idle_not_health_info <= '1';
	else
		 err_state_out_Idle_not_health_info <= '0';
	end if;
end process;


--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

-- Header_flit state

-- fault_out = '0'
--------------------------------------------------------------------------------------------------

process (state_out, valid_in, fault_out, flit_type, state_in)
begin 
	if (state_out = Header_flit and valid_in = '1' and fault_out = '0' and flit_type = "010" and state_in /= Body_flit) then
		err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Body_state_in_Body_flit <= '1';
	else
		err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Body_state_in_Body_flit <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, flit_type, state_in)
begin 
	if (state_out = Header_flit and valid_in = '1' and fault_out = '0' and flit_type = "100" and state_in /= Tail_flit) then
		err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Tail_state_in_Tail_flit <= '1';
	else
		err_state_out_Header_flit_valid_in_not_fault_out_flit_type_Tail_state_in_Tail_flit <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, write_fake_flit)
begin 
	if (state_out = Header_flit and valid_in = '1' and fault_out = '0' and write_fake_flit = '1') then
		err_state_out_Header_flit_valid_in_not_fault_out_not_write_fake_flit <= '1';
	else
		err_state_out_Header_flit_valid_in_not_fault_out_not_write_fake_flit <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, fault_info_in)
begin 
	if (state_out = Header_flit and valid_in = '1' and fault_out = '0' and fault_info_in = '1') then
		err_state_out_Header_flit_valid_in_not_fault_out_not_fault_info_in <= '1';
	else
		err_state_out_Header_flit_valid_in_not_fault_out_not_fault_info_in <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, faulty_packet_in, faulty_packet_out)
begin 
	if (state_out = Header_flit and valid_in = '1' and fault_out = '0' and faulty_packet_in /= faulty_packet_out) then
		err_state_out_Header_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change <= '1';
	else
		err_state_out_Header_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change <= '0';
	end if;
end process;


-- fault_out = '1'
--------------------------------------------------------------------------------------------------

process (state_out, valid_in, fault_out, write_fake_flit)
begin 
	if (state_out = Header_flit and valid_in = '1' and fault_out = '1' and write_fake_flit = '0') then
		err_state_out_Header_flit_valid_in_fault_out_write_fake_flit <= '1';
	else
		err_state_out_Header_flit_valid_in_fault_out_write_fake_flit <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, state_in)
begin 
	if (state_out = Header_flit and valid_in = '1' and fault_out = '1' and state_in /= Packet_drop) then
		err_state_out_Header_flit_valid_in_fault_out_state_in_Packet_drop <= '1';
	else
		err_state_out_Header_flit_valid_in_fault_out_state_in_Packet_drop <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, fault_info_in)
begin 
	if (state_out = Header_flit and valid_in = '1' and fault_out = '1' and fault_info_in = '0') then
		err_state_out_Header_flit_valid_in_fault_out_fault_info_in <= '1';
	else
		err_state_out_Header_flit_valid_in_fault_out_fault_info_in <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, faulty_packet_in)
begin 
	if (state_out = Header_flit and valid_in = '1' and fault_out = '1' and faulty_packet_in /= '1') then
		err_state_out_Header_flit_valid_in_fault_out_faulty_packet_in <= '1';
	else
		err_state_out_Header_flit_valid_in_fault_out_faulty_packet_in <= '0';
	end if;
end process;

process (state_out, valid_in, state_in, state_out)
begin 
	if (state_out = Header_flit and valid_in = '0' and state_in /= state_out) then
		err_state_out_Header_flit_not_valid_in_state_in_state_out_not_change <= '1';
	else
		err_state_out_Header_flit_not_valid_in_state_in_state_out_not_change <= '0';
	end if;
end process;

process (state_out, valid_in, faulty_packet_in, faulty_packet_out)
begin 
	if (state_out = Header_flit and valid_in = '0' and faulty_packet_in /= faulty_packet_out) then
		err_state_out_Header_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change <= '1';
	else
		err_state_out_Header_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change <= '0';
	end if;
end process;

process (state_out, valid_in, fault_info_in)
begin 
	if (state_out = Header_flit and valid_in = '0' and fault_info_in = '1') then
		err_state_out_Header_flit_not_valid_in_not_fault_info_in <= '1';
	else
		err_state_out_Header_flit_not_valid_in_not_fault_info_in <= '0';
	end if;
end process;

process (state_out, valid_in, write_fake_flit)
begin 
	if (state_out = Header_flit and valid_in = '0' and write_fake_flit = '1') then
		err_state_out_Header_flit_not_valid_in_not_write_fake_flit <= '1';
	else
		err_state_out_Header_flit_not_valid_in_not_write_fake_flit <= '0';
	end if;
end process;

process (state_out, fake_credit)
begin 
	if ( (state_out = Header_flit or state_out = Body_flit) and fake_credit /= '0') then
		err_state_out_Header_flit_or_Body_flit_not_fake_credit <= '1';
	else
		err_state_out_Header_flit_or_Body_flit_not_fake_credit <= '0';
	end if;
end process;

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------


-- Body_flit state

-- fault_out = '0'
--------------------------------------------------------------------------------------------------

process (state_out, valid_in, fault_out, flit_type, state_in, state_out)
begin 
	if (state_out = Body_flit and valid_in = '1' and fault_out = '0' and flit_type = "010" and state_in /= state_out) then
		err_state_out_Body_flit_valid_in_not_fault_out_state_in_state_out_not_change <= '1';
	else
		err_state_out_Body_flit_valid_in_not_fault_out_state_in_state_out_not_change <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, flit_type, state_in)
begin 
	if (state_out = Body_flit and valid_in = '1' and fault_out = '0' and flit_type = "100" and state_in /= Tail_flit) then
		err_state_out_Body_flit_valid_in_not_fault_out_state_in_Tail_flit <= '1';
	else
		err_state_out_Body_flit_valid_in_not_fault_out_state_in_Tail_flit <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, flit_type, health_info)
begin 
	if (state_out = Body_flit and valid_in = '1' and fault_out = '0' and flit_type = "100" and health_info = '0') then
		err_state_out_Body_flit_valid_in_not_fault_out_health_info <= '1';
	else
		err_state_out_Body_flit_valid_in_not_fault_out_health_info <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, flit_type, health_info)
begin 
	if (state_out = Body_flit and valid_in = '1' and fault_out = '0' and flit_type /= "100" and health_info = '1') then
		err_state_out_Body_flit_valid_in_not_fault_out_flit_type_not_tail_not_health_info <= '1';
	else
		err_state_out_Body_flit_valid_in_not_fault_out_flit_type_not_tail_not_health_info <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, health_info)
begin 
	if (state_out = Body_flit and valid_in = '1' and fault_out = '1' and health_info = '1') then
		err_state_out_Body_flit_valid_in_fault_out_not_health_info <= '1';
	else
		err_state_out_Body_flit_valid_in_fault_out_not_health_info <= '0';
	end if;
end process;

process (state_out, valid_in, health_info)
begin 
	if (state_out = Body_flit and valid_in = '0' and health_info = '1') then
		err_state_out_Body_flit_valid_in_not_health_info <= '1';
	else
		err_state_out_Body_flit_valid_in_not_health_info <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, write_fake_flit)
begin 
	if (state_out = Body_flit and valid_in = '1' and fault_out = '0' and write_fake_flit = '1') then
		err_state_out_Body_flit_valid_in_not_fault_out_not_write_fake_flit <= '1';
	else
		err_state_out_Body_flit_valid_in_not_fault_out_not_write_fake_flit <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, fault_info_in)
begin 
	if (state_out = Body_flit and valid_in = '1' and fault_out = '0' and fault_info_in = '1') then
		err_state_out_Body_flit_valid_in_not_fault_out_fault_info_in <= '1';
	else
		err_state_out_Body_flit_valid_in_not_fault_out_fault_info_in <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, faulty_packet_in, faulty_packet_out)
begin 
	if (state_out = Body_flit and valid_in = '1' and fault_out = '0' and faulty_packet_in /= faulty_packet_out) then
		err_state_out_Body_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change <= '1';
	else
		err_state_out_Body_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change <= '0';
	end if;
end process;


-- fault_out = '1'
--------------------------------------------------------------------------------------------------

process (state_out, valid_in, fault_out, write_fake_flit)
begin 
	if (state_out = Body_flit and valid_in = '1' and fault_out = '1' and write_fake_flit = '0') then
		err_state_out_Body_flit_valid_in_fault_out_write_fake_flit <= '1';
	else
		err_state_out_Body_flit_valid_in_fault_out_write_fake_flit <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, state_in)
begin 
	if (state_out = Body_flit and valid_in = '1' and fault_out = '1' and state_in /= Packet_drop) then
		err_state_out_Body_flit_valid_in_fault_out_state_in_Packet_drop <= '1';
	else
		err_state_out_Body_flit_valid_in_fault_out_state_in_Packet_drop <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, fault_info_in)
begin 
	if (state_out = Body_flit and valid_in = '1' and fault_out = '1' and fault_info_in = '0') then
		err_state_out_Body_flit_valid_in_fault_out_fault_info_in <= '1';
	else
		err_state_out_Body_flit_valid_in_fault_out_fault_info_in <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, faulty_packet_in)
begin 
	if (state_out = Body_flit and valid_in = '1' and fault_out = '1' and faulty_packet_in /= '1') then
		err_state_out_Body_flit_valid_in_fault_out_faulty_packet_in <= '1';
	else
		err_state_out_Body_flit_valid_in_fault_out_faulty_packet_in <= '0';
	end if;
end process;

process (state_out, valid_in, state_in)
begin 
	if (state_out = Body_flit and valid_in = '0' and state_in /= state_out) then
		err_state_out_Body_flit_not_valid_in_state_in_state_out_not_change <= '1';
	else
		err_state_out_Body_flit_not_valid_in_state_in_state_out_not_change <= '0';
	end if;
end process;

process (state_out, valid_in, faulty_packet_in, faulty_packet_out)
begin 
	if (state_out = Body_flit and valid_in = '0' and faulty_packet_in /= faulty_packet_out) then
		err_state_out_Body_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change <= '1';
	else
		err_state_out_Body_flit_not_valid_in_faulty_packet_in_faulty_packet_out_not_change <= '0';
	end if;
end process;

process (state_out, valid_in, fault_info_in)
begin 
	if (state_out = Body_flit and valid_in = '0' and fault_info_in = '1') then
		err_state_out_Body_flit_not_valid_in_not_fault_info_in <= '1';
	else
		err_state_out_Body_flit_not_valid_in_not_fault_info_in <= '0';
	end if;
end process;

process (state_out, fake_credit)
begin 
	if (state_out = Body_flit and fake_credit = '1') then
		err_state_out_Body_flit_not_fake_credit <= '1';
	else
		err_state_out_Body_flit_not_fake_credit <= '0';
	end if;
end process;

process (state_out, valid_in, write_fake_flit)
begin 
	if (state_out = Body_flit and valid_in = '0' and write_fake_flit = '1') then
		err_state_out_Body_flit_not_valid_in_not_write_fake_flit <= '1';
	else
		err_state_out_Body_flit_not_valid_in_not_write_fake_flit <= '0';
	end if;
end process;


--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

-- Tail_flit state

-- fault_out = '0'
--------------------------------------------------------------------------------------------------

process (state_out, valid_in, fault_out, flit_type, state_in)
begin 
	if (state_out = Tail_flit and valid_in = '1' and fault_out = '0' and flit_type = "001" and state_in /= Header_flit) then
		err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_Header_state_in_Header_flit <= '1';
	else
		err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_Header_state_in_Header_flit <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, fake_credit)
begin 
	if (state_out = Tail_flit and valid_in = '1' and fault_out = '0' and fake_credit = '1') then
		err_state_out_Tail_flit_valid_in_not_fault_out_not_fake_credit <= '1';
	else
		err_state_out_Tail_flit_valid_in_not_fault_out_not_fake_credit <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, fault_info_in)
begin 
	if (state_out = Tail_flit and valid_in = '1' and fault_out = '0' and fault_info_in = '1') then
		err_state_out_Tail_flit_valid_in_not_fault_out_not_fault_info_in <= '1';
	else
		err_state_out_Tail_flit_valid_in_not_fault_out_not_fault_info_in <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, faulty_packet_in, faulty_packet_out)
begin 
	if (state_out = Tail_flit and valid_in = '1' and fault_out = '0' and faulty_packet_in /= faulty_packet_out) then
		err_state_out_Tail_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change <= '1';
	else
		err_state_out_Tail_flit_valid_in_not_fault_out_faulty_packet_in_faulty_packet_out_not_change <= '0';
	end if;
end process;


-- fault_out = '1'
--------------------------------------------------------------------------------------------------


process (state_out, valid_in, fault_out, fake_credit)
begin 
	if (state_out = Tail_flit and valid_in = '1' and fault_out = '1' and fake_credit /= '1') then
		err_state_out_Tail_flit_valid_in_fault_out_fake_credit <= '1';
	else
		err_state_out_Tail_flit_valid_in_fault_out_fake_credit <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, state_in)
begin 
	if (state_out = Tail_flit and valid_in = '1' and fault_out = '1' and state_in /= Packet_drop) then
		err_state_out_Tail_flit_valid_in_fault_out_state_in_Packet_drop <= '1';
	else
		err_state_out_Tail_flit_valid_in_fault_out_state_in_Packet_drop <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, fault_info_in)
begin 
	if (state_out = Tail_flit and valid_in = '1' and fault_out = '1' and fault_info_in = '0') then
		err_state_out_Tail_flit_valid_in_fault_out_fault_info_in <= '1';
	else
		err_state_out_Tail_flit_valid_in_fault_out_fault_info_in <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, faulty_packet_in)
begin 
	if (state_out = Tail_flit and valid_in = '1' and fault_out = '1' and faulty_packet_in /= '1') then
		err_state_out_Tail_flit_valid_in_fault_out_faulty_packet_in <= '1';
	else
		err_state_out_Tail_flit_valid_in_fault_out_faulty_packet_in <= '0';
	end if;
end process;

process (state_out, valid_in, state_in)
begin 
	if (state_out = Tail_flit and valid_in = '0' and state_in /= Idle) then
		err_state_out_Tail_flit_not_valid_in_state_in_Idle <= '1';
	else
		err_state_out_Tail_flit_not_valid_in_state_in_Idle <= '0';
	end if;
end process;

process (state_out, valid_in, faulty_packet_in, faulty_packet_out)
begin 
	if (state_out = Tail_flit and valid_in = '0' and faulty_packet_in /= faulty_packet_out) then
		err_state_out_Tail_flit_not_valid_in_faulty_packet_in_faulty_packet_in_not_change <= '1';
	else
		err_state_out_Tail_flit_not_valid_in_faulty_packet_in_faulty_packet_in_not_change <= '0';
	end if;
end process;

process (state_out, valid_in, fault_info_in)
begin 
	if (state_out = Tail_flit and valid_in = '0' and fault_info_in = '1') then
		err_state_out_Tail_flit_not_valid_in_not_fault_info_in <= '1';
	else
		err_state_out_Tail_flit_not_valid_in_not_fault_info_in <= '0';
	end if;
end process;

process (state_out, valid_in, fake_credit)
begin 
	if (state_out = Tail_flit and valid_in = '0' and fake_credit /= '0') then
		err_state_out_Tail_flit_not_valid_in_not_fake_credit <= '1';
	else
		err_state_out_Tail_flit_not_valid_in_not_fake_credit <= '0';
	end if;
end process;

process (state_out, write_fake_flit)
begin 
	if (state_out = Tail_flit and write_fake_flit = '1') then
		err_state_out_Tail_flit_not_write_fake_flit <= '1';
	else
		err_state_out_Tail_flit_not_write_fake_flit <= '0';
	end if;
end process;



--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------


-- Packet_drop state

-- faulty_packet_out = '1'
--------------------------------------------------------------------------------------------------

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, fake_credit)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '1' and flit_type = "001" and fault_out = '0' and fake_credit /= '0') then
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_not_fake_credit <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_not_fake_credit <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, faulty_packet_in)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '1' and flit_type = "001" and fault_out = '0' and faulty_packet_in /= '0') then
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_not_faulty_packet_in <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_not_faulty_packet_in <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, state_in)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '1' and flit_type = "001" and fault_out = '0' and state_in /= Header_flit) then
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_state_in_Header_flit <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_state_in_Header_flit <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, write_fake_flit)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '1' and flit_type = "001" and fault_out = '0' and write_fake_flit = '0') then
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_write_fake_flit <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_out_write_fake_flit <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, state_in, state_out)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '1' and flit_type = "001" and fault_out = '1' and state_in /= state_out) then
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_fault_out_state_in_state_out_not_change <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_fault_out_state_in_state_out_not_change <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, faulty_packet_in)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '1' and flit_type = "100" and fault_out = '0' and faulty_packet_in /= '0') then
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_not_faulty_packet_in <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_not_faulty_packet_in <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, state_in, state_out)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '1' and flit_type = "100" and fault_out = '1' and state_in /= state_out) then
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_fault_out_state_in_state_out_not_change <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_fault_out_state_in_state_out_not_change <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, state_in)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '1' and flit_type = "100" and fault_out = '0' and state_in /= Idle) then
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_not_state_in_Idle <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_not_state_in_Idle <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, fake_credit)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '1' and flit_type = "100" and fault_out = '0' and fake_credit = '0') then
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_fake_credit <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Tail_not_fault_out_fake_credit <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, fake_credit)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '1' and ((flit_type /= "001" and flit_type /= "100") or fault_out = '1') and fake_credit = '0') then
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_invalid_fault_out_fake_credit <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_invalid_fault_out_fake_credit <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, faulty_packet_in, faulty_packet_out)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and ( valid_in = '0' or (flit_type /= "001" and flit_type /= "100") or fault_out = '1' ) and faulty_packet_in /= faulty_packet_out) then
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_flit_type_body_or_invalid_fault_out_faulty_packet_in_faulty_packet_out_not_change <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_flit_type_body_or_invalid_fault_out_faulty_packet_in_faulty_packet_out_not_change <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, state_in, state_out)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and ((flit_type /= "001" and flit_type /= "100") or fault_out = '1') and state_in /= state_out) then
		err_state_out_Packet_drop_faulty_packet_out_flit_type_invalid_fault_out_state_in_state_out_not_change <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_flit_type_invalid_fault_out_state_in_state_out_not_change <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, faulty_packet_in, faulty_packet_out)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '0' and faulty_packet_in /= faulty_packet_out) then
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_faulty_packet_in_faulty_packet_out_equal <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_faulty_packet_in_faulty_packet_out_equal <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, state_in, state_out)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '0' and state_in /= state_out) then
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_state_in_state_out_not_change <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_state_in_state_out_not_change <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, write_fake_flit)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '0' and write_fake_flit = '1') then
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_not_write_fake_flit <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_not_write_fake_flit <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, fake_credit)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '0' and fake_credit = '1') then
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_not_fake_credit <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_not_fake_credit <= '0';
	end if;
end process;

-- faulty_packet_out = '0'
--------------------------------------------------------------------------------------------------

process (state_out, faulty_packet_out, state_in, state_out)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '0' and state_in /= state_out) then
		err_state_out_Packet_drop_not_faulty_packet_out_state_in_state_out_not_change <= '1';
	else
		err_state_out_Packet_drop_not_faulty_packet_out_state_in_state_out_not_change <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, faulty_packet_in, faulty_packet_out)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '0' and faulty_packet_in /= faulty_packet_out) then
		err_state_out_Packet_drop_not_faulty_packet_out_faulty_packet_in_faulty_packet_out_not_change <= '1';
	else
		err_state_out_Packet_drop_not_faulty_packet_out_faulty_packet_in_faulty_packet_out_not_change <= '0';
	end if;
end process;

process (state_out, fault_info_in)
begin 
	if (state_out = Packet_drop and fault_info_in = '1') then
		err_state_out_Packet_drop_not_fault_info_in <= '1';
	else
		err_state_out_Packet_drop_not_fault_info_in <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, fake_credit)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '0' and fake_credit = '1') then
		err_state_out_Packet_drop_not_faulty_packet_out_not_fake_credit <= '1';
	else
		err_state_out_Packet_drop_not_faulty_packet_out_not_fake_credit <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, write_fake_flit)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and (valid_in = '0' or flit_type /= "001" or fault_out = '1') and write_fake_flit = '1') then
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_or_fault_out_not_write_fake_flit <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_header_or_fault_out_not_write_fake_flit <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, write_fake_flit)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '0' and write_fake_flit = '1') then
		err_state_out_Packet_drop_not_faulty_packet_out_not_write_fake_flit <= '1';
	else
		err_state_out_Packet_drop_not_faulty_packet_out_not_write_fake_flit <= '0';
	end if;
end process;

process (fault_info, fault_info_out)
begin 
	if (fault_info /= fault_info_out) then
		err_fault_info_fault_info_out_equal <= '1';
	else
		err_fault_info_fault_info_out_equal <= '0';
	end if;
end process;

process (state_out, valid_in, state_in, state_out)
begin 
	if (state_out = Packet_drop and valid_in = '0' and state_in /= state_out) then
		err_state_out_Packet_drop_not_valid_in_state_in_state_out_equal <= '1';
	else
		err_state_out_Packet_drop_not_valid_in_state_in_state_out_equal <= '0';
	end if;
end process;

process (state_out, valid_in, fault_out, flit_type, state_in, state_out)
begin 
	if (state_out = Tail_flit and valid_in = '1' and fault_out = '0' and flit_type /= "001" and state_in /= state_out) then
		err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_not_Header_state_in_state_out_equal <= '1';
	else
		err_state_out_Tail_flit_valid_in_not_fault_out_flit_type_not_Header_state_in_state_out_equal <= '0';
	end if;
end process;

-- Added after change of design !

process (state_out, faulty_packet_out, valid_in, flit_type, fault_info_in)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and valid_in = '1' and flit_type = "001" and fault_info_in /= '1') then
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_info_in <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_valid_in_flit_type_Header_not_fault_info_in <= '0';
	end if;
end process;

process (state_out, faulty_packet_out, valid_in, flit_type, fault_out, fault_info_in)
begin 
	if (state_out = Packet_drop and faulty_packet_out = '1' and (valid_in = '0' or flit_type /= "001") and fault_info_in /= '0') then
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_Header_not_not_fault_info_in <= '1';
	else
		err_state_out_Packet_drop_faulty_packet_out_not_valid_in_or_flit_type_not_Header_not_not_fault_info_in <= '0';
	end if;
end process;


end behavior;