########################################################################
#	Copyright (C) 2016 Siavoosh Payandeh Azad
#
########################################################################
import sys
try:
	report_file = open('report.txt', 'r')
except IOError:
    print "Could not open input report file!"
    sys.exit()

sent_packet_counter = 0
received_packet_counter = 0
diagnostic_packet_counter = 0
file_name = None
statements = None
branches = None

print '%100s' % "file_name", "|\t", '%10s' %"stmts", "|\t", '%10s' %"branches" 
print "----"*33
for line in report_file:	
	if line != '':
		if "File" in line:
			file_name = line.split("/")[-1][:-1]
		if "Stmts" in line:
			statements = line.split()[-1]
		if "Branches" in line:
			branches =  line.split()[-1]
		if branches is not None:
			print '%100s' % file_name, "|\t", '%10s' %statements, "|\t", '%10s' %branches
			file_name = None
			statements = None
			branches = None
report_file.close()
