##############################################################################
## Filename:          D:\fpga_project\cpu\5/drivers/uart_peripheral_v1_00_a/data/uart_peripheral_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Wed Jul 18 21:30:48 2018 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "uart_peripheral" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
