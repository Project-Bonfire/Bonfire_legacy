library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_misc.all;
use IEEE.NUMERIC_STD.all;
-- use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hamtm is

-- generic( n: integer := 34);
 port (datain  : in std_logic_vector(31 downto 0);
        data_out: out std_logic_vector(31 downto 0);
         se        : out std_logic;
         de        : out std_logic;
         ne        : out std_logic
         );
end hamtm;

architecture Beh of hamtm is

component hamming_encoder is

 --generic(n: integer := 34);
 port   (datain               : in  Std_logic_vector(31 downto 0);  -- d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27
         dataout              : out std_logic_vector(38 downto 0)
            ); -- d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 p0 p1

end component;

component hamming_decoder is
 --generic(n: integer := 34);
 port
         (hamming_in     : in std_logic_vector(38 downto 0);    --d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25                                             --d26 d27 p0 p1 p2 p3 p4 p5 p6
        dataout        : out std_logic_vector(31 downto 0);   --d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25                                             --d26 d27
          s_err_corr     : out std_logic;                   --diagnostic outputs
         d_err_det      : out std_logic;                   --diagnostic outputs
          no_error       : out std_logic);                  --diagnostic outputs

end component;

signal dataout_sig : std_logic_vector (38 downto 0);
signal datain_sig, data_out_sig : std_logic_vector (31 downto 0);
signal serr_sig, derr_sig, ne_sig : std_logic;

-- FOR Hamenc : hamming_encoder USE ENTITY work.hamming_encoder;
-- FOR Hamdec : hamming_decoder USE ENTITY work.hamming_decoder;

begin

datain_sig <= datain;
data_out <= data_out_sig;
se <= serr_sig;
de <= derr_sig;
ne <= ne_sig;

Hamenc : hamming_encoder
--generic map (n => 34)
port map(datain_sig, dataout_sig);

Hamdec : hamming_decoder
--generic map (n => 34)
port map( dataout_sig, data_out_sig, serr_sig, derr_sig, ne_sig );

end Beh;