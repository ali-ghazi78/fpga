`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:11:06 08/12/2018 
// Design Name: 
// Module Name:    i2c_master_write_tester 
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
`define not_busy	1
`define busy	0
module i2c_master_write_tester(clock,reset,sda_pin,scl_pin,led[0:7]);
input clock;
input reset;
output  sda_pin;
output  scl_pin;
output reg [0:7] led;
reg enable_send;
wire i2c_f;
reg slv_address;
reg slv_data;
reg slv_register;
reg [0:7]counter_data;
initial begin
	counter_data=0;
	enable_send=1;
end

i2c_master_write_byte k(
.clock(clock),
.reset(reset),
//.led(led),
.sda(sda_pin),
.scl(scl_pin),
.slave_address(slv_address),
.slave_register(slv_register),
.slave_data(slv_data),
.i2c_status(i2c_status),
.i2c_busy(i2c_busy),
.enable_send(enable_send)
);
freq_maker freq_test(.freq_2_make(1),.freq_output(i2c_f),.clock(clock),.reset(reset),.freq_in_mhz(50));
always @(posedge i2c_f)begin
	if(i2c_busy==`not_busy)begin
		if(counter_data==0)begin
			slv_address=8'hc0;
			slv_register=22;
			slv_data=8'hf0;
		end
		else if(counter_data==2)begin
			slv_address=8'hc0;
			slv_register=22;
			slv_data=8'hf5;
		
		end
		else if(counter_data==4)begin
			slv_address=8'hc0;
			slv_register=22;
			slv_data=8'hf5;
		
		end
		else if(counter_data==6)begin
			slv_address=8'hc0;
			slv_register=22;
			slv_data=8'hf5;
		
		end
		else if(counter_data==8)begin
			slv_address=8'hc0;
			slv_register=22;
			slv_data=8'hf5;
		
		end
		else if(counter_data==10)begin
			counter_data=9;
		end
		led=i2c_status;
		counter_data=counter_data+1;
		enable_send=~enable_send;
	end
end

endmodule









