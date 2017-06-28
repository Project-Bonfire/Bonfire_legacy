import os 

for i in range(0, 6):
	print "------------"*5
	print "experiment number:", i
	print "FAULT per second", "\tPIR", "\t\tflits sent", "\tflits lost", "\tpackets sent", "\tpackets lost"
	for x in os.walk("."):
		#print x[0] 
		for filename in os.listdir(x[0]):
			if ".txt" in filename:
				name = x[0][2:]+"/"+filename
				file = open(name, "r")
				if x[0][2:].split("/")[1] == str(i):

					for line in file:
						split_list =  line.split()
						# print line
						if "sent" in line: 
							packet_sent = split_list[2]
							flit_sent = split_list[5]
						if "lost" in line: 
							packet_lost = split_list[2]
							flit_lost = split_list[5]
					print  x[0][2:].split("/")[0].split("_")[1],  "\t\t", filename.split("_")[2], "\t\t",   
					print flit_sent, "\t\t", flit_lost, "\t\t", packet_sent, "\t\t", packet_lost