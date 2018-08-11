
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name usart_fpga_2 -dir "D:/fpga_project/usart_fpga_2/planAhead_run_4" -part xc6slx9tqg144-2
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "D:/fpga_project/usart_fpga_2/usart_tester.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/fpga_project/usart_fpga_2} }
set_property target_constrs_file "pinning.ucf" [current_fileset -constrset]
add_files [list {pinning.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "D:/fpga_project/usart_fpga_2/usart_tester.xdl"
if {[catch {read_twx -name results_1 -file "D:/fpga_project/usart_fpga_2/usart_tester.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"D:/fpga_project/usart_fpga_2/usart_tester.twx\": $eInfo"
}
