
#    The idea here is to make some lists of the necessary files for each scenario
#    in order to make the code a little more organized!


#---------------------------------------------------------
#
#        Credit based related files
#
#---------------------------------------------------------

# Files for the base-line credit based router!
credit_based_files = ["arbiter_in.vhd", "arbiter_out.vhd", "allocator.vhd", "LBDR.vhd",
                      "xbar.vhd", "FIFO_one_hot_credit_based.vhd"]
credit_based_files_verilog = ["Verilog/arbiter_in.sv",  "Verilog/arbiter_out.sv", "Verilog/allocator.sv", "Verilog/LBDR.sv",
                              "Verilog/xbar.sv", "Verilog/FIFO_one_hot_credit_based.sv"]

# Files for the credit based router equipped with packet-drop mechanism and Fault Classifier!
credit_based_files_PD_FC = ["arbiter_in.vhd", "arbiter_out.vhd", "allocator.vhd", "LBDR_packet_drop.vhd",
                            "xbar.vhd", "FIFO_one_hot_credit_based_packet_drop_classifier_support.vhd",
							              "counter_threshold.vhd"]

# Files for the credit based router equipped with packet-drop mechanism!
credit_based_files_PD = ["arbiter_in.vhd", "arbiter_out.vhd", "allocator.vhd", "LBDR_packet_drop.vhd",
                         "xbar.vhd", "FIFO_one_hot_credit_based_packet_drop.vhd"]

# Files for the credit based router equipped with packet-saving mechanism!
credit_based_files_PS = ["arbiter_in.vhd", "arbiter_out.vhd", "allocator.vhd", "LBDR_packet_drop.vhd",
                         "xbar.vhd", "FIFO_one_hot_credit_based_packet_drop_flit_saving.vhd"]

#TODO: needs to be tested:
credit_based_files_SHMU = ["allocator.vhd", "arbiter_in.vhd", "arbiter_out.vhd", "counter_threshold.vhd",
						   "FIFO_one_hot_credit_based_packet_drop_classifier_support.vhd", "LBDR_packet_drop.vhd", "NI.vhd",
						   "Router_32_bit_credit_based_packet_drop_classifier_SHMU.vhd", "xbar.vhd"]

credit_based_files_NI_Test = ["mlite_pack.vhd", "allocator.vhd", "arbiter_in.vhd", "arbiter_out.vhd", "counter_threshold.vhd", "ParityChecker_for_LBDR.vhd",
                              "FIFO_one_hot_credit_based_packet_drop_classifier_support.vhd", "LBDR_packet_drop.vhd",
                              "NI.vhd", "Router_32_bit_credit_based_packet_drop_classifier_SHMU.vhd", "xbar.vhd"]
#TODO: should add to NI_Test the following file: "TB_Package_32_bit_credit_based_NI.vhd"

# Original Plasma processor files along with the NI and NoC node wrapper!
PE_files = ["mlite_pack.vhd", "memory_sim.vhd", "alu.vhd", "bus_mux.vhd", "cache.vhd",
            "control.vhd", "ddr_ctrl.vhd", "eth_dma.vhd", "mem_ctrl.vhd",
            "mult.vhd", "pc_next.vhd", "pipeline.vhd", "ram.vhd",
            "reg_bank_tri_port.vhd", "shifter.vhd", "uart.vhd", "NI.vhd",
            "mlite_cpu.vhd", "plasma.vhd", "NoC_Node.vhd"]


#---------------------------------------------------------
#
#        Checker's files
#
#---------------------------------------------------------
## CB
CB_Allocator_with_checkers_files = ["Arbiter_in_one_hot_checkers.vhd", "Arbiter_in_one_hot_with_checkers.vhd",
                                    "Arbiter_out_one_hot_pseudo_checkers.vhd", "arbiter_out_one_hot_with_checkers.vhd",
                                    "allocator_logic_pseudo_checkers.vhd", "allocator_credit_counter_logic_pseudo_checkers.vhd",
                                    "allocator_with_checkers.vhd" ]

CB_Allocator_with_checkers_with_FI_files = ["Arbiter_in_one_hot_checkers.vhd", "Arbiter_in_one_hot_with_checkers_with_FI.vhd",
                                            "Arbiter_out_one_hot_pseudo_checkers.vhd", "arbiter_out_one_hot_with_checkers_with_FI.vhd",
                                            "allocator_logic_pseudo_checkers.vhd", "allocator_credit_counter_logic_pseudo_checkers.vhd",
                                            "allocator_with_checkers_with_FI.vhd" ]

CB_FIFO_one_hot_CB_PD_FC_with_checkers_files = ["FIFO_one_hot_credit_based_packet_drop_classifier_support_checkers.vhd",
											                          "FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers.vhd"]

CB_FIFO_one_hot_CB_PD_FC_with_checkers_with_FI_files = ["FIFO_one_hot_credit_based_packet_drop_classifier_support_checkers.vhd",
                                                        "FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers_with_FI.vhd"]

CB_LBDR_PD_with_checkers_files = ["Cx_Reconf_pseudo_checkers.vhd", "Rxy_Reconf_pseudo_checkers.vhd",
                                  "LBDR_packet_drop_routing_part_pseudo_checkers.vhd",
								                  "LBDR_packet_drop_with_checkers.vhd"]

CB_LBDR_PD_with_checkers_with_FI_files = ["Cx_Reconf_pseudo_checkers.vhd", "Rxy_Reconf_pseudo_checkers.vhd",
                                          "LBDR_packet_drop_routing_part_pseudo_checkers.vhd",
                                          "LBDR_packet_drop_with_checkers_with_FI.vhd"]

# HS
HS_Arbiter_one_hot_with_checkers =["Arbiter_checkers.vhd", "Arbiter_one_hot_with_checkers.vhd"]
HS_FIFO_one_hot_with_checkers =["FIFO_control_part_checkers.vhd", "FIFO_one_hot_with_checkers.vhd"]
HS_LBDR_with_checkers =["LBDR_checkers.vhd", "LBDR_with_checkers.vhd"]
