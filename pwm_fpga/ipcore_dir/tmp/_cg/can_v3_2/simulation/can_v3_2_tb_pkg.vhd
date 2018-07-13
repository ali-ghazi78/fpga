-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
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

-- Author Xilinx
-----------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

package can_v3_2_tb_pkg is

--------------------------------- Clock Periods --------------------------------
-- Clock Periods for the CAN_CLK and SYS_CLK 
--------------------------------------------------------------------------------

constant PERIOD_CAN_CLK:    time     := 50 ns;
constant PERIOD_SYS_CLK:    time     := 25 ns;

--------------------------------------------------------------------------------
-- The Addresses of all Xilinx Configuration Register locations
-- The 2 LSBs of the address are not used.
--------------------------------------------------------------------------------
-- Address is X00  -- READ AND WRITE 
constant ADDR_SRR:        std_logic_vector(0 to 7)  := "00000000"; 
-- Address is X04  -- READ AND WRITE
constant ADDR_MSR:        std_logic_vector(0 to 7)  := "00000100"; 
-- Address is X08  -- READ AND WRITE
constant ADDR_BRPR:       std_logic_vector(0 to 7)  := "00001000"; 
-- Address is X0C  -- READ AND WRITE
constant ADDR_BTR:        std_logic_vector(0 to 7)  := "00001100";
-- Address is X10  -- READ ONLY
constant ADDR_ECR:        std_logic_vector(0 to 7)  := "00010000"; 
-- Address is X14  -- READ ONLY
constant ADDR_ESR:        std_logic_vector(0 to 7)  := "00010100"; 
-- Address is X18  -- READ ONLY
constant ADDR_SR:         std_logic_vector(0 to 7)  := "00011000";
-- Address is X1C  -- READ ONLY
constant ADDR_ISR:        std_logic_vector(0 to 7)  := "00011100"; 
-- Address is X20  -- READ AND WRITE
constant ADDR_IER:        std_logic_vector(0 to 7)  := "00100000"; 
-- Address is X24  -- WRITE ONLY
constant ADDR_ICR:        std_logic_vector(0 to 7)  := "00100100";
-- Address is X30  -- WRITE ONLY
constant ADDR_TXF_ID:     std_logic_vector(0 to 7)  := "00110000"; 
-- Address is X34   -- WRITE ONLY
constant ADDR_TXF_DLC:    std_logic_vector(0 to 7)  := "00110100"; 
-- Address is X38   -- WRITE ONLY
constant ADDR_TXF_DW1:    std_logic_vector(0 to 7)  := "00111000";
-- Address is X3C   -- WRITE ONLY
constant ADDR_TXF_DW2:    std_logic_vector(0 to 7)  := "00111100";
-- Address is X40   -- WRITE ONLY
constant ADDR_TXH_ID:     std_logic_vector(0 to 7)  := "01000000"; 
-- Address is X44   -- WRITE ONLY
constant ADDR_TXH_DLC:    std_logic_vector(0 to 7)  := "01000100"; 
 -- Address is X48  -- WRITE ONLY
constant ADDR_TXH_DW1:    std_logic_vector(0 to 7)  := "01001000";
-- Address is X4C   -- WRITE ONLY
constant ADDR_TXH_DW2:    std_logic_vector(0 to 7)  := "01001100"; 
-- Address is X50   -- READ ONLY
constant ADDR_RXF_ID:     std_logic_vector(0 to 7)  := "01010000";  
-- Address is X54   -- READ ONLY
constant ADDR_RXF_DLC:    std_logic_vector(0 to 7)  := "01010100";
-- Address is X58   -- READ ONLY
constant ADDR_RXF_DW1:    std_logic_vector(0 to 7)  := "01011000";
-- Address is X5C   -- READ ONLY
constant ADDR_RXF_DW2:    std_logic_vector(0 to 7)  := "01011100"; 
-- Address is X60   -- READ/ WRITE
constant ADDR_AFR:        std_logic_vector(0 to 7)  := "01100000";
-- Address is X64   -- READ/ WRITE
constant ADDR_AFMR1:      std_logic_vector(0 to 7) := "01100100";
-- Address is X68   -- READ/ WRITE
constant ADDR_AFIR1:      std_logic_vector(0 to 7) := "01101000";   
-- Address is X6C   -- READ/ WRITE
constant ADDR_AFMR2:      std_logic_vector(0 to 7) := "01101100"; 
-- Address is X70   -- READ/ WRITE
constant ADDR_AFIR2:      std_logic_vector(0 to 7) := "01110000"; 
  -- Address is X74 -- READ/ WRITE
