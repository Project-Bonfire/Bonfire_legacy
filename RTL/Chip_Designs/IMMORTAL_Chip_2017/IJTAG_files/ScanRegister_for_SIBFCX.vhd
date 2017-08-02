library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ScanRegister_for_SIBFCX is
 Generic (Size : positive;
          BitOrder : string; -- MSBLSB / LSBMSB
          SOSource : natural;
          ResetValue : STD_LOGIC_VECTOR);
    Port ( SI : in STD_LOGIC;
           CE : in STD_LOGIC;
           SE : in STD_LOGIC;
           UE : in STD_LOGIC;
           SEL : in STD_LOGIC;
           RST : in STD_LOGIC;
           TCK : in STD_LOGIC;
           SO : out STD_LOGIC;
           CaptureSource : in STD_LOGIC_VECTOR (Size-1 downto 0);
           ScanRegister_out : out STD_LOGIC_VECTOR (Size-1 downto 0);
           ue_mux_out : out STD_LOGIC_VECTOR (Size-1 downto 0));
end ScanRegister_for_SIBFCX;

architecture ScanRegister_arch of ScanRegister_for_SIBFCX is

signal and_ce, and_se, and_ue: std_logic;
signal internal_si: std_logic_vector(Size downto 0);
signal cs_reg: std_logic_vector(Size-1 downto 0);
signal u_reg: std_logic_vector(Size-1 downto 0):=ResetValue;
signal se_mux, ce_mux, ue_mux: std_logic_vector(Size-1 downto 0);

begin

-- Basic Combinational Logic
and_ce <= CE and SEL;
and_se <= SE and SEL;
and_ue <= UE and SEL;
internal_si(Size) <= SI;

-- TDR Shift Register Core
SCAN_REGISTER: for i in Size-1 downto 0 generate

-- Multiplexers
se_mux(i) <= internal_si(i+1) when and_se = '1' else cs_reg(i);
ce_mux(i) <= CaptureSource(i) when and_ce = '1' else se_mux(i);
ue_mux(i) <= cs_reg(i) when and_ue = '1' else u_reg(i);

-- Flip-Flops
cs_reg(i) <= ce_mux(i) when TCK'event and TCK = '1';
process(RST,TCK)
begin
  if RST = '1' then
    u_reg(i) <= ResetValue(Size-1-i);
  elsif TCK'event and TCK = '0' then
    u_reg(i) <= ue_mux(i);
  end if;
end process;

-- Internal Connections
internal_si(i) <= cs_reg(i);

end generate;

-- Outputs
MSBLSB_SO : if BitOrder = "MSBLSB" generate
              SO <= internal_si(SOSource);
				end generate;
LSBMSB_SO : if BitOrder = "LSBMSB" generate
              SO <= internal_si(Size-1-SOSource);
				end generate;				
ScanRegister_out <= u_reg;
ue_mux_out <= ue_mux;

end ScanRegister_arch;