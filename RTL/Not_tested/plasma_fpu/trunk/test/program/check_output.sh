#!/bin/bash

# convert from memory to txt file
perl file2out.pl -txt memory_out.mem > memory_out.txt

# create binary file
perl file2out.pl -bin memory_out.txt test_out.jp2