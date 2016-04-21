library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
 use ieee.math_real.all;
 

package TB_Package is
  function Header_gen(Packet_length, source, destination, packet_id: integer ) return std_logic_vector ;
  function Body_gen(Packet_length, Data: integer ) return std_logic_vector ;
  function Tail_gen(Packet_length, Data: integer ) return std_logic_vector ;
  procedure gen_packet(Packet_length, source, destination, packet_id, initial_delay: in integer; finish_time: in time;  signal clk: in std_logic;  signal DCTS: in std_logic; signal RTS: out std_logic; signal port_in: out std_logic_vector);
  procedure gen_random_packet(Packet_length, source, packet_id, initial_delay: in integer; finish_time: in time; signal clk: in std_logic; 
                     signal DCTS: in std_logic; signal RTS: out std_logic; 
                     signal port_in: out std_logic_vector);
  procedure get_packet(DATA_WIDTH: in integer; initial_delay: in integer; signal clk: in std_logic; signal CTS: out std_logic; signal DRTS: in std_logic; signal port_in: in std_logic_vector);
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
         std_logic_vector(to_unsigned(source, 4))  & std_logic_vector(to_unsigned(packet_id, 8)) & '0';
return Header_flit;
end Header_gen;


function Body_gen(Packet_length, Data: integer)
              return std_logic_vector is
variable Body_flit: std_logic_vector (31 downto 0);
begin
Body_flit := Body_type &  std_logic_vector(to_unsigned(Data, 28)) & '0';
return Body_flit;
end Body_gen;


function Tail_gen(Packet_length, Data: integer)
              return std_logic_vector is
variable Tail_flit: std_logic_vector (31 downto 0);
begin
Tail_flit := Tail_type &  std_logic_vector(to_unsigned(Data, 28)) & '0';
return Tail_flit;
end Tail_gen;

procedure gen_packet(Packet_length, source, destination, packet_id, initial_delay: in integer;  finish_time: in time; signal clk: in std_logic; 
                     signal DCTS: in std_logic; signal RTS: out std_logic; 
                     signal port_in: out std_logic_vector) is
-- Packet_length of 3 means it has 1 header, 1 body and 1 tail. the number of body packets are equal to Packet_length-2
-- source: id of the source node
-- destination: id of the destination node
-- packet id: packet identification number! TODO: has to be implemented!
-- initial_delay: waits for this number of clock cycles before sending the packet!
  variable seed1 :positive ;
    variable seed2 :positive ;
    variable rand : real ;
    variable first_time :boolean := true;
    variable destination_id: integer;
   begin
   while true loop

   RTS <= '0';
   if first_time = true then 
     for i in 0 to initial_delay loop 
        wait until clk'event and clk ='0';
      end loop;
    else
      wait until clk'event and clk ='0';
    end if;

  --wait untill the falling edge of the clock to avoid race!
  report "Packet generated at " & time'image(now) & " From " & integer'image(source) & " to " & integer'image(destination);
  port_in <= Header_gen(Packet_length, source, destination, packet_id);
  wait until clk'event and clk ='1';
  RTS <= '1';
  wait until DCTS'event and DCTS ='1';
  wait for 1 ns;
  RTS <= '0';

  for I in 0 to Packet_length-3 loop 
    uniform(seed1, seed2, rand);
     
    wait until clk'event and clk ='0';
    port_in <= Body_gen(Packet_length, integer(rand*1000.0));
    wait until clk'event and clk ='1';
    RTS <= '1';
    wait until DCTS'event and DCTS ='1';
    wait for 1 ns;
    RTS <= '0';
  end loop;
  
  wait until clk'event and clk ='0';
  port_in <= Tail_gen(Packet_length, 200);
    wait until clk'event and clk ='1';
    RTS <= '1';
    wait until DCTS'event and DCTS ='1';
    wait for 1 ns;
    RTS <= '0';
    if now > 1000 ns then 
        wait;
    end if;
  end loop;
end gen_packet;

procedure gen_random_packet(Packet_length, source, packet_id, initial_delay: in integer; finish_time: in time; signal clk: in std_logic; 
                     signal DCTS: in std_logic; signal RTS: out std_logic; 
                     signal port_in: out std_logic_vector) is
-- Packet_length of 3 means it has 1 header, 1 body and 1 tail. the number of body packets are equal to Packet_length-2
-- source: id of the source node
-- packet id: packet identification number! TODO: has to be implemented!
-- initial_delay: waits for this number of clock cycles before sending the packet!
  variable seed1 :positive ;
    variable seed2 :positive ;
    variable rand : real ;
    variable first_time :boolean := true;
    variable destination_id: integer;
   begin
   while true loop

   RTS <= '0';
   if first_time = true then 
     for i in 0 to initial_delay loop 
        wait until clk'event and clk ='0';
      end loop;
    else
      wait until clk'event and clk ='0';
    end if;

  uniform(seed1, seed2, rand);
  destination_id := integer(rand*15.0);

  while (destination_id = source) loop 
    uniform(seed1, seed2, rand);
    destination_id := integer(rand*15.0);
  end loop;

  --wait untill the falling edge of the clock to avoid race!
  report "Packet generated at " & time'image(now) & " From " & integer'image(source) & " to " & integer'image(destination_id);
  port_in <= Header_gen(Packet_length, source, destination_id, packet_id);
  wait until clk'event and clk ='1';
  RTS <= '1';
  wait until DCTS'event and DCTS ='1';
  wait for 1 ns;
  RTS <= '0';

  for I in 0 to Packet_length-3 loop 
    uniform(seed1, seed2, rand);
     
    wait until clk'event and clk ='0';
    port_in <= Body_gen(Packet_length, integer(rand*1000.0));
    wait until clk'event and clk ='1';
    RTS <= '1';
    wait until DCTS'event and DCTS ='1';
    wait for 1 ns;
    RTS <= '0';
  end loop;
  
  wait until clk'event and clk ='0';
  port_in <= Tail_gen(Packet_length, 200);
    wait until clk'event and clk ='1';
    RTS <= '1';
    wait until DCTS'event and DCTS ='1';
    wait for 1 ns;
    RTS <= '0';
    if now > 1000 ns then 
        wait;
    end if;
  end loop;
end gen_random_packet;

procedure get_packet(DATA_WIDTH: in integer; initial_delay: in integer; signal clk: in std_logic; 
                   signal CTS: out std_logic; signal DRTS: in std_logic; signal port_in: in std_logic_vector) is
-- initial_delay: waits for this number of clock cycles before sending the packet!
  variable source_node, destination_node, P_length, counter: integer;
   begin
   while true loop
       counter := 0;
       CTS <= '0';

        wait until DRTS'event and DRTS ='1';
       CTS <= '1';  
       wait until clk'event and clk ='1';     
       counter := counter+1;
       if (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) = "001") then
              
              P_length := to_integer(unsigned(port_in(28 downto 17)));
              destination_node := to_integer(unsigned(port_in(16 downto 13)));
              source_node := to_integer(unsigned(port_in(12 downto 9)));
       end if;         
       CTS <= '0';
       while (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) /= "100") loop
          wait until DRTS'event and DRTS ='1';
          CTS <= '1';  
          wait until clk'event and clk ='1';
          counter := counter+1;  
          CTS <= '0';
       end loop;

      report "Packet received at " & time'image(now) & " From " & integer'image(source_node) & " to " & integer'image(destination_node) & " with length: "& integer'image(P_length) & " counter: "& integer'image(counter);
      assert (P_length=counter) report "wrong packet size" severity error;

 
   end loop;
end get_packet;

end TB_Package;