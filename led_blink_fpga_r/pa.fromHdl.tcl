
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name led_blink_fpga_r -dir "D:/fpga_project/led_blink_fpga_r/planAhead_run_1" -part xc6slx9tqg144-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "pininig.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {led_module.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top led_module $srcset
add_files [list {pininig.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-2
