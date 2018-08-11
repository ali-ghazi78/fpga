`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:00 07/20/2018 
// Design Name: 
// Module Name:    micro_blaze_insatntiate 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module micro_blaze_insatntiate(input clock,
input reset,
output IO_Addr_Strobe,
output IO_Read_Strobe,
output IO_Write_Strobe,
output [31:0] IO_Address,
output [31:0] IO_Byte_Enable,
output [31:0] IO_Write_Data,
input [31 : 0] IO_Read_Data,
input IO_Ready,
output [31 : 0] GPO1,
output [31 : 0] GPO2,
output [31 : 0] GPO3,
output [31 : 0] GPO4,
output [31 : 0] GIO1,
output [31 : 0] GIO2,
output [31 : 0] GIO3,
output [31 : 0] GIO4,
output GPI1_Interrupt,
output GPI2_Interrupt,
output GPI3_Interrupt,
output GPI4_Interrupt,
input [15 : 0] INTC_Interrupt,
output INTC_IRQ
);

microblaze_mcs_v1_4 your_instance_name (
  .Clk(clock), // input Clk
  .Reset(reset), // input Reset
  .IO_Addr_Strobe(IO_Addr_Strobe), // output IO_Addr_Strobe
  .IO_Read_Strobe(IO_Read_Strobe), // output IO_Read_Strobe
  .IO_Write_Strobe(IO_Write_Strobe), // output IO_Write_Strobe
  .IO_Address(IO_Address), // output [31 : 0] IO_Address
  .IO_Byte_Enable(IO_Byte_Enable), // output [3 : 0] IO_Byte_Enable
  .IO_Write_Data(IO_Write_Data), // output [31 : 0] IO_Write_Data
  .IO_Read_Data(IO_Read_Data), // input [31 : 0] IO_Read_Data
  .IO_Ready(IO_Ready), // input IO_Ready
  .GPO1(GPO1), // output [31 : 0] GPO1
  .GPO2(GPO2), // output [31 : 0] GPO2
  .GPO3(GPO3), // output [31 : 0] GPO3
  .GPO4(GPO4), // output [31 : 0] GPO4
  .GPI1(GPI1), // input [31 : 0] GPI1
  .GPI1_Interrupt(GPI1_Interrupt), // output GPI1_Interrupt
  .GPI2(GPI2), // input [31 : 0] GPI2
  .GPI2_Interrupt(GPI2_Interrupt), // output GPI2_Interrupt
  .GPI3(GPI3), // input [31 : 0] GPI3
  .GPI3_Interrupt(GPI3_Interrupt), // output GPI3_Interrupt
  .GPI4(GPI4), // input [31 : 0] GPI4
  .GPI4_Interrupt(GPI4_Interrupt), // output GPI4_Interrupt
  .INTC_Interrupt(INTC_Interrupt), // input [15 : 0] INTC_Interrupt
  .INTC_IRQ(INTC_IRQ) // output INTC_IRQ
);
endmodule
