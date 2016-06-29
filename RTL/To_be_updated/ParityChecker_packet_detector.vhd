--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity parity_checker_packet_detector is 
	generic(DATA_WIDTH : integer := 32);
	port(
		reset: in  std_logic;
        clk: in  std_logic;
		RX: in std_logic_vector(DATA_WIDTH-1 downto 0);
		DRTS: in std_logic;
		faulty_packet, healthy_packet: out std_logic
		);
end parity_checker_packet_detector;

architecture behavior of parity_checker_packet_detector is

signal xor_all: std_logic;
signal fault_out: std_logic;
alias flit_type: RX(1 downto 0);

type state_type IS (Idle, Header_flit, Body_flit, Tail_flit);
SIGNAL state_out, state_in : state_type;

begin 

-- sequential process
process(reset, clk)begin
	if reset = '0' then
		state_out <= Idle;
	elsif clk'event and clk = '1' then
		state_out <= state_in;
	end if;
end process;

--anything bellow this is combinatorial 

-- this part is the typical parity
xor_all <= XOR_REDUCE(RX(DATA_WIDTH-1 downto 1));
process(DRTS, RX)begin 
	if DRTS = '1' then 
		if xor_all = RX(0) then 
			fault_out <= '0';
		else
			fault_out <= '1';
		end if;
	else
		fault_out <= '0';
	end if;
end process;

-- FSM for packet health detection
process(flit_type, fault_out, state_out, DRTS)
begin
	faulty_packet <= '0';
	healthy_packet <= '0';
	if DRTS = '1' then 
		case(state_out) is
	        when Idle =>

	        	if flit_type = "001" then 
	        		state_in <= Header_flit;
	        	else
	        		state_in <= state_out;
	        	end if;

	        when Header_flit =>

	        	if fault_out = '0' then
	        		if flit_type = "010" then 
	        			state_in <= Body_flit;
		        	else
		        		state_in <= state_out;
		        	end if; 
	        	else
	        		state_in <= Idle;
	        		faulty_packet <= '1';
	        	end if;

	        when Body_flit =>

	        	if fault_out = '0' then
	        		if flit_type = "100" then 
	        			state_in <= Tail_flit;
		        	else
		        		state_in <= state_out;
		        	end if; 
	        	else
	        		state_in <= Idle;
	        		faulty_packet <= '1';
	        	end if;
	        
	        when Tail_flit =>
	        	state_in <= Idle;
	        	if fault_out = '0' then
	        		healthy_packet <= '1';
	        	else
	        		faulty_packet <= '1';
	        	end if;
	    end case;
    else
        state_in <= state_out;
    end if; 
end process;
end;


