# Use these for switching power report (Only valid for AMS for now).
# set SAIF_FILE_NAME "saif_file_name.saif"
# set INSTANCE_NAME_FOR_SAIF "AXI_OpenRISC_testbench/AXI_OpenRISC_topIns"

report_timing > timing_report.txt
report_area   > area_report.txt

# For now only valid for AMS!
report_power  > power_AMS.txt

# Also store other types of power report, which give you more details of the power consumption of your cicuit , e.g.
# report_power -analysis_effort high -hierarchy -levels 2 > power_switching_activity_hierarchical_AMS.txt

# reading the switching activity file and reporing power (if power analysis based on saif file is used)
# read_saif -input $SAIF_FILE_NAME -instance_name $INSTANCE_NAME_FOR_SAIF 
 
# and then a timing report is always very welcome (reports critical path delay as well)
report_timing -path_type full -max_paths 10 -significant_digits 5 > detailed_timing_report.txt
report_qor    > critical_path_delay_report.txt

write -format verilog -hierarchy -output gate_level_netlist.v
write_sdc sdc_output.sdc
write_sdf sdf_output.sdf

# If only '1' is written to the file, everything is OK!
check_design > summary_error_warning_info.txt
