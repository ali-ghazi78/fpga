`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:47:30 07/09/2018 
// Design Name: 
// Module Name:    pwm 
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
module pwm(clock,prescaler[31:0],count_2_reach_2_top[9:0],top[9:0],pwm_out);
    input clock;
    input [9:0]top;
    input[31:0] prescaler;
    input[9:0] count_2_reach_2_top;
    output pwm_out;

    reg pwm_out;
    reg[31:0] counter;
    reg[9:0] counter_4_pwm;
    reg[31:0] prescaler_temp;
    reg [9:0]top_temp;
    
    initial begin
        counter=0;
        counter_4_pwm=0;
        pwm_out=0;
        prescaler_temp=prescaler;
        top_temp=top;
    end 

    always @(posedge clock) begin
        counter =counter+1;
        if(prescaler_temp==counter && counter!=0) begin
            if(count_2_reach_2_top==0)pwm_out=0;
            else if(counter_4_pwm<count_2_reach_2_top) begin
                counter_4_pwm=counter_4_pwm+1;
                pwm_out=1;
            end
            else begin 
                if(counter_4_pwm>=1023||counter_4_pwm>=top_temp)
                    counter_4_pwm=0;
                else
                    counter_4_pwm=counter_4_pwm+1;
                pwm_out=0;
            end
            counter=0;
        end
            
    end 
endmodule
