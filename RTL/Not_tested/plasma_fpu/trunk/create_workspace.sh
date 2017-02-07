#!/bin/bash

# create workspace folder
if [ ! -d workspace ]; then mkdir workspace; fi

# go to workspace
cd workspace

# link all necessary scripts here
ln -sf ../test/scripts/run.sh
ln -sf ../test/scripts/run.tcl
ln -sf ../test/scripts/wave.do
ln -sf ../test/scripts/plasma_memory.tcl

# link program data here
ln -sf ../test/program/memory_in.mem 
ln -sf ../test/program/memory_out.mem
