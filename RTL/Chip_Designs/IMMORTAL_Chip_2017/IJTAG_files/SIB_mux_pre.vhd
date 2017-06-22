--Copyright (C) 2017 Dmitri Mihhailov

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SIB_mux_pre is
    Port ( -- Scan Interface  client --------------
	       SI : in  STD_LOGIC; -- ScanInPort 
           CE : in STD_LOGIC; -- CaptureEnPort
           SE : in STD_LOGIC; -- ShiftEnPort
           UE : in STD_LOGIC; -- UpdateEnPort
           SEL : in STD_LOGIC; -- SelectPort
           RST : in STD_LOGIC; -- ResetPort
           TCK : in STD_LOGIC; -- TCKPort
           SO : out STD_LOGIC; -- ScanOutPort
		   -- Scan Interface  host ----------------
           fromSO : in  STD_LOGIC; -- ScanInPort
           toCE : out  STD_LOGIC; -- ToCaptureEnPort
           toSE : out  STD_LOGIC; -- ToShiftEnPort
           toUE : out  STD_LOGIC; -- ToUpdateEnPort
           toSEL : out  STD_LOGIC; -- ToSelectPort
           toRST : out  STD_LOGIC; -- ToResetPort
           toTCK : out  STD_LOGIC; -- ToTCKPort
           toSI : out  STD_LOGIC); -- ScanOutPort
end SIB_mux_pre;

architecture SIB_mux_pre_arch of SIB_mux_pre is

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

signal SR_so : STD_LOGIC;
signal SR_do : STD_LOGIC_VECTOR (0 downto 0);

component ScanMux is
 Generic (ControlSize : positive);
    Port ( ScanMux_in : in STD_LOGIC_VECTOR((2**ControlSize)-1 downto 0);
           SelectedBy : in STD_LOGIC_VECTOR(ControlSize-1 downto 0);
           ScanMux_out : out STD_LOGIC);
end component;

signal SIBmux_out : STD_LOGIC;

begin

SO <= SR_so; -- Source SR
toCE <= CE;
toSE <= SE;
toUE <= UE;
toSEL <= SEL and SR_do(0); -- SEL & SR.DO
toRST <= RST;
toTCK <= TCK;
toSI <= SI; -- Source SI

SR : ScanRegister
 Generic map (Size => 1,
              BitOrder => "MSBLSB", -- MSBLSB / LSBMSB
              SOSource => 0,
              ResetValue => "0") -- ResetValue 1'b0
    Port map ( SI => SIBmux_out, -- ScanInSource SIBmux_out
               CE => CE,
               SE => SE,
               UE => UE,
               SEL => SEL,
               RST => RST,
               TCK => TCK,
               SO => SR_so,
               CaptureSource => SR_do, -- CaptureSource SR
               ScanRegister_out => SR_do);
			   
SIBmux : ScanMux
 Generic map ( ControlSize => 1)
    Port map ( ScanMux_in(0) => SI, -- 1'b0 : SI
	           ScanMux_in(1) => fromSO, -- 1'b1 : fromSO
               SelectedBy => SR_do, --SelectedBy SR
               ScanMux_out => SIBmux_out);

end SIB_mux_pre_arch;