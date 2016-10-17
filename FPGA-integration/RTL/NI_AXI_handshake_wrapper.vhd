-- Copyright (C) Karl Janson 2016

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity AXI_handshake_wrapper is
    generic (
        DATA_WIDTH  :   integer := 32;
        NI_DEPTH    :   integer := 16
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
        AXI_data_read_in   :   in std_logic;
        
        AXI_TX_in      :   in std_logic_vector(DATA_WIDTH-1 downto 0);
        AXI_send_en :   in std_logic
    );
end AXI_handshake_wrapper;

architecture Behavioral of AXI_handshake_wrapper is
    component NI is
        generic (
            DATA_WIDTH  :   integer := 32;
            NI_DEPTH    :   integer := 16
        );
        port (
            reset   :   in std_logic;
            clk     :   in std_logic;
            
            RX1     :   in std_logic_vector(DATA_WIDTH-1 downto 0); 
            TX1     :   out std_logic_vector(DATA_WIDTH-1 downto 0); 
            DRTS1   :   in std_logic;
            DCTS1   :   in std_logic;
            RTS1    :   out std_logic;
            CTS1    :   out std_logic;

            RX2     :   in std_logic_vector(DATA_WIDTH-1 downto 0); 
            TX2     :   out std_logic_vector(DATA_WIDTH-1 downto 0);
             
            DRTS2   :   in std_logic;
            DCTS2   :   in std_logic;
            RTS2    :   out  std_logic;
            CTS2    :   out  std_logic
        );
    end component;

    signal PE_TX    :   std_logic_vector(DATA_WIDTH-1 downto 0); 
    signal PE_RX    :   std_logic_vector(DATA_WIDTH-1 downto 0);  
    signal PE_DRTS  :   std_logic;
    signal PE_DCTS  :   std_logic;
    signal PE_RTS   :   std_logic;
    signal PE_CTS   :   std_logic;

    type send_state_type is (S_IDLE, S_SEND);
    type recv_state_type is (S_IDLE, S_RECV, S_WAIT);
    
    signal send_state   :   send_state_type;
    signal recv_state   :   recv_state_type;
    
    signal RX_en    :   std_logic;
    signal TX_en    :   std_logic;
    signal axi_data_read    :   std_logic;
    signal AXI_RX_IRQ   :   std_logic;
    signal AXI_RX       :   std_logic_vector(DATA_WIDTH-1 downto 0);
    signal AXI_data_read_prev   :   std_logic;
    
begin

Network_interface: NI
generic map(
    DATA_WIDTH => DATA_WIDTH, 
    NI_DEPTH => NI_DEPTH)
    
port map (
    reset   =>  reset,
    clk     =>  clk,

    -- Router connection
    RX1     =>  R_RX,
    DRTS1   =>  R_DRTS,
    CTS1    =>  R_CTS,
    TX2     =>  R_TX,
    DCTS2   =>  R_DCTS,
    RTS2    =>  R_RTS,
    
    -- AXI PE emulation connection
    TX1     =>  PE_RX,
    DCTS1   =>  PE_CTS,
    RTS1    =>  PE_DRTS,
    RX2     =>  PE_TX,
    DRTS2   =>  PE_RTS,
    CTS2    =>  PE_DCTS
);

-- FSM for sending data from AXI to the NI
AXI_TX_FSM: process (clk, reset)

begin
    if (reset = '0') then
        PE_RTS <= '0';
        TX_en <= '0';
        send_state <= S_IDLE;
        
    elsif (clk'event and clk = '1') then
        case send_state is
            when S_IDLE =>
                if (AXI_send_en = '1') then
                    PE_RTS <= '1';
                    TX_en <= '1';
                    send_state <= S_SEND;
                else
                    TX_en <= '0';
                end if;
                
            when S_SEND =>
                if (PE_DCTS = '1') then
                    PE_RTS <= '0';
                    send_state <= S_IDLE;
                end if;
                
            when others =>
                PE_RTS <= '0';
                TX_en <= '0';
                send_state <= S_IDLE;
        end case;
    end if;

end process AXI_TX_FSM;

-- FSM for receiving data from the NI to teh AXI bus
AXI_RX_FSM: process (clk, reset)

begin
    if (reset = '0') then
        PE_CTS <= '0';
        RX_en <= '0';
        AXI_RX_IRQ <= '0';
        recv_state <= S_IDLE;
        AXI_data_read <= '1';
        
    elsif (clk'event and clk = '1') then
        case recv_state is
            when S_IDLE =>
                if (AXI_data_read = '1') then
                    if (PE_DRTS = '1') then
                        PE_CTS <= '1';
                        RX_en <= '1';
                        AXI_RX_IRQ <= '0';
                        recv_state <= S_RECV;
                    end if;
                else
                    if (AXI_data_read_in = '1') then
                        AXI_data_read <= '1';
                    end if;
                end if;  

                
            when S_RECV =>
                RX_en <= '0';
                PE_CTS <= '0';
                AXI_RX_IRQ <= '1';
                AXI_data_read <= '0';
                recv_state <= S_IDLE;
                
            when others =>
                PE_CTS <= '0';
                RX_en <= '0';
                AXI_RX_IRQ <= '0';
                recv_state <= S_IDLE;
        end case;
    end if;

end process AXI_RX_FSM;

RX_store: process (clk, reset)
begin
    if (reset = '0') then
        AXI_RX <= (others => '0');
        
    elsif (clk'event and clk = '1') then
        if (RX_en = '1') then
            AXI_RX <= PE_RX;
        else
            AXI_RX <= AXI_RX;
        end if;
    end if;
    
end process RX_store;


PE_TX <= AXI_TX_in when TX_en = '1' else
         (others => '0') when TX_en = '0';
         
AXI_RX_IRQ_out <= AXI_RX_IRQ;

AXI_RX_out <= AXI_RX;

end Behavioral;
