#!/bin/bash

# MODULE_FILE = $1
# CHECKERS_FILE = $2
# TOP_MODULE_FILE = $3
# SYNTHESIS_SCRIPT_FILE = $4
# name_string = $5
# module_name = $6

mkdir temp

cp ../../../synthesis_design_analyzer/"$1" temp/
cp checker_vhdl/"$2" temp/
cp checker_vhdl/"$3" temp/
cp synthesis_scripts/"$4" temp/

cp ../../../synthesis_design_analyzer/.synopsys_dc.setup temp/
cp ../../../synthesis_design_analyzer/.synopsys_vss.setup temp/
cp ../../../synthesis_design_analyzer/class.lib temp/
cp ../../../synthesis_design_analyzer/import temp/
cp analyze temp/
cp $6_with_checkers_top.inp temp/

cd temp
mkdir work

echo "Now running Synopsys Design Compiler ... Please grab a cup of coffee, while we do the rest of the work for you!"
dc_shell -f "$4"

./import $6_with_checkers_top.edif class.lib

echo "Now running performing Fault Simulating using Turbo Tester Analyze tool ... We're almost finished!"
./analyze -no_drop -chk_eval -chk_module_name CHECKERS $6_with_checkers_top

cd ..
mkdir area_results
cp temp/area*.txt area_results/

variable="$5"
echo $variable
mkdir coverage_results
cp temp/fstat coverage_results/fstat"$variable"

#cd temp
#rm -f -r ./*
cd ..
# rmdir temp

echo "Finally, we're done!"