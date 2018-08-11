##############################################################################
## Filename:          D:\fpga_project\cpu\10/drivers/pwm_peipheral_v1_00_a/data/pwm_peipheral_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Thu Jul 19 01:37:41 2018 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "pwm_peipheral" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
