--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 USE ieee.numeric_std.ALL; 

entity TAP_tb is 
end;

architecture behavior of TAP_tb is

    component TAP  is
        port (
            -- signals from the PC!
            TRST : in std_logic;    -- Test Reset
            TCK: in std_logic;      -- Test Clock
            TMS: in std_logic;      -- Test Mode Select  
            TDI: in std_logic;      -- Test Data In
            TDO: out std_logic;      -- Test Data out

            -- signals to the boundry scan cell
            SC_IN: in std_logic;    -- Scan chain to TAP
            SC_OUT: out std_logic;   -- TAP to Scan chain 
            CaptureDR: out std_logic;
            ShiftDR: out std_logic;
            EXTEST: out std_logic;
            UpdateDR: out std_logic
        );
    end component;

    component scan_cell is
        port (
            Data_In: in std_logic;
            SC_IN: in std_logic;    -- Scan in
            SC_OUT: out std_logic;   -- Scan out
            EXTEST: in std_logic;
            CaptureDR, ShiftDR, UpdateDR: in std_logic;
            ClockDR: in std_logic;
            Data_out: out std_logic
        );
    end component;

    constant clk_period : time := 1 ns;
    signal reset,clk: std_logic :='0';
    signal TMS, TDI, TDO, SC_IN, SC_OUT, CaptureDR,  ShiftDR, EXTEST, UpdateDR: std_logic := '0';
    signal Data_In, Data_out: std_logic_vector (3 downto 0):= (others=>'0');
    signal BS_SC: std_logic_vector (2 downto 0); 

 begin 

TAP_0 : TAP port map (reset, clk, TMS, TDI, TDO, SC_OUT, SC_IN,  CaptureDR,  ShiftDR, EXTEST, UpdateDR);

reset <= '1' after 1 ns;

 GEN_scan_cell: 
   for I in 0 to 3 generate
        First_cell: if I = 0 generate 
            BSC_0 : scan_cell port map (Data_In(I), SC_IN, BS_SC(0), EXTEST, CaptureDR, ShiftDR, UpdateDR , clk, Data_out(I));
        end generate;

        Last_cell: if I=3 generate 
            BSC_3 : scan_cell port map (Data_In(I), BS_SC(I-1), SC_OUT, EXTEST, CaptureDR, ShiftDR, UpdateDR , clk, Data_out(I));
        end generate;

        Cell_I: if I>0 and I<3 generate
            BSC_I : scan_cell port map (Data_In(I), BS_SC(I-1), BS_SC(I) , EXTEST, CaptureDR, ShiftDR, UpdateDR , clk, Data_out(I));
        end generate;
   end generate;
 

process begin
    wait for clk_period/2;
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    TMS <= '1';
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    TMS <= '0';
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    TMS <= '1';
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    TMS <= '1';
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    TMS <= '0';
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    TDI<='1';
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    TDI<='0';
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    TDI<='1';
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    TDI<='0';
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    clk <= '0'; wait for clk_period/2;   clk <= '1'; wait for clk_period/2; 
    wait;   
end process;

end;




