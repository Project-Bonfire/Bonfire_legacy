--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO is
    generic (
        DATA_WIDTH: integer := 32
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            RX: in std_logic_vector(DATA_WIDTH-1 downto 0); 
            DRTS: in std_logic;  
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            CTS: out std_logic; 
            empty_out: out std_logic; 
            Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0); 

            -- Checker outputs
            err_FIFO_control_part_DRTS_CTS, err_FIFO_write_pointer_update: out std_logic;
            err_FIFO_read_pointer_not_update, err_FIFO_write_pointer_not_update: out std_logic;
            err_FIFO_full_empty, err_FIFO_empty, err_FIFO_empty1, err_FIFO_full: out std_logic;
            err_FIFO_read_pointer_onehot, err_FIFO_write_pointer_onehot: out std_logic;
            err_FIFO_HS_state_onehot: out std_logic;
            err_FIFO_read_en_onehot: out std_logic; 
            err_FIFO_read_from_empty_FIFO: out std_logic; 
            err_FIFO_write_to_full_FIFO: out std_logic;
            err_FIFO_control_part_CTS_in_CTS_out: out std_logic; 
            err_FIFO_read_en_empty: out std_logic;
            err_FIFO_read_en_empty1: out std_logic            
    );
end;

architecture behavior of FIFO is
   signal read_pointer, read_pointer_in,  write_pointer, write_pointer_in: std_logic_vector(3 downto 0);
   signal full, empty: std_logic;
   signal read_en, write_en: std_logic;
   signal CTS_in, CTS_out: std_logic;

   signal FIFO_MEM_1, FIFO_MEM_1_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_2, FIFO_MEM_2_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_3, FIFO_MEM_3_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_4, FIFO_MEM_4_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   
-- TYPE STATE_TYPE IS (IDLE, READ_DATA);
   SUBTYPE STATE_TYPE IS STD_LOGIC_VECTOR (1 DOWNTO 0);
   CONSTANT IDLE: STATE_TYPE:="01"; 
   CONSTANT READ_DATA: STATE_TYPE:="10";

   SIGNAL HS_state_out, HS_state_in : STATE_TYPE;

component FIFO_control_part_checkers is
    port (  DRTS: in std_logic;
            CTS_out: in std_logic;
            CTS_in: in std_logic;
            read_en_N : in std_logic;
            read_en_E : in std_logic;                        
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            read_pointer: in std_logic_vector(3 downto 0);
            read_pointer_in: in std_logic_vector(3 downto 0);
            write_pointer: in std_logic_vector(3 downto 0); 
            write_pointer_in: in std_logic_vector(3 downto 0); 
            empty_out: in std_logic;
            full_out: in std_logic;
            read_en_out: in std_logic;
            write_en_out: in std_logic; 
            HS_state_in: in std_logic_vector(1 downto 0);         

            -- Checker outputs
            err_FIFO_control_part_DRTS_CTS, err_FIFO_write_pointer_update: out std_logic;
            err_FIFO_read_pointer_not_update, err_FIFO_write_pointer_not_update: out std_logic;
            err_FIFO_full_empty, err_FIFO_empty, err_FIFO_empty1, err_FIFO_full: out std_logic;
            err_FIFO_read_pointer_onehot, err_FIFO_write_pointer_onehot: out std_logic;
            err_FIFO_HS_state_onehot: out std_logic;
            err_FIFO_read_en_onehot: out std_logic; 
            err_FIFO_read_from_empty_FIFO: out std_logic; 
            err_FIFO_write_to_full_FIFO: out std_logic;
            err_FIFO_control_part_CTS_in_CTS_out: out std_logic; 
            err_FIFO_read_en_empty: out std_logic;
            err_FIFO_read_en_empty1: out std_logic
            );
end component;

begin
 --------------------------------------------------------------------------------------------
--                           block diagram of the FIFO!
--  previous            
--   router                
--     --            ------------------------------------------             
--       |          |                                          |
--     TX|--------->| RX                               Data_out|----> goes to Xbar and LBDR
--       |          |                                          | 
--    RTS|--------->| DRTS             FIFO             read_en|<---- Comes from Arbiters (N,E,W,S,L)
--       |          |                               (N,E,W,S,L)|
--   DCTS|<---------| CTS                                      |    
--     --            ------------------------------------------ 
 --------------------------------------------------------------------------------------------
-- Hand shake protocol!
--
--                |<-Valid->|
--                |   Data  |  
--           _____ _________ ______
--  RX       _____X_________X______ 
--  DRTS     _____|'''''''''|_____
--  CTS      __________|''''|_______
--

 --------------------------------------------------------------------------------------------
--  circular buffer structure
--                                   <--- WriteP    
--              ---------------------------------
--              |   3   |   2   |   1   |   0   |
--              ---------------------------------
--                                   <--- readP   
 --------------------------------------------------------------------------------------------

