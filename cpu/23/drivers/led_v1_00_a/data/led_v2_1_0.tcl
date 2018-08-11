##############################################################################
## Filename:          D:\fpga_project\cpu\23/drivers/led_v1_00_a/data/led_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Fri Aug 03 20:47:39 2018 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "led" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
