##############################################################################
## Filename:          D:\fpga_project\cpu\23/drivers/timer_v1_00_a/data/timer_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Tue Aug 14 02:29:18 2018 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "timer" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
