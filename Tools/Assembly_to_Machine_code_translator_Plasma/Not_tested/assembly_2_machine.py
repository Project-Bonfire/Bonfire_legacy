# ---------------------------------------------------------------------
# -- Copyright (C) 2016 Siavoosh Payandeh Azad and Behrad Niazmand
# --
# -- 	Assembly to Machine code translator for Plasma
# --	@ Input : assembly.txt (based on the sub-set of MIPS I 32-bit instruction set architecture)
# -- 	@ Output : code.txt
# ---------------------------------------------------------------------


input_file = open('assembly.txt', 'r')
output_file = open('code.txt', 'w')

dictionary = {
				# Instruction Opcodes

				# Arithmetic Logic Unit
				# R-Type instructions
				"ADD": "000000",
				"ADDU": "000000",
				"AND": "000000",
				"NOR" : "000000",
				"OR"  : "000000",
				"SLT" : "000000",
				"SLTU" : "000000",
				"SUB" : "000000",
				"SUBU" : "000000",
				"XOR" : "000000",
				# I-Type instructions
				"ADDI": "001000",
				"ADDIU": "001001",
				"ANDI": "001100",
				"SUBI": "011010",
				"LUI" : "001111",
				"ORI" : "001101",
				"SLTI" : "001010",
				"SLTIU" : "001011",
				"XORI" : "001110",

				# Shifter
				# R-Type instructions
				"SLL" : "000000",
				"SLLV" : "000000",
				"SRA" : "000000",
				"SRAV" : "000000",
				"SRL" : "000000",
				"SRLV" : "000000",

				# Multiply
				# R-Type
				"DIV" : "000000",
				"DIVU" : "000000",
				"MFHI" : "000000",
				"MFLO" : "000000",
				"MTHI" : "000000",
				"MTLO" : "000000",
				"MULT" : "000000",
				"MULTU" : "000000",

				# Branch
				# R-Type instructions
				"BREAK" : "000000",
				"JALR" : "000000",
				"JR" : "000000",
				"MFC0" : "010000",
				"MTC0" : "010000",
				"SYSCALL" : "000000",

				# I-Type instructions
				"BEQ" : "000100",
				"BGEZ": "000001",
				"BGEZAL" : "000001",
				"BGTZ" : "000111",
				"BLEZ" : "000110",
				"BLTZ" : "000001",
				"BLTZAL" : "000001",
				"BNE" : "000101",

				# J-Type instructions
				"J": "000010",
				"JAL" : "000011",
				"JNIFR": "011000",
				"JNIFW": "011001",

				# Memory Access
				# I-Type instructions
				"LB" : "100000",
				"LBU" : "100100",
				"LH" : "100001",
				"LHU" : "100101",
				"LW": "100011",
				"SB" : "101000",
				"SH" : "101001",
				"SW": "101011",
}

