analyze -library WORK -format vhdl {../RTL/Router/credit_based/RTL/xbar.vhd ../RTL/Router/credit_based/RTL/LBDR.vhd ../RTL/Router/credit_based/RTL/FIFO_one_hot_credit_based.vhd ../RTL/Router/credit_based/RTL/arbiter_out.vhd ../RTL/Router/credit_based/RTL/arbiter_in.vhd ../RTL/Router/credit_based/RTL/allocator.vhd ../RTL/Router/credit_based/RTL/Router_32_bit_credit_based.vhd}

elaborate ROUTER_CREDIT_BASED -architecture BEHAVIOR -library DEFAULT -parameters "DATA_WIDTH = 32, current_address = 5, Cx_rst = 15, NoC_size = 4"

link
uniquify
