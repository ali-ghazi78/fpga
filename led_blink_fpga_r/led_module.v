`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:05 07/08/2018 
// Design Name: 
// Module Name:    led_module 
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
module led_module(output led[8:0],input clock);

	reg [32:0] counter;
	reg led[7:0];
	integer i;
	initial begin
		counter=0;
		led[0]=0;
		led[1]=1;
		led[2]=0;
		led[3]=1;
		led[4]=0;
		led[5]=1;
		led[6]=0;
		led[7]=1;

	end
	always @(posedge clock) begin
		if(counter>6000000) begin
			counter=0;
			for(i=0;i<=7;i=i+1) begin
				led[i]=~led[i];
			end
		end
		else begin
			counter=counter+1;
		end
		
	end 


endmodule
