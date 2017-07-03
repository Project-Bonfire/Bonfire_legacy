#!/bin/bash
# we assume that we are in this path: Bonfire/Scripts/execution_scripts

PL=8
# check if there is an output folder
if [ ! -d "output" ]; then
    mkdir output
else
    echo "removing files in output folder"
    rm -rf output
    mkdir output
fi

for j in 0 1 2 3 4 5 
do
	mkdir output/$j
	echo "made folder: output/$j"
	for i in 0.005 0.01 0.015 0.02 0.025 0.03
	  do 
	     echo "running simulate.py for PIR: $i "
	     # here we run the tool...
	     # the -lat key is used just to run the tool without gui! this should be later added to the simulate script
	     python ../../simulate.py -D 2 -credit_based_FC -packet_drop -FC -FI -NI_Test -SHMU -Rand $i -PS $PL $PL -sim 10000 -end 11000 -lat
	     # copy the results into output folder
	     echo "copying tmp/simul_temp/stats.txt to output/$j/latency_PIR\_$i\_PL\_$PL.txt"
	     cp ../../tmp/simul_temp/stats.txt output/$j/latency_PIR\_$i\_PL\_$PL.txt
	 done
done
