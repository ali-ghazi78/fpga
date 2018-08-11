/*****************************************************************************
* Filename:          D:\fpga_project\cpu\5/drivers/uart_peripheral_v1_00_a/src/uart_peripheral.h
* Version:           1.00.a
* Description:       uart_peripheral Driver Header File
* Date:              Wed Jul 18 21:30:48 2018 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef UART_PERIPHERAL_H
#define UART_PERIPHERAL_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLV_REG0 : user logic slave module register 0
 * -- SLV_REG1 : user logic slave module register 1
 * -- SLV_REG2 : user logic slave module register 2
 * -- SLV_REG3 : user logic slave module register 3
 * -- SLV_REG4 : user logic slave module register 4
 */
#define UART_PERIPHERAL_USER_SLV_SPACE_OFFSET (0x00000000)
#define UART_PERIPHERAL_SLV_REG0_OFFSET (UART_PERIPHERAL_USER_SLV_SPACE_OFFSET + 0x00000000)
#define UART_PERIPHERAL_SLV_REG1_OFFSET (UART_PERIPHERAL_USER_SLV_SPACE_OFFSET + 0x00000004)
#define UART_PERIPHERAL_SLV_REG2_OFFSET (UART_PERIPHERAL_USER_SLV_SPACE_OFFSET + 0x00000008)
#define UART_PERIPHERAL_SLV_REG3_OFFSET (UART_PERIPHERAL_USER_SLV_SPACE_OFFSET + 0x0000000C)
#define UART_PERIPHERAL_SLV_REG4_OFFSET (UART_PERIPHERAL_USER_SLV_SPACE_OFFSET + 0x00000010)

/**************************** Type Definitions *****************************/


/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a UART_PERIPHERAL register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the UART_PERIPHERAL device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void UART_PERIPHERAL_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define UART_PERIPHERAL_mWriteReg(BaseAddress, RegOffset, Data) \
 	Xil_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a UART_PERIPHERAL register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the UART_PERIPHERAL device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 UART_PERIPHERAL_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define UART_PERIPHERAL_mReadReg(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from UART_PERIPHERAL user logic slave registers.
 *
 * @param   BaseAddress is the base address of the UART_PERIPHERAL device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void UART_PERIPHERAL_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 UART_PERIPHERAL_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define UART_PERIPHERAL_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (UART_PERIPHERAL_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))
#define UART_PERIPHERAL_mWriteSlaveReg1(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (UART_PERIPHERAL_SLV_REG1_OFFSET) + (RegOffset), (Xuint32)(Value))
#define UART_PERIPHERAL_mWriteSlaveReg2(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (UART_PERIPHERAL_SLV_REG2_OFFSET) + (RegOffset), (Xuint32)(Value))
#define UART_PERIPHERAL_mWriteSlaveReg3(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (UART_PERIPHERAL_SLV_REG3_OFFSET) + (RegOffset), (Xuint32)(Value))
#define UART_PERIPHERAL_mWriteSlaveReg4(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (UART_PERIPHERAL_SLV_REG4_OFFSET) + (RegOffset), (Xuint32)(Value))

#define UART_PERIPHERAL_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (UART_PERIPHERAL_SLV_REG0_OFFSET) + (RegOffset))
#define UART_PERIPHERAL_mReadSlaveReg1(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (UART_PERIPHERAL_SLV_REG1_OFFSET) + (RegOffset))
#define UART_PERIPHERAL_mReadSlaveReg2(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (UART_PERIPHERAL_SLV_REG2_OFFSET) + (RegOffset))
#define UART_PERIPHERAL_mReadSlaveReg3(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (UART_PERIPHERAL_SLV_REG3_OFFSET) + (RegOffset))
#define UART_PERIPHERAL_mReadSlaveReg4(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (UART_PERIPHERAL_SLV_REG4_OFFSET) + (RegOffset))

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the UART_PERIPHERAL instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus UART_PERIPHERAL_SelfTest(void * baseaddr_p);

#endif /** UART_PERIPHERAL_H */
