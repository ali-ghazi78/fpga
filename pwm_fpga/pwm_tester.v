`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:31:44 07/09/2018 
// Design Name: 
// Module Name:    pwm_tester 
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
module pwm_tester(output pwm_out,input clock,input key,output led2);
reg[31:0] prescaler;
reg[9:0] max;
reg key_holder;
reg led2;
integer c;
initial begin 
	prescaler = 100;
	key_holder=0;
	max=0;
	led2=0;
	c=0;
	
end 
	always@(negedge clock) begin
		if(key==0) begin
			if(key_holder==0) begin
				max=max+50;
			end
			key_holder=1;
		end
		else begin
			key_holder=0;
		end 
		if(max>=1000)
			max=1;
		c=c+1;
		if(c>=1000000) begin
			c=0;
			max=max+1;
		end
	
	end
	

	pwm p1(clock,prescaler,max,1000,pwm_out);
	


endmodule
