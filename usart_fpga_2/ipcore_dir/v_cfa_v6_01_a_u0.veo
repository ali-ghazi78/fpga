/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used solely      *
*     for design, simulation, implementation and creation of design files      *
*     limited to Xilinx devices or technologies. Use with non-Xilinx           *
*     devices or technologies is expressly prohibited and immediately          *
*     terminates your license.                                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY     *
*     FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY     *
*     PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE              *
*     IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS       *
*     MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY       *
*     CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY        *
*     RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY        *
*     DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE    *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A    *
*     PARTICULAR PURPOSE.                                                      *
*                                                                              *
*     Xilinx products are not intended for use in life support appliances,     *
*     devices, or systems.  Use in such applications are expressly             *
*     prohibited.                                                              *
*                                                                              *
*     (c) Copyright 1995-2018 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/

/*******************************************************************************
*     Generated from core with identifier: xilinx.com:ip:v_cfa:6.01.a          *
*                                                                              *
*     The Xilinx LogiCORE Color Filter Array Interpolation Core                *
*     reconstructs RGB data from color image sensors equipped with a Bayer     *
*     Color Filter Array.                                                      *
*******************************************************************************/

// Interfaces:
//    ctrl
//    video_in
//    video_out
//    aclk_intf
//    aresetn_intf
//    aclken_intf
//    s_axi_aclk_intf
//    s_axi_aclken_intf
//    s_axi_aresetn_intf

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
v_cfa_v6_01_a_u0 your_instance_name (
  .aclk(aclk), // input aclk
  .aclken(aclken), // input aclken
  .aresetn(aresetn), // input aresetn
  .s_axis_video_tdata(s_axis_video_tdata), // input [7 : 0] s_axis_video_tdata
  .s_axis_video_tready(s_axis_video_tready), // output s_axis_video_tready
  .s_axis_video_tvalid(s_axis_video_tvalid), // input s_axis_video_tvalid
  .s_axis_video_tlast(s_axis_video_tlast), // input s_axis_video_tlast
  .s_axis_video_tuser(s_axis_video_tuser), // input s_axis_video_tuser
  .m_axis_video_tdata(m_axis_video_tdata), // output [23 : 0] m_axis_video_tdata
  .m_axis_video_tvalid(m_axis_video_tvalid), // output m_axis_video_tvalid
  .m_axis_video_tready(m_axis_video_tready), // input m_axis_video_tready
  .m_axis_video_tlast(m_axis_video_tlast), // output m_axis_video_tlast
  .m_axis_video_tuser(m_axis_video_tuser) // output m_axis_video_tuser
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file v_cfa_v6_01_a_u0.v when simulating
// the core, v_cfa_v6_01_a_u0. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

