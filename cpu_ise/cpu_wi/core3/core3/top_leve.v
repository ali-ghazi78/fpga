`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:03 07/21/2018 
// Design Name: 
// Module Name:    top_leve 
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
module top_leve(
input reset,
input clock,
input tx,
output led
);

wire transmit;
wire uart_busy;
wire [7:0]data_w;
wire [31 : 0] GPO1;
wire [31 : 0] GPI1;


my_usart usart1 (
    .led(led), 
    .reset(reset), 
    .clock(clock), 
    .data(data_w), 
    .prescaler(2500), 
    .rx_pin(), 
    .tx_pin(tx), 
    .transmit(transmit), 
    .uart_busy(uart_busy)
    );






assign data_w=GPO1[7:0];
assign transmit=GPO1[8];
assign GPI1[0]=uart_busy;


microblaze_mcs_v1_4 my_micro (
  .Clk(clock), // input Clk
  .Reset(reset), // input Reset
  .IO_Addr_Strobe(), // output IO_Addr_Strobe
  .IO_Read_Strobe(), // output IO_Read_Strobe
  .IO_Write_Strobe(), // output IO_Write_Strobe
  .IO_Address(), // output [31 : 0] IO_Address
  .IO_Byte_Enable(), // output [3 : 0] IO_Byte_Enable
  .IO_Write_Data(), // output [31 : 0] IO_Write_Data
  .IO_Read_Data(), // input [31 : 0] IO_Read_Data
  .IO_Ready(), // input IO_Ready
  .GPO1(GPO1), // output [31 : 0] GPO1
  .GPO2(), // output [31 : 0] GPO2
  .GPO3(), // output [31 : 0] GPO3
  .GPO4(), // output [31 : 0] GPO4
  .GPI1(GPI1), // input [31 : 0] GPI1
  .GPI1_Interrupt( ), // output GPI1_Interrupt
  .GPI2( ), // input [31 : 0] GPI2
  .GPI2_Interrupt( ), // output GPI2_Interrupt
  .GPI3( ), // input [31 : 0] GPI3
  .GPI3_Interrupt( ), // output GPI3_Interrupt
  .GPI4( ), // input [31 : 0] GPI4
  .GPI4_Interrupt( ), // output GPI4_Interrupt
  .INTC_Interrupt( ), // input [15 : 0] INTC_Interrupt
  .INTC_IRQ( ) // output INTC_IRQ
);

endmodule
