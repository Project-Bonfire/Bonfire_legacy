-- Tesbench for testing the AXI handshaking wrapper for NI
-- Copyright (C) 2016 Karl Janson

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity NI_AXI_handshake_wrapper_tb is
    generic (
        DATA_WIDTH  :   integer := 32;
        NI_DEPTH    :   integer := 4
    );
end NI_AXI_handshake_wrapper_tb;

architecture Behavioral of NI_AXI_handshake_wrapper_tb is

component AXI_handshake_wrapper is
    generic (
        DATA_WIDTH  :   integer := DATA_WIDTH;
        NI_DEPTH    :   integer := NI_DEPTH
    );
    port ( 
        reset   :   in std_logic;
        clk     :   in std_logic;
        
        --Router connection
        R_RX    :   in std_logic_vector(DATA_WIDTH-1 downto 0); 
        R_TX    :   out std_logic_vector(DATA_WIDTH-1 downto 0);
        R_DRTS  :   in std_logic;
        R_DCTS  :   in std_logic;
        R_RTS   :   out std_logic;
        R_CTS   :   out std_logic;
        
        -- Abstraction signals for AXI
        AXI_RX_out          :   out std_logic_vector(DATA_WIDTH-1 downto 0);
        AXI_RX_IRQ_out      :   out std_logic;
        AXI_data_read_in    :   in std_logic;
        
        AXI_TX_in       :   in std_logic_vector(DATA_WIDTH-1 downto 0);
        AXI_send_en     :   in std_logic
    );
end component;
    
    signal reset   :   std_logic := '0';
    signal clk     :   std_logic := '0';
 
           --Router connection
    signal R_RX    :   std_logic_vector(DATA_WIDTH-1 downto 0); 
    signal R_TX    :   std_logic_vector(DATA_WIDTH-1 downto 0);
    signal R_DRTS  :   std_logic;
    signal R_DCTS  :   std_logic;
    signal R_RTS   :   std_logic;
    signal R_CTS   :   std_logic;
 
           -- Abstraction signals for AXI
    signal AXI_RX_out          :   std_logic_vector(DATA_WIDTH-1 downto 0);
    signal AXI_RX_IRQ_out      :   std_logic;
    signal AXI_data_read_in   :   std_logic;

    signal AXI_TX      :   std_logic_vector(DATA_WIDTH-1 downto 0);
    signal AXI_send_en :   std_logic;
    
    signal counter: integer := 0;
    signal counter_data_read: integer := 0;
    
begin

AXI_Network_interface: AXI_handshake_wrapper
port map (
    reset   =>  reset,
    clk     =>  clk,
    
    --Router connection
    R_RX    =>   R_RX,
    R_TX    =>   R_TX,
    R_DRTS  =>   R_DRTS,
    R_DCTS  =>   R_DCTS,
    R_RTS   =>   R_RTS,
    R_CTS   =>   R_CTS,
    
    -- Abstraction signals for AXI
    AXI_RX_out          =>  AXI_RX_out,
    AXI_RX_IRQ_out      =>  AXI_RX_IRQ_out,
    AXI_data_read_in    =>  AXI_data_read_in,
    
    AXI_TX_in      =>  AXI_TX,
    AXI_send_en    =>  AXI_send_en
);

clk <= not clk after 10 ns;

process (clk)
begin
    if clk'event and clk = '1' then
        if counter = 1 then
            reset <= '1';
        elsif counter = 3 then
            AXI_TX <= x"11111111";
        elsif counter = 8 then
            AXI_send_en <= '1';
        elsif counter = 9 then
            AXI_send_en <= '0';

        elsif counter = 13 then
            AXI_TX <= x"22222222";
        elsif counter = 14 then
            AXI_send_en <= '1';
        elsif counter = 15 then
            AXI_send_en <= '0';
        
        elsif counter = 19 then
            AXI_TX <= x"33333333";
        elsif counter = 20 then
            AXI_send_en <= '1';
        elsif counter = 21 then
            AXI_send_en <= '0';
        
        elsif counter = 25 then
            AXI_TX <= x"44444444";
        elsif counter = 26 then
            AXI_send_en <= '1';
        elsif counter = 27 then
            AXI_send_en <= '0';

        elsif counter = 33 then
            AXI_TX <= x"55555555";
        elsif counter = 34 then
            AXI_send_en <= '1';
        elsif counter = 35 then
            AXI_send_en <= '0';

        
--        elsif counter = 40 then
--            AXI_data_read <= '1';
--        elsif counter = 41 then
--            AXI_data_read <= '0';
        
--        elsif counter = 44 then
--            AXI_data_read <= '1';
--        elsif counter = 45 then
--            AXI_data_read <= '0';
        
--        elsif counter = 50 then
--            AXI_data_read <= '1';
--        elsif counter = 51 then
--            AXI_data_read <= '0';
        
--        elsif counter = 55 then
--            AXI_data_read <= '1';
--        elsif counter = 56 then
--            AXI_data_read <= '0';
        
--        elsif counter = 60 then
--            AXI_data_read <= '1';
--        elsif counter = 61 then
--            AXI_data_read <= '0';
        
        end if;
        counter <= counter + 1;
    end if;
    
    
end process;

AXI_read_data:process(clk)
begin
    
    if clk'event and clk = '1' then
        if (AXI_data_read_in = '1') then
            AXI_data_read_in <= '0';
        elsif (AXI_RX_IRQ_out = '1') then
            counter_data_read <= counter_data_read + 1;
            if (counter_data_read = 20) then
                AXI_data_read_in <= '1';
                counter_data_read <= 0;
            end if;
        end if;
    end if;
end process;

R_RX <= R_TX;
R_DRTS <= R_RTS;
R_DCTS <= R_CTS;

end Behavioral;
