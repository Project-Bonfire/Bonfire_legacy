library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_misc.all;

Entity hamming_decoder is

 port
              (hamming_in    : in  std_logic_vector(38 downto 0);    --d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25                                             --d26 d27 p0 p1 p2 p3 p4 p5 p6
           dataout       : out std_logic_vector(31 downto 0);   --d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25                                             --d26 d27 
              s_err_corr    : out std_logic;                   --diagnostic outputs
              d_err_det     : out std_logic;                   --diagnostic outputs
              no_error      : out std_logic);                  --diagnostic outputs

end hamming_decoder;


architecture beh OF hamming_decoder is

Signal syndrome : std_logic_vector (6 downto 0);
 
begin

syndrome(0) <=  hamming_in(0) xor hamming_in(1) xor hamming_in(3) xor hamming_in(4) xor hamming_in(6) xor 
                 hamming_in(8) xor hamming_in(10) xor hamming_in(11) xor hamming_in(13) xor hamming_in(15) xor 
                 hamming_in(17) xor hamming_in(19) xor hamming_in(21) xor hamming_in(23) xor hamming_in(25) xor hamming_in(26) xor hamming_in(28) xor hamming_in(30) xor hamming_in(32);

syndrome(1) <=  hamming_in(0) xor hamming_in(2) xor hamming_in(3) xor hamming_in(5) xor hamming_in(6) xor 
                 hamming_in(9) xor hamming_in(10) xor hamming_in(12) xor hamming_in(13) xor hamming_in(16) xor 
                 hamming_in(17) xor hamming_in(20) xor hamming_in(21) xor hamming_in(24) xor hamming_in(25) xor hamming_in(27) xor hamming_in(28) xor hamming_in(31) xor hamming_in(33);
syndrome(2) <=  XOR_REDUCE(hamming_in(3 downto 1)) xor XOR_REDUCE(hamming_in(10 downto 7)) xor XOR_REDUCE(hamming_in(17 downto 14)) xor 
                 XOR_REDUCE(hamming_in(25 downto 22)) xor XOR_REDUCE(hamming_in(31 downto 29)) xor hamming_in(34);
syndrome(3) <=  XOR_REDUCE(hamming_in(10 downto 4)) xor XOR_REDUCE(hamming_in(25 downto 18)) xor hamming_in(35);
syndrome(4) <=  XOR_REDUCE(hamming_in(25 downto 11)) xor hamming_in(36);
syndrome(5) <=  XOR_REDUCE(hamming_in(31 downto 26)) xor hamming_in(37);
syndrome(6) <=  XOR_REDUCE(hamming_in(38 downto 0));


 PROCESS(hamming_in, syndrome)
 BEGIN
        if (syndrome = "0000000") then -------no errors
            no_error   <= '1';
            d_err_det  <= '0';
            s_err_corr <= '0';
            dataout <= hamming_in(31 downto 0);

        elsif (syndrome(6) = '1') then -----------------------------------------------single bit error
            no_error   <= '0';
           d_err_det  <= '0';
           s_err_corr <= '1';
           dataout <= hamming_in(31 downto 0);     -- to cover all the bits

            Case syndrome(5 downto 0) is

                when "000000"|"000001"|"000010"|"000100"|"001000"|"010000"|"100000" =>   ------ this implies the error is only in parity bits, not data.
                dataout <= hamming_in(31 downto 0); 

                when "000011" => dataout(0) <= not hamming_in(0);
                when "000101" => dataout(1) <= not hamming_in(1);
                when "000110" => dataout(2) <= not hamming_in(2);
                when "000111" => dataout(3) <= not hamming_in(3);
                when "001001" => dataout(4) <= not hamming_in(4);
                when "001010" => dataout(5) <= not hamming_in(5);
                when "001011" => dataout(6) <= not hamming_in(6);
                when "001100" => dataout(7) <= not hamming_in(7);
                when "001101" => dataout(8) <= not hamming_in(8);
                when "001110" => dataout(9) <= not hamming_in(9);
                when "001111" => dataout(10) <= not hamming_in(10);
                when "010001" => dataout(11) <= not hamming_in(11);
                when "010010" => dataout(12) <= not hamming_in(12);
                when "010011" => dataout(13) <= not hamming_in(13);
                when "010100" => dataout(14) <= not hamming_in(14);
                when "010101" => dataout(15) <= not hamming_in(15);
                when "010110" => dataout(16) <= not hamming_in(16);
                when "010111" => dataout(17) <= not hamming_in(17);
                when "011000" => dataout(18) <= not hamming_in(18);
                when "011001" => dataout(19) <= not hamming_in(19);
                when "011010" => dataout(20) <= not hamming_in(20);
                when "011011" => dataout(21) <= not hamming_in(21);
                when "011100" => dataout(22) <= not hamming_in(22);
                when "011101" => dataout(23) <= not hamming_in(23);
                when "011110" => dataout(24) <= not hamming_in(24);
                when "011111" => dataout(25) <= not hamming_in(25);
                when "100001" => dataout(26) <= not hamming_in(26);
                when "100010" => dataout(27) <= not hamming_in(27);
                when "100011" => dataout(28) <= not hamming_in(28);
                when "100100" => dataout(29) <= not hamming_in(29);
                when "100101" => dataout(30) <= not hamming_in(30);
                when "100110" => dataout(31) <= not hamming_in(31);
                when others=> dataout <= (others=> '0');
            END Case;
        ----------------------------- double error detection-----------------------------
        ELSIF (syndrome(6) = '0') AND (syndrome(5 downto 0) /= "000000") THEN
            no_error   <= '0';
            d_err_det  <= '1';
            s_err_corr <= '0';
            dataout <= (others=> '0');
        ELSE
            no_error   <= '0';
            d_err_det  <= '1';
            s_err_corr <= '0';
            dataout <= (others=> '0');
        END if;
 END process;

END beh;