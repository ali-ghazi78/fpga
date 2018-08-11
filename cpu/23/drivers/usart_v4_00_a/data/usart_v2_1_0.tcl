##############################################################################
## Filename:          D:\fpga_project\cpu\23/drivers/usart_v4_00_a/data/usart_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Sat Aug 04 04:38:19 2018 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "usart" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}