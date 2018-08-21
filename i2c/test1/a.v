`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:26 08/12/2018 
// Design Name: 
// Module Name:    a 
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
module a(clock,led[0:7],sda);
input clock;
wire my_in;
wire my_out;
output [0:7]led;
inout sda;
//assign led=3;
assign enable=0;//0 output faal -1 output qeir faal
assign led=my_out;
assign my_in=0;

IOBUF aa(.T(enable),.I(my_in),.O(my_out),.IO(sda));


endmodule
