##############################################################################
## Filename:          D:\fpga_project\cpu\16/drivers/myrealusart_v1_00_a/data/myrealusart_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Wed Aug 01 02:16:01 2018 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "myrealusart" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
