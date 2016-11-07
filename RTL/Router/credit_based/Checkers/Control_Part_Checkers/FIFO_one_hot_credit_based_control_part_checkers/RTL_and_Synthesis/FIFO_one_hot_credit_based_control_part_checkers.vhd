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
 
            -- Checker outputs
			err_write_en_write_pointer, 
			err_not_write_en_write_pointer, 
			err_read_pointer_write_pointer_not_empty, 
			err_read_pointer_write_pointer_empty, 
			err_read_pointer_write_pointer_not_full, 
			err_read_pointer_write_pointer_full, 
			err_read_pointer_increment, 
			err_read_pointer_not_increment, 
			err_read_en_credit_out, 
			err_not_read_en_credit_out, 
			err_write_en, 
			err_not_write_en, 
			err_read_en_mismatch : out std_logic
            );

end FIFO_credit_based_control_part_checkers;

architecture behavior of FIFO_credit_based_control_part_checkers is

signal read_en_signal: std_logic;

begin 

read_en_signal <= (read_en_N or read_en_E or read_en_W or read_en_S or read_en_L) and not empty_out;

-- Checkers

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
	if ( (read_en_out = '0' or (read_en_out = '1' and empty_out = '1') ) and read_pointer_in /= read_pointer ) then
		 err_read_pointer_not_increment <= '1';
	else
		 err_read_pointer_not_increment <= '0';
	end if;
end process;

-- Checked !

process (read_en_out, credit_out)
begin
	if (read_en_out = '1' and credit_out = '0') then
		 err_read_en_credit_out <= '1';
	else
		 err_read_en_credit_out <= '0';
	end if;
end process;

-- Added !

process (read_en_out, credit_out)
begin
	if (read_en_out = '0' and credit_out = '1') then
		 err_not_read_en_credit_out <= '1';
	else
		 err_not_read_en_credit_out <= '0';
	end if;
end process;

-- Added !

process (valid_in, full_out, write_en_out)
begin
	if (valid_in = '1' and full_out = '0' and write_en_out = '0') then
		 err_write_en <= '1';
	else
		 err_write_en <= '0';
	end if;
end process;

-- Updated !

process (valid_in, full_out, write_en_out)
begin
	if ( (valid_in = '0' or full_out = '1') and write_en_out = '1') then
		 err_not_write_en <= '1';
	else
		 err_not_write_en <= '0';
	end if;
end process;

-- Updated !

process (read_en_out, read_en_signal)
begin
	if (read_en_out /= read_en_signal) then
		 err_read_en_mismatch <= '1';
	else
		 err_read_en_mismatch <= '0';
	end if;
end process;

end behavior;