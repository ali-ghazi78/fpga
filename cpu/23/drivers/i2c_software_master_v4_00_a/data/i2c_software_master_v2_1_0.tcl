##############################################################################
## Filename:          D:\fpga_project\cpu\23/drivers/i2c_software_master_v4_00_a/data/i2c_software_master_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Mon Aug 13 17:32:16 2018 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "i2c_software_master" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}