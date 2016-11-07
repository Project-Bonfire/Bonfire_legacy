--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
 use ieee.math_real.all;
 use std.textio.all;
 use ieee.std_logic_misc.all;

package TB_Package is
  function Header_gen(Packet_length, source, destination, packet_id: integer ) return std_logic_vector ;
  function Body_gen(Packet_length, Data: integer ) return std_logic_vector ;
  function Tail_gen(Packet_length, Data: integer ) return std_logic_vector ;
  procedure credit_counter_control(signal clk: in std_logic; 
                                 signal credit_in: in std_logic; signal valid_out: in std_logic; 
                                 signal credit_counter_out: out std_logic_vector(1 downto 0));
  procedure gen_random_packet(network_size, frame_length, source, initial_delay, min_packet_size, max_packet_size: in integer;
                      finish_time: in time; signal clk: in std_logic;
                      signal credit_counter_in: in std_logic_vector(1 downto 0); signal valid_out: out std_logic; 
                      signal port_in: out std_logic_vector);
  procedure gen_bit_reversed_packet(network_size, frame_length, source, initial_delay, min_packet_size, max_packet_size: in integer;
                      finish_time: in time; signal clk: in std_logic;
                      signal credit_counter_in: in std_logic_vector(1 downto 0); signal valid_out: out std_logic; 
                      signal port_in: out std_logic_vector); 
  procedure get_packet(DATA_WIDTH, initial_delay, Node_ID: in integer; signal clk: in std_logic; 
                     signal credit_out: out std_logic; signal valid_in: in std_logic; signal port_in: in std_logic_vector);
  procedure gen_fault(signal sta_0, sta_1: out std_logic; signal address: out std_logic_vector; delay, seed_1, seed_2: in integer);

end TB_Package;

