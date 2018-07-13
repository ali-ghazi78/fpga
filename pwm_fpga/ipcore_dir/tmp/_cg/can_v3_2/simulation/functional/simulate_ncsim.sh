
#!/bin/sh
rm -rf work
mkdir work

echo "Compiling CAN Simulation Core"
ncvhdl -nocopyright -v93 -work work ../../../can_v3_2.vhd 

echo "Compiling package"
ncvhdl -nocopyright -v93 -work work ../can_v3_2_tb_pkg.vhd

echo "Compiling CAN Example Design"
ncvhdl -nocopyright -v93 -work work ../../example_design/can_v3_2_top.vhd 

echo "Compiling Test Bench"
ncvhdl -nocopyright -v93 -work work ../can_v3_2_tb.vhd

ncelab -nocopyright -access +r work.can_v3_2_tb:test

ncsim -nocopyright -gui work.can_v3_2_tb -input "@simvision -input wave.sv"
