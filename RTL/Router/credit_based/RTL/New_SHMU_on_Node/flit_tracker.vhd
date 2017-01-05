--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity flit_tracker is
    generic (
        DATA_WIDTH: integer := 32;
        tracker_file: string :="track.txt"
    );
    port (
        RX: in std_logic_vector (DATA_WIDTH-1 downto 0); 
        valid_in : in std_logic
    );
end;

architecture behavior of flit_tracker is
begin
process(RX, valid_in)
	variable source_id, destination_id, Packet_length, packet_id: integer;
	variable LINEVARIABLE : line;
	file tracker_file : text open write_mode is tracker_file;
	begin

		if valid_in'event and valid_in = '1' then
			if RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "001" then 
				Packet_length := to_integer(unsigned(RX(28 downto 17)));
	            destination_id := to_integer(unsigned(RX(16 downto 13)));
	            source_id := to_integer(unsigned(RX(12 downto 9)));
	            packet_id := to_integer(unsigned(RX(8 downto 1)));
				write(LINEVARIABLE, "H flit at " & time'image(now) & " From " & integer'image(source_id) & " to " & integer'image(destination_id) & " with length: " & integer'image(Packet_length) & " id: " & integer'image(packet_id));
				writeline(VEC_FILE, LINEVARIABLE);
			elsif RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "100" then 
				write(LINEVARIABLE, "B flit at " & time'image(now) )
			elsif RX(DATA_WIDTH-1 downto DATA_WIDTH-3) = "100" then 
				write(LINEVARIABLE, "T flit at " & time'image(now))
			end if;
		end if; 
end process;

end;