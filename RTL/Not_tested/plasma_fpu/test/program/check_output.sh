# <Feb. 7th 2017> edit by Behrad Niazmand (bniazmand@ati.ttu.ee), added "perl" to the beginning of the files to use perl when executing the script.

#!/bin/bash

# convert from memory to txt file
perl file2out.pl -txt memory_out.mem > memory_out.txt

# create binary file
perl file2out.pl -bin memory_out.txt test_out.jp2