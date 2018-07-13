`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:08:49 07/10/2018 
// Design Name: 
// Module Name:    clock_devider 
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
//-------------------------------reset is active low------------------------------
//---------------------only even zoj prescaler is allowed---------------------- ---
module clock_devider(clk,prescaler[15:0],output_clk);
	input clk;
	input [15:0] prescaler;
	output output_clk;

	reg output_clk;
	reg[15:0] counter;
	
	initial begin
		counter=0;
		output_clk=0;
	end


	always@(posedge clk) begin
		counter=counter+1;
			if(counter*2>=prescaler) begin
				output_clk=~output_clk;
				counter=0;
			end
	end
	
endmodule

