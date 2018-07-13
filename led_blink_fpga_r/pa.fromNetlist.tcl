
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name led_blink_fpga_r -dir "D:/fpga_project/led_blink_fpga_r/planAhead_run_2" -part xc6slx9tqg144-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/fpga_project/led_blink_fpga_r/led_module.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/fpga_project/led_blink_fpga_r} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "pininig.ucf" [current_fileset -constrset]
add_files [list {pininig.ucf}] -fileset [get_property constrset [current_run]]
link_design
