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
module usart_tester(input reset,input clock,input rx,output tx,output reg k,output led2);
	reg[59:0][7:0] data_;
	reg [7:0] data;
	initial data_="ll h e l l o  w o r l d  w i t h  f p g a ";
	reg transmit;
	wire wi;
	wire busy;
	reg [15:0]counter;
	initial counter=0;
	initial transmit=1;
	initial k=1;
	reg i;
	initial i=0;
	my_usart u1( led2,reset,clock,16'd2500,data,rx,tx,transmit,busy);
	clock_devider d2(clock,16'd12000,wi);
	
	always @(posedge clock) begin
		counter=counter+1;
		#100000;
			if(busy==1)begin//if the device is not busy 
				data=67;
				transmit=0;	
				k=0;
				counter=0;
				i=i+1;
				if(i>=20)
					i=0;
			end
			if(busy==0)begin
				transmit=1;
				k=1;
			end

		
	end 
endmodule
