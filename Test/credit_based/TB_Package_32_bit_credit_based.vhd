--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
 use ieee.math_real.all;
 use std.textio.all;
 use ieee.std_logic_misc.all;

package TB_Package is
  function Header_gen(source, destination: integer ) return std_logic_vector ;

  function Body_1_gen(Packet_length, packet_id: integer ) return std_logic_vector ;
  function Body_gen(Data: integer ) return std_logic_vector ;

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
end TB_Package;

package body TB_Package is
  constant Header_type : std_logic_vector := "001";
  constant Body_type : std_logic_vector := "010";
  constant Tail_type : std_logic_vector := "100";

  function Header_gen(source, destination: integer)
              return std_logic_vector is
    	variable Header_flit: std_logic_vector (31 downto 0);
    	begin
    	Header_flit := Header_type &  std_logic_vector(to_unsigned(source, 14)) &
                     std_logic_vector(to_unsigned(destination, 14))  & XOR_REDUCE(Header_type &  std_logic_vector(to_unsigned(source, 14)) &
                     std_logic_vector(to_unsigned(destination, 14)));
    return Header_flit;
  end Header_gen;

  function Body_1_gen(Packet_length, packet_id: integer)
                return std_logic_vector is
    variable Body_flit: std_logic_vector (31 downto 0);
    begin
    Body_flit := Body_type &  std_logic_vector(to_unsigned(Packet_length, 14))&  std_logic_vector(to_unsigned(packet_id, 14)) &
                 XOR_REDUCE(Body_type &  std_logic_vector(to_unsigned(Packet_length, 14))&  std_logic_vector(to_unsigned(packet_id, 14)));
    return Body_flit;
  end Body_1_gen;


  function Body_gen(Data: integer)
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
    variable seed1 :positive := source+1;
    variable seed2 :positive := source+1;
    variable LINEVARIABLE : line;
    file VEC_FILE : text is out "sent.txt";
    variable rand : real ;
    variable destination_id: integer;
    variable id_counter, frame_starting_delay, Packet_length, frame_ending_delay : integer:= 0;
    variable credit_counter: std_logic_vector (1 downto 0);
    begin

    Packet_length := integer((integer(rand*100.0)*frame_length)/100);
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
      frame_starting_delay := integer(((integer(rand*100.0)*(frame_length - Packet_length-1)))/100);
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
      id_counter := id_counter + 1;
      if id_counter = 16384 then
          id_counter := 0;
      end if;
      --------------------------------------
      uniform(seed1, seed2, rand);
      Packet_length := integer((integer(rand*100.0)*frame_length)/100);
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
          destination_id := integer(rand*real((network_size**2)-1));
      end loop;
      --------------------------------------
      write(LINEVARIABLE, "Packet generated at " & time'image(now) & " From " & integer'image(source) & " to " & integer'image(destination_id) & " with length: " & integer'image(Packet_length) & " id: " & integer'image(id_counter));
      writeline(VEC_FILE, LINEVARIABLE);
      wait until clk'event and clk ='0'; -- On negative edge of clk (for syncing purposes)
      port_in <= Header_gen(source, destination_id); -- Generating the header flit of the packet (All packets have a header flit)!
      valid_out <= '1';
      wait until clk'event and clk ='0';

      for I in 0 to Packet_length-3 loop
            -- The reason for -3 is that we have packet length of Packet_length, now if you exclude header and tail
            -- it would be Packet_length-2 to enumerate them, you can count from 0 to Packet_length-3.
            if credit_counter_in = "00" then
             valid_out <= '0';
             -- Wait until next router/NI has at least enough space for one flit in its input FIFO
             wait until credit_counter_in'event and credit_counter_in > 0;
             wait until clk'event and clk ='0';
            end if;

            uniform(seed1, seed2, rand);
            -- Each packet can have no body flits or one or more than body flits.
            if I = 0 then
              port_in <= Body_1_gen(Packet_length, id_counter);
            else
              port_in <= Body_gen(integer(rand*1000.0));
            end if;
             valid_out <= '1';
             wait until clk'event and clk ='0';
      end loop;

      if credit_counter_in = "00" then
             valid_out <= '0';
             -- Wait until next router/NI has at least enough space for one flit in its input FIFO
             wait until credit_counter_in'event and credit_counter_in > 0;
             wait until clk'event and clk ='0';
      end if;


      uniform(seed1, seed2, rand);
      -- Close the packet with a tail flit (All packets have one tail flit)!
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
    variable seed1 :positive := source+1;
    variable seed2 :positive := source+1;
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
      if id_counter = 16384 then
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
      destination_id := to_integer(unsigned(not std_logic_vector(to_unsigned(source, network_size))));
      if destination_id = source then
        wait;
      end if;
      --------------------------------------
      write(LINEVARIABLE, "Packet generated at " & time'image(now) & " From " & integer'image(source) & " to " & integer'image(destination_id) & " with length: " & integer'image(Packet_length) & " id: " & integer'image(id_counter));
      writeline(VEC_FILE, LINEVARIABLE);
      wait until clk'event and clk ='0';
      port_in <= Header_gen(source, destination_id); -- Generating the header flit of the packet (All packets have a header flit)!
      valid_out <= '1';
      wait until clk'event and clk ='0';

      for I in 0 to Packet_length-3 loop
            if credit_counter_in = "00" then
             valid_out <= '0';
             wait until credit_counter_in'event and credit_counter_in >0;
             wait until clk'event and clk ='0';
            end if;

            uniform(seed1, seed2, rand);
            if I = 0 then
              port_in <= Body_1_gen(Packet_length, id_counter);
            else
              port_in <= Body_gen(integer(rand*1000.0));
            end if;
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
     file DIAGNOSIS_FILE : text is out "DIAGNOSIS.txt";
     variable DIAGNOSIS: std_logic;
     variable DIAGNOSIS_vector: std_logic_vector(12 downto 0);
     begin
     credit_out <= '1';
     counter := 0;
     while true loop

         wait until clk'event and clk ='1';

         if valid_in = '1' then
              if (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) = "001") then
                counter := 1;
                DIAGNOSIS := '0';
                source_node := to_integer(unsigned(port_in(28 downto 15)));
                destination_node := to_integer(unsigned(port_in(14 downto 1)));

            end if;
            if  (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) = "010")   then
               --report "flit type: " &integer'image(to_integer(unsigned(port_in(DATA_WIDTH-1 downto DATA_WIDTH-3)))) ;
               --report  "counter: " & integer'image(counter);
               if counter = 1 then
                  P_length := to_integer(unsigned(port_in(28 downto 15)));
                  packet_id := to_integer(unsigned(port_in(15 downto 1)));
               end if;
               counter := counter+1;
               if port_in(28 downto 13) = "0100011001000100" then
                  DIAGNOSIS := '1';
                  DIAGNOSIS_vector(11 downto 0) := port_in(12 downto 1);
               end if;
            end if;
            if (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) = "100") then
                counter := counter+1;
              report "Node: " & integer'image(Node_ID) & "    Packet received at " & time'image(now) & " From " & integer'image(source_node) & " to " & integer'image(destination_node) & " with length: "& integer'image(P_length) & " counter: "& integer'image(counter);
              assert (P_length=counter) report "wrong packet size" severity warning;
              assert (Node_ID=destination_node) report "wrong packet destination " severity failure;
              if DIAGNOSIS = '1' then
                DIAGNOSIS_vector(12) := port_in(28);
                write(LINEVARIABLE, "Packet received at " & time'image(now) & " From: " & integer'image(source_node) & " to: " & integer'image(destination_node) & " length: "& integer'image(P_length) & " actual length: "& integer'image(counter)  & " id: "& integer'image(packet_id));
                writeline(DIAGNOSIS_FILE, LINEVARIABLE);
              else
                write(LINEVARIABLE, "Packet received at " & time'image(now) & " From: " & integer'image(source_node) & " to: " & integer'image(destination_node) & " length: "& integer'image(P_length) & " actual length: "& integer'image(counter)  & " id: "& integer'image(packet_id));
                writeline(VEC_FILE, LINEVARIABLE);
              end if;
               counter := 0;
            end if;
         end if;

     end loop;
  end get_packet;

end TB_Package;
