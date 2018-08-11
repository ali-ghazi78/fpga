##############################################################################
## Filename:          D:\fpga_project\cpu\15/drivers/usart_v1_00_a/data/usart_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Tue Jul 31 15:54:18 2018 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "usart" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
