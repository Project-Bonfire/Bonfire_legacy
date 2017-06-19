#!/bin/bash
# we assume that we are in this path: Bonfire/Scripts/scripts_for_papers
# TODO: update latency script to also handle FI cases!

PL=8
# check if there is a 
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
	for i in 0.005 0.01 0.015 0.02 0.025 0.03
	  do 
	     echo "running simulate.py for PIR: $i "
	     # here we run the tool...
	     python ../../simulate.py -D 2 -credit_based_FC -packet_drop -FC -FI -NI_Test -SHMU -Rand $i -PS $PL $PL -sim 10000 -end 11000 -lat
	     # copy the results into output folder
	     cp ../../tmp/simul_temp/stats.txt output/$j/latency_PIR\_$i\_PL\_$PL.txt
	 done
done
