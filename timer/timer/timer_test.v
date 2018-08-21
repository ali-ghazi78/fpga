`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:09:10 08/14/2018 
// Design Name: 
// Module Name:    timer_test 
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
module timer_test( clock, reset, led,inter );
	output reg led;
	input clock;
	input reset;
	output inter;
timer mm(
.prescaler(50000),
.clock(clock),
.reset(reset),
.top(5000),
.interupt(inter)
    );

	always@(posedge clock)begin
		if(inter)
			led=~led;

	end

endmodule
