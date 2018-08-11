`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:37:49 08/08/2018 
// Design Name: 
// Module Name:    usart_tester_rx_tx 
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
module usart_tester_rx_tx(led,led1,led2,clock,reset,tx_pin,rx_pin,transmit);
	
	input clock;
	input reset;
	input rx_pin;
	output reg[7:0]led;
	output  led1;
	output  led2;
	output reg tx_pin;
	output reg transmit;
	wire  usart_busy1;
	wire  usart_busy2;
	wire tx_temp_internal;
	wire [0:7] data_rx;
	reg [0:7] data_tx;
	reg [0:31] counter;
	reg [0:7] i;
	
	initial begin
		transmit=1;
		counter=0;
		led=16'b0000_1111;
		i=0;
	end

	usart_tx tx_1 ( 
		 .reset(reset), 
		 .clock(clock), 
		 .prescaler(1250), 
		 .data(data_tx), 
		 .tx_pin(tx_temp_internal), 
		 .transmit(transmit), 
		 .usart_busy(usart_busy1)
		 );


	// Instantiate the module
	usart_rx rx_1 (
		 .reset(reset), 
		 .clock(clock), 
		 .prescaler(1250), 
		 .data(data_rx), 
		 .rx_pin(tx_temp_internal), 
		 .usart_busy(usart_busy2)
		 );

	always @(posedge clock)begin
		if(usart_busy1==0)begin
			transmit=1;
		end
		if(counter>5000000)begin
				counter=0;
			if(usart_busy1==1)begin
				data_tx=20;
				transmit=0;	
				i=i+1;
			end
			
		end
		else
			counter=counter+1;
	end
	always@(posedge usart_busy2)begin//bayad posedge bashe zira vaqti karesh tammom mishe high mishe .avale kar hengame shoro low mishe
			led=data_rx;
	end





endmodule
