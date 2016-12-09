import itertools
import sys

if  '--help' in sys.argv[1:]:
	print "\t-IF [input size] [input type]: input format"
	print "\t\t [input size]: an integer that tells the tool about the size of this specific input"
	print "\t\t [input type]: the type of the pattern expected from the script: "
	print "\t\t\t  oh: one-hot "
	print "\t\t\t  z: Zero, these bits stay zero for all patterns "
	print "\t\t\t  ao: all-one, these bits stay one for all patterns "
	print "\t\t\t  we: what-ever, the tool doesnt apply any constriants on the pattern "
	print "\t\t\t  B\"binary string\": should be exactly following this pattern"
	print "\t-o [outputfile_name]: name of the output \".inp\" file, \"test_patterns.inp\" by default"
	print "\t---------------------------------------"
	print "\t***EXAMPLE: python tpg.py -IF 2 oh 1 z  3 oh 5 we -o all_test_patterns.inp "
	print "\t            generates a 2+1+3+5 bit pattern where first two bits are one-hot next 1 bit is constantly zero"
	print "\t            3 next bits are also one hot and next 5 bits will have all the possible combinations "
	print "\t***EXAMPLE 2: python tpg.py -IF 1 z 3 B101 5 we"
	print "\t            generates a 1+3+5 bit pattern in test_patterns.inp where first bit is always zero,"
	print "\t            3 next bits are always \"101\" and next 5 bits will have all the possible combinations "
	print "\t---------------------------------------"
	sys.exit()

if '-o'  in sys.argv[1:]:
  filename = sys.argv[sys.argv.index('-o')+1]
else:
  filename = "test_patterns.inp"

input_size = []
input_format = {}
counter = 0

if '-IF'  in sys.argv[1:]:
	pointer = sys.argv.index('-IF')+1
	while("-" not in sys.argv[pointer]):	
		if not sys.argv[pointer].isdigit():
			raise ValueError("Wrong input size!")
		input_size.append(int(sys.argv[pointer]))
		# print "here:",sys.argv[pointer]
		pointer += 1
		input_format[counter] = []
		while not sys.argv[pointer].isdigit():
			input_format[counter].append(sys.argv[pointer])
			# print "there:", sys.argv[pointer]
			if sys.argv[pointer].isdigit():
				wrong_format = False
			elif sys.argv[pointer] in ["oh", "z", "ao", "we"]:
				wrong_format = False
			elif "B" in sys.argv[pointer]:
				wrong_format = False
			else:
				wrong_format = True
			if wrong_format == True:

				raise ValueError("Wrong input format!")

			pointer += 1
			
			if "-" in sys.argv[pointer]:
				break
			
			if pointer == len(sys.argv): 
				break
		
		counter += 1
		if pointer == len(sys.argv): 
			break
	pattern_length = sum(input_size)
else:
	print "no input patterns provided...Exit!"
	sys.exit()
 
print "input_size:", input_size
print "input_format:", input_format

#test_patern_list = list(itertools.product([0, 1], repeat=pattern_length))
test_patern_file = open(str(filename), 'w')


def is_list_one_hot(binary_list):
	sum = 0
	for item in binary_list:
		sum += item
	if sum == 1:
		return True
	else:
		return False

def is_list_zero(binary_list):
	sum = 0
	for item in binary_list:
		sum += item
	if sum == 0:
		return True
	else:
		return False

def is_list_all_ones(binary_list):
	sum = 0
	for item in binary_list:
		sum += item
	if sum == len(binary_list):
		return True
	else:
		return False

def list_follows_exact_format(binary_list, input_format):
	binary_string = ""
	for item in binary_list:
		binary_string+=str(item)
	if binary_string == input_format:
		return True
	return False


def check_input_format(data, input_format):
	if "we" in input_format:		# What Ever!
		return True
	else:
		if is_list_one_hot(data):
			if "oh" in input_format:
				return True
		if is_list_zero(data):
			if "z" in input_format:
				return True
		if is_list_all_ones(data):
			if "ao" in input_format:
				return True
		for item in input_format:
			if "B" in item:
				if  item[1:].isdigit():
					if list_follows_exact_format(data, item[1:]):
						return True
		return False
		

print "--------------------------------------------------------------------------------"
list_of_accepted_patterns= []
for item in itertools.product([0, 1], repeat=pattern_length):
	#print item
	index = 0
	acceptable = True
	for i in range(0, len(input_size)):
		data = item[index: index+input_size[i]]
		#print data, check_input_format(data, input_format[i]), input_format[i]
		if not check_input_format(data, input_format[i]):
			acceptable = False
 		index += input_size[i]
 	if acceptable:
 		#print item
 		list_of_accepted_patterns.append(item)



test_patern_file.write("\n.VECTORS "+str(len(list_of_accepted_patterns))+"\n\n")
test_patern_file.write("\n.PATTERNS\n\n")
for item in list_of_accepted_patterns:
	string_for_file = ""
	for bit in item:
		string_for_file += str(bit)
	string_for_file += "\n"	
	test_patern_file.write(string_for_file)
test_patern_file.close()
