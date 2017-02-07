#!/bin/bash

# create ascii from hex file
file2out.pl -hex test.bmp > data.txt

# compose instruction and data together
cat openJPEG.txt data.txt > memory.txt

# create simulation input for memory
file2out.pl -mem memory.txt > memory_in.mem