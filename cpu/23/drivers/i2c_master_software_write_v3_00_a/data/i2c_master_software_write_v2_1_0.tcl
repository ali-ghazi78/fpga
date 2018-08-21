##############################################################################
## Filename:          D:\fpga_project\cpu\23/drivers/i2c_master_software_write_v3_00_a/data/i2c_master_software_write_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Mon Aug 13 16:48:33 2018 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "i2c_master_software_write" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
