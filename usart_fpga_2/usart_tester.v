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
		
		usart_rx mm();
		my_usart m();
endmodule
