library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity FIFO_control_part_checkers is
    port (  DRTS: in std_logic;
    		CTS_out: in std_logic;
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
            -- FIFO Control Part with dominant checkers and the ones that give in total 100% CEI and FC
            err_FIFO_control_part_DRTS_CTS: out std_logic; 
            err_FIFO_write_pointer_update: out std_logic;
            err_FIFO_read_pointer_not_update: out std_logic; 
            err_FIFO_write_pointer_not_update: out std_logic;
            err_FIFO_full_empty: out std_logic;
            err_FIFO_empty: out std_logic; 
            err_FIFO_empty1: out std_logic;
            err_FIFO_full: out std_logic;
            err_FIFO_read_pointer_onehot: out std_logic; 
            err_FIFO_write_pointer_onehot: out std_logic;
             err_FIFO_read_en_onehot: out std_logic; 
            err_FIFO_read_from_empty_FIFO: out std_logic; 
            err_FIFO_write_to_full_FIFO: out std_logic;
            err_FIFO_control_part_CTS_in_CTS_out: out std_logic;
            err_FIFO_read_en_empty: out std_logic
            );

end FIFO_control_part_checkers;

architecture behavior of FIFO_control_part_checkers is

signal read_en_signals: std_logic_vector(4 downto 0);

begin 

-- Checkers


-- When FIFO has not received a request, It can not send Clear to Send (When DRTS=0, CTS must be 0)!
process(DRTS, CTS_out, full_out, CTS_in) begin
	if ( ((DRTS = '0' or CTS_out = '1' or full_out ='1') and CTS_in = '1') ) then
		err_FIFO_control_part_DRTS_CTS <= '1';
	else
		err_FIFO_control_part_DRTS_CTS <= '0';
	end if;
end process;

-- If there is a request to FIFO for writing and CTS_out is zero and the FIFO is not full, CTS_in must also be zero!
process(CTS_out, DRTS, full_out, CTS_in) begin
	if (CTS_out = '0' and DRTS = '1' and full_out ='0' and CTS_in = '0') then
		err_FIFO_control_part_CTS_in_CTS_out <= '1';
	else
		err_FIFO_control_part_CTS_in_CTS_out <= '0';
	end if;
end process;

read_en_signals <= read_en_N & read_en_E & read_en_W & read_en_S & read_en_L;

-- Read_en from Arbiters can either be all zeros or must be one-hot!
process(read_en_out, empty_out, read_en_signals) begin
	if ( (read_en_out = '1' and empty_out = '0' and read_en_signals /= "10000" and read_en_signals /= "01000" and read_en_signals /= "00100" and read_en_signals /= "00010" and read_en_signals /= "00001") or (read_en_out = '0' and empty_out = '0' and read_en_signals /="00000" ) ) then
		err_FIFO_read_en_onehot <= '1';
	else 
		err_FIFO_read_en_onehot <= '0';
	end if;
end process;

process(read_en_signals, empty_out, read_en_out) begin
	if ( (read_en_signals = "00000" or empty_out = '1') and read_en_out = '1' ) then
		err_FIFO_read_en_empty <= '1';
	else 
		err_FIFO_read_en_empty <= '0';
	end if;
end process;

-- If there is no request for reading from the FIFO or the FIFO is empty, read pointer must not be updated (it must remain the previous value)!
process(read_en_out, empty_out, read_pointer, read_pointer_in) begin
	if ( ((read_en_out = '0') or (empty_out = '1')) and (read_pointer_in /= read_pointer)) then
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
process(DRTS, full_out, empty_out) begin
	if (DRTS = '1' and full_out = '1' and  empty_out = '1') then
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

process(read_pointer, write_pointer, empty_out) begin
	if ((read_pointer /= write_pointer) and empty_out = '1') then
		err_FIFO_empty1 <= '1';
	else
		err_FIFO_empty1 <= '0';
	end if;
end process;

-- if read_pointer is pointing to one location after write_pointer (in a circular manner), full must be high (active) !
process(read_pointer, read_pointer_in, write_pointer, write_pointer_in, full_out) begin
	if ((write_pointer = read_pointer(0)&read_pointer(3 downto 1) ) and full_out = '0') then
		err_FIFO_full <= '1';
	else
		err_FIFO_full <= '0';
	end if;
end process;

-- Reading from an empty FIFO is not possible!
process(read_en_out, empty_out) begin
	if (read_en_out = '1' and empty_out = '1') then
		err_FIFO_read_from_empty_FIFO <= '1';
	else
		err_FIFO_read_from_empty_FIFO <= '0';
	end if;
end process;

-- Writing to a full FIFO is not possible!
process(write_en_out, full_out) begin
	if (write_en_out = '1' and full_out = '1') then
		err_FIFO_write_to_full_FIFO <= '1';
	else
		err_FIFO_write_to_full_FIFO <= '0';
	end if;
end process;

process(read_pointer, read_pointer_in) begin
	if ((read_pointer /= "00001" and read_pointer /= "00010" and read_pointer /= "00100" and read_pointer /= "01000" and read_pointer /= "10000") or (read_pointer_in /= "00001" and read_pointer_in /= "00010" and read_pointer_in /= "00100" and read_pointer_in /= "01000" and read_pointer_in /= "10000")) then
		err_FIFO_read_pointer_onehot <= '1';
	else
		err_FIFO_read_pointer_onehot <= '0';
	end if;
end process;

process(write_pointer, write_pointer_in) begin
	if ((write_pointer /= "00001" and write_pointer /= "00010" and write_pointer /= "00100" and write_pointer /= "01000" and write_pointer /= "10000")or (write_pointer_in /= "00001" and write_pointer_in /= "00010" and write_pointer_in /= "00100" and write_pointer_in /= "01000" and write_pointer_in /= "10000")) then
		err_FIFO_write_pointer_onehot <= '1';
	else
		err_FIFO_write_pointer_onehot <= '0';
	end if;
end process;


end behavior;