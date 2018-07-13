
------------------------------------------------------------------------
-- Title      : CAN Top Level
-- Project    : CAN
------------------------------------------------------------------------
-- File       : can_v3_2_top.vhd
-- Author     : Xilinx Inc.
------------------------------------------------------------------------
-- (c) Copyright 2007 - 2010 Xilinx, Inc. All rights reserved.

-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
------------------------------------------------------------------------
-- Description: This is the top level vhdl wrapper for the CAN Controller core
--              and for the design example provided with it.
--
--              This wrapper also instantiates IOB flip-flops and input/
--              output buffers on the PHY side and IPIC interfaces.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use ieee.numeric_std.all;
library unisim;
use unisim.all;


entity can_v3_2_top is
  port (
    CAN_PHY_TX:         out   std_logic;
    CAN_PHY_RX:         in    std_logic;
    -- External I/Os
    SYS_CLK:            in    std_logic;
    CAN_CLK:            in    std_logic;
    Bus2IP_Reset:       in    std_logic;
    Bus2IP_Data:        in    std_logic_vector(0 to 31);
    Bus2IP_RNW:         in    std_logic;
    Bus2IP_Addr:        in    std_logic_vector(0 to 5);
    Bus2IP_CS:          in    std_logic;
    IP2Bus_Data:        out   std_logic_vector(0 to 31);
    IP2Bus_Ack:         out   std_logic;
    IP2Bus_IntrEvent:   out   std_logic;
    IP2Bus_Error:       out   std_logic
    );	
end can_v3_2_top;


architecture wrapper of can_v3_2_top is
  
component IBUFG
 port (
   O                  : out std_logic;
   I                  : in  std_logic
 );
 end component;	

component BUFG
 port (
   O                  : out std_logic;
   I                  : in  std_logic
 );
 end component;	

component can_v3_2 is
  port (
    CAN_PHY_TX:         out   std_logic;
    CAN_PHY_RX:         in    std_logic;
    -- External I/Os
    SYS_CLK:            in    std_logic;
    CAN_CLK:            in    std_logic;
    Bus2IP_Reset:       in    std_logic;
    Bus2IP_Data:        in    std_logic_vector(0 to 31);
    Bus2IP_RNW:         in    std_logic;
    Bus2IP_Addr:        in    std_logic_vector(0 to 5);
    Bus2IP_CS:          in    std_logic;
    IP2Bus_Data:        out   std_logic_vector(0 to 31);
    IP2Bus_Ack:         out   std_logic;
    IP2Bus_IntrEvent:   out   std_logic;
    IP2Bus_Error:       out   std_logic
    );
end component;
	
	
  signal SYS_CLK_ibufg:        std_logic;
  signal CAN_CLK_ibufg:	       std_logic;
  signal SYS_CLK_bufg: 	       std_logic;
  signal CAN_CLK_bufg:	       std_logic;
 
  
begin

  ibufg_can_clk : IBUFG port map (I => CAN_CLK,       O => CAN_CLK_ibufg);
  ibufg_sys_clk : IBUFG port map (I => SYS_CLK,       O => SYS_CLK_ibufg);
  bufg_can_clk :  BUFG port map  (I => CAN_CLK_ibufg, O => CAN_CLK_bufg);
  bufg_sys_clk :  BUFG port map  (I => SYS_CLK_ibufg, O => SYS_CLK_bufg);


can_core : can_v3_2 
  port map (
    CAN_PHY_TX          =>  CAN_PHY_TX, 
    CAN_PHY_RX          =>  CAN_PHY_RX, 
    -- External I/Os
    SYS_CLK             =>  SYS_CLK_bufg,
    CAN_CLK             =>  CAN_CLK_bufg,
    Bus2IP_Reset        =>  Bus2IP_Reset,
    Bus2IP_Data         =>  Bus2IP_Data,
    Bus2IP_RNW          =>  Bus2IP_RNW,
    Bus2IP_Addr         =>  Bus2IP_Addr,
    Bus2IP_CS           =>  Bus2IP_CS,
    IP2Bus_Data         =>  IP2Bus_Data,
    IP2Bus_Ack          =>  IP2Bus_Ack,
    IP2Bus_IntrEvent    =>  IP2Bus_IntrEvent,
    IP2Bus_Error        =>  IP2Bus_Error
    );
end wrapper;

	
		
