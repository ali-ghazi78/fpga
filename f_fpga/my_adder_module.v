`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:06:46 07/08/2018 
// Design Name: 
// Module Name:    my_adder_module 
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
module led_blinking(clock,led);
	input clock;
	output led;
	integer out;
	integer counter;
	
	assign led = 1;
/*
	assign led = 1;
	initial begin	
		counter=0;
		out=0;
	end 
	always @(posedge clock) begin
		if((counter%20)==0) begin
			counter=0;
			out=~out;
		end
		else begin
			counter=counter+1;
		end 
	end
*/
endmodule

