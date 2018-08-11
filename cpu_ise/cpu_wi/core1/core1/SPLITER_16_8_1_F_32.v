`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:39:22 07/21/2018 
// Design Name: 
// Module Name:    SPLITER_16_8_1_F_32 
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
module SPLITER(input in1[31:0],output out_16[15:0],output out_8[7:0],output out_1);
input [31:0] in1;
output [15:0] out_16;
output [7:0]out_8;
output out_1;
assign out_16_=in1[15:0];
assign out_8=in1[23:16];
assign out_1=in1[24];
endmodule
