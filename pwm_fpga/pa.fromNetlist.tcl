
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name pwm_fpga -dir "D:/fpga_project/pwm_fpga/planAhead_run_4" -part xc6slx9tqg144-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/fpga_project/pwm_fpga/pwm_tester.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/fpga_project/pwm_fpga} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "pininig.ucf" [current_fileset -constrset]
add_files [list {pininig.ucf}] -fileset [get_property constrset [current_run]]
link_design
