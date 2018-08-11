`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:37:26 08/08/2018 
// Design Name: 
// Module Name:    usart_rx 
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

//reset is active low
// the point is that u use usart_busy for interupt in sdk to see what data has been received recently
`define not_busy 1
`define busy 0
`define finished 1
`define not_finished 0

module usart_rx(led,reset,clock,prescaler[0:15],data[0:7],rx_pin,usart_busy);
	input reset;
	input clock;
	output reg [0:7] data;
	input [0:15] prescaler;
	output reg led;
	output reg usart_busy;
	input  rx_pin;
	reg [0:15]counter_clock;
	reg flag_finished;
	reg [0:7] counter_data;
	reg [0:7] data_temp;

	initial begin 
		data=0;
		led=0;
		usart_busy=`not_busy;
		counter_clock=0;
		flag_finished=`finished;
		counter_data=0;
		data_temp=data;
	end 
	always @(posedge clock) begin
		counter_clock=counter_clock+1;
		if(!reset)begin
			counter_clock=0;
			data=0;
			data_temp=0;
			led=1;
			counter_data=0;
			flag_finished=`finished;
		end
		else if(counter_clock>=prescaler)begin//only even prescaler is available
			counter_clock=0;
			if(flag_finished==`not_finished||rx_pin==0)begin
				led=1;
				usart_busy=`busy;
				flag_finished=`not_finished;
				if(counter_data==0) begin  		//start condition has occured
					counter_data=1;		
					data_temp=0;
				end
				else if (counter_data>=9)begin
					counter_data=0;
					usart_busy=`not_busy;
					flag_finished=`finished;
					counter_data=0;
					if(rx_pin==1)				//data is valid .it should be 1 
						data=data_temp;
					else
						data=16'b1111_1111;//be careful if data was not valid we will receive 0xff u can comment this line to keep the last valid data
						
				end
				else begin
					data_temp=data_temp|(rx_pin<<counter_data-1);
					counter_data=counter_data+1;
				end
			end
			else begin
				led=0;
				usart_busy=`not_busy;
				flag_finished=`finished;
			end
		end 
	
	
	end


endmodule