constant ADDR_AFMR3:      std_logic_vector(0 to 7) := "01110100";
  -- Address is X78 -- READ/ WRITE
constant ADDR_AFIR3:      std_logic_vector(0 to 7) := "01111000"; 
  -- Address is X7C -- READ/ WRITE
constant ADDR_AFMR4:      std_logic_vector(0 to 7) := "01111100";
  -- Address is X80 -- READ/ WRITE
constant ADDR_AFIR4:      std_logic_vector(0 to 7) := "10000000";  			

----------------- Configuration Register Write Procedure ------------------
-- This procedure is used to write to the CAN Configuration Registers 
-- Address of the Register, and Data to be written as passed as constants
-- This procedure drives the Bus2IP_CS, BU2IP_RNW, Bus2IP_Data and Bus2IP_Addr
-- signals.
--------------------------------------------------------------------------------
procedure REGWRITE (
  signal   SYS_CLK:         in  std_logic;
  constant ADDR_IN:	    in  std_logic_vector(0 to 7);
  constant DATA_IN: 	    in  std_logic_vector(0 to 31); 
  signal   Bus2IP_CS:	    out std_logic;		     
  signal   Bus2IP_RNW: 	    out std_logic;		 
  signal   Bus2IP_Addr:     out std_logic_vector(0 to 7);
  signal   Bus2IP_Data:     out std_logic_vector(0 to 31); 
  signal   IP2Bus_Ack:      in  std_logic);
----------------- ICR Register Write Procedure ------------------
-- This procedure is used to write to the Interrupt Clear Register
-- Address of the Register is passed as a constant
-- Data to be written is passed as a signal
-- This procedure drives the Bus2IP_CS, BU2IP_RNW, Bus2IP_Data and Bus2IP_Addr
-- signals.
--------------------------------------------------------------------------------
procedure ICRWRITE (
  signal   SYS_CLK:         in  std_logic;
  constant ADDR_IN:	    in  std_logic_vector(0 to 7);
  signal   DATA_IN: 	    in  std_logic_vector(0 to 31); 
  signal   Bus2IP_CS:	    out std_logic;		     
  signal   Bus2IP_RNW: 	    out std_logic;		 
  signal   Bus2IP_Addr:     out std_logic_vector(0 to 7);
  signal   Bus2IP_Data:     out std_logic_vector(0 to 31); 
  signal   IP2Bus_Ack: 	    in  std_logic);  
----------------- Configuration Register Read Procedure ------------------
-- This procedure is used to read from the CAN Configuration Registers 
-- Address of the Register is passed as a constant
-- This procedure drives the Bus2IP_CS, BU2IP_RNW, Bus2IP_Data and Bus2IP_Addr
-- signals.
-- This value read from the register is returned to the caller via the DATA_OUT
-- signal.
--------------------------------------------------------------------------------

procedure REGREAD (
  signal   SYS_CLK:         in  std_logic;
  constant ADDR_IN:	    in  std_logic_vector(0 to 7);
  signal   DATA_OUT:        out std_logic_vector(0 to 31);
  signal   Bus2IP_CS:	    out std_logic;		     
  signal   Bus2IP_RNW: 	    out std_logic;		 
  signal   Bus2IP_Addr:     out std_logic_vector(0 to 7);
  signal   Bus2IP_Data:     out std_logic_vector(0 to 31); 
  signal   IP2Bus_Data:     in  std_logic_vector(0 to 31);
  signal   IP2Bus_Ack:      in  std_logic);
  
    					 
----------------------------  RX FIFO Read Procedure  --------------------------
-- This procedure is used to read from the RX FIFO
-- This procedure calls the REGREAD procedure to read the RX FIFO memory locations
-- ID,DLC,DW1,DW2 are values read from the RX FIFO
--------------------------------------------------------------------------------					 
procedure RXFIFOREAD(
  signal   SYS_CLK:         in  std_logic;
  signal   ID:              out  std_logic_vector(0 to 31); 
  signal   DLC:             out  std_logic_vector(0 to 31);	
  signal   DW1:             out  std_logic_vector(0 to 31);	
  signal   DW2:             out  std_logic_vector(0 to 31); 
  signal   Bus2IP_CS:	    out std_logic;		     
  signal   Bus2IP_RNW: 	    out std_logic;		 
  signal   Bus2IP_Addr:     out std_logic_vector(0 to 7);
  signal   Bus2IP_Data:     out std_logic_vector(0 to 31);
  signal   IP2Bus_Data:     in  std_logic_vector(0 to 31);
  signal   IP2Bus_Ack: 	    in  std_logic);          
