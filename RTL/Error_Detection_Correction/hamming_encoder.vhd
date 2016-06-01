library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_misc.all;


entity hamming_encoder is
 --generic(n: integer := 27);
 port(datain               : in  Std_logic_vector(31 downto 0);  -- d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27
      dataout              : out std_logic_vector(38 downto 0));                                             
end hamming_encoder;


architecture combinational of hamming_encoder is

 signal p0, p1, p2, p3, p4, p5, p6 : std_logic; --check bits
--signal dataout_sig:std_logic_vector(34 downto 0);
BEGIN
--dataout<=dataout_sig;
--generate check bits 

 p0 <= datain(0) xor datain(1) xor datain(3) xor datain(4) xor datain(6) xor datain(8) xor datain(10) xor datain(11) xor datain(13) xor datain(15) 
         xor datain(17) xor datain(19) xor datain(21) xor datain(23) xor datain(25) xor datain(26) xor datain(28) xor datain(30);
 p1 <= datain(0) xor datain(2) xor datain(3) xor datain(5) xor datain(6) xor datain(9) xor datain(10) xor datain(12) xor datain(13) xor datain(16) 
         xor datain(17) xor datain(20) xor datain(21) xor datain(24) xor datain(25) xor datain(27) xor datain(28) xor datain(31);
 p2 <= XOR_REDUCE(datain(3 downto 1)) xor XOR_REDUCE(datain(10 downto 7)) xor XOR_REDUCE(datain(17 downto 14)) xor XOR_REDUCE(datain(25 downto 22)) xor XOR_REDUCE(datain(31 downto 29));
 p3 <= XOR_REDUCE(datain(10 downto 4)) xor XOR_REDUCE(datain(25 downto 18));
 
 p4 <= XOR_REDUCE(datain(25 downto 11));
 p5 <= XOR_REDUCE(datain(31 downto 26));

 P6 <= XOR_REDUCE(datain(31 downto 0)) xor p0 xor p1 xor p2 xor p3 xor p4 xor p5;
 
 
dataout <= p6 & p5 & p4 & p3 & p2 & p1 & p0 & datain;

END combinational;