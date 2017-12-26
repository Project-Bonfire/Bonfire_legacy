# Copyright (C) 2016 Siavoosh Payandeh Azad

import itertools
import sys

if '--help' in sys.argv[1:]:
    print "welcome to Test Pattern Generator script..."
    print "using this script you can generate complex test patterns for your circuit."
    print "-Copyright (C) 2016 \033[93m\033[4m\033[1mProject Bonfire\033[0m!"
    print "---------------------------------------"
    print "Program arguments:"
    print "\t\033[93m\033[1m -IF\033[0m [input size] [input type]: input format"
    print "\t\t [input size]: an integer that tells the tool about the size of this specific input"
    print "\t\t [input type]: the type of the pattern expected from the script: "
    print "\t\t\t  oh: one-hot "
    print "\t\t\t  z: Zero, these bits stay zero for all patterns "
    print "\t\t\t  ao: all-one, these bits stay one for all patterns "
    print "\t\t\t  we: what-ever, the tool doesnt apply any constraints on the pattern "
    print "\t\t\t  B\"binary string\": should be exactly following this pattern"
    print "\t\t  you can stack up several of these types. see example 3!"
    print "\t\033[93m\033[1m-V\033[0m will be printing more info... "
    print "\t\033[93m\033[1m-o\033[0m [outputfile_name]: name of the output \".inp\" file, \"" \
          "test_patterns.inp\" by default"
    print "\t---------------------------------------"
    print "\t\033[94m\033[1m* EXAMPLE 1:\033[0m python tpg.py -IF 2 oh 1 z  3 oh 5 we -o all_test_patterns.inp "
    print "\t             generates a 2+1+3+5 bit pattern where first two bits are one-hot next 1 bit is " \
          "constantly zero"
    print "\t             3 next bits are also one hot and next 5 bits will have all the possible combinations "
    print "\t\033[94m\033[1m* EXAMPLE 2:\033[0m python tpg.py -IF 1 z 3 B101 5 we"
    print "\t             generates a 1+3+5 bit pattern in test_patterns.inp where first bit is always zero,"
    print "\t             3 next bits are always \"101\" and next 5 bits will have all the possible combinations "
    print "\t\033[94m\033[1m* EXAMPLE 3:\033[0m python tpg.py -IF 1 z 3 B101 oh 5 we"
    print "\t             generates a 1+3+5 bit pattern in test_patterns.inp where first bit is always zero,"
    print "\t             3 next bits are always \"101\" \033[93m\033[1m\033[4mor\033[0m \"one-hot\" and next " \
          "5 bits will have all the possible combinations "
    print "\t---------------------------------------"
    sys.exit()

input_format_name = {'z': "Zero",
                     'oh': "One Hot",
                     'ao': "All One",
                     'we': "what ever",
                     'B': "binary"
                     }
if '-o' in sys.argv[1:]:
    filename = sys.argv[sys.argv.index('-o') + 1]
else:
    filename = "test_patterns.inp"

input_size = []
input_format = {}
counter = 0

if '-V' in sys.argv[1:]:
    verbose = True
else:
    verbose = False

if '-IF' in sys.argv[1:]:
    pointer = sys.argv.index('-IF') + 1
    while "-" not in sys.argv[pointer]:
        if not sys.argv[pointer].isdigit():
            raise ValueError("Wrong input size!")
        input_size.append(int(sys.argv[pointer]))
        pointer += 1
        input_format[counter] = []
        while not sys.argv[pointer].isdigit():
            input_format[counter].append(sys.argv[pointer])
            if sys.argv[pointer].isdigit():
                wrong_format = False
            elif sys.argv[pointer] in ["oh", "oh", "z", "ao", "we"]:
                wrong_format = False
            elif "B" in sys.argv[pointer]:
                wrong_format = False
            else:
                wrong_format = True
            if wrong_format:
                raise ValueError("Wrong input format!")

            pointer += 1

            if pointer == len(sys.argv):
                break

            if "-" in sys.argv[pointer]:
                break

        counter += 1
        if pointer == len(sys.argv):
            break
    pattern_length = sum(input_size)
else:
    print "no input patterns provided...Exit!"
    sys.exit()

test_pattern_file = open(str(filename), 'w')

print "--------------------------------------------------------------------------------"
print '\033[92m' + "INFO: " + '\033[0m' + "reporting the configuration:\n"
print "        .----------------------------------------"
print "        | input size |	input format"
print "   .----'----------------------------------------"
for i in range(0, len(input_size)):
    format = ""
    for item in input_format[i]:
        i_format = item
        if "B" in item:
            i_format = "B"
        format += input_format_name[i_format]+", "

    print '   |{:3d} | {:7d}    |  {:10s}     '.format(i, input_size[i], format[:-2])
    print "   '---------------------------------------------"

print
if verbose:
    print '\033[92m' + "INFO: " + '\033[0m' + "Starting preparing individual lists..."
output_size = 1
for item in input_format:
    input_format_list = []
    if "z" in input_format[item]:
        input_format_list.append('0' * input_size[item])

    if "ao" in input_format[item]:
        input_format_list.append('1' * input_size[item])

    if "B" in input_format[item][0]:
        input_format_list.append(input_format[item][0][1:])

    if "we" in input_format[item]:
        input_format_list = [''.join(map(str, tup)) for tup in itertools.product([0, 1], repeat=input_size[item])]

    if "oh" in input_format[item]:
        for i in range(0, input_size[item]):
            input_format_list.append('0' * i + '1' + '0' * (input_size[item] - i - 1))
    input_format[item].append(input_format_list)
    output_size *= len(input_format_list)
    if verbose:
        print "----------------------------"
        print "calculating for size: ", input_size[item], "with format:", input_format[item][:-1]
        print "\tnumber of inputs to be added:", len(input_format_list)
        print "\tlist of inputs to be added:", input_format_list
        print "\toutput size so far:", output_size

if verbose:
    print "----------------------------"
    print '\033[92m' + "INFO: " + '\033[0m' + "Individual lists are prepared for input sets..."
    print '\033[92m' + "INFO: " + '\033[0m' + "Final output size:", output_size
    if output_size > 100000000:
        print '\033[91m' + "WARNING: " + '\033[0m' + "your final output size is big... you might run out of disc space!"
    print
    print '\033[92m' + "INFO: " + '\033[0m' + "Starting making product of the lists... This might take a while!"

list_of_accepted_patterns = []
for item in input_format:
    if len(input_format[item]) > 0:
        sub_item = input_format[item][len(input_format[item]) - 1]
        if len(list_of_accepted_patterns) == 0:
            list_of_accepted_patterns = sub_item
        else:
            list_of_accepted_patterns = map(''.join,
                                            itertools.chain(itertools.product(list_of_accepted_patterns, sub_item)))

# print list_of_accepted_patterns

test_pattern_file.write("\n.VECTORS " + str(len(list_of_accepted_patterns)) + "\n\n")
test_pattern_file.write("\n.PATTERNS\n\n")
for item in list_of_accepted_patterns:
    string_for_file = ""
    for bit in item:
        string_for_file += str(bit)
    string_for_file += "\n"
    test_pattern_file.write(string_for_file)
test_pattern_file.close()