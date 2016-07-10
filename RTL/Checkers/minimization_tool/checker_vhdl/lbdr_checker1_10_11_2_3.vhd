
library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity LBDR_checkers is
	generic (
        cur_addr_rst: integer := 5;
        NoC_size: integer := 4
    );
    port (  empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;
            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: in std_logic;
            N1_out, E1_out, W1_out, S1_out: in std_logic;
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);

            -- Checker outputs
err_header_not_empty_Requests_in_onehot,
err_header_empty_Requests_FF_Requests_in,
err_tail_Requests_in_all_zero,
err_dst_addr_cur_addr_not_W1,
err_dst_addr_cur_addr_S1 : out std_logic
            );
end LBDR_checkers;

architecture behavior of LBDR_checkers is

signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);  
signal Requests_FF: std_logic_vector(4 downto 0);
signal Requests_in: std_logic_vector(4 downto 0);

begin 

  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));

  Requests_FF <= Req_N_FF & Req_E_FF & Req_W_FF & Req_S_FF & Req_L_FF;
  Requests_in <= Req_N_in & Req_E_in & Req_W_in & Req_S_in & Req_L_in;

-- Implementing checkers in form of concurrent assignments (combinational assertions)
 
process (flit_type, empty, Requests_in) 
begin 
    if (flit_type = "001" and empty = '0' and Requests_in /= "00001" and Requests_in /= "00010" and Requests_in /= "00100" and 
        Requests_in /= "01000" and Requests_in /= "10000") then 
        err_header_not_empty_Requests_in_onehot <= '1'; 
    else  
        err_header_not_empty_Requests_in_onehot <= '0'; 
    end if; 
end process; 
 
process (flit_type, empty, Requests_FF, Requests_in) 
begin 
    if (flit_type = "001" and empty = '1' and Requests_FF /= Requests_in) then 
        err_header_empty_Requests_FF_Requests_in <= '1'; 
    else  
        err_header_empty_Requests_FF_Requests_in <= '0'; 
    end if; 
end process; 
 
process (flit_type, Requests_in) 
begin 
    if (flit_type = "100" and Requests_in /= "00000") then 
        err_tail_Requests_in_all_zero <= '1'; 
    else  
        err_tail_Requests_in_all_zero <= '0'; 
    end if; 
end process; 
 
process (cur_addr, dst_addr, W1_out) 
begin 
    if ( dst_addr((NoC_size/2)-1 downto 0) >= cur_addr((NoC_size/2)-1 downto 0) and W1_out = '1') then 
        err_dst_addr_cur_addr_not_W1 <= '1'; 
    else  
        err_dst_addr_cur_addr_not_W1 <= '0'; 
    end if; 
end process; 
 
process (cur_addr, dst_addr, S1_out) 
begin 
    if ( cur_addr(NoC_size-1 downto NoC_size/2) < dst_addr(NoC_size-1 downto NoC_size/2) and S1_out = '0') then 
        err_dst_addr_cur_addr_S1 <= '1'; 
    else  
        err_dst_addr_cur_addr_S1 <= '0'; 
    end if; 
end process; 
 

end behavior;

