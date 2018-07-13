////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: usart_tester_translate.v
// /___/   /\     Timestamp: Wed Jul 11 03:10:52 2018
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/translate -ofmt verilog -sim usart_tester.ngd usart_tester_translate.v 
// Device	: 6slx9tqg144-2
// Input file	: usart_tester.ngd
// Output file	: D:\fpga_project\usart_fpga\netgen\translate\usart_tester_translate.v
// # of Modules	: 1
// Design Name	: usart_tester
// Xilinx        : F:\xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module usart_tester (
  clk, rx, tx
);
  input clk;
  input rx;
  output tx;
  wire clk_BUFGP;
  wire \u1/tx_pin_4 ;
  wire transmit;
  wire \u1/d1/output_clk_INV_2_o ;
  wire \u1/_n0055_32 ;
  wire \u1/flag_transmit_wait_33 ;
  wire \u1/d1/output_clk_34 ;
  wire \u1/_n00541_35 ;
  wire \u1/_n00542_36 ;
  wire N2;
  wire \u1/tx_pin_glue_rst_40 ;
  wire \u1/Mcount_counter_cy<6>_rt_41 ;
  wire \u1/Mcount_counter_cy<5>_rt_42 ;
  wire \u1/Mcount_counter_cy<4>_rt_43 ;
  wire \u1/Mcount_counter_cy<3>_rt_44 ;
  wire \u1/Mcount_counter_cy<2>_rt_45 ;
  wire \u1/Mcount_counter_cy<1>_rt_46 ;
  wire \u1/Mcount_counter_xor<7>_rt_47 ;
  wire \u1/flag_transmit_wait_rstpot_48 ;
  wire N4;
  wire \u1/counter_7_rstpot_50 ;
  wire \u1/counter_6_rstpot_51 ;
  wire \u1/counter_5_rstpot_52 ;
  wire \u1/counter_4_rstpot_53 ;
  wire \u1/counter_3_rstpot_54 ;
  wire \u1/counter_2_rstpot_55 ;
  wire \u1/counter_1_rstpot_56 ;
  wire \u1/counter_0_rstpot_57 ;
  wire \clk_BUFGP/IBUFG_2 ;
  wire GND;
  wire VCC;
  wire [2 : 2] data;
  wire [6 : 0] \u1/Mcount_counter_cy ;
  wire [0 : 0] \u1/Mcount_counter_lut ;
  wire [7 : 0] \u1/counter ;
  wire [7 : 0] \u1/Result ;
  X_ONE   XST_VCC (
    .O(data[2])
  );
  X_ZERO   XST_GND (
    .O(transmit)
  );
  X_XOR2   \u1/Mcount_counter_xor<7>  (
    .I0(\u1/Mcount_counter_cy [6]),
    .I1(\u1/Mcount_counter_xor<7>_rt_47 ),
    .O(\u1/Result [7])
  );
  X_XOR2   \u1/Mcount_counter_xor<6>  (
    .I0(\u1/Mcount_counter_cy [5]),
    .I1(\u1/Mcount_counter_cy<6>_rt_41 ),
    .O(\u1/Result [6])
  );
  X_MUX2   \u1/Mcount_counter_cy<6>  (
    .IB(\u1/Mcount_counter_cy [5]),
    .IA(transmit),
    .SEL(\u1/Mcount_counter_cy<6>_rt_41 ),
    .O(\u1/Mcount_counter_cy [6])
  );
  X_XOR2   \u1/Mcount_counter_xor<5>  (
    .I0(\u1/Mcount_counter_cy [4]),
    .I1(\u1/Mcount_counter_cy<5>_rt_42 ),
    .O(\u1/Result [5])
  );
  X_MUX2   \u1/Mcount_counter_cy<5>  (
    .IB(\u1/Mcount_counter_cy [4]),
    .IA(transmit),
    .SEL(\u1/Mcount_counter_cy<5>_rt_42 ),
    .O(\u1/Mcount_counter_cy [5])
  );
  X_XOR2   \u1/Mcount_counter_xor<4>  (
    .I0(\u1/Mcount_counter_cy [3]),
    .I1(\u1/Mcount_counter_cy<4>_rt_43 ),
    .O(\u1/Result [4])
  );
  X_MUX2   \u1/Mcount_counter_cy<4>  (
    .IB(\u1/Mcount_counter_cy [3]),
    .IA(transmit),
    .SEL(\u1/Mcount_counter_cy<4>_rt_43 ),
    .O(\u1/Mcount_counter_cy [4])
  );
  X_XOR2   \u1/Mcount_counter_xor<3>  (
    .I0(\u1/Mcount_counter_cy [2]),
    .I1(\u1/Mcount_counter_cy<3>_rt_44 ),
    .O(\u1/Result [3])
  );
  X_MUX2   \u1/Mcount_counter_cy<3>  (
    .IB(\u1/Mcount_counter_cy [2]),
    .IA(transmit),
    .SEL(\u1/Mcount_counter_cy<3>_rt_44 ),
    .O(\u1/Mcount_counter_cy [3])
  );
  X_XOR2   \u1/Mcount_counter_xor<2>  (
    .I0(\u1/Mcount_counter_cy [1]),
    .I1(\u1/Mcount_counter_cy<2>_rt_45 ),
    .O(\u1/Result [2])
  );
  X_MUX2   \u1/Mcount_counter_cy<2>  (
    .IB(\u1/Mcount_counter_cy [1]),
    .IA(transmit),
    .SEL(\u1/Mcount_counter_cy<2>_rt_45 ),
    .O(\u1/Mcount_counter_cy [2])
  );
  X_XOR2   \u1/Mcount_counter_xor<1>  (
    .I0(\u1/Mcount_counter_cy [0]),
    .I1(\u1/Mcount_counter_cy<1>_rt_46 ),
    .O(\u1/Result [1])
  );
  X_MUX2   \u1/Mcount_counter_cy<1>  (
    .IB(\u1/Mcount_counter_cy [0]),
    .IA(transmit),
    .SEL(\u1/Mcount_counter_cy<1>_rt_46 ),
    .O(\u1/Mcount_counter_cy [1])
  );
  X_XOR2   \u1/Mcount_counter_xor<0>  (
    .I0(transmit),
    .I1(\u1/Mcount_counter_lut [0]),
    .O(\u1/Result [0])
  );
  X_MUX2   \u1/Mcount_counter_cy<0>  (
    .IB(transmit),
    .IA(data[2]),
    .SEL(\u1/Mcount_counter_lut [0]),
    .O(\u1/Mcount_counter_cy [0])
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \u1/d1/output_clk  (
    .CLK(clk_BUFGP),
    .CE(data[2]),
    .I(\u1/d1/output_clk_INV_2_o ),
    .O(\u1/d1/output_clk_34 ),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .INIT ( 64'h7FFFFFFFFFEEFFEE ))
  \u1/_n00541  (
    .ADR0(\u1/counter [5]),
    .ADR1(\u1/counter [6]),
    .ADR2(\u1/counter [2]),
    .ADR3(\u1/counter [7]),
    .ADR4(\u1/counter [3]),
    .ADR5(\u1/counter [4]),
    .O(\u1/_n00541_35 )
  );
  X_LUT5 #(
    .INIT ( 32'h72FE0000 ))
  \u1/_n00542  (
    .ADR0(\u1/counter [1]),
    .ADR1(\u1/counter [0]),
    .ADR2(\u1/counter [2]),
    .ADR3(\u1/counter [4]),
    .ADR4(\u1/counter [3]),
    .O(\u1/_n00542_36 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFFE ))
  \u1/_n0055_SW0  (
    .ADR0(\u1/counter [0]),
    .ADR1(\u1/counter [1]),
    .ADR2(\u1/counter [2]),
    .ADR3(\u1/flag_transmit_wait_33 ),
    .O(N2)
  );
  X_LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \u1/_n0055  (
    .ADR0(\u1/counter [7]),
    .ADR1(\u1/counter [5]),
    .ADR2(\u1/counter [6]),
    .ADR3(\u1/counter [4]),
    .ADR4(\u1/counter [3]),
    .ADR5(N2),
    .O(\u1/_n0055_32 )
  );
  X_FF #(
    .INIT ( 1'b1 ))
  \u1/tx_pin  (
    .CLK(\u1/d1/output_clk_34 ),
    .I(\u1/tx_pin_glue_rst_40 ),
    .O(\u1/tx_pin_4 ),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \u1/Mcount_counter_cy<6>_rt  (
    .ADR0(\u1/counter [6]),
    .O(\u1/Mcount_counter_cy<6>_rt_41 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \u1/Mcount_counter_cy<5>_rt  (
    .ADR0(\u1/counter [5]),
    .O(\u1/Mcount_counter_cy<5>_rt_42 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \u1/Mcount_counter_cy<4>_rt  (
    .ADR0(\u1/counter [4]),
    .O(\u1/Mcount_counter_cy<4>_rt_43 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \u1/Mcount_counter_cy<3>_rt  (
    .ADR0(\u1/counter [3]),
    .O(\u1/Mcount_counter_cy<3>_rt_44 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \u1/Mcount_counter_cy<2>_rt  (
    .ADR0(\u1/counter [2]),
    .O(\u1/Mcount_counter_cy<2>_rt_45 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \u1/Mcount_counter_cy<1>_rt  (
    .ADR0(\u1/counter [1]),
    .O(\u1/Mcount_counter_cy<1>_rt_46 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \u1/Mcount_counter_xor<7>_rt  (
    .ADR0(\u1/counter [7]),
    .O(\u1/Mcount_counter_xor<7>_rt_47 ),
    .ADR1(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \u1/flag_transmit_wait  (
    .CLK(\u1/d1/output_clk_34 ),
    .I(\u1/flag_transmit_wait_rstpot_48 ),
    .O(\u1/flag_transmit_wait_33 ),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT4 #(
    .INIT ( 16'hFFFE ))
  \u1/flag_transmit_wait_rstpot_SW0  (
    .ADR0(\u1/counter [6]),
    .ADR1(\u1/counter [5]),
    .ADR2(\u1/counter [4]),
    .ADR3(\u1/counter [3]),
    .O(N4)
  );
  X_LUT6 #(
    .INIT ( 64'hFFFAFFFAFFFACCC8 ))
  \u1/flag_transmit_wait_rstpot  (
    .ADR0(\u1/counter [7]),
    .ADR1(\u1/flag_transmit_wait_33 ),
    .ADR2(N4),
    .ADR3(N2),
    .ADR4(\u1/_n00542_36 ),
    .ADR5(\u1/_n00541_35 ),
    .O(\u1/flag_transmit_wait_rstpot_48 )
  );
  X_LUT3 #(
    .INIT ( 8'h0B ))
  \u1/tx_pin_glue_rst  (
    .ADR0(\u1/tx_pin_4 ),
    .ADR1(\u1/flag_transmit_wait_33 ),
    .ADR2(\u1/_n0055_32 ),
    .O(\u1/tx_pin_glue_rst_40 )
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \u1/counter_7  (
    .CLK(\u1/d1/output_clk_34 ),
    .I(\u1/counter_7_rstpot_50 ),
    .O(\u1/counter [7]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \u1/counter_6  (
    .CLK(\u1/d1/output_clk_34 ),
    .I(\u1/counter_6_rstpot_51 ),
    .O(\u1/counter [6]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \u1/counter_5  (
    .CLK(\u1/d1/output_clk_34 ),
    .I(\u1/counter_5_rstpot_52 ),
    .O(\u1/counter [5]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \u1/counter_4  (
    .CLK(\u1/d1/output_clk_34 ),
    .I(\u1/counter_4_rstpot_53 ),
    .O(\u1/counter [4]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \u1/counter_3  (
    .CLK(\u1/d1/output_clk_34 ),
    .I(\u1/counter_3_rstpot_54 ),
    .O(\u1/counter [3]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \u1/counter_2  (
    .CLK(\u1/d1/output_clk_34 ),
    .I(\u1/counter_2_rstpot_55 ),
    .O(\u1/counter [2]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \u1/counter_1  (
    .CLK(\u1/d1/output_clk_34 ),
    .I(\u1/counter_1_rstpot_56 ),
    .O(\u1/counter [1]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \u1/counter_0  (
    .CLK(\u1/d1/output_clk_34 ),
    .I(\u1/counter_0_rstpot_57 ),
    .O(\u1/counter [0]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT5 #(
    .INIT ( 32'h888888B8 ))
  \u1/counter_3_rstpot  (
    .ADR0(\u1/counter [3]),
    .ADR1(\u1/flag_transmit_wait_33 ),
    .ADR2(\u1/Result [3]),
    .ADR3(\u1/_n00542_36 ),
    .ADR4(\u1/_n00541_35 ),
    .O(\u1/counter_3_rstpot_54 )
  );
  X_LUT5 #(
    .INIT ( 32'h888888B8 ))
  \u1/counter_2_rstpot  (
    .ADR0(\u1/counter [2]),
    .ADR1(\u1/flag_transmit_wait_33 ),
    .ADR2(\u1/Result [2]),
    .ADR3(\u1/_n00542_36 ),
    .ADR4(\u1/_n00541_35 ),
    .O(\u1/counter_2_rstpot_55 )
  );
  X_LUT5 #(
    .INIT ( 32'h888888B8 ))
  \u1/counter_1_rstpot  (
    .ADR0(\u1/counter [1]),
    .ADR1(\u1/flag_transmit_wait_33 ),
    .ADR2(\u1/Result [1]),
    .ADR3(\u1/_n00542_36 ),
    .ADR4(\u1/_n00541_35 ),
    .O(\u1/counter_1_rstpot_56 )
  );
  X_LUT5 #(
    .INIT ( 32'h888888B8 ))
  \u1/counter_0_rstpot  (
    .ADR0(\u1/counter [0]),
    .ADR1(\u1/flag_transmit_wait_33 ),
    .ADR2(\u1/Result [0]),
    .ADR3(\u1/_n00542_36 ),
    .ADR4(\u1/_n00541_35 ),
    .O(\u1/counter_0_rstpot_57 )
  );
  X_LUT5 #(
    .INIT ( 32'h888888B8 ))
  \u1/counter_4_rstpot  (
    .ADR0(\u1/counter [4]),
    .ADR1(\u1/flag_transmit_wait_33 ),
    .ADR2(\u1/Result [4]),
    .ADR3(\u1/_n00542_36 ),
    .ADR4(\u1/_n00541_35 ),
    .O(\u1/counter_4_rstpot_53 )
  );
  X_LUT5 #(
    .INIT ( 32'h888888B8 ))
  \u1/counter_5_rstpot  (
    .ADR0(\u1/counter [5]),
    .ADR1(\u1/flag_transmit_wait_33 ),
    .ADR2(\u1/Result [5]),
    .ADR3(\u1/_n00542_36 ),
    .ADR4(\u1/_n00541_35 ),
    .O(\u1/counter_5_rstpot_52 )
  );
  X_LUT5 #(
    .INIT ( 32'h888888B8 ))
  \u1/counter_6_rstpot  (
    .ADR0(\u1/counter [6]),
    .ADR1(\u1/flag_transmit_wait_33 ),
    .ADR2(\u1/Result [6]),
    .ADR3(\u1/_n00542_36 ),
    .ADR4(\u1/_n00541_35 ),
    .O(\u1/counter_6_rstpot_51 )
  );
  X_LUT5 #(
    .INIT ( 32'h888888B8 ))
  \u1/counter_7_rstpot  (
    .ADR0(\u1/counter [7]),
    .ADR1(\u1/flag_transmit_wait_33 ),
    .ADR2(\u1/Result [7]),
    .ADR3(\u1/_n00542_36 ),
    .ADR4(\u1/_n00541_35 ),
    .O(\u1/counter_7_rstpot_50 )
  );
  X_INV   \u1/Mcount_counter_lut<0>_INV_0  (
    .I(\u1/counter [0]),
    .O(\u1/Mcount_counter_lut [0])
  );
  X_INV   \u1/d1/output_clk_INV_2_o1_INV_0  (
    .I(\u1/d1/output_clk_34 ),
    .O(\u1/d1/output_clk_INV_2_o )
  );
  X_IPAD #(
    .LOC ( "P56" ))
  clk_57 (
    .PAD(clk)
  );
  X_OPAD #(
    .LOC ( "P121" ))
  tx_58 (
    .PAD(tx)
  );
  X_CKBUF   \clk_BUFGP/BUFG  (
    .I(\clk_BUFGP/IBUFG_2 ),
    .O(clk_BUFGP)
  );
  X_CKBUF   \clk_BUFGP/IBUFG  (
    .I(clk),
    .O(\clk_BUFGP/IBUFG_2 )
  );
  X_OBUF   tx_OBUF (
    .I(\u1/tx_pin_4 ),
    .O(tx)
  );
  X_ZERO   NlwBlock_usart_tester_GND (
    .O(GND)
  );
  X_ONE   NlwBlock_usart_tester_VCC (
    .O(VCC)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

