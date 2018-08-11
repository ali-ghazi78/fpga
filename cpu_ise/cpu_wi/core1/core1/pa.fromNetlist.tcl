
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name core1 -dir "D:/fpga_project/cpu_ise/cpu_wi/core1/core1/planAhead_run_3" -part xc6slx9tqg144-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/fpga_project/cpu_ise/cpu_wi/core1/core1/schematic_src_1.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/fpga_project/cpu_ise/cpu_wi/core1/core1} {real_micro_blaze_1} }
add_files [list {real_micro_blaze_1/microblaze_mcs_v1_4.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "pinning.ucf" [current_fileset -constrset]
add_files [list {pinning.ucf}] -fileset [get_property constrset [current_run]]
link_design
