--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
 use ieee.math_real.all;
 use std.textio.all;
 use ieee.std_logic_misc.all;

package TB_Package is
   procedure NI_control(network_size, frame_length, current_address, initial_delay, min_packet_size, max_packet_size: in integer;
                      finish_time: in time; 
                      signal clk:                      in std_logic;
                      -- NI configuration
                      signal reserved_address :        in std_logic_vector(29 downto 0);
                      signal flag_address :            in std_logic_vector(29 downto 0) ; -- reserved address for the memory mapped I/O
                      signal counter_address :         in std_logic_vector(29 downto 0);
                      signal reconfiguration_address : in std_logic_vector(29 downto 0);  -- reserved address for reconfiguration register
                      signal self_diagnosis_address :  in std_logic_vector(29 downto 0);
                      -- NI signals
                      signal enable:                   out std_logic; 
                      signal write_byte_enable:        out std_logic_vector(3 downto 0);
                      signal address:                  out std_logic_vector(31 downto 2); 
                      signal data_write:               out std_logic_vector(31 downto 0);
                      signal data_read:                out std_logic_vector(31 downto 0));
 
end TB_Package;

package body TB_Package is
  constant Header_type : std_logic_vector := "001";
  constant Body_type : std_logic_vector := "010";
  constant Tail_type : std_logic_vector := "100";


  procedure NI_control(network_size, frame_length, current_address, initial_delay, min_packet_size, max_packet_size: in integer;
                      finish_time: in time; 
                      signal clk:                      in std_logic;
                      -- NI configuration
                      signal reserved_address :        in std_logic_vector(29 downto 0);
                      signal flag_address :            in std_logic_vector(29 downto 0) ; -- reserved address for the memory mapped I/O
                      signal counter_address :         in std_logic_vector(29 downto 0);
                      signal reconfiguration_address : in std_logic_vector(29 downto 0);  -- reserved address for reconfiguration register
                      signal self_diagnosis_address :  in std_logic_vector(29 downto 0);
                      -- NI signals
                      signal enable:                   out std_logic; 
                      signal write_byte_enable:        out std_logic_vector(3 downto 0);
                      signal address:                  out std_logic_vector(31 downto 2); 
                      signal data_write:               out std_logic_vector(31 downto 0);
                      signal data_read:                out std_logic_vector(31 downto 0)) is
    -- variables for random functions
    variable seed1 :positive ;
    variable seed2 :positive ;
    variable rand : real ;
    --file handling variables
    variable SEND_LINEVARIABLE : line; 
    file SEND_FILE : text is out "sent.txt";

    variable RECEIVED_LINEVARIABLE : line; 
    file RECEIVED_FILE : text is out "received.txt";

    variable DIAGNOSIS_LINEVARIABLE : line; 
    file DIAGNOSIS_FILE : text is out "diagnosis.txt";
    -- receiving variables 
    variable receive_source_node, receive_destination_node, receive_packet_id, receive_counter, receive_packet_length: integer;
    variable diagnosis_source_node, diagnosis_destination_node, diagnosis_packet_id, diagnosis_counter, diagnosis_packet_length: integer;
    
    -- sending variables
    variable send_destination_node, send_counter, send_packet_length: integer:= 0;
    type state_type is (Idle, Header_flit, Body_flit, Tail_flit);
    variable  state : state_type;

    variable  frame_starting_delay : integer:= 0;
    variable frame_counter: integer:= 0;

    begin

    enable <= '1';
    state <=  Idle;
    uniform(seed1, seed2, rand);
    frame_starting_delay := integer(((integer(rand*100.0)*(frame_length - 3*Packet_length)))/100);

    while true loop
      
      -- read the flag status
      address <= flag_address;  
      write_byte_enable <= '0000'; -- Is it fine to use ' instead of " ?
      wait until clk'event and clk ='0';

      --flag register is organized like this:
      --       .-------------------------------------------------.
      --       | N2P_empty | P2N_full | self_diagnosis_flag | ...| 
      --       '-------------------------------------------------'
      if read_data(30) = '1' then  -- N2P is not empty, can receive flit
              -- read the received data status
              address <= reserved_address;
              write_byte_enable <= '0000';
              wait until clk'event and clk ='0';

              if (data_read(DATA_WIDTH-1 downto DATA_WIDTH-3) = "001") then -- got header flit
                  receive_packet_length := to_integer(unsigned(data_read(28 downto 17)));
                  receive_destination_node := to_integer(unsigned(data_read(16 downto 13)));
                  receive_source_node := to_integer(unsigned(data_read(12 downto 9)));
                  receive_packet_id := to_integer(unsigned(data_read(8 downto 1)));
                  receive_counter := 1; 
              end if;  

              if  (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) = "010") then  -- got body flit
                  receive_counter := counter+1; 
              end if; 

              if (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) = "100") then -- got tail flit
                  receive_counter := counter+1; 
                  write(RECEIVED_LINEVARIABLE, "Packet received at " & time'image(now) & " From: " & integer'image(receive_source_node) & " to: " & integer'image(receive_destination_node) & " length: "& integer'image(receive_packet_length) & " actual length: "& integer'image(receive_counter)  & " id: "& integer'image(receive_packet_id));
                  writeline(RECEIVED_FILE, RECEIVED_LINEVARIABLE);
              end if;
      elsif read_data(31) = '0' then -- P2N is not full, can send flit
          frame_counter := frame_counter + 1;
          if frame_counter > frame_starting_delay then
              address <= reserved_address;
              write_byte_enable <= '1111';
              if state = Idle then
                  if frame_counter < frame_starting_delay+send_packet_length then
                    state :=  Header_flit;
                    send_counter := send_counter+1;
                    -- generating the destination address
                    uniform(seed1, seed2, rand);
                    send_destination_node := integer(rand*real((network_size**2)-1));
                    while (destination_id = source) loop 
                        uniform(seed1, seed2, rand);
                        send_destination_node := integer(rand*real((network_size**2)-1));
                    end loop;
                    --generating the packet length
                    uniform(seed1, seed2, rand);
                    send_packet_length := integer((integer(rand*100.0)*frame_length)/300);
                    if (send_packet_length < min_packet_size) then 
                        send_packet_length:=min_packet_size;
                    end if;
                    if (send_packet_length > max_packet_size) then 
                        send_packet_length:=max_packet_size;
                    end if;
                    -- this is the header flit
                    data_write <= std_logic_vector(to_unsigned(send_destination_node, 4)) & "0000" & std_logic_vector(to_unsigned(send_packet_length, 8)) & "0000000000000000";
                  else
                    state :=  Idle;
                  end if;
              elsif stat = 'Header_flit' then
                  -- first body flit
                  data_write <= "0000" & std_logic_vector(to_unsigned(integer(rand*1000.0), 28));
                  send_counter := send_counter+1;
                  state :=  Body_flit;
              elsif stat = Body_flit then
                  -- rest of body flits
                  data_write <= "0000" & std_logic_vector(to_unsigned(integer(rand*1000.0), 28));
                  send_counter := send_counter+1;
                  if send_counter = send_packet_length-2 then 
                      state :=  Tail_flit;
                  else
                      state :=  Body_flit;
                  end if;
              elsif stat = Tail_flit then
                  -- tail flit
                  data_write <= "0000" & std_logic_vector(to_unsigned(integer(rand*1000.0), 28));
                  send_counter := 0;
                  state :=  Idle;
              end if;
            end if;
            if frame_counter = frame_length then
                frame_counter:= 0;
                frame_starting_delay := integer(((integer(rand*100.0)*(frame_length - 3*Packet_length)))/100);
            end if;
            wait until clk'event and clk ='0';
      elsif read_data(29) = '1' then  -- self diagnosis data is ready!
              -- read the received self diagnosis data status
              address <= self_diagnosis_address;
              write_byte_enable <= '0000';
              wait until clk'event and clk ='0';

              if (data_read(DATA_WIDTH-1 downto DATA_WIDTH-3) = "001") then -- got header flit
                  diagnosis_packet_length := to_integer(unsigned(data_read(28 downto 17)));
                  diagnosis_destination_node := to_integer(unsigned(data_read(16 downto 13)));
                  diagnosis_source_node := to_integer(unsigned(data_read(12 downto 9)));
                  diagnosis_packet_id := to_integer(unsigned(data_read(8 downto 1)));
                  diagnosis_counter := 1; 
              end if;  

              if  (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) = "010") then  -- got body flit
                  diagnosis_counter := counter+1; 
              end if; 

              if (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) = "100") then -- got tail flit
                  diagnosis_counter := counter+1; 
                  write(DIAGNOSIS_LINEVARIABLE, "Packet received at " & time'image(now) & " From: " & integer'image(diagnosis_source_node) & " to: " & integer'image(diagnosis_destination_node) & " length: "& integer'image(diagnosis_packet_length) & " actual length: "& integer'image(diagnosis_counter)  & " id: "& integer'image(diagnosis_packet_id));
                  writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
              end if;
      end if;

      if now > finish_time then 
          wait; 
      end if;
    end loop;

  end NI_control;


end TB_Package;
