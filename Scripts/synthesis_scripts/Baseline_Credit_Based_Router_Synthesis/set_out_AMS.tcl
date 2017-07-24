report_timing > time_AMS.txt
report_area   > area_AMS.txt
report_power  > power_AMS.txt
# Also store other types of power report, which give you more details of the power consumption of your cicuit , e.g.
# report_power -analysis_effort high -hierarchy -levels 2 > power_hierarchical_AMS.txt

# reading the switching activity file and reporing power 
read_saif -input saif_file_name.saif -instance_name AXI_OpenRISC_testbench/AXI_OpenRISC_topIns
 
report_power -analysis_effort high > output_power_report_log.txt 
 
 
# and then a timing report is always very welcome
report_timing -path_type full -max_paths 10 -significant_digits 5 > timing_power_report.txt
report_qor    > critical_path_delay_AMS.txt

write -format verilog -hierarchy -output AMS_modax.v
write_sdc AMS_modax.sdc
write_sdf AMS_modax.sdf
