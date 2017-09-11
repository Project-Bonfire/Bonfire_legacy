---------------------------------------------------------------------
-- TITLE: RAM wrapper
-- AUTHOR: Siavoosh Payandeh Azad
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use work.mlite_pack.all;

entity ram is
   generic(memory_type : string := "DEFAULT";
           stim_file: string :="code.txt");
   port(clk               : in std_logic;
		    reset             : in std_logic;
        enable            : in std_logic;
        write_byte_enable : in std_logic_vector(3 downto 0);
        address           : in std_logic_vector(31 downto 2);
        data_write        : in std_logic_vector(31 downto 0);
        data_read         : out std_logic_vector(31 downto 0));
end; --entity ram

architecture logic of ram is
    component SHKA65_4096X32X1CM4
    port(A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11 : in std_logic;
         DO0,DO1,DO2,
         DO3,DO4,DO5,DO6,DO7,DO8,DO9,DO10,DO11,DO12,
         DO13,DO14,DO15,DO16,DO17,DO18,DO19,DO20,
         DO21,DO22,DO23,DO24,DO25,DO26,DO27,DO28,
         DO29,DO30,DO31 : out std_logic;
         DI0,DI1,DI2,DI3,DI4,DI5,
         DI6,DI7,DI8,DI9,DI10,DI11,DI12,DI13,DI14,
         DI15,DI16,DI17,DI18,DI19,DI20,DI21,DI22,
         DI23,DI24,DI25,DI26,DI27,DI28,DI29,DI30,
         DI31,CK,WEB,DVSE,DVS0,DVS1,DVS2,CSB: in std_logic);
    end component;
    signal write_enable: std_logic;
    signal write_BWEB: std_logic_vector(31 downto 0);
    signal not_clock: std_logic;
    signal delayed_data_out, Q: std_logic_vector(31 downto 0);
begin

   write_enable <= not(write_byte_enable(0) or write_byte_enable(1) or write_byte_enable(2) or write_byte_enable(3));
   not_clock <= not clk;


   RAM_unit: SHKA65_4096X32X1CM4
   generic map (cdeFileInit => stim_file)
   port map(
   A0 => address(2),
   A1 => address(3),
   A2 => address(4),
   A3 => address(5),
   A4 => address(6),
   A5 => address(7),
   A6 => address(8),
   A7 => address(9),
   A8 => address(10),
   A9 => address(11),
   A10 => address(12),
   A11 => address(13),
   DO0 => data_read(0),
   DO1 => data_read(1),
   DO2 => data_read(2),
   DO3 => data_read(3),
   DO4 => data_read(4),
   DO5 => data_read(5),
   DO6 => data_read(6),
   DO7 => data_read(7),
   DO8 => data_read(8),
   DO9 => data_read(9),
   DO10 => data_read(10),
   DO11 => data_read(11),
   DO12 => data_read(12),
   DO13 => data_read(13),
   DO14 => data_read(14),
   DO15 => data_read(15),
   DO16 => data_read(16),
   DO17 => data_read(17),
   DO18 => data_read(18),
   DO19 => data_read(19),
   DO20 => data_read(20),
   DO21 => data_read(21),
   DO22 => data_read(22),
   DO23 => data_read(23),
   DO24 => data_read(24),
   DO25 => data_read(25),
   DO26 => data_read(26),
   DO27 => data_read(27),
   DO28 => data_read(28),
   DO29 => data_read(29),
   DO30 => data_read(30),
   DO31 => data_read(31),
   DI0 => data_write(0),
   DI1 => data_write(1),
   DI2 => data_write(2),
   DI3 => data_write(3),
   DI4 => data_write(4),
   DI5 => data_write(5),
   DI6 => data_write(6),
   DI7 => data_write(7),
   DI8 => data_write(8),
   DI9 => data_write(9),
   DI10 => data_write(10),
   DI11 => data_write(11),
   DI12 => data_write(12),
   DI13 => data_write(13),
   DI14 => data_write(14),
   DI15 => data_write(15),
   DI16 => data_write(16),
   DI17 => data_write(17),
   DI18 => data_write(18),
   DI19 => data_write(19),
   DI20 => data_write(20),
   DI21 => data_write(21),
   DI22 => data_write(22),
   DI23 => data_write(23),
   DI24 => data_write(24),
   DI25 => data_write(25),
   DI26 => data_write(26),
   DI27 => data_write(27),
   DI28 => data_write(28),
   DI29 => data_write(29),
   DI30 => data_write(30),
   DI31 => data_write(31),
   CK => clk,
   WEB => write_enable,
   DVSE => '0',
   DVS0 => '0',
   DVS1 => '0',
   DVS2 => '0',
   CSB => '0'
    );


end; --architecture logic
