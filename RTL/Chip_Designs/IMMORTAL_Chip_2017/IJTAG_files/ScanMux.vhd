library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ScanMux is
 Generic (ControlSize : positive := 3);
    Port ( ScanMux_in : in STD_LOGIC_VECTOR((2**ControlSize)-1 downto 0);
           SelectedBy : in STD_LOGIC_VECTOR(ControlSize-1 downto 0);
           ScanMux_out : out STD_LOGIC);
end ScanMux;

architecture ScanMux_arch of ScanMux is

signal internal_connections: std_logic_vector((2**(ControlSize+1))-2 downto 0);

begin

internal_connections((2**ControlSize)-1 downto 0) <= ScanMux_in;

mux_network: for i in 0 to ControlSize-1 generate

 mux_layer: for j in 0 to 2**(ControlSize-1-i)-1 generate
 
   internal_connections((2**(ControlSize+1))-(2**(ControlSize-i))+j) <= internal_connections((2**(ControlSize+1))-(2**(ControlSize+1-i))+2*j+1) when SelectedBy(i) = '1' else internal_connections((2**(ControlSize+1))-(2**(ControlSize+1-i))+2*j+0);

 end generate;

end generate;

ScanMux_out <= internal_connections((2**(ControlSize+1))-2);

end ScanMux_arch;