
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name f_fpga -dir "D:/fpga_project/f_fpga/planAhead_run_1" -part xa6slx4csg225-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "pininig.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {my_adder_module.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top led_blinking $srcset
add_files [list {pininig.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xa6slx4csg225-3
