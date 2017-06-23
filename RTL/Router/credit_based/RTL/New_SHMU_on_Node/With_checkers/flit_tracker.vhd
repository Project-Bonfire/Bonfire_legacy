--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use IEEE.NUMERIC_STD.all;
 use ieee.std_logic_misc.all;

entity flit_tracker is
    generic (
        DATA_WIDTH: integer := 32;
        tracker_file: string :="track.txt"
    );
    port (
    	clk: in std_logic;
        RX: in std_logic_vector (DATA_WIDTH-1 downto 0);
        valid_in : in std_logic
    );
end;

architecture behavior of flit_tracker is
begin
process(clk)
	variable source_id, destination_id, Packet_length, packet_id: integer;
	variable LINEVARIABLE : line;
 	variable xor_check : std_logic;
 	file trace_file : text is out tracker_file;
	begin
		Packet_length := 0;
		destination_id := 0;
		source_id := 0;
		packet_id := 0;
		if clk'event and clk = '1' then
			if unsigned(RX) /= to_unsigned(0, RX'length) and valid_in = '1' then
				if RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "001" then
					Packet_length := to_integer(unsigned(RX(28 downto 17)));
		            destination_id := to_integer(unsigned(RX(16 downto 13)));
		            source_id := to_integer(unsigned(RX(12 downto 9)));
		            packet_id := to_integer(unsigned(RX(8 downto 1)));
		            xor_check :=  XOR_REDUCE(RX(DATA_WIDTH-1 downto 1));
		            if xor_check = RX(0) then
		            	write(LINEVARIABLE, "H flit at " & time'image(now) & " From " & integer'image(source_id) & " to " & integer'image(destination_id) & " with length: " & integer'image(Packet_length) & " id: " & integer'image(packet_id));
		            else
		            	write(LINEVARIABLE, "H flit at " & time'image(now) & " From " & integer'image(source_id) & " to " & integer'image(destination_id) & " with length: " & integer'image(Packet_length) & " id: " & integer'image(packet_id) & " FAULTY ");
		            end if;
					writeline(trace_file, LINEVARIABLE);
				elsif RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "010" then
					xor_check :=  XOR_REDUCE(RX(DATA_WIDTH-1 downto 1));
		            if xor_check = RX(0) then
						write(LINEVARIABLE, "B flit at " & time'image(now));
					else
						write(LINEVARIABLE, "B flit at " & time'image(now) & " FAULTY ");
					end if;
					writeline(trace_file, LINEVARIABLE);
				elsif RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "100" then
					xor_check :=  XOR_REDUCE(RX(DATA_WIDTH-1 downto 1));
		            if xor_check = RX(0) then
						write(LINEVARIABLE, "T flit at " & time'image(now));
					else
						write(LINEVARIABLE, "T flit at " & time'image(now) & " FAULTY ");
					end if;
					writeline(trace_file, LINEVARIABLE);
				end if;
			end if;
		end if;
end process;

end;