`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:26:49 08/03/2018 
// Design Name: 
// Module Name:    led_micro_blaze 
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
module led_micro_blaze(led[0:7],clock);
input clock;
wire [0:7]my_wire;
 output reg [0:7]led;
 
 reg [0:7]oo;
assign my_wire[7]=1;
assign my_wire[6]=0;
assign my_wire[5]=0;
assign my_wire[4]=0;
assign my_wire[3]=0;
assign my_wire[2]=0;
assign my_wire[1]=0;
assign my_wire[0]=0;


 
	always @(posedge clock)begin
	
		oo<=my_wire;
		led<=oo;
	end


endmodule