----------------------------- TX FIFO Write Procedure --------------------------					 
-- This procedure is used to write to the TX FIFO
-- This procedure calls the REGWRITE procedure to write to the TX FIFO memory 
-- locations.
-- ID,DLC,DW1,DW2 are written into the TX FIFO memory locations
--------------------------------------------------------------------------------
								
procedure TXFIFOWRITE(
  signal   SYS_CLK:         in  std_logic;
  constant ID:              in  std_logic_vector(0 to 31); 
  constant DLC:             in  std_logic_vector(0 to 31);
  constant DW1:             in  std_logic_vector(0 to 31);	
  constant DW2:             in  std_logic_vector(0 to 31); 
  signal   Bus2IP_CS:	    out std_logic;		     
  signal   Bus2IP_RNW: 	    out std_logic;	
  signal   Bus2IP_Addr:     out std_logic_vector(0 to 7);
  signal   Bus2IP_Data:     out std_logic_vector(0 to 31); 
  signal   IP2Bus_Ack:      in  std_logic);   
				
------------------------------ TX HPB Write Procedure --------------------------					 
-- This procedure is used to write to the TX FIFO
-- This procedure calls the REGWRITE procedure to write to the TX FIFO memory 
-- locations.
-- ID,DLC,DW1,DW2 are written into the TX FIFO memory locations
--------------------------------------------------------------------------------

procedure TXHPBWRITE(
  signal   SYS_CLK:         in  std_logic;
  constant ID:              in  std_logic_vector(0 to 31); 
  constant DLC:             in  std_logic_vector(0 to 31);
  constant DW1:             in  std_logic_vector(0 to 31);	
  constant DW2:             in  std_logic_vector(0 to 31); 
  signal   Bus2IP_CS:	    out std_logic;		     
  signal   Bus2IP_RNW: 	    out std_logic;	
  signal   Bus2IP_Addr:     out std_logic_vector(0 to 7);
  signal   Bus2IP_Data:     out std_logic_vector(0 to 31); 
  signal   IP2Bus_Ack:      in  std_logic);          
------------------------------ Report the ISR Bits set -------------------------
-- This procedure is used to report via assert statements the bits in the ISR
-- that are set
--------------------------------------------------------------------------------
 
procedure REPORTISR(
  signal   READ_REG:        in  std_logic_vector(0 to 31));
    					
end package can_v3_2_tb_pkg;
				
package body 	can_v3_2_tb_pkg is				 

--------------------------------------------------------------------------------
----------------- Configuration Register Write Procedure -----------------------
procedure REGWRITE (
  signal   SYS_CLK:         in  std_logic;
  constant ADDR_IN:	    in  std_logic_vector(0 to 7);
  constant DATA_IN: 	    in  std_logic_vector(0 to 31); 
  
  signal   Bus2IP_CS:	    out std_logic;		     
  signal   Bus2IP_RNW: 	    out std_logic;		 
  signal   Bus2IP_Addr:     out std_logic_vector(0 to 7);
  signal   Bus2IP_Data:     out std_logic_vector(0 to 31); 
  signal   IP2Bus_Ack:      in  std_logic) is		 
    
    begin

	Wait until SYS_CLK'event and SYS_CLK = '1' and IP2Bus_Ack = '0';
	Wait for PERIOD_SYS_CLK/4 ;

          Bus2IP_CS <= '1';           
          Bus2IP_RNW <= '0';
          Bus2IP_Addr <= ADDR_IN;
          Bus2IP_Data <= DATA_IN;	
  
	Wait until SYS_CLK'event and SYS_CLK = '1' and IP2Bus_ACK = '1';
  	Wait for PERIOD_SYS_CLK/4;	
     	
          Bus2IP_CS <= '0';  
          Bus2IP_RNW <= '0';
          Bus2IP_Data <= X"00000000";
          Bus2IP_Addr <= "00000000";
				
	Wait until SYS_CLK'event and SYS_CLK = '1';		
