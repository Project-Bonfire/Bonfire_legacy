library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SReg is
 Generic ( Size : positive := 7);
    Port ( -- Scan Interface scan_client ----------
	        SI : in STD_LOGIC; -- ScanInPort 
           SO : out STD_LOGIC; -- ScanOutPort
           SEL : in STD_LOGIC; -- SelectPort
           ----------------------------------------		
           SE : in STD_LOGIC; -- ShiftEnPort
           CE : in STD_LOGIC; -- CaptureEnPort
           UE : in STD_LOGIC; -- UpdateEnPort
           RST : in STD_LOGIC; -- ResetPort
           TCK : in STD_LOGIC; -- TCKPort
			  DI : in STD_LOGIC_VECTOR (Size-1 downto 0); --DataInPort
			  DO : out STD_LOGIC_VECTOR (Size-1 downto 0)); --DataOutPort
end SReg;

architecture SReg_arch of SReg is

signal SR_so : STD_LOGIC;
signal SR_do : STD_LOGIC_VECTOR (Size-1 downto 0);

component ScanRegister is
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
           ScanRegister_out : out STD_LOGIC_VECTOR (Size-1 downto 0));
end component;

constant ResetValue : STD_LOGIC_VECTOR (Size-1 downto 0) := (others => '0'); -- ResetValue 1'b0

begin

SO <= SR_so; -- Source SR
DO <= SR_do; -- Source SR

SR : ScanRegister
 Generic map (Size => Size,
              BitOrder => "MSBLSB", -- MSBLSB / LSBMSB
              SOSource => 0, -- Source SR[0]
              ResetValue => ResetValue)
    Port map ( SI => SI, -- ScanInSource SI
               CE => CE,
               SE => SE,
               UE => UE,
               SEL => SEL,
               RST => RST,
               TCK => TCK,
               SO => SR_so,
               CaptureSource => DI, -- CaptureSource DI
               ScanRegister_out => SR_do);

end SReg_arch;