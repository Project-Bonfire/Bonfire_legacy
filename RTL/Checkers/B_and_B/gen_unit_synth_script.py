# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
import package_file


def gen_unit_checker_script(checker_id):

    name_string = ""
    for i in checker_id:
        name_string += str(i)+"_"
    # print name_string[:len(name_string)-1]
    unit_synthesis_script = open("synthesis_scripts/"+package_file.unit_under_test+"_with_checkers_" +
                                 name_string[:len(name_string)-1]+"_synthesis.script", 'w')

    unit_synthesis_script.write("/* Bus Naming variables */\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("bus_naming_style = \"%s<%d>\"\n")
    unit_synthesis_script.write("bus_dimension_separator_style = \"><\"\n")
    unit_synthesis_script.write("bus_range_separator_style = \":\" \n")
    unit_synthesis_script.write("bus_extraction_style = \"%s<%d:%d>\"\n")
    unit_synthesis_script.write(" \n")
    unit_synthesis_script.write("/* Power and Ground variables */\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("edifin_ground_net_name = \"gnd!\"\n")
    unit_synthesis_script.write("edifin_ground_net_property_name = \"\"\n")
    unit_synthesis_script.write("edifin_ground_net_property_value = \"\"\n")
    unit_synthesis_script.write("edifout_ground_name = \"gnd\"\n")
    unit_synthesis_script.write("edifout_ground_net_name = \"gnd!\"\n")
    unit_synthesis_script.write("edifout_ground_net_property_name = \"\"\n")
    unit_synthesis_script.write("edifout_ground_net_property_value = \"\"\n")
    unit_synthesis_script.write("edifout_ground_pin_name = \"gnd!\"\n")
    unit_synthesis_script.write("edifin_power_net_name = \"vdd!\"\n")
    unit_synthesis_script.write("edifin_power_net_property_name = \"\"\n")
    unit_synthesis_script.write("edifin_power_net_property_value = \"\"\n")
    unit_synthesis_script.write("edifout_power_name = \"vdd\"\n")
    unit_synthesis_script.write("edifout_power_net_name = \"vdd!\"\n")
    unit_synthesis_script.write("edifout_power_net_property_name = \"\"\n")
    unit_synthesis_script.write("edifout_power_net_property_value = \"\"\n")
    unit_synthesis_script.write("edifout_power_pin_name = \"vdd!\"\n")
    unit_synthesis_script.write("edifout_power_and_ground_representation = \"net\"\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("/* Net to Port Connection variables */\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("edifin_autoconnect_ports = \"true\"\n")
    unit_synthesis_script.write("compile_fix_multiple_port_nets = \"true\"\n")
    unit_synthesis_script.write("single_group_per_sheet = \"true\"\n")
    unit_synthesis_script.write("use_port_name_for_oscs = \"false\"\n")
    unit_synthesis_script.write("write_name_nets_same_as_ports = \"true\"\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("/* Output variables */\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("edifout_netlist_only = \"true\"\n")
    unit_synthesis_script.write("edifout_instantiate_ports = \"true\"\n")
    unit_synthesis_script.write("edifout_pin_name_propery_name = \"pinName\"\n")
    unit_synthesis_script.write(" \n")
    unit_synthesis_script.write("/* Important! */\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("edifout_numerical_array_members = \"true\" \n")
    unit_synthesis_script.write("edifout_no_array = \"false\"\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("/********************************************/\n")
    unit_synthesis_script.write("/*  Now starts the synthesis:               */\n")
    unit_synthesis_script.write("/********************************************/\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("/* ================================================= */\n")
    unit_synthesis_script.write("/* Don't use the following cells!!                   */\n")
    unit_synthesis_script.write("/* ================================================= */\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("set_dont_use { class/EO, class/EN, class/EOP, class/ENP, class/EO3, class/EN3, "
                                "class/EO3P, class/EN3P, class/EOI, class/ENI, class/FD1S, class/FD2S, class/FD4S, "
                                "class/IVDA, class/IVDAP, class/B2I, class/B2IP, class/B3I, class/B3IP, class/AO4P, "
                                "class/NR*, class/EO1P, class/ND*}\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("analyze -format vhdl "+package_file.module_file_name+"\n")
    unit_synthesis_script.write("analyze -format vhdl "+package_file.unit_under_test.lower()+"_checker" +
                                name_string[:len(name_string)-1]+".vhd\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("analyze -format vhdl "+package_file.unit_under_test.lower()+"_checker" +
                                name_string[:len(name_string)-1]+"_top.vhd\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("elaborate "+package_file.unit_under_test+"_with_checkers_top -update\n")
    unit_synthesis_script.write("current_design = "+package_file.unit_under_test+"_with_checkers_top\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("link\n")
    unit_synthesis_script.write("compile\n")
    unit_synthesis_script.write("\n")
    unit_synthesis_script.write("write -format edif -hierarchy -output " + package_file.unit_under_test +
                                "_with_checkers_top.edif\n")
    unit_synthesis_script.write("report_area > area"+name_string[:len(name_string)-1]+".txt\n")
    unit_synthesis_script.write("exit\n")

    unit_synthesis_script.close()