report_timing > time_AMS.txt
report_area   > area_AMS.txt
report_power  > power_AMS.txt
report_qor    > critical_path_delay_AMS.txt

write -format verilog -hierarchy -output AMS_modax.v
write_sdc AMS_modax.sdc
write_sdf AMS_modax.sdf
