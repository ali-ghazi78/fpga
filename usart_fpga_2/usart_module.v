`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:35 07/12/2018 
// Design Name: 
// Module Name:    usart_module 
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
//--------------------------reset is active low---------------------------------
//-------------------(8bit data) (no parity) (1 stop bit)-----------------------
//transmit input is always 1 .when loading data finished and you wanted to send data make transmit low 
module my_usart(k,reset,clock,prescaler[15:0],data[7:0],rx_pin,tx_pin,transmit,uart_busy);
	input reset;
	input clock;
	input [7:0] data;
	input rx_pin;
	input transmit;
	input [15:0] prescaler;
	output k;
	output reg uart_busy;
	output tx_pin;
	wire clock_devided;
	reg tx_pin;
	reg [7:0]counter;
	reg[15:0] clock_counter;
	reg finished;
	reg [7:0] data_temp;
	reg k;
	reg [31:0]p;
	reg flag_wait;
	initial begin
		uart_busy=1;//1 means not busy 
		finished=1;
		counter=0;
		tx_pin=1;
		data_temp=data;
		flag_wait=0;
		p=0;
		k=1;
	end
	always @(posedge clock ) begin
		clock_counter=clock_counter+1;
		if(!reset) begin		
			counter=0;
			tx_pin=1;
			finished=1;
			flag_wait=0;
			clock_counter=0;
			uart_busy=1;
		end
		if(transmit==1)
			flag_wait=0;
		if(clock_counter*2>=prescaler) begin
			clock_counter=0;
			if((flag_wait==0)&&(transmit==0||finished==0)) begin
				counter=counter+1;
				finished =0;
				if(counter==1)begin
					uart_busy=0;//is busy
					tx_pin=0;										//start		
					data_temp=data;
				end 
				else if(counter>=10)begin
					uart_busy=1;//not busy .sending data finished
					tx_pin=1;				//stop
					counter=0;
					finished =1;
					if(transmit==0)
						flag_wait=1;
					else
						flag_wait=0;
					k=~k;

				end
				else begin
					tx_pin=(data_temp&(1))&&(1);
					data_temp=data_temp>>1;
				end
			end
		end
	end

endmodule


