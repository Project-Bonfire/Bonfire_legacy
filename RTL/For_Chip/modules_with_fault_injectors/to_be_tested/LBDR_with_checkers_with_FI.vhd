--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity LBDR is
    generic (
        cur_addr_rst: integer := 5;
        Rxy_rst: integer := 60;
        Cx_rst: integer := 15;
        NoC_size: integer := 4
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            Req_N, Req_E, Req_W, Req_S, Req_L:out std_logic; 
            -- fault injector signals
            shift: in std_logic;
            fault_clk: in std_logic;
            data_in_serial: in std_logic;
            data_out_serial: out std_logic;
            -- Checker outputs
            --err_header_not_empty_Requests_in_onehot, 
            err_header_empty_Requests_FF_Requests_in, 
            err_tail_Requests_in_all_zero, 
            err_header_tail_Requests_FF_Requests_in, 
            err_dst_addr_cur_addr_N1,
            err_dst_addr_cur_addr_not_N1,
            err_dst_addr_cur_addr_E1,
            err_dst_addr_cur_addr_not_E1,
            err_dst_addr_cur_addr_W1,
            err_dst_addr_cur_addr_not_W1,
            err_dst_addr_cur_addr_S1,
            err_dst_addr_cur_addr_not_S1, 
            err_dst_addr_cur_addr_not_Req_L_in, 
            err_dst_addr_cur_addr_Req_L_in, 
            err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in : out std_logic
           );
end LBDR;

architecture behavior of LBDR is

  signal Cx:  std_logic_vector(3 downto 0);
  signal Rxy:  std_logic_vector(7 downto 0);
  signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);  
  signal N1, E1, W1, S1  :std_logic := '0';  
  signal Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: std_logic;
  signal Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: std_logic;
  signal empty_sig, empty_faulty: std_logic;
  -- New signals used for integration of FI(s) in LBDR module
  signal flit_type_sig, flit_type_faulty: std_logic_vector (2 downto 0);
  signal dst_addr_sig, dst_addr_faulty: std_logic_vector (NoC_size-1 downto 0);

empty_sig <= empty;
flit_type_sig <= flit_type;
dst_addr_sig <= dst_addr;

component LBDR_checkers is
  generic (
        cur_addr_rst: integer := 5;
        NoC_size: integer := 4
    );
    port (  empty: in std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;
            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: in std_logic;
            N1_out, E1_out, W1_out, S1_out: in std_logic;
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);

            -- Checker outputs
            --err_header_not_empty_Requests_in_onehot, 
            err_header_empty_Requests_FF_Requests_in, 
            err_tail_Requests_in_all_zero, 
            err_header_tail_Requests_FF_Requests_in, 
            err_dst_addr_cur_addr_N1,
            err_dst_addr_cur_addr_not_N1,
            err_dst_addr_cur_addr_E1,
            err_dst_addr_cur_addr_not_E1,
            err_dst_addr_cur_addr_W1,
            err_dst_addr_cur_addr_not_W1,
            err_dst_addr_cur_addr_S1,
            err_dst_addr_cur_addr_not_S1, 
            err_dst_addr_cur_addr_not_Req_L_in, 
            err_dst_addr_cur_addr_Req_L_in, 
            err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in : out std_logic
            );
end component;

component fault_injector is 
  generic(DATA_WIDTH : integer := 7);
  port(
    data_in: in std_logic_vector (DATA_WIDTH-1 downto 0);
    address: in std_logic_vector(integer(ceil(log2(real(DATA_WIDTH))))-1 downto 0);
    sta_0: in std_logic;
    sta_1: in std_logic;
    data_out: out std_logic_vector (DATA_WIDTH-1 downto 0)
    );
end component;

component shift_register_serial_in is
    generic (
        REG_WIDTH: integer := 8
    );
    port (
        clk, reset : in std_logic;
        shift: in std_logic;
        data_in_serial: in std_logic;
        data_out_parallel: out std_logic_vector(REG_WIDTH-1 downto 0);
        data_out_serial: out std_logic
    );
end component;

signal FI_add_sta: std_logic_vector(12 downto 0); -- 8 bits for 8 inputs (empty (1 bit), flit_type (3 bits) and dst_addr (4 bits))
                                                  -- 3 bits for fault injection location address (ceil of log2(7) = 3)
                                                  -- 2 bits for type of fault (SA0 or SA1)
signal faulty_inputs: std_logic_vector(7 downto 0); -- 8 bits for 8 inputs (with one fault injected in one of them)

begin 

FI: fault_injector generic map(DATA_WIDTH => 8) 
           port map (data_in=> FI_add_sta(12 downto 5) , address=> FI_add_sta(4 downto 2), sta_0=> FI_add_sta(1), sta_1=> FI_add_sta(0), data_out => faulty_inputs
            );

-- Extracting faulty values for input signals
empty_faulty <= faulty_inputs(7);
flit_type_faulty <= faulty_inputs (6 downto 4);
dst_addr_faulty <= faulty_inputs (3 downto 0);

