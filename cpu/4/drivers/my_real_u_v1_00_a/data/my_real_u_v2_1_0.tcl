##############################################################################
## Filename:          D:\fpga_project\cpu\4/drivers/my_real_u_v1_00_a/data/my_real_u_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Wed Jul 18 21:08:08 2018 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "my_real_u" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
