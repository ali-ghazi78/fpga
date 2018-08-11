`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:23:10 08/11/2018 
// Design Name: 
// Module Name:    i2c_master 
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
// Data is placed on the SDA line after SCL goes low, and is sampled after the SCL line goes high
//Start Condition    the master device leaves SCL high and pulls SDA low
// the address is  (MSB) first, followed by a R/W bit a read (1) or write (0) operation.
//The 9th bit of the frame is the NACK/ACK bit.both for data and address
//stop low to high) transition on SDA after a 0->1 transition on SCL with SCL remaining high.During normal data writing operation, the value on SDA should not change when SCL is high
`define freq_main 50000
`define freq_i2c  
`define not_busy	1
`define busy	0
//if value of  and scl is z it means they are both high
//enable_send is high always when u make it low the transmition starts 
module i2c_master_write_byte(clock,reset,led,sda,scl,slave_address,slave_register,slave_data,i2c_status,i2c_busy,enable_send);
	input clock;
	input reset;
	inout sda;
	inout scl;
	input [0:7]slave_address;
	input [0:7]slave_data;
	input [0:7]slave_register;
	input enable_send;
	output reg [0:7]i2c_status;
	output reg led;
	output reg i2c_busy;
	wire delay_ms;
	wire delay_ns;
	reg [0:7]counter_data;
	

	initial  begin
		i2c_busy=`not_busy;
		led=0;
		i2c_status=0;
	end
	always@(posedge i2c_clock) begin
		if(!reset)begin
			i2c_busy=`not_busy;
			led=1;
			i2c_status=0;
			scl=z;
			sda=z;
		end
		else if(!enable_send)begin
			if(counter_i2c==0)begin
				led=1;
				i2c_busy=`busy;
				scl=z;
				sda=z;
				i2c_status=0;
				counter_i2c=counter_i2c+1;
			end
			else if(counter_i2c==1)begin						//-----------------------------start_condition---------------
				sda=0;
				scl=z;		
				counter_data=8;//because we avoided negative numbers
				counter_i2c=counter_i2c+1;
			end
			else if(counter_i2c>=2&&counter_i2c<=17)begin//---------------------- address msb to lsb-------------------
				if(counter_data>=1&&counter_i2c%2==0)begin//2-4-6-8-10-12-14-16
					scl=0;
					sda=((slave_address&(1<<(counter_data-1)))&&1)?z:0;
					counter_data=counter_data-1;
				end
				else if(counter_data%2==1)begin
					scl=z;		
				end
				counter_i2c=counter_i2c+1;
			end
			else if(counter_i2c==18)begin
				if(sda==1)//no ack
					i2c_status=i2c_status|1;		//address was sent but no ack
				else
					i2c_status=i2c_status|2;		//address was sent and ack received 
				scl=0;
				counter_data=8;
				counter_i2c=counter_i2c+1;
			end
			else if(counter_i2c>=19&&counter_i2c<=34)begin//---------------------- register msb to lsb-------------------
				if(counter_data>=1&&counter_i2c%2==0)begin//2-4-6-8-10-12-14-16
					scl=0;
					sda=((slave_address&(1<<(counter_data-1)))&&1)?z:0;
					counter_data=counter_data-1;
				end
				else if(counter_data%2==1)begin
					scl=z;		
				end
				counter_i2c=counter_i2c+1;
			end
			counter_data=8;//because we avoided negative numbers
			for(;counter_data>=1;counter_data=counter_data-1)begin
				scl=0;
				sda=((slave_register&(1<<(counter_data-1)))&&1)?z:0;
				#10_000;//100khz
				scl=z;		
				#10_000;//100khz			
			end
			//------------------------------------------------------------
			if(sda==1)//no ack
				i2c_status=i2c_status|4;		//register was sent but no ack
			else
				i2c_status=i2c_status|8;		//register was sent and ack received
			scl=0;
			#10_000;//100khz			
			//---------------------- data msb to lsb-------------------
			counter_data=8;//because we avoided negative numbers
			for(;counter_data>=1;counter_data=counter_data-1)begin
				scl=0;
				sda=((slave_data&(1<<(counter_data-1)))&&1)?z:0;
				#10_000;//100khz
				scl=z;		
				#10_000;//100khz			
			end
			//------------------------------------------------------------
			if(sda==1)//no ack
				i2c_status=i2c_status|16;		//data was sent but no ack
			else
				i2c_status=i2c_status|32;		//data was sent and ack received 
			scl=0;
			#10_000;//100khz
				
			//-----------------------------start_condition---------------
			scl=0;		
			#10_000;//100khz
			sda=0;
			#10_000;//100khz
			scl=z;
			#10;			
			sda=z;
			//-----------------------------------------------------------
			i2c_busy=`not_busy;
			led=0;
		end
		else begin//nothing has happend
			led=0;
		end
	end
endmodule



//for example if u have 50mhz just pass 50 for freq_in_mhz 
//for example if u have 50khz  kilooo not mega just pass 50 for freq_2_make  


//*2 be khater ine ke vati modul mikoni freq khoroji nesf mishe
module freq_maker(freq_2_make,freq_output,clock,reset,freq_in_mhz,led);
	input [0:15] freq_2_make;
	input [0:7] freq_in_mhz;
	input clock;
	input reset;
	output reg led;
	output freq_output;
	reg [0:31]counter_clock;
	
	initial begin
		counter_clock=0;
		freq_output=0;
		led=0;
	end
	
	always @(posedge clock)begin
		if(!reset)begin
			counter_clock=0;
			delay_output=0;		
			led=0;
		end
		else begin	
			if((counter_clock*2)<((freq_in_mhz*1000)/(freq_2_make)))begin
				freq_output=~freq_output;
				counter_clock=0;
				led=1;
			end
			else begin
				counter_clock=counter_clock+1;
				led=0;
			end
		end
		
	end 



endmodule