end REGWRITE;
--------------------------------------------------------------------------------
----------------- Interrupt Clear Register Write Procedure ---------------------
procedure ICRWRITE (
  signal   SYS_CLK:         in  std_logic;
  constant ADDR_IN:	    in  std_logic_vector(0 to 7);
  signal   DATA_IN: 	    in  std_logic_vector(0 to 31); 
  
  signal   Bus2IP_CS:	    out std_logic;		     
  signal   Bus2IP_RNW: 	    out std_logic;		 
  signal   Bus2IP_Addr:     out std_logic_vector(0 to 7);
  signal   Bus2IP_Data:     out std_logic_vector(0 to 31); 
  signal   IP2Bus_Ack:      in  std_logic) is		 
     begin
  
	Wait until SYS_CLK'event and SYS_CLK = '1' and IP2Bus_Ack = '0';		
	Wait for PERIOD_SYS_CLK/4 ;

          Bus2IP_CS <= '1';           
          Bus2IP_RNW <= '0';
          Bus2IP_Addr <= ADDR_IN;
          Bus2IP_Data <= DATA_IN;	
  
	Wait until SYS_CLK'event and SYS_CLK = '1' and IP2Bus_ACK = '1';
  	Wait for PERIOD_SYS_CLK/4;	
     	
          Bus2IP_CS   <= '0';  
          Bus2IP_RNW  <= '0';
          Bus2IP_Data <= X"00000000";
          Bus2IP_Addr <= "00000000";
				
	Wait until SYS_CLK'event and SYS_CLK = '1';		
end ICRWRITE;
--------------------------------------------------------------------------------
----------------- Configuration Register Read Procedure ------------------------
procedure REGREAD (
  signal   SYS_CLK:         in  std_logic;
  constant ADDR_IN:	    in  std_logic_vector(0 to 7);
  signal   DATA_OUT:        out std_logic_vector(0 to 31);
  signal   Bus2IP_CS:	    out std_logic;		     
  signal   Bus2IP_RNW: 	    out std_logic;		 
  signal   Bus2IP_Addr:     out std_logic_vector(0 to 7);
  signal   Bus2IP_Data:     out std_logic_vector(0 to 31); 
  signal   IP2Bus_Data:     in  std_logic_vector(0 to 31);
  signal   IP2Bus_Ack:      in  std_logic) is 
		 
    begin
  
	Wait until SYS_CLK'event and SYS_CLK = '1' and IP2Bus_Ack = '0';	
	Wait for PERIOD_SYS_CLK/4 ;
          Bus2IP_CS <= '1';           
          Bus2IP_RNW <= '1';
          Bus2IP_Addr <= ADDR_IN;
          Bus2IP_Data <= X"00000000";	


	Wait until SYS_CLK'event and SYS_CLK = '1' and IP2Bus_ACK = '1';
          DATA_OUT  <= IP2Bus_Data; 		
  	Wait for PERIOD_SYS_CLK/4;			
          Bus2IP_CS <= '0';  
          Bus2IP_RNW <= '0';
          Bus2IP_Data <= X"00000000";
          Bus2IP_Addr <= "00000000";
				
        Wait until SYS_CLK'event and SYS_CLK = '1';		
end REGREAD;
--------------------------------------------------------------------------------
----------------------------  RX FIFO Read Procedure  --------------------------
procedure RXFIFOREAD(
  signal   SYS_CLK:         in  std_logic;
  
  signal   ID:              out  std_logic_vector(0 to 31); 
  signal   DLC:             out  std_logic_vector(0 to 31);	
  signal   DW1:             out  std_logic_vector(0 to 31);	
  signal   DW2:             out  std_logic_vector(0 to 31); 
  
  signal   Bus2IP_CS:	    out std_logic;		     
  signal   Bus2IP_RNW: 	    out std_logic;	
  signal   Bus2IP_Addr:     out std_logic_vector(0 to 7); 		
  signal   Bus2IP_Data:     out std_logic_vector(0 to 31);
  signal   IP2Bus_Data:     in  std_logic_vector(0 to 31);
  signal   IP2Bus_Ack:      in  std_logic) is          
begin
	
