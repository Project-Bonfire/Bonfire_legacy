--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
 use ieee.math_real.all;
 use std.textio.all;

 use ieee.std_logic_misc.all;

package TB_Package_LV is
  function Header_gen(Packet_length, source, destination, packet_id: integer ) return std_logic_vector ;
  function Body_gen(Packet_length, Data: integer ) return std_logic_vector ;
  function Tail_gen(Packet_length, Data: integer ) return std_logic_vector ;
  procedure credit_counter_control_LV(signal clk: in std_logic; 
                                 signal credit_in: in std_logic; signal valid_out: in std_logic; 
                                 signal credit_counter_out: out std_logic_vector(1 downto 0));
  procedure gen_random_packet_LV(SHMU_ID, frame_length, source, initial_delay, min_packet_size, max_packet_size: in integer;
                      finish_time: in time; signal clk: in std_logic;
                      signal credit_counter_in: in std_logic_vector(1 downto 0); signal valid_out: out std_logic; 
                      signal port_in: out std_logic_vector);
  procedure get_packet_LV(DATA_WIDTH, initial_delay, Node_ID: in integer; signal clk: in std_logic; 
                     signal credit_out: out std_logic; signal valid_in: in std_logic; signal port_in: in std_logic_vector);
  
  

end TB_Package_LV;

