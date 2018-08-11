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


microblaze_mcs_v1_4 your_instance_name (
  .Clk(clock), // input Clk
  .Reset(reset), // input Reset
  .GPO1(GPO1), // output [31 : 0] GPO1
  .GPI1(GPI1), // input [31 : 0] GPI1
  .GPI1_Interrupt() // output GPI1_Interrupt
);
endmodule
