##############################################################################
## Filename:          D:\fpga_project\cpu\23/drivers/i2c_software_master_v1_00_a/data/i2c_software_master_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Sun Aug 12 12:02:43 2018 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "i2c_software_master" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
