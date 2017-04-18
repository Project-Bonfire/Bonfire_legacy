--Copyright (C) 2017 Konstantin Shibin

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AsyncDataRegisterAdapter is
 Generic ( Size : positive := 8);
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
			  -- Data interface
           DI : in STD_LOGIC_VECTOR (Size-1 downto 0);
           DO : out STD_LOGIC_VECTOR (Size-1 downto 0)
			     );
end AsyncDataRegisterAdapter;

architecture AsyncDataRegisterAdapter_arch of AsyncDataRegisterAdapter is

signal DI_sync_first, DI_sync: STD_LOGIC_VECTOR (Size-1 downto 0);
signal sreg_do: STD_LOGIC_VECTOR (Size-1 downto 0);
signal sreg_so: STD_LOGIC;

component SReg is
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
end component;

begin

synchronizer : process( TCK )
begin
  if  TCK'event and TCK = '1' then
    DI_sync_first <= DI;
    DI_sync <= DI_sync_first;
  end if ;
end process ; -- synchronizer

SO <= sreg_so;
DO <= sreg_do;
			  
shiftreg : SReg 
 Generic map ( Size => Size)
    Port map ( -- Scan Interface scan_client ----------
	            SI => SI, -- Input Port SI = SI
               SO => sreg_so,
               SEL => SEL,
               ----------------------------------------		
               SE => SE,
               CE => CE,
               UE => UE,
               RST => RST,
               TCK => TCK,
			         DI => DI_sync,
			         DO => sreg_do);		  

end AsyncDataRegisterAdapter_arch;