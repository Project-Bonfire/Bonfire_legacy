library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity FIFO_control_part_checkers is
    port (  DRTS: in std_logic;
            CTS_in: in std_logic;
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            read_pointer: in std_logic_vector(3 downto 0);
            read_pointer_in: in std_logic_vector(3 downto 0);
            write_pointer: in std_logic_vector(3 downto 0); 
            write_pointer_in: in std_logic_vector(3 downto 0); 
            empty_out: in std_logic;
            full_out: in std_logic;
            read_en_out: in std_logic;
            write_en_out: in std_logic;            

            -- Checker outputs
            err_FIFO_control_part_DRTS_CTS, err_FIFO_read_pointer_update, err_FIFO_write_pointer_update: out std_logic;
            err_FIFO_read_pointer_not_update, err_FIFO_write_pointer_not_update: out std_logic;
            err_FIFO_full_empty, err_FIFO_empty, err_FIFO_full: out std_logic;
            err_FIFO_read_pointer_onehot, err_FIFO_write_pointer_onehot: out std_logic
            );
end FIFO_control_part_checkers;

architecture behavior of FIFO_control_part_checkers is

begin 

-- Checkers

-- When FIFO has not received a request, It can not send Clear to Send (When DRTS=0, CTS must be 0)!
process(DRTS, CTS_in) begin
	if (DRTS = '0' and CTS_in = '1') then
		err_FIFO_control_part_DRTS_CTS <= '1';
	else
		err_FIFO_control_part_DRTS_CTS <= '0';
	end if;
end process;

-- If there is a request for reading from the FIFO (one of the read_en signals is active) and the FIFO is not empty, read pointer must be updated!
process(read_en_N, read_en_E, read_en_W, read_en_S, read_en_L, read_en_out, empty_out, read_pointer, read_pointer_in) begin
	if ( (read_en_N = '1' or read_en_E = '1' or read_en_W = '1' or read_en_S = '1' or read_en_L = '1' or read_en_out = '1') and (empty_out = '0') and (read_pointer_in = read_pointer)) then
		err_FIFO_read_pointer_update <= '1';
	else 
		err_FIFO_read_pointer_update <= '0';
	end if;
end process;

-- If there is no request for reading from the FIFO or the FIFO is empty, read pointer must not be updated (it must remain the previous value)!
process(read_en_N, read_en_E, read_en_W, read_en_S, read_en_L, read_en_out, empty_out, read_pointer, read_pointer_in) begin
	if ( ((read_en_N = '1' and read_en_E = '1' and read_en_W = '1' and read_en_S = '1' and read_en_L = '1' and read_en_out = '1') or (empty_out = '1')) and (read_pointer_in /= read_pointer)) then
		err_FIFO_read_pointer_not_update <= '1';
	else 
		err_FIFO_read_pointer_not_update <= '0';
	end if;
end process;

-- If there is a request for writing to the FIFO and the FIFO is not full, write pointer must be updated!
process(write_en_out, full_out, write_pointer, write_pointer_in) begin
	if ( (write_en_out = '1') and (full_out = '0') and (write_pointer_in = write_pointer)) then
		err_FIFO_write_pointer_update <= '1';
	else 
		err_FIFO_write_pointer_update <= '0';
	end if;
end process;

-- If there is no request for writing to the FIFO or the FIFO is full, write pointer must not be updated (it must remain the previous value)!
process(write_en_out, full_out, write_pointer, write_pointer_in) begin
	if ( ((write_en_out = '0') or (full_out = '1')) and (write_pointer_in /= write_pointer)) then
		err_FIFO_write_pointer_not_update <= '1';
	else 
		err_FIFO_write_pointer_not_update <= '0';
	end if;
end process;

-- The FIFO cannot be full and empty at the same time
process(full_out, empty_out) begin
	if (full_out = '1' and  empty_out = '1') then
		err_FIFO_full_empty <= '1';
	else
		err_FIFO_full_empty <= '0';
	end if;
end process;

-- if read_pointer and write_pointer are pointing to the same location, empty must be high (active) !
process(read_pointer, write_pointer, empty_out) begin
	if ((read_pointer = write_pointer) and empty_out = '0') then
		err_FIFO_empty <= '1';
	else
		err_FIFO_empty <= '0';
	end if;
end process;

-- if read_pointer is pointing to one location after write_pointer (in a circular manner), full must be high (active) !
process(read_pointer, write_pointer, full_out) begin
	if ( (write_pointer = read_pointer - 1) and full_out = '0') then
		err_FIFO_full <= '1';
	else
		err_FIFO_full <= '0';
	end if;
end process;

process(read_pointer, read_pointer_in) begin
	if ((read_pointer /= "0001" and read_pointer /= "0010" and read_pointer /= "0100" and read_pointer /= "1000") or (read_pointer_in /= "0001" and read_pointer_in /= "0010" and read_pointer_in /= "0100" and read_pointer_in /= "1000")) then
		err_FIFO_read_pointer_onehot <= '1';
	else
		err_FIFO_read_pointer_onehot <= '0';
	end if;
end process;

process(write_pointer, write_pointer_in) begin
	if ((write_pointer /= "0001" and write_pointer /= "0010" and write_pointer /= "0100" and write_pointer /= "1000")or (write_pointer_in /= "0001" and write_pointer_in /= "0010" and write_pointer_in /= "0100" and write_pointer_in /= "1000")) then
		err_FIFO_write_pointer_onehot <= '1';
	else
		err_FIFO_write_pointer_onehot <= '0';
	end if;
end process;


end behavior;