counter = 0
for line in input_file:
	counter += 1
	#print counter, line
	if "nop" in line:

		output_file.write("\n")
	else:
		line_split = line[:len(line)-1].split(" ")

		if "," in line_split[1]:
			line_split_arguments = line_split[1].split(",")
		else:
			line_split_arguments =  [line_split[1]]

		if len(line_split_arguments) == 1 and  line_split[0] != "JR":
			for item in  line_split_arguments:
				argument_binary =  "{0:b}".format(int(item))
			for i in range (0, 32-len(argument_binary)-len(dictionary[line_split[0]])):
				argument_binary  ="0" + argument_binary

		if len(line_split_arguments) == 3 :
			first_one =  "{0:b}".format(int(line_split_arguments[0]))
			second_one =  "{0:b}".format(int(line_split_arguments[1]))
			third_one =  "{0:b}".format(int(line_split_arguments[2]))
			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 16-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one

		if line_split[0] == "AND":
			first_one =  "{0:b}".format(int(line_split_arguments[1]))
			second_one = "{0:b}".format(int(line_split_arguments[2]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000100100"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + rest

		if line_split[0] == "ADD":
			first_one =  "{0:b}".format(int(line_split_arguments[1]))
			second_one = "{0:b}".format(int(line_split_arguments[2]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000100000"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + rest

		if line_split[0] == "ADDU":
			first_one =  "{0:b}".format(int(line_split_arguments[1]))
			second_one = "{0:b}".format(int(line_split_arguments[2]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000100001"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + rest

		if line_split[0] == "ADDI" or line_split[0] == "ADDIU" or line_split[0] == "ANDI" or line_split[0] == "ORI" or line_split[0] == "SLTI" or line_split[0] == "SLTIU" or line_split[0] == "XORI" :
			first_one =  "{0:b}".format(int(line_split_arguments[1]))
			second_one = "{0:b}".format(int(line_split_arguments[0]))
			third_one =  "{0:b}".format(int(line_split_arguments[2]))

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 16-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one

		if line_split[0] == "SLL":
			first_one =  "00000" # Register rs is implied as R0 which always stored zero
			second_one = "{0:b}".format(int(line_split_arguments[1]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			fourth_one =  "{0:b}".format(int(line_split_arguments[2])) # shift amount
			rest = "000000"

			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			for i in range(0, 5-len(fourth_one)):
				fourth_one = "0"+fourth_one
			argument_binary = first_one + second_one + third_one + fourth_one + rest

		if line_split[0] == "SRL":
			first_one =  "00000" # Register rs is implied as R0 which always stored zero
			second_one = "{0:b}".format(int(line_split_arguments[1]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			fourth_one =  "{0:b}".format(int(line_split_arguments[2])) # shift amount
			rest = "000010"

			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			for i in range(0, 5-len(fourth_one)):
				fourth_one = "0"+fourth_one
			argument_binary = first_one + second_one + third_one + fourth_one + rest

		if line_split[0] == "SLLV" or line_split[0] == "SRAV" or line_split[0] == "SRLV":
			first_one =  "{0:b}".format(int(line_split_arguments[2]))
			second_one = "{0:b}".format(int(line_split_arguments[1]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000000100"

			for i in range(0, 5-len(second_one)):
				first_one = "0"+second_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + rest

		if line_split[0] == "SRA":
			first_one =  "00000"
			second_one = "{0:b}".format(int(line_split_arguments[1]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			fourth_one =  "{0:b}".format(int(line_split_arguments[2]))
			rest = "000011"

			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			for i in range(0, 5-len(third_one)):
				fourth_one = "0"+fourth_one
			argument_binary = first_one + second_one + third_one + fourth_one + rest

		if line_split[0] == "DIV":
			first_one =  "{0:b}".format(int(line_split_arguments[0]))
			second_one = "{0:b}".format(int(line_split_arguments[1]))
			rest = "0000000000011010"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			argument_binary = first_one + second_one + rest

		if line_split[0] == "DIVU":
			first_one =  "{0:b}".format(int(line_split_arguments[0]))
			second_one = "{0:b}".format(int(line_split_arguments[1]))
			rest = "0000000000011011"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			argument_binary = first_one + second_one + rest

		if line_split[0] == "MULT":
			first_one =  "{0:b}".format(int(line_split_arguments[0]))
			second_one = "{0:b}".format(int(line_split_arguments[1]))
			rest = "0000000000011000"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			argument_binary = first_one + second_one + rest

		if line_split[0] == "MULTU":
			first_one =  "{0:b}".format(int(line_split_arguments[0]))
			second_one = "{0:b}".format(int(line_split_arguments[1]))
			rest = "0000000000011001"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			argument_binary = first_one + second_one + rest

		if line_split[0] == "MFHI":
			first_one = "0000000000"
			second_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000010000"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			argument_binary = first_one + second_one + rest

		if line_split[0] == "MFLO":
			first_one = "0000000000"
			second_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000010010"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			argument_binary = first_one + second_one + rest

		if line_split[0] == "MTHI":
			first_one = "{0:b}".format(int(line_split_arguments[0]))
			rest = "000000000000000010001"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			argument_binary = first_one + rest

		if line_split[0] == "MTLO":
			first_one = "{0:b}".format(int(line_split_arguments[0]))
			rest = "000000000000000010011"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			argument_binary = first_one + rest

		if line_split[0] == "NOR":
			first_one =  "{0:b}".format(int(line_split_arguments[1]))
			second_one = "{0:b}".format(int(line_split_arguments[2]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000100111"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + rest

		if line_split[0] == "OR":
			first_one =  "{0:b}".format(int(line_split_arguments[1]))
			second_one = "{0:b}".format(int(line_split_arguments[2]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000100101"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + rest

		if line_split[0] == "SLT":
			first_one =  "{0:b}".format(int(line_split_arguments[1]))
			second_one = "{0:b}".format(int(line_split_arguments[2]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000101010"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + rest

		if line_split[0] == "SLTU":
			first_one =  "{0:b}".format(int(line_split_arguments[1]))
			second_one = "{0:b}".format(int(line_split_arguments[2]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000101011"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + rest

		if line_split[0] == "SUB":
			first_one =  "{0:b}".format(int(line_split_arguments[1]))
			second_one = "{0:b}".format(int(line_split_arguments[2]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000100010"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + rest

		if line_split[0] == "SUBU":
			first_one =  "{0:b}".format(int(line_split_arguments[1]))
			second_one = "{0:b}".format(int(line_split_arguments[2]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000100011"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + rest

		if line_split[0] == "XOR":
			first_one =  "{0:b}".format(int(line_split_arguments[1]))
			second_one = "{0:b}".format(int(line_split_arguments[2]))
			third_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "00000100110"

			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one
			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + rest

		if line_split[0] == "BEQ" or line_split[0] == "BNE":
			first_one =  "{0:b}".format(int(line_split_arguments[0]))
			second_one = "{0:b}".format(int(line_split_arguments[1]))
			third_one =  "{0:b}".format(int(line_split_arguments[2]))
			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one

			for i in range(0, 16-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one

		if line_split[0] == "BGEZ":
			first_one =  "{0:b}".format(int(line_split_arguments[0]))
			second_one =  "00001"
			third_one =  "{0:b}".format(int(line_split_arguments[1]))
			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one

			for i in range(0, 16-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one

		if line_split[0] == "BGEZAL":
			first_one =  "{0:b}".format(int(line_split_arguments[0]))
			second_one =  "10001"
			third_one =  "{0:b}".format(int(line_split_arguments[1]))
			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one

			for i in range(0, 16-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one

		if line_split[0] == "BGTZ" or line_split[0] == "BLEZ" or line_split[0] == "BLTZ":
			first_one =  "{0:b}".format(int(line_split_arguments[0]))
			second_one =  "00000"
			third_one =  "{0:b}".format(int(line_split_arguments[1]))
			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one

			for i in range(0, 16-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one

		if line_split[0] == "BLTZAL":
			first_one =  "{0:b}".format(int(line_split_arguments[0]))
			second_one =  "10000"
			third_one =  "{0:b}".format(int(line_split_arguments[1]))
			for i in range(0, 5-len(first_one)):
				first_one = "0"+first_one

			for i in range(0, 16-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one

		if line_split[0] == "LUI":
			first_one =  "00000"
			second_one = "{0:b}".format(int(line_split_arguments[0]))
			third_one =  "{0:b}".format(int(line_split_arguments[1]))
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one

			for i in range(0, 16-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one

		if line_split[0] == "MFC0":
			first_one =  "00000"
			second_one = "{0:b}".format(int(line_split_arguments[0]))
			third_one =  "{0:b}".format(int(line_split_arguments[1]))
			fourth_one =  "00000000000"
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one

			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + fourth_one

		if line_split[0] == "MTC0":
			first_one =  "00100"
			second_one = "{0:b}".format(int(line_split_arguments[0]))
			third_one =  "{0:b}".format(int(line_split_arguments[1]))
			fourth_one =  "00000000000"
			for i in range(0, 5-len(second_one)):
				second_one = "0"+second_one

			for i in range(0, 5-len(third_one)):
				third_one = "0"+third_one
			argument_binary = first_one + second_one + third_one + fourth_one

		if line_split[0] == "JR":
			first_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest =  "000000000000000001000"
			argument_binary = first_one + rest

		if line_split[0] == "JALR": # For JALR rs, rd is implied as R31 which should store PC ??
			first_one =  "{0:b}".format(int(line_split_arguments[0]))
			rest = "000001111100000001001" # rd is implied as register 31 (to store PC) ??

		if line_split[0] == "SYSCALL":
			argument_binary = "00000000000000000000000000001100"

		line = str(hex(int(dictionary[line_split[0]]+argument_binary, 2))[2:])
		while len(line) < 8:
			line = "0" + line
		output_file.write(line+"\n")

input_file.close()
output_file.close()