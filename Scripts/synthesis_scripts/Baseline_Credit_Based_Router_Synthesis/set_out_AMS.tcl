report_timing > time_AMS.txt
report_area   > area_AMS.txt
report_power  > power_AMS.txt
# Also store other types of power report, which give you more details of the power consumption of your cicuit , e.g.
# report_power -analysis_effort high -hierarchy -levels 2 > power_switching_activity_hierarchical_AMS.txt

# reading the switching activity file and reporing power (if power analysis based on saif file is used)
# read_saif -input saif_file_name.saif -instance_name AXI_OpenRISC_testbench/AXI_OpenRISC_topIns 
 
# and then a timing report is always very welcome (reports critical path delay as well)
report_timing -path_type full -max_paths 10 -significant_digits 5 > Detailed_Timing_report_AMS.txt
report_qor    > Critical_path_delay_report_AMS.txt

write -format verilog -hierarchy -output AMS_modax.v
write_sdc AMS_modax.sdc
write_sdf AMS_modax.sdf
