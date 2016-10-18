


def gen_customized_router(router_type, router_file):

  router_file.write("--Copyright (C) 2016 Siavoosh Payandeh Azad\n")
  router_file.write("\n")
  router_file.write("library ieee;\n")
  router_file.write("use ieee.std_logic_1164.all;\n")
  router_file.write("use IEEE.STD_LOGIC_ARITH.ALL;\n")
  router_file.write("use IEEE.STD_LOGIC_UNSIGNED.ALL;\n")
  router_file.write("\n")


  if router_type == "":
    router_file.write("entity router_full is\n")
  else:
    router_file.write("entity router_"+str(router_type)+" is\n")
  router_file.write("	generic (\n")
  router_file.write("        DATA_WIDTH: integer := 32;\n")
  router_file.write("        current_address : integer := 0;\n")
  router_file.write("        Rxy_rst : integer := 60;\n")
  router_file.write("        Cx_rst : integer := 10;\n")
  router_file.write("        NoC_size : integer := 4\n")
  router_file.write("    );\n")
  router_file.write("    port (\n")
  router_file.write("    reset, clk: in std_logic;\n")

  router_file.write("\t\t")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      if port == "L":
        router_file.write("DCTS_"+str(port))
      else:
        router_file.write("DCTS_"+str(port)+",")
  router_file.write(": in std_logic;\n")

  router_file.write("\t\t")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      if port == "L":
        router_file.write("DRTS_"+str(port))
      else:
        router_file.write("DRTS_"+str(port)+",")
  router_file.write(": in std_logic;\n")


  router_file.write("\t\t")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      if port == "L":
        router_file.write("RX_"+str(port))
      else:
        router_file.write("RX_"+str(port)+",")
  router_file.write(": in std_logic_vector (DATA_WIDTH-1 downto 0);\n")


  router_file.write("\t\t")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      if port == "L":
        router_file.write("RTS_"+str(port))
      else:
        router_file.write("RTS_"+str(port)+",")
  router_file.write(": out std_logic;\n")

  router_file.write("\t\t")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      if port == "L":
        router_file.write("CTS_"+str(port))
      else:
        router_file.write("CTS_"+str(port)+",")
  router_file.write(": out std_logic;\n")
 
  router_file.write("\t\t")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      if port == "L":
        router_file.write("TX_"+str(port))
      else:
        router_file.write("TX_"+str(port)+",")
  router_file.write(": out std_logic_vector (DATA_WIDTH-1 downto 0)\n")
  router_file.write("    ); \n")
  if router_type == "":
    router_file.write("end router_full;\n")
  else:
    router_file.write("end router_"+str(router_type)+";\n")

  router_file.write("\n")
  if router_type == "":
    router_file.write("architecture behavior of router_full is\n")
  else:
    router_file.write("architecture behavior of router_"+str(router_type)+" is\n")

  router_file.write("\n")
  router_file.write("  COMPONENT FIFO   \n")
  router_file.write(" 	generic (\n")
  router_file.write("        DATA_WIDTH: integer := 32\n")
  router_file.write("    );\n")
  router_file.write("    port (  reset: in  std_logic;\n")
  router_file.write("            clk: in  std_logic;\n")
  router_file.write("            RX: in std_logic_vector (DATA_WIDTH-1 downto 0); \n")
  router_file.write("            DRTS: in std_logic;\n")
  router_file.write("            read_en_N : in std_logic;   \n")
  router_file.write("            read_en_E : in std_logic; \n")
  router_file.write("            read_en_W : in std_logic; \n")
  router_file.write("            read_en_S : in std_logic; \n")
  router_file.write("            read_en_L : in std_logic;\n")
  router_file.write("            CTS: out std_logic;\n")
  router_file.write("            empty_out: out std_logic;\n")
  router_file.write("            Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)\n")
  router_file.write("    );\n")
  router_file.write("	end COMPONENT;\n")
  router_file.write("\n")
  router_file.write("    COMPONENT Arbiter   \n")
  router_file.write(" 	 \n")
  router_file.write("    port (  reset: in  std_logic;\n")
  router_file.write("            clk: in  std_logic;\n")
  router_file.write("            Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic;\n")
  router_file.write("            DCTS: in std_logic;\n")
  router_file.write("            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic;\n")
  router_file.write("            Xbar_sel : out std_logic_vector(4 downto 0);\n")
  router_file.write("            RTS: out std_logic\n")
  router_file.write("            );\n")
  router_file.write("	end COMPONENT;\n")
  router_file.write("\n")
  router_file.write("	COMPONENT LBDR is\n")
  router_file.write("    generic (\n")
  router_file.write("        cur_addr_rst: integer := 0;\n")
  router_file.write("        Rxy_rst: integer := 60;\n")
  router_file.write("        Cx_rst: integer := 8;\n")
  router_file.write("        NoC_size : integer := 4\n")
  router_file.write("    );\n")
  router_file.write("    port (  reset: in  std_logic;\n")
  router_file.write("            clk: in  std_logic;\n")
  router_file.write("            empty: in  std_logic;\n")
  router_file.write("            flit_type: in std_logic_vector(2 downto 0);\n")
  router_file.write("            dst_addr: in std_logic_vector(NoC_size-1 downto 0);\n")
  router_file.write("            Req_N, Req_E, Req_W, Req_S, Req_L:out std_logic\n")
  router_file.write("            );\n")
  router_file.write("	end COMPONENT;\n")
  router_file.write("\n")
  router_file.write(" 	COMPONENT XBAR is\n")
  router_file.write("    generic (\n")
  router_file.write("        DATA_WIDTH: integer := 32\n")
  router_file.write("    );\n")
  router_file.write("    port (\n")
  router_file.write("        North_in: in std_logic_vector(DATA_WIDTH-1 downto 0);\n")
  router_file.write("        East_in: in std_logic_vector(DATA_WIDTH-1 downto 0);\n")
  router_file.write("        West_in: in std_logic_vector(DATA_WIDTH-1 downto 0);\n")
  router_file.write("        South_in: in std_logic_vector(DATA_WIDTH-1 downto 0);\n")
  router_file.write("        Local_in: in std_logic_vector(DATA_WIDTH-1 downto 0);\n")
  router_file.write("        sel: in std_logic_vector (4 downto 0);\n")
  router_file.write("        Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)\n")
  router_file.write("    );\n")
  router_file.write("	end COMPONENT;\n")
  router_file.write("\n")

  router_file.write("\tsignal ")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      if port == "L":
        router_file.write("FIFO_D_out_"+str(port)) 
      else:
        router_file.write("FIFO_D_out_"+str(port)+", ")
  router_file.write(": std_logic_vector(DATA_WIDTH-1 downto 0);\n")

  router_file.write("\n")
  router_file.write("  -- Grant_XY : Grant signal generated from Arbiter for output X connected to FIFO of input Y\n")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
        router_file.write("\tsignal Grant_"+str(port)+"N, Grant_"+str(port)+"E, Grant_"+str(port)+"W, Grant_"+str(port)+"S, Grant_"+str(port)+"L: std_logic;\n")

  router_file.write("\n")   
  router_file.write("  -- Req_XY : Request signal generated from LBDR of input X connected to Arbiter of output Y\n")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
        router_file.write("\tsignal Req_"+str(port)+"N, Req_"+str(port)+"E, Req_"+str(port)+"W, Req_"+str(port)+"S, Req_"+str(port)+"L: std_logic;\n")  

  router_file.write("\n") 

  router_file.write("\tsignal ")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      if port == "L":
        router_file.write("empty_"+str(port)) 
      else:
        router_file.write("empty_"+str(port)+", ")
  router_file.write(": std_logic;\n")


  router_file.write("\n") 
  router_file.write("\tsignal ")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      if port == "L":
        router_file.write("Xbar_sel_"+str(port)) 
      else:
        router_file.write("Xbar_sel_"+str(port)+", ")
  router_file.write(": std_logic_vector(4 downto 0);\n")

  
  router_file.write("\n")
  router_file.write("begin\n")
  router_file.write("	\n")
  router_file.write("------------------------------------------------------------------------------------------------------------------------------\n")
  router_file.write("--                                      block diagram of one channel\n")
  router_file.write("--\n")
  router_file.write("--                                     .____________grant_________     \n")
  router_file.write("--                                     |                          ^\n")
  router_file.write("--                                     |     _______            __|_______        \n")
  router_file.write("--                                     |    |       |          |          |      \n")
  router_file.write("--                                     |    | LBDR  |---req--->|  Arbiter | <--handshake-->                       \n")
  router_file.write("--                                     |    |_______|          |__________|     signals         \n")
  router_file.write("--                                     |       ^                  |\n")
  router_file.write("--                                   __v___    | flit          ___v__  \n")
  router_file.write("--                         RX ----->|      |   | type         |      |        \n")
  router_file.write("--                     <-handshake->| FIFO |---o------------->|      |-----> TX\n")
  router_file.write("--                        signals   |______|           ------>|      |\n")
  router_file.write("--                                                     ------>| XBAR |        \n")
  router_file.write("--                                                     ------>|      |        \n")
  router_file.write("--                                                     ------>|      |        \n")
  router_file.write("--                                                            |______|        \n")
  router_file.write("--                    \n")
  router_file.write("------------------------------------------------------------------------------------------------------------------------------\n")
  router_file.write("------------------------------------------------------------------------------------------------------------------------------\n")
  router_file.write("\n")
  router_file.write("-- all the FIFOs\n")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      router_file.write(" FIFO_"+str(port)+": FIFO generic map (DATA_WIDTH  => DATA_WIDTH)\n")
      router_file.write("   PORT MAP (reset => reset, clk => clk, RX => RX_"+str(port)+", DRTS => DRTS_"+str(port)+", \n")
      router_file.write("\t\t\t\t")
      for source_port in ["N", "E", "W", "S", "L"]:
        if port != source_port: 
          if source_port not in router_type:
            router_file.write("read_en_"+str(source_port)+" => Grant_"+str(source_port)+str(port)+", ")
          else:
            router_file.write("read_en_"+str(source_port)+" => '0', ")
        else:
          router_file.write("read_en_"+str(source_port)+" => '0', ")
      router_file.write("\n")    
      router_file.write("   			CTS => CTS_"+str(port)+", empty_out => empty_"+str(port)+", Data_out => FIFO_D_out_"+str(port)+");      \n")

  router_file.write("------------------------------------------------------------------------------------------------------------------------------\n")
  router_file.write("------------------------------------------------------------------------------------------------------------------------------\n")
  router_file.write("------------------------------------------------------------------------------------------------------------------------------\n")
  router_file.write("\n")
  router_file.write("-- all the LBDRs\n")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      router_file.write("LBDR_"+str(port)+": LBDR generic map (cur_addr_rst => current_address, Rxy_rst => Rxy_rst, Cx_rst => Cx_rst, NoC_size => NoC_size)\n")
      router_file.write("	   PORT MAP (reset => reset, clk => clk, empty => empty_"+str(port)+", flit_type => FIFO_D_out_"+str(port)+"(DATA_WIDTH-1 downto DATA_WIDTH-3), dst_addr=> FIFO_D_out_"+str(port)+"(DATA_WIDTH-19+NoC_size-1 downto DATA_WIDTH-19) ,\n")
      router_file.write("   		 	 Req_N=> Req_"+str(port)+"N, Req_E=>Req_"+str(port)+"E, Req_W=>Req_"+str(port)+"W, Req_S=>Req_"+str(port)+"S, Req_L=>Req_"+str(port)+"L);\n")
      router_file.write("\n")
   
  router_file.write("------------------------------------------------------------------------------------------------------------------------------\n")
  router_file.write("------------------------------------------------------------------------------------------------------------------------------\n")
  router_file.write("------------------------------------------------------------------------------------------------------------------------------\n")
  router_file.write("\n")
  router_file.write("-- all the Arbiters\n")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      router_file.write("Arbiter_"+str(port)+": Arbiter \n")
      router_file.write("   PORT MAP (reset => reset, clk => clk,\n")
      router_file.write("\t\t\t\t")
      for source_port in ["N", "E", "W", "S", "L"]:
        if port != source_port: 
          if source_port not in router_type:
            router_file.write("Req_"+str(source_port)+" => Req_"+str(source_port)+str(port)+", ")
          else:
            router_file.write("Req_"+str(source_port)+" => '0', ")
        else:
          router_file.write("Req_"+str(source_port)+" => '0', ")
      router_file.write("\n")
      router_file.write("        DCTS => DCTS_"+str(port)+",\n")
      router_file.write("\t\t\t\t")
      for source_port in ["N", "E", "W", "S", "L"]:
        router_file.write("Grant_"+str(source_port)+" => Grant_"+str(port)+str(source_port)+", ")  
      router_file.write("\n")    
      router_file.write("          Xbar_sel => Xbar_sel_"+str(port)+", \n")
      router_file.write("          RTS =>  RTS_"+str(port)+"\n")
      router_file.write("        );     \n")

  
  router_file.write("------------------------------------------------------------------------------------------------------------------------------\n")
  router_file.write("------------------------------------------------------------------------------------------------------------------------------\n")
  router_file.write("------------------------------------------------------------------------------------------------------------------------------\n")
  router_file.write("\n")
  router_file.write("-- all the Xbars\n")
  for port in ["N", "E", "W", "S", "L"]:
    if port not in router_type:
      router_file.write("XBAR_"+str(port)+": XBAR generic map (DATA_WIDTH  => DATA_WIDTH)\n")
      if "N" in router_type:
        router_file.write("   PORT MAP (North_in =>(others =>'0'), ")
      else:
        router_file.write("   PORT MAP (North_in => FIFO_D_out_N, ")

      if "E" in router_type:
         router_file.write("East_in =>(others =>'0'), ")
      else:
        router_file.write("East_in =>FIFO_D_out_E, ")

      if "W" in router_type:
         router_file.write("West_in =>(others =>'0'), ")
      else:
        router_file.write("West_in =>FIFO_D_out_W, ")

      if "S" in router_type:
         router_file.write("South_in =>(others =>'0'), ")
      else:
        router_file.write("South_in =>FIFO_D_out_S, ")

      if "L" in router_type:
         router_file.write("Local_in =>(others =>'0'), \n")
      else:
        router_file.write("Local_in => FIFO_D_out_L, \n")

      router_file.write("        sel => Xbar_sel_"+str(port)+",  Data_out=> TX_"+str(port)+");\n")
      router_file.write("\n")
  router_file.write("end;\n")
  router_file.write("\n")
  return None

for type in ["N", "E", "W", "S", "NW", "NE", "SW", "SE", ""]:
  if type == "":
    router_file = open('router_full.vhd', 'w')
  else:
    router_file = open('router_'+str(type)+'.vhd', 'w')
  gen_customized_router(type, router_file)
  router_file.close()
