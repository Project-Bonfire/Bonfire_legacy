########################################################################
#	Copyright (C) 2016 Siavoosh Payandeh Azad
#
########################################################################
import sys

input_file_path = None
if '-i' in sys.argv[1:]:
    input_file_path = sys.argv[sys.argv.index('-i')+1]
    if ".txt" not in input_file_path:
            raise ValueError("Wrong file extention. only .txt files are accepted!")
else:
    raise ValueError("Please provide a valid modelsim coverage report file!")

try:
	report_file = open(input_file_path, 'r')
except IOError:
    print "Could not open input report file!"
    sys.exit()

sent_packet_counter = 0
received_packet_counter = 0
diagnostic_packet_counter = 0
file_name = None
statements = None
branches = None
condition = None
expression = None
states = None
transition = None
toggle = None
def add_color(value):
	if int(float(value)) == 100:
		return '\033[92m' + value + '\033[0m'
	elif int(float(value)) < 50:
		return '\033[31m' + value + '\033[0m'
	elif int(float(value)) > 50 and int(float(value)) != 100:
		return '\033[33m' + value + '\033[0m'
	else:
		return '\033[00m' + value + '\033[0m'

print '%120s' % "", "\t", '%20s' %"FEC" , "\t\t", '%20s' %"FSM"
print '%120s' % "", "\t\t", '%20s' %"---------------------" , "\t\t", '%20s' %"---------------------"

print '%100s' % "file_name", "|\t", '%10s' %"stmts", "|\t", '%10s' %"branches" ,\
	  "|\t", '%10s' %"Condition" , "|\t", '%10s' %"Expression" , "|\t", '%10s' %"States" , "|\t", '%10s' %"Transitions"  , '%10s' %"toggle"
print 8*"\t"+"-------------------------------------|-------------|---------------|---------------|---------------|---------------|---------------|---------------|"
sum_statement = 0
sum_branches = 0
sum_condition = 0
sum_expression = 0
sum_states = 0
sum_transition = 0
sum_toggle = 0
num_of_files = 0
for line in report_file:
	if line != '':
		if "File" in line:
			file_name = line.split("/")[-1][:-1]
		if "Stmts" in line:
			statements = add_color(line.split()[-1])
			sum_statement += int(float(line.split()[-1]))
		if "Branches" in line:
			branches =  add_color(line.split()[-1])
			sum_branches += int(float(line.split()[-1]))
		if "FEC Condition Terms" in line:
			condition =  add_color(line.split()[-1])
			sum_condition += int(float(line.split()[-1]))
		if "FEC Expression Terms" in line:
			expression = add_color(line.split()[-1])
			sum_expression += int(float(line.split()[-1]))
		if "States" in line:
			states =  add_color(line.split()[-1])
			sum_states += int(float(line.split()[-1]))
		if "Transitions" in line:
			transition =  add_color(line.split()[-1])
			sum_transition += int(float(line.split()[-1]))
		if "Toggle" in line:
			toggle =  add_color(line.split()[-1])
			sum_toggle += int(float(line.split()[-1]))

		if toggle is not None:
			print '%100s' % file_name, "|\t", '%19s' %statements, "|\t", '%19s' %branches, "|\t", '%19s' %condition, \
				  "|\t", '%19s' %expression, "|\t", '%19s' %states,  "|\t", '%19s' %transition , "|\t", '%19s' %toggle
			num_of_files += 1.0
			file_name = None
			statements = None
			branches = None
			condition = None
			expression = None
			states = None
			transition = None
			toggle = None
print '%100s' % "", "--------------|"+"---------------|"*6
print '%100s' % "", " \t", '%10s' %"{0:.2f}".format(sum_statement/num_of_files), "|\t", '%10s' %"{0:.2f}".format(sum_branches/num_of_files), \
	  "|\t", '%10s' %"{0:.2f}".format(sum_condition/num_of_files), "|\t", '%10s' %"{0:.2f}".format(sum_expression/num_of_files), "|\t",\
	  '%10s' %"{0:.2f}".format(sum_states/num_of_files),  "|\t", '%10s' %"{0:.2f}".format(sum_transition/num_of_files),\
	  "|\t", '%10s' %"{0:.2f}".format(sum_toggle/num_of_files)
report_file.close()
report_file.close()