REGREAD(SYS_CLK,ADDR_RXF_ID,ID,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
		
Wait until SYS_CLK'event and SYS_CLK = '1';		
REGREAD(SYS_CLK,ADDR_RXF_DLC,DLC,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);

Wait until SYS_CLK'event and SYS_CLK = '1';		
REGREAD(SYS_CLK,ADDR_RXF_DW1,DW1,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);

Wait until SYS_CLK'event and SYS_CLK = '1';		
REGREAD(SYS_CLK,ADDR_RXF_DW2,DW2,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
	
end RXFIFOREAD;

--------------------------------------------------------------------------------
----------------------------- TX FIFO Write Procedure --------------------------					 
procedure TXFIFOWRITE(
  signal   SYS_CLK:         in  std_logic;
  constant ID:              in  std_logic_vector(0 to 31); 
  constant DLC:             in  std_logic_vector(0 to 31);
  constant DW1:             in  std_logic_vector(0 to 31);	
  constant DW2:             in  std_logic_vector(0 to 31); 
  signal   Bus2IP_CS:	    out std_logic;		     
  signal   Bus2IP_RNW: 	    out std_logic;	
  signal   Bus2IP_Addr:     out std_logic_vector(0 to 7);
  signal   Bus2IP_Data:     out std_logic_vector(0 to 31); 
  signal   IP2Bus_Ack: 	    in  std_logic) is        


begin
			
REGWRITE (SYS_CLK,ADDR_TXF_ID,ID,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);
	
Wait until SYS_CLK'event and SYS_CLK = '1';		
REGWRITE (SYS_CLK,ADDR_TXF_DLC,DLC,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);

Wait until SYS_CLK'event and SYS_CLK = '1';		
REGWRITE (SYS_CLK,ADDR_TXF_DW1,DW1,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);

Wait until SYS_CLK'event and SYS_CLK = '1';		
REGWRITE (SYS_CLK,ADDR_TXF_DW2,DW2,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);
	
end TXFIFOWRITE;
--------------------------------------------------------------------------------
------------------------------ TX HPB Write Procedure --------------------------					 

procedure TXHPBWRITE(
  signal   SYS_CLK:         in  std_logic;
  constant ID:              in  std_logic_vector(0 to 31); 
  constant DLC:             in  std_logic_vector(0 to 31);
  constant DW1:             in  std_logic_vector(0 to 31);	
  constant DW2:             in  std_logic_vector(0 to 31); 
  signal   Bus2IP_CS:	    out std_logic;		     
  signal   Bus2IP_RNW: 	    out std_logic;		 
  signal   Bus2IP_Addr:     out std_logic_vector(0 to 7);
  signal   Bus2IP_Data:     out std_logic_vector(0 to 31); 
  signal   IP2Bus_Ack:      in  std_logic) is          
	

begin
			
			
REGWRITE (SYS_CLK,ADDR_TXH_ID,ID,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);
		
Wait until SYS_CLK'event and SYS_CLK = '1';		
REGWRITE (SYS_CLK,ADDR_TXH_DLC,DLC,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);

Wait until SYS_CLK'event and SYS_CLK = '1';		
REGWRITE (SYS_CLK,ADDR_TXH_DW1,DW1,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);

Wait until SYS_CLK'event and SYS_CLK = '1';		
REGWRITE (SYS_CLK,ADDR_TXH_DW2,DW2,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);
		
end TXHPBWRITE;	
------------------------------ Report the ISR Bits set -------------------------
-- This procedure is used to report via assert statements the bits in the ISR
-- that are set
--------------------------------------------------------------------------------
 
procedure REPORTISR(
  signal   READ_REG:        in  std_logic_vector(0 to 31)) is
  begin
  
  -- ARBLST bit
  ASSERT(READ_REG(31) = '0') 
  REPORT "ARBLST in the ISR is set"
  SEVERITY NOTE;
  -- TXOK bit
  ASSERT(READ_REG(30) = '0') 
  REPORT "TXOK in the ISR is set"
  SEVERITY NOTE; 
  -- TXFLL bit
  ASSERT(READ_REG(29) = '0') 
  REPORT "TXFLL in the ISR is set"
  SEVERITY NOTE;
  -- TXBFLL bit
  ASSERT(READ_REG(28) = '0') 
  REPORT "TXBFLL in the ISR is set"
  SEVERITY NOTE;
  -- RXOK bit
  ASSERT(READ_REG(27) = '0') 
  REPORT "RXOK in the ISR is set"
  SEVERITY NOTE;  
  -- RXUFLW bit
  ASSERT(READ_REG(26) = '0') 
  REPORT "RXUFLW in the ISR is set"
  SEVERITY NOTE;  
  -- RXOFLW bit
  ASSERT(READ_REG(25) = '0') 
  REPORT "RXOFLW in the ISR is set"
  SEVERITY NOTE;  
  -- RXNEMP bit
  ASSERT(READ_REG(24) = '0') 
  REPORT "RXNEMP in the ISR is set"
  SEVERITY NOTE;  -- ERROR bit
  -- ERROR bit
  ASSERT(READ_REG(23) = '0') 
  REPORT "ERROR in the ISR is set"
  SEVERITY NOTE;
  -- BSOFF bit
  ASSERT(READ_REG(22) = '0') 
  REPORT "BSOFF in the ISR is set"
  SEVERITY NOTE; 
  -- SLP bit
  ASSERT(READ_REG(21) = '0') 
  REPORT "SLP in the ISR is set"
  SEVERITY NOTE;  
  -- WKUP bit
  ASSERT(READ_REG(20) = '0') 
  REPORT "WKUP in the ISR is set"
  SEVERITY NOTE;
  
end REPORTISR;  
            
end package body can_v3_2_tb_pkg;