package body TB_Package is
  constant Header_type : std_logic_vector := "001";
  constant Body_type : std_logic_vector := "010";
  constant Tail_type : std_logic_vector := "100";

  function Header_gen(Packet_length, source, destination, packet_id: integer)
              return std_logic_vector is
    	variable Header_flit: std_logic_vector (31 downto 0);
    	begin
    	Header_flit := Header_type &  std_logic_vector(to_unsigned(Packet_length, 12)) & std_logic_vector(to_unsigned(destination, 4)) & 
                   std_logic_vector(to_unsigned(source, 4))  & std_logic_vector(to_unsigned(packet_id, 8)) & XOR_REDUCE(Header_type &  
                   std_logic_vector(to_unsigned(Packet_length, 12)) & std_logic_vector(to_unsigned(destination, 4)) & 
                   std_logic_vector(to_unsigned(source, 4))  & std_logic_vector(to_unsigned(packet_id, 8)));
    return Header_flit;
  end Header_gen;


  function Body_gen(Packet_length, Data: integer)
                return std_logic_vector is
    variable Body_flit: std_logic_vector (31 downto 0);
    begin
    Body_flit := Body_type &  std_logic_vector(to_unsigned(Data, 28)) & XOR_REDUCE(Body_type & std_logic_vector(to_unsigned(Data, 28)));
    return Body_flit;
  end Body_gen;


  function Tail_gen(Packet_length, Data: integer)
                return std_logic_vector is
    variable Tail_flit: std_logic_vector (31 downto 0);
    begin
    Tail_flit := Tail_type &  std_logic_vector(to_unsigned(Data, 28)) & XOR_REDUCE(Tail_type & std_logic_vector(to_unsigned(Data, 28)));
    return Tail_flit;
  end Tail_gen;

  procedure credit_counter_control(signal clk: in std_logic; 
                                   signal credit_in: in std_logic; signal valid_out: in std_logic; 
                                   signal credit_counter_out: out std_logic_vector(1 downto 0)) is

    variable credit_counter: std_logic_vector (1 downto 0);

    begin
    credit_counter := "11";
    
    while true loop
      credit_counter_out<= credit_counter;
      wait until clk'event and clk ='1';
      if valid_out = '1' and credit_in ='1' then 
        credit_counter := credit_counter; 
      elsif credit_in = '1' then
        credit_counter := credit_counter + 1; 
      elsif valid_out = '1' and  credit_counter > 0 then
        credit_counter := credit_counter - 1; 
      else
        credit_counter := credit_counter; 
      end if;
    end loop;
  end credit_counter_control;

  procedure gen_random_packet(network_size, frame_length, source, initial_delay, min_packet_size, max_packet_size: in integer;
                      finish_time: in time; signal clk: in std_logic;
                      signal credit_counter_in: in std_logic_vector(1 downto 0); signal valid_out: out std_logic; 
                      signal port_in: out std_logic_vector) is
    variable seed1 :positive ;
    variable seed2 :positive ;
    variable LINEVARIABLE : line; 
    file VEC_FILE : text is out "sent.txt";
    variable rand : real ;
    variable destination_id: integer;
    variable id_counter, frame_starting_delay, Packet_length, frame_ending_delay : integer:= 0;
    variable credit_counter: std_logic_vector (1 downto 0);
    begin

    Packet_length := integer((integer(rand*100.0)*frame_length)/300);
    valid_out <= '0';
    port_in <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
    wait until clk'event and clk ='1';
    for i in 0 to initial_delay loop
      wait until clk'event and clk ='1';
    end loop;
    port_in <= "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" ;

    while true loop

      --generating the frame initial delay
      uniform(seed1, seed2, rand);
      frame_starting_delay := integer(((integer(rand*100.0)*(frame_length - 3*Packet_length)))/100);
      --generating the frame ending delay
      frame_ending_delay := frame_length - (3*Packet_length+frame_starting_delay);

      for k in 0 to frame_starting_delay-1 loop 
          wait until clk'event and clk ='0';
      end loop;

      valid_out <= '0';
      while credit_counter_in = 0 loop
        wait until clk'event and clk ='0';
      end loop;


      -- generating the packet 
      id_counter := id_counter + 1;
      if id_counter = 256 then
          id_counter := 0;
      end if;
      --------------------------------------
      uniform(seed1, seed2, rand);
      Packet_length := integer((integer(rand*100.0)*frame_length)/300);
      if (Packet_length < min_packet_size) then 
          Packet_length:=min_packet_size;
      end if;
      if (Packet_length > max_packet_size) then 
          Packet_length:=max_packet_size;
      end if;
      --------------------------------------
      uniform(seed1, seed2, rand);
      destination_id := integer(rand*real((network_size**2)-1));
      while (destination_id = source) loop 
          uniform(seed1, seed2, rand);
          destination_id := integer(rand*3.0);
      end loop;
      --------------------------------------
      write(LINEVARIABLE, "Packet generated at " & time'image(now) & " From " & integer'image(source) & " to " & integer'image(destination_id) & " with length: " & integer'image(Packet_length) & " id: " & integer'image(id_counter));
      writeline(VEC_FILE, LINEVARIABLE);
      wait until clk'event and clk ='0';
      port_in <= Header_gen(Packet_length, source, destination_id, id_counter);
      valid_out <= '1';
      wait until clk'event and clk ='0';

      for I in 0 to Packet_length-3 loop 
            if credit_counter_in = "00" then 
             valid_out <= '0'; 
             wait until credit_counter_in'event and credit_counter_in >0;
             wait until clk'event and clk ='0';
            end if;

            uniform(seed1, seed2, rand);
            port_in <= Body_gen(Packet_length, integer(rand*1000.0));
            valid_out <= '1';
             wait until clk'event and clk ='0';
      end loop;

      if credit_counter_in = "00" then 
             valid_out <= '0'; 
             wait until credit_counter_in'event and credit_counter_in >0;
             wait until clk'event and clk ='0';
      end if;

 
      uniform(seed1, seed2, rand);
      port_in <= Tail_gen(Packet_length, integer(rand*1000.0));
      valid_out <= '1';
      wait until clk'event and clk ='0';

      valid_out <= '0';
      port_in <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;

      for l in 0 to frame_ending_delay-1 loop 
         wait until clk'event and clk ='0';
      end loop;
      port_in <= "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" ;
      
      if now > finish_time then 
          wait; 
      end if;
    end loop;
  end gen_random_packet;

procedure gen_bit_reversed_packet(network_size, frame_length, source, initial_delay, min_packet_size, max_packet_size: in integer;
                      finish_time: in time; signal clk: in std_logic;
                      signal credit_counter_in: in std_logic_vector(1 downto 0); signal valid_out: out std_logic; 
                      signal port_in: out std_logic_vector) is
    variable seed1 :positive ;
    variable seed2 :positive ;
    variable LINEVARIABLE : line; 
    file VEC_FILE : text is out "sent.txt";
    variable rand : real ;
    variable destination_id: integer;
    variable id_counter, frame_starting_delay, Packet_length, frame_ending_delay : integer:= 0;
    variable credit_counter: std_logic_vector (1 downto 0);
    begin

    Packet_length := integer((integer(rand*100.0)*frame_length)/300);
    valid_out <= '0';
    port_in <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
    wait until clk'event and clk ='1';
    for i in 0 to initial_delay loop
      wait until clk'event and clk ='1';
    end loop;
    port_in <= "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" ;

    while true loop

      --generating the frame initial delay
      uniform(seed1, seed2, rand);
      frame_starting_delay := integer(((integer(rand*100.0)*(frame_length - 3*Packet_length)))/100);
      --generating the frame ending delay
      frame_ending_delay := frame_length - (3*Packet_length+frame_starting_delay);

      for k in 0 to frame_starting_delay-1 loop 
          wait until clk'event and clk ='0';
      end loop;

      valid_out <= '0';
      while credit_counter_in = 0 loop
        wait until clk'event and clk ='0';
      end loop;


      -- generating the packet 
      id_counter := id_counter + 1;
      if id_counter = 256 then
          id_counter := 0;
      end if;
      --------------------------------------
      uniform(seed1, seed2, rand);
      Packet_length := integer((integer(rand*100.0)*frame_length)/300);
      if (Packet_length < min_packet_size) then 
          Packet_length:=min_packet_size;
      end if;
      if (Packet_length > max_packet_size) then 
          Packet_length:=max_packet_size;
      end if;
      --------------------------------------
      uniform(seed1, seed2, rand);
      destination_id := integer(rand*real((network_size**2)-1));
      while (destination_id = source) loop 
          uniform(seed1, seed2, rand);
          destination_id := integer(rand*3.0);
      end loop;
      --------------------------------------
      write(LINEVARIABLE, "Packet generated at " & time'image(now) & " From " & integer'image(source) & " to " & integer'image(destination_id) & " with length: " & integer'image(Packet_length) & " id: " & integer'image(id_counter));
      writeline(VEC_FILE, LINEVARIABLE);
      wait until clk'event and clk ='0';
      port_in <= Header_gen(Packet_length, source, destination_id, id_counter);
      valid_out <= '1';
      wait until clk'event and clk ='0';

      for I in 0 to Packet_length-3 loop 
            if credit_counter_in = "00" then 
             valid_out <= '0'; 
             wait until credit_counter_in'event and credit_counter_in >0;
             wait until clk'event and clk ='0';
            end if;

            uniform(seed1, seed2, rand);
            port_in <= Body_gen(Packet_length, integer(rand*1000.0));
            valid_out <= '1';
             wait until clk'event and clk ='0';
      end loop;

      if credit_counter_in = "00" then 
             valid_out <= '0'; 
             wait until credit_counter_in'event and credit_counter_in >0;
             wait until clk'event and clk ='0';
      end if;

 
      uniform(seed1, seed2, rand);
      port_in <= Tail_gen(Packet_length, integer(rand*1000.0));
      valid_out <= '1';
      wait until clk'event and clk ='0';

      valid_out <= '0';
      port_in <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;

      for l in 0 to frame_ending_delay-1 loop 
         wait until clk'event and clk ='0';
      end loop;
      port_in <= "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" ;
      
      if now > finish_time then 
          wait; 
      end if;
    end loop;
  end gen_bit_reversed_packet;


  procedure get_packet(DATA_WIDTH, initial_delay, Node_ID: in integer; signal clk: in std_logic; 
                       signal credit_out: out std_logic; signal valid_in: in std_logic; signal port_in: in std_logic_vector) is
  -- initial_delay: waits for this number of clock cycles before sending the packet!
    variable source_node, destination_node, P_length, packet_id, counter: integer;
    variable LINEVARIABLE : line; 
     file VEC_FILE : text is out "received.txt";
     begin
     credit_out <= '1';
     counter := 0;
     while true loop
         
         wait until clk'event and clk ='1';
        
         if valid_in = '1' then
              if (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) = "001") then
                counter := 1; 
                P_length := to_integer(unsigned(port_in(28 downto 17)));
                destination_node := to_integer(unsigned(port_in(16 downto 13)));
                source_node := to_integer(unsigned(port_in(12 downto 9)));
                packet_id := to_integer(unsigned(port_in(8 downto 1)));
            end if;  
            if  (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) = "010")   then
               --report "flit type: " &integer'image(to_integer(unsigned(port_in(DATA_WIDTH-1 downto DATA_WIDTH-3)))) ;
               --report  "counter: " & integer'image(counter);
               counter := counter+1; 
            end if;
            if (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) = "100") then 
                counter := counter+1; 
              report "Packet received at " & time'image(now) & " From " & integer'image(source_node) & " to " & integer'image(destination_node) & " with length: "& integer'image(P_length) & " counter: "& integer'image(counter);
              assert (P_length=counter) report "wrong packet size" severity warning;
              assert (Node_ID=destination_node) report "wrong packet destination " severity failure;
               write(LINEVARIABLE, "Packet received at " & time'image(now) & " From: " & integer'image(source_node) & " to: " & integer'image(destination_node) & " length: "& integer'image(P_length) & " actual length: "& integer'image(counter)  & " id: "& integer'image(packet_id));
               writeline(VEC_FILE, LINEVARIABLE);
               counter := 0;
            end if;
         end if;

     end loop;
  end get_packet;

procedure gen_fault(signal sta_0, sta_1: out std_logic; signal address: out std_logic_vector; delay, seed_1, seed_2: in integer) is
  variable seed1 :positive := seed_1;
   variable seed2 :positive := seed_2;
   variable rand : real;
   variable stuck: integer;
begin 
  sta_0 <= '0';
  sta_1 <= '0';
  while true loop
      sta_0 <= '0';
      sta_1 <= '0';
      for I in 0 to delay loop 
        wait for 1 ns;
      end loop;
      uniform(seed1, seed2, rand);
      address <= std_logic_vector(to_unsigned(integer(rand*31.0), 5));
      uniform(seed1, seed2, rand);
      stuck := integer(rand*11.0);
      if stuck > 5 then
        sta_0 <= '1';
        sta_1 <= '0';
      else
        sta_0 <= '0';
        sta_1 <= '1';
      end if; 
      wait for 1 ns;
  end loop;
end gen_fault;

end TB_Package;