-- FIFO Control Part checkers instantiation
FIFOCONTROLPARTCHECKERS: FIFO_control_part_checkers port map (
                                                              DRTS => DRTS,
                                                              CTS_in => CTS_in, CTS_out => CTS_out,
                                                              read_en_N => read_en_N, read_en_E => read_en_E, read_en_W => read_en_W, read_en_S => read_en_S, read_en_L => read_en_L,
                                                              read_pointer => read_pointer, read_pointer_in => read_pointer_in, write_pointer => write_pointer, write_pointer_in => write_pointer_in,
                                                              empty_out => empty, full_out => full, 
                                                              read_en_out => read_en, write_en_out => write_en,
                                                              HS_state_in => HS_state_in,
                
                                                              err_FIFO_control_part_DRTS_CTS => err_FIFO_control_part_DRTS_CTS, 
                                                              err_FIFO_read_pointer_not_update => err_FIFO_read_pointer_not_update,
                                                              err_FIFO_write_pointer_update => err_FIFO_write_pointer_update,
                                                              err_FIFO_write_pointer_not_update => err_FIFO_write_pointer_not_update,
                                                              err_FIFO_full_empty => err_FIFO_full_empty, 
                                                              err_FIFO_empty => err_FIFO_empty, 
                                                              err_FIFO_empty1 => err_FIFO_empty1, 
                                                              err_FIFO_full => err_FIFO_full, 
                                                              err_FIFO_read_pointer_onehot => err_FIFO_read_pointer_onehot,
                                                              err_FIFO_write_pointer_onehot => err_FIFO_write_pointer_onehot, 
                                                              err_FIFO_HS_state_onehot => err_FIFO_HS_state_onehot, 
                                                              err_FIFO_read_en_onehot => err_FIFO_read_en_onehot, 
                                                              err_FIFO_read_from_empty_FIFO => err_FIFO_read_from_empty_FIFO, 
                                                              err_FIFO_write_to_full_FIFO => err_FIFO_write_to_full_FIFO, 
                                                              err_FIFO_control_part_CTS_in_CTS_out => err_FIFO_control_part_CTS_in_CTS_out, 
                                                              err_FIFO_read_en_empty => err_FIFO_read_en_empty,
                                                              err_FIFO_read_en_empty1 => err_FIFO_read_en_empty1
                                                             );


   process (clk, reset)begin
        if reset = '0' then
            HS_state_out <= IDLE;
            read_pointer <= "0001";
            write_pointer <= "0001";
            CTS_out<='0';

            FIFO_MEM_1 <= (others=>'0');
            FIFO_MEM_2 <= (others=>'0');
            FIFO_MEM_3 <= (others=>'0');
            FIFO_MEM_4 <= (others=>'0');

        elsif clk'event and clk = '1' then
            HS_state_out <= HS_state_in;
            write_pointer <= write_pointer_in;
            if write_en = '1' then
                --write into the memory
                  FIFO_MEM_1 <= FIFO_MEM_1_in;
                  FIFO_MEM_2 <= FIFO_MEM_2_in;
                  FIFO_MEM_3 <= FIFO_MEM_3_in;
                  FIFO_MEM_4 <= FIFO_MEM_4_in;                   
            end if;
            read_pointer <=  read_pointer_in;
            CTS_out<=CTS_in;
        end if;
    end process;

 -- anything below here is pure combinational
 
   -- combinatorial part
   process(RX, write_pointer, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4)begin
      case( write_pointer ) is
          when "0001" => FIFO_MEM_1_in <= RX;         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
          when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= RX;         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
          when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= RX;         FIFO_MEM_4_in <= FIFO_MEM_4; 
          when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= RX;                  
          when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4; 
      end case ;
   end process;

   process(read_pointer, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4)begin
        case( read_pointer ) is
          when "0001" => Data_out <= FIFO_MEM_1;
          when "0010" => Data_out <= FIFO_MEM_2;
          when "0100" => Data_out <= FIFO_MEM_3;
          when "1000" => Data_out <= FIFO_MEM_4;
          when others => Data_out <= FIFO_MEM_1; 
        end case ;
   end process;

   read_en <= (read_en_N or read_en_E or read_en_W or read_en_S or read_en_L) and not empty; 
   empty_out <= empty;
   CTS <= CTS_out;

   process(write_en, write_pointer)begin
     if write_en = '1'then
        write_pointer_in <= write_pointer(2 downto 0)&write_pointer(3); 
     else
        write_pointer_in <= write_pointer; 
     end if;
   end process;

   process(read_en, empty, read_pointer)begin
        if (read_en = '1' and empty = '0') then
            read_pointer_in <= read_pointer(2 downto 0)&read_pointer(3); 
        else 
            read_pointer_in <= read_pointer; 
        end if;
   end process;

   process(HS_state_out, full, DRTS, CTS_out) begin
        case(HS_state_out) is
            when IDLE =>
                if CTS_out = '0' and DRTS = '1' and full ='0' then
                    HS_state_in <= READ_DATA;
                    CTS_in <= '1';
                    write_en <= '1';
                else
                    HS_state_in <= IDLE;
                    CTS_in <= '0';
                    write_en <= '0';
                end if;
            when others => -- READ_DATA
                if CTS_out = '0' and DRTS = '1' and full ='0' then
                    HS_state_in <= READ_DATA;
                    CTS_in <= '1';
                    write_en <= '1';
                else
                    HS_state_in <= IDLE;
                    CTS_in <= '0';
                    write_en <= '0';
                end if;
        end case ;
        
   end process;
                        
    process(write_pointer, read_pointer) begin
        if read_pointer = write_pointer  then
                empty <= '1';
            else
                empty <= '0';
            end if;
--      if write_pointer = read_pointer>>1 then
	if write_pointer = read_pointer(0)&read_pointer(3 downto 1) then
                full <= '1';
            else
                full <= '0'; 
            end if; 

    end process;

end;
