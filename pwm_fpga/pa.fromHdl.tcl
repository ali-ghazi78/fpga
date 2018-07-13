
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name pwm_fpga -dir "D:/fpga_project/pwm_fpga/planAhead_run_2" -part xc6slx9tqg144-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "pininig.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {pwm.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {pwm_tester.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top pwm_tester $srcset
add_files [list {pininig.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-2
