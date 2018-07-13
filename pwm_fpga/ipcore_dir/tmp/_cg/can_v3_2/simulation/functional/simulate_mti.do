
set work work
vlib $work

echo "Compiling CAN Simulation Core"
vcom -93 -quiet -work $work ../../../can_v3_2.vhd 

echo "Compiling package"
vcom -work $work -quiet -93 ../can_v3_2_tb_pkg.vhd

echo "Compiling CAN Example Design"
vcom -work $work -quiet -93 ../../example_design/can_v3_2_top.vhd

echo "Compiling Test Bench"
vcom -work $work -quiet -93 ../can_v3_2_tb.vhd 

vsim -t ps -L simprim -L unisim $work.can_v3_2_tb

do wave.do

#Ignore integer warnings at time 0
set StdArithNoWarnings 1
run 0
set StdArithNoWarnings 0

run 700000ns
