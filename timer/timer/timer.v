`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:55:29 08/14/2018 
// Design Name: 
// Module Name:    timer 
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
module timer(
prescaler[0:15],
clock,
reset,
top[0:15],
interupt
    );
	input [0:15]prescaler;
	input clock;
	input reset;
	input [0:15]top;
	output reg interupt;
	
	reg [0:15] counter_prescaler;
	reg [0:15] counter;
	
	initial begin
		interupt=0;
		counter=0;
		counter_prescaler=0;
	end

	always @(posedge clock)begin
		if((!reset)||top==0||prescaler==0)begin
			interupt=0;
			counter=0;
			counter_prescaler=0;
		end
		else if(counter_prescaler>=prescaler)begin
			if(counter>=top+1)begin
				counter=0;
				interupt=1;
			end
			else begin
				counter=counter+1;
				interupt=0;
			end
			counter_prescaler=0;
		end
		else begin
			counter_prescaler=counter_prescaler+1;
		
		
		end
	end


endmodule
