transcript_file = open('transcript', 'r')
recieved_file = open('received.txt', 'w')
sent_file = open('sent.txt', 'w')
diagnosis_file = open('diagnosis.txt', 'w')
for line in transcript_file:
	if line != '':
		if "Packet received" in line:
			recieved_file.write(line[11:])
		if "Packet generated" in line:
			sent_file.write(line[11:])
		if "NI recieved" in line:
			diagnosis_file.write(line[11:])

recieved_file.close()
sent_file.close()
diagnosis_file.close()