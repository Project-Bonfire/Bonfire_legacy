library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity ELBDR_checkers is
	generic (
        cur_addr_rst: integer := 5;
        NoC_size: integer := 4
    );
    port (  empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            Req_N_in, Req_W_in, Req_S_in, Req_L_in: in std_logic;
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);

            -- Checker outputs
            err_LBDR_Req_onehot, err_LBDR_dst_addr_checker, err_LBDR_Req_tail_allzero, err_LBDR_Req_allzero : out std_logic -- , err_LBDR_Req_not_Local : out std_logic
            );
end ELBDR_checkers;

architecture behavior of ELBDR_checkers is

signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);  

begin 

  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));

-- Implementing checkers in form of concurrent assignments (combinational assertions)

-- If empty is zero (If FIFO is not empty), Request outputs of LBDR must be one-hot
process(flit_type, empty, Req_N_in, Req_W_in, Req_S_in, Req_L_in)begin
    if (flit_type = "010" or flit_type = "001") then
         err_LBDR_Req_onehot <= not ( empty or (
                            ((    Req_N_in) and (not Req_W_in) and (not Req_S_in) and (not Req_L_in)) or 
                            ((not Req_N_in) and (    Req_W_in) and (not Req_S_in) and (not Req_L_in)) or 
                            ((not Req_N_in) and (not Req_W_in) and (    Req_S_in) and (not Req_L_in)) or 
                            ((not Req_N_in) and (not Req_W_in) and (not Req_S_in) and (    Req_L_in))));
    else
        err_LBDR_Req_onehot <= '0';
    end if;
end process;

-- For tail flit, all output requests of LBDR must be zero!
process(flit_type, empty, Req_N_in, Req_W_in, Req_S_in, Req_L_in)begin
    if ( empty = '0' and flit_type = "100" and (Req_N_in = '1' or Req_W_in = '1' or Req_S_in = '1' or Req_L_in = '1') ) then
        err_LBDR_Req_tail_allzero <= '1';
    else 
        err_LBDR_Req_tail_allzero <= '0';
    end if;
end process;

-- If empty is one (If FIFO is empty), all the Request outputs of LBDR must be zero   
err_LBDR_Req_allzero <= empty and (Req_N_in or Req_W_in or Req_S_in or Req_L_in);

-- Checking destination address (Depending on the location of the destination node with respect to the current node, if wrong requests from LBDR
-- go active, there is a fault!)
process (empty, flit_type, dst_addr, Req_N_in, Req_W_in, Req_S_in) -- , Req_L_in)
begin
    -- North
    if (empty = '0') and (flit_type = "001") and (dst_addr = "0001") and (Req_N_in = '0') then 
        err_LBDR_dst_addr_checker <= '1';
    -- West
    elsif (empty = '0') and (flit_type = "001") and (dst_addr = "0000" or dst_addr = "0100" or dst_addr = "1000" or dst_addr = "1100") and (Req_W_in = '0') then 
        err_LBDR_dst_addr_checker <= '1';
    -- South
    elsif (empty = '0') and (flit_type = "001") and (dst_addr = "1001" or dst_addr = "1101") and (Req_S_in = '0') then 
        err_LBDR_dst_addr_checker <= '1';
    else
        err_LBDR_dst_addr_checker <= '0';
    end if;
end process;

end behavior;