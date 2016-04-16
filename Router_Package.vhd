--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

package Router_Package is
  function Header_gen(Packet_length, source, destination, packet_id: integer ) return std_logic_vector ;
  function Body_gen(Packet_length, Data: integer ) return std_logic_vector ;
  function Tail_gen(Packet_length, Data: integer ) return std_logic_vector ;
end Router_Package;




package body Router_Package is
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


end Router_Package;