SR: shift_register_serial_in generic map(REG_WIDTH => 7)
          port map( clk=> fault_clk, reset=>reset, shift=> shift,data_in_serial=> data_in_serial, 
                data_out_parallel=> FI_add_sta, data_out_serial=> data_out_serial
              );


  Cx       <= std_logic_vector(to_unsigned(Cx_rst, Cx'length));
  Rxy      <= std_logic_vector(to_unsigned(Rxy_rst, Rxy'length));
  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));

  N1 <= '1' when  dst_addr_faulty(NoC_size-1 downto NoC_size/2) < cur_addr(NoC_size-1 downto NoC_size/2) else '0';
  E1 <= '1' when  cur_addr((NoC_size/2)-1 downto 0) < dst_addr_faulty((NoC_size/2)-1 downto 0) else '0';
  W1 <= '1' when  dst_addr_faulty((NoC_size/2)-1 downto 0) < cur_addr((NoC_size/2)-1 downto 0) else '0';
  S1 <= '1' when  cur_addr(NoC_size-1 downto NoC_size/2) < dst_addr_faulty(NoC_size-1 downto NoC_size/2) else '0';

LBDRCHECKERS: LBDR_checkers generic map (cur_addr_rst => cur_addr_rst, NoC_size => NoC_size)
                            port map (
                                      -- the non-faulty values of inputs go to checkers (according to the ReCoSoC, Euromicro DSD and NOCS papers ??)
                                      empty_sig => empty_sig, 
                                      flit_type_sig => flit_type_sig, 
                                      Req_N_FF  => Req_N_FF, 
                                      Req_E_FF  => Req_E_FF, 
                                      Req_W_FF  => Req_W_FF, 
                                      Req_S_FF  => Req_S_FF,
                                      Req_L_FF  => Req_L_FF,
                                      Req_N_in  => Req_N_in, 
                                      Req_E_in  => Req_E_in, 
                                      Req_W_in  => Req_W_in, 
                                      Req_S_in  => Req_S_in, 
                                      Req_L_in  => Req_L_in, 
                                      N1_out    => N1, 
                                      E1_out    => E1,
                                      W1_out    => W1,
                                      S1_out    => S1,
                                      dst_addr_sign  => dst_addr_sig,

                                      err_header_empty_Requests_FF_Requests_in => err_header_empty_Requests_FF_Requests_in,
                                      err_tail_Requests_in_all_zero => err_tail_Requests_in_all_zero,
                                      err_header_tail_Requests_FF_Requests_in => err_header_tail_Requests_FF_Requests_in,
                                      err_dst_addr_cur_addr_N1 => err_dst_addr_cur_addr_N1,
                                      err_dst_addr_cur_addr_not_N1 => err_dst_addr_cur_addr_not_N1,
                                      err_dst_addr_cur_addr_E1 => err_dst_addr_cur_addr_E1,
                                      err_dst_addr_cur_addr_not_E1 => err_dst_addr_cur_addr_not_E1,
                                      err_dst_addr_cur_addr_W1 => err_dst_addr_cur_addr_W1,
                                      err_dst_addr_cur_addr_not_W1 => err_dst_addr_cur_addr_not_W1,
                                      err_dst_addr_cur_addr_S1 => err_dst_addr_cur_addr_S1,
                                      err_dst_addr_cur_addr_not_S1 => err_dst_addr_cur_addr_not_S1,
                                      err_dst_addr_cur_addr_not_Req_L_in => err_dst_addr_cur_addr_not_Req_L_in,
                                      err_dst_addr_cur_addr_Req_L_in => err_dst_addr_cur_addr_Req_L_in,
                                      err_header_not_empty_Req_N_in => err_header_not_empty_Req_N_in,
                                      err_header_not_empty_Req_E_in => err_header_not_empty_Req_E_in,
                                      err_header_not_empty_Req_W_in => err_header_not_empty_Req_W_in,
                                      err_header_not_empty_Req_S_in => err_header_not_empty_Req_S_in
                                     );

process(clk, reset)
begin
if reset = '0' then 
  Req_N_FF <= '0';
  Req_E_FF <= '0';
  Req_W_FF <= '0';
  Req_S_FF <= '0';
  Req_L_FF <= '0';

elsif clk'event and clk = '1' then 
  Req_N_FF <= Req_N_in;
  Req_E_FF <= Req_E_in;
  Req_W_FF <= Req_W_in;
  Req_S_FF <= Req_S_in;
  Req_L_FF <= Req_L_in;
end if;
end process;
 
-- The combionational part

Req_N <= Req_N_FF;
Req_E <= Req_E_FF;
Req_W <= Req_W_FF;
Req_S <= Req_S_FF;
Req_L <= Req_L_FF;

process(N1, E1, W1, S1, Rxy, Cx, flit_type_faulty, empty_faulty, Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF) begin
 if flit_type_faulty = "001" and empty_faulty = '0' then
        Req_N_in <= ((N1 and not E1 and not W1) or (N1 and E1 and Rxy(0)) or (N1 and W1 and Rxy(1))) and Cx(0);
        Req_E_in <= ((E1 and not N1 and not S1) or (E1 and N1 and Rxy(2)) or (E1 and S1 and Rxy(3))) and Cx(1);
        Req_W_in <= ((W1 and not N1 and not S1) or (W1 and N1 and Rxy(4)) or (W1 and S1 and Rxy(5))) and Cx(2);
        Req_S_in <= ((S1 and not E1 and not W1) or (S1 and E1 and Rxy(6)) or (S1 and W1 and Rxy(7))) and Cx(3);
        Req_L_in <= not N1 and not E1 and not W1 and not S1;

  elsif flit_type_faulty = "100" then
        Req_N_in <= '0';
        Req_E_in <= '0';
        Req_W_in <= '0';
        Req_S_in <= '0';
        Req_L_in <= '0';

  else
        Req_N_in <= Req_N_FF;
        Req_E_in <= Req_E_FF;
        Req_W_in <= Req_W_FF;
        Req_S_in <= Req_S_FF;
        Req_L_in <= Req_L_FF;
  end if;
end process;
   
END;