package body TB_Package_LV is
  constant Header_type : std_logic_vector := "001";
  constant Body_type : std_logic_vector := "010";
  constant Tail_type : std_logic_vector := "100";

  function Header_gen(Packet_length, source, destination, packet_id: integer)
              return std_logic_vector is
    	variable Header_flit: std_logic_vector (10 downto 0);
      variable faulty_healhty: integer;
       variable seed1 :positive ;
      variable seed2 :positive ;
     variable rand : real ;
     	begin
      uniform(seed1, seed2, rand);
      faulty_healhty := integer(rand*100.0);
      if faulty_healhty > 50 then
          Header_flit := std_logic_vector(to_unsigned(source, 4))  & std_logic_vector(to_unsigned(destination, 4)) &  Header_type;
      else
          Header_flit := std_logic_vector(to_unsigned(source, 4))  & std_logic_vector(to_unsigned(destination, 4)) &  Header_type;
      end if;
    	
    return Header_flit;
  end Header_gen;


  function Body_gen(Packet_length, Data: integer)
                return std_logic_vector is
    variable Body_flit: std_logic_vector (10 downto 0);
    begin
    Body_flit :=  std_logic_vector(to_unsigned(Data, 8)) & Body_type;
    return Body_flit;
  end Body_gen;


  function Tail_gen(Packet_length, Data: integer)
                return std_logic_vector is
    variable Tail_flit: std_logic_vector (10 downto 0);
    begin
    Tail_flit := std_logic_vector(to_unsigned(Data, 8)) & Tail_type;
    return Tail_flit;
  end Tail_gen;

  procedure credit_counter_control_LV(signal clk: in std_logic; 
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
  end credit_counter_control_LV;

  procedure gen_random_packet_LV(SHMU_ID, frame_length, source, initial_delay, min_packet_size, max_packet_size: in integer;
                      finish_time: in time; signal clk: in std_logic;
                      signal credit_counter_in: in std_logic_vector(1 downto 0); signal valid_out: out std_logic; 
                      signal port_in: out std_logic_vector) is
    variable seed1 :positive ;
    variable seed2 :positive ;
    variable LINEVARIABLE : line; 
    file VEC_FILE : text is out "LV_sent.txt";
    variable rand : real ;
    variable destination_id: integer;
    variable id_counter, frame_starting_delay, Packet_length, frame_ending_delay : integer:= 0;
    variable credit_counter: std_logic_vector (1 downto 0);
    begin

    Packet_length := integer((integer(rand*100.0)*frame_length)/300);
    valid_out <= '0';
    port_in <= "XXXXXXXXXXX" ;
    wait until clk'event and clk ='1';
    for i in 0 to initial_delay loop
      wait until clk'event and clk ='1';
    end loop;
    port_in <= "UUUUUUUUUUU" ;

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
      id_counter := id_counter + 1;
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
      --uniform(seed1, seed2, rand);
      --destination_id := integer(rand*3.0);
      --while (destination_id = source) loop 
      --    uniform(seed1, seed2, rand);
      --    destination_id := integer(rand*3.0);
      --end loop;
      destination_id := SHMU_ID;
      --------------------------------------
      write(LINEVARIABLE, "LV_Packet generated at " & time'image(now) & " From " & integer'image(source) & " to " & integer'image(destination_id) & " with length: "& integer'image(Packet_length));
      writeline(VEC_FILE, LINEVARIABLE);
      wait until clk'event and clk ='0';
      port_in <= Header_gen(Packet_length, source, destination_id, id_counter);
      valid_out <= '1';
      wait until clk'event and clk ='0';

      --valid_out <= '0';
      --while credit_counter_in = 0 loop
      --  wait until clk'event and clk ='1';
      --end loop;
 

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
            --valid_out <= '0';
            --while credit_counter_in = 0 loop
            --    wait until clk'event and clk ='0';
            --end loop;  
            --wait until clk'event and clk ='1';
           
           
            
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
      port_in <= "ZZZZZZZZZZZ" ;

      for l in 0 to frame_ending_delay-1 loop 
         wait until clk'event and clk ='0';
      end loop;
      port_in <= "UUUUUUUUUUU" ;
      
      if now > finish_time then 
          wait; 
      end if;
    end loop;
  end gen_random_packet_LV;


  procedure get_packet_LV(DATA_WIDTH, initial_delay, Node_ID: in integer; signal clk: in std_logic; 
                       signal credit_out: out std_logic; signal valid_in: in std_logic; signal port_in: in std_logic_vector) is
  -- initial_delay: waits for this number of clock cycles before sending the packet!
    variable source_node, destination_node, P_length, packet_id, counter: integer;
    variable LINEVARIABLE : line; 
     file VEC_FILE : text is out "LV_received.txt";
     file SHMU_FILE : text is out "SHMU_Notifications.txt";

     variable body_input:std_logic_vector(10 downto 0);
     variable tail_input:std_logic_vector(10 downto 0);
     begin
     credit_out <= '1';
      while true loop
         
         wait until clk'event and clk ='1';
        
         if valid_in = '1' then
             if (port_in(2 downto 0) = "001") then
                destination_node := to_integer(unsigned(port_in(6 downto 3)));
                source_node := to_integer(unsigned(port_in(10 downto 7)));
             end if; 
             if (port_in(2 downto 0) = "010") then
              body_input := port_in;
             end if;
             if (port_in(2 downto 0) = "100") then
              tail_input := port_in;
              report "Packet received at " & time'image(now) & " From " & integer'image(source_node) & " to " & integer'image(destination_node) ;
               write(LINEVARIABLE, "LV_Packet received at " & time'image(now) & " From: " & integer'image(source_node) & " to: " & integer'image(destination_node) );
               writeline(VEC_FILE, LINEVARIABLE);
               if Node_ID = 0 then
                  if body_input(3) = '1'  then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link L is Intermittent " );
                  elsif body_input(8) = '1' then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link L is Faulty " );
                  elsif tail_input(5) = '1' then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link L is Healthy " );
                  end if;

                  if body_input(4) = '1'  then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link S is Intermittent " );
                  elsif body_input(9) = '1' then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link S is Faulty " );
                  elsif tail_input(6) = '1' then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link S is Healthy " );
                  end if;

                  if body_input(5) = '1'  then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link W is Intermittent " );
                  elsif body_input(10) = '1' then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link W is Faulty " );
                  elsif tail_input(7) = '1' then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link W is Healthy " );
                  end if;


                  if body_input(6) = '1'  then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link E is Intermittent " );
                  elsif tail_input(3) = '1' then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link E is Faulty " );
                  elsif tail_input(8) = '1' then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link E is Healthy " );
                  end if;

                  if body_input(7) = '1'  then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link N is Intermittent " );
                  elsif tail_input(4) = '1' then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link N is Faulty " );
                  elsif tail_input(9) = '1' then 
                     write(LINEVARIABLE, " Node " & integer'image(source_node) & " link N is Healthy " );
                  end if;


                  writeline(SHMU_FILE, LINEVARIABLE);
              end if; 
             end if; 
         end if;

     end loop;
  end get_packet_LV;

 

end TB_Package_LV;
