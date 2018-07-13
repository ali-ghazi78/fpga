`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:13:16 07/11/2018 
// Design Name: 
// Module Name:    usart_tester 
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
module usart_tester(input reset,input clock,input rx,output tx,output reg led1,output led2);
	reg [7:0] data;
	reg transmit;
	wire busy;
	initial transmit=1;
	initial led1=1;
	initial data=67;
	my_usart u1( led2,reset,clock,16'd1250,data,rx,tx,transmit,busy);	
	always @(posedge clock) begin
		if(busy==1)begin//if the device is not busy 
			data=67;
			transmit=0;	
			led1=0;
		end
		if(busy==0)begin
			transmit=1;
			led1=1;
		end
	end 
endmodule
