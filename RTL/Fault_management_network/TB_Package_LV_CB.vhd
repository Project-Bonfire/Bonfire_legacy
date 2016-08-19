--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
 use ieee.math_real.all;
 use std.textio.all;
 use ieee.std_logic_misc.all;

package TB_Package is
  function packet_gen(source, destination: integer; healthy_faulty: Boolean) return std_logic_vector;
  
  procedure credit_counter_control(signal clk: in std_logic; 
                                 signal credit_in: in std_logic; signal valid_out: in std_logic; 
                                 signal credit_counter_out: out std_logic_vector(1 downto 0));
  procedure gen_random_packet(SHMU_ID, frame_length, source, initial_delay, min_packet_size, max_packet_size: in integer;
                      finish_time: in time; signal clk: in std_logic;
                      signal credit_counter_in: in std_logic_vector(1 downto 0); signal valid_out: out std_logic; 
                      signal port_in: out std_logic_vector);
  procedure get_packet(DATA_WIDTH, initial_delay, Node_ID: in integer; signal clk: in std_logic; 
                     signal credit_out: out std_logic; signal valid_in: in std_logic; signal port_in: in std_logic_vector);
   

end TB_Package;

package body TB_Package is
  constant Header_type : std_logic_vector := "001";
   

  function packet_gen( source, destination: integer; healthy_faulty: Boolean)
              return std_logic_vector is
    	variable packet: std_logic_vector (12 downto 0);
      variable healthy: std_logic;
    	begin
      if healthy_faulty then  
          healthy := '0';   
      else
          healthy := '1';
      end if;
    	packet :=   std_logic_vector(to_unsigned(source, 4))  & std_logic_vector(to_unsigned(destination, 4)) & healthy & '1' & "001";
    return packet;
  end packet_gen;

 

  procedure credit_counter_control(signal clk: in std_logic; 
                                   signal credit_in: in std_logic; signal valid_out: in std_logic; 
                                   signal credit_counter_out: out std_logic_vector(1 downto 0)) is

    variable credit_counter: std_logic_vector (1 downto 0);

    begin
    credit_counter := "11";
    
    while true loop
      credit_counter_out<= credit_counter;
      wait until clk'event and clk ='1';
      if credit_in = '1' then
        credit_counter := credit_counter + 1; 
      end if;
      if valid_out = '1' and  credit_counter > 0 then
        credit_counter := credit_counter - 1; 
      end if;
    end loop;
  end credit_counter_control;

  procedure gen_random_packet(SHMU_ID, frame_length, source, initial_delay, min_packet_size, max_packet_size: in integer;
                      finish_time: in time; signal clk: in std_logic;
                      signal credit_counter_in: in std_logic_vector(1 downto 0); signal valid_out: out std_logic; 
                      signal port_in: out std_logic_vector) is
    variable seed1 :positive ;
    variable seed2 :positive ;
    variable LINEVARIABLE : line; 
    file VEC_FILE : text is out "sent.txt";
    variable rand : real ;
    variable destination_id: integer;
    variable faulty_healhty: integer;
    variable id_counter, frame_starting_delay, Packet_length, frame_ending_delay : integer:= 0;
    variable credit_counter: std_logic_vector (1 downto 0);
    begin

    Packet_length := 1;
    valid_out <= '0';
    port_in <= "XXXXXXXXXXXXX" ;
    wait until clk'event and clk ='1';
    for i in 0 to initial_delay loop
      wait until clk'event and clk ='1';
    end loop;
    port_in <= "UUUUUUUUUUUUU" ;
     
	    while true loop

	      --generating the frame initial delay
	      uniform(seed1, seed2, rand);

	      frame_starting_delay := integer(((integer(rand*100.0)*((2*frame_length/3) - Packet_length)))/100);
	      --generating the frame ending delay
	      frame_ending_delay := frame_length - (Packet_length+frame_starting_delay);

	      for k in 0 to frame_starting_delay-1 loop 
	          wait until clk'event and clk ='0';
	      end loop;

	      valid_out <= '0';
	      while credit_counter_in = 0 loop
	        wait until clk'event and clk ='0';
	      end loop;


	      -- generating the packet  
	      --------------------------------------
	      uniform(seed1, seed2, rand);
 		  destination_id := SHMU_ID;
	      
	      uniform(seed1, seed2, rand);
	      faulty_healhty := integer(rand*100.0);
	      if faulty_healhty > 50 then
	        write(LINEVARIABLE, "Healthy Packet generated at " & time'image(now) & " From " & integer'image(source) & " to " & integer'image(destination_id));
	        writeline(VEC_FILE, LINEVARIABLE);
	        wait until clk'event and clk ='0';
	        port_in <= packet_gen(source, destination_id, True);
	        valid_out <= '1';
	        wait until clk'event and clk ='0';
	      else
	        write(LINEVARIABLE, "Faulty Packet generated at " & time'image(now) & " From " & integer'image(source) & " to " & integer'image(destination_id));
	        writeline(VEC_FILE, LINEVARIABLE);
	        wait until clk'event and clk ='0';
	        port_in <= packet_gen(source, destination_id, False);
	        valid_out <= '1';
	        wait until clk'event and clk ='0';        
	      end if;

	      --------------------------------------
	     

	      valid_out <= '0';
	      port_in <= "ZZZZZZZZZZZZZ" ;

	      for l in 0 to frame_ending_delay-1 loop 
	         wait until clk'event and clk ='0';
	      end loop;
	      port_in <= "UUUUUUUUUUUUU" ;
	      
	      if now > finish_time then 
	          wait; 
	      end if;
	    end loop;
	 
  end gen_random_packet;


  procedure get_packet(DATA_WIDTH, initial_delay, Node_ID: in integer; signal clk: in std_logic; 
                       signal credit_out: out std_logic; signal valid_in: in std_logic; signal port_in: in std_logic_vector) is
  -- initial_delay: waits for this number of clock cycles before sending the packet!
    variable source_node, destination_node: integer;
    variable LINEVARIABLE : line; 
     file VEC_FILE : text is out "received.txt";
     begin
     credit_out <= '1';
 
     while true loop
         
         wait until clk'event and clk ='1';
        
         if valid_in = '1' then
              if (port_in(2 downto 0) = "001") then
                destination_node := to_integer(unsigned(port_in(8 downto 5)));
                source_node := to_integer(unsigned(port_in(12 downto 9)));
             end if; 
              report "Packet received at " & time'image(now) & " From " & integer'image(source_node) & " to " & integer'image(destination_node) ;
               write(LINEVARIABLE, "Packet received at " & time'image(now) & " From: " & integer'image(source_node) & " to: " & integer'image(destination_node) );
               writeline(VEC_FILE, LINEVARIABLE);
 
         end if;

     end loop;
  end get_packet;


end TB_Package;
