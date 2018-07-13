------------------------------------------------------------------------
-- Title      : Demonstration testbench
-- Project    : CAN Controller Core
------------------------------------------------------------------------
-- File       : can_v3_2_tb.vhd
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
-- Description: This testbench will exercise the ports of the CAN core
--              to demonstrate the functionality.
-- The testbench performs the following operations

-- Setting up the Configuration Registers 
-- Write Messages to the TXHPB/TX FIFO  
-- Read the Messages from the RX FIFO
-----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use ieee.numeric_std.all;

library work;
use work.can_v3_2_tb_pkg.all;

entity can_v3_2_tb is
end entity can_v3_2_tb;


architecture test of can_v3_2_tb is
	
component can_v3_2_top is
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
	
	
  signal SYS_CLK:             std_logic := '0';
  signal CAN_CLK:             std_logic := '0';
  signal Bus2IP_Reset: 	      std_logic := '1';
  signal CAN_PHY_TX_I:        std_logic;

  signal Bus2IP_CS:           std_logic := '0';       
  signal Bus2IP_RNW:          std_logic := '0';
  signal Bus2IP_Addr:         std_logic_vector(0 to 7) := "00000000";
  signal Bus2IP_Addr_core:    std_logic_vector(0 to 5) := "000000";
  signal Bus2IP_Data:         std_logic_vector(0 to 31):= X"00000000";
  signal IP2Bus_Data:         std_logic_vector(0 to 31):= X"00000000";
  signal IP2Bus_Ack:          std_logic := '0';
  signal IP2Bus_IntrEvent:    std_logic := '0';
  signal IP2Bus_Error:        std_logic := '0';
  
  signal REG_READ:            std_logic_vector(0 to 31) := X"00000000";
  signal WAIT_PROC:           std_logic := '0';  
  
  signal RXF_ID:              std_logic_vector(0 to 31);
  signal RXF_DLC:             std_logic_vector(0 to 31);
  signal RXF_DW1:             std_logic_vector(0 to 31);
  signal RXF_DW2:             std_logic_vector(0 to 31);
  signal ERROR_CNT:           integer   := 0;
  signal opb_timeout_cnt:     std_logic_vector(15 downto 0) := (others => '0');  
	begin

Bus2IP_Addr_core <= Bus2IP_Addr(0 to 5);

-------------------------------- SYS_CLK Generation ----------------------------
-- This process generates the SYS_CLK
--------------------------------------------------------------------------------	
sysclk:	process
  variable CLK: std_logic := '0';
  begin
   while(TRUE)
     loop
       wait for PERIOD_SYS_CLK/2;
        CLK := not CLK;
        SYS_CLK <= CLK;
     end loop;
end process sysclk;
-------------------------------- CAN_CLK Generation ----------------------------
-- This process generates the CAN_CLK
--------------------------------------------------------------------------------	
canclk: process
  variable CLK: std_logic := '0';
  begin
    while(TRUE)
      loop
        wait for PERIOD_CAN_CLK/2;
          CLK := not CLK;
          CAN_CLK <= CLK;
      end loop;
end process canclk;	
	
---------------- Stimulus Generator/ Corectness checker-------------------------
-- This process reads/writes to various configuration registers in the CAN core.
-- The Core is set in loop back mode, and five frames are sent by the core.
-- The sent frames are compared with the received frames.
--------------------------------------------------------------------------------
process 
  begin	
  REPORT "Timing checks are not valid" SEVERITY NOTE;
  
--------------------------------------------------------------------------------
-- Deassert the Bus2IP_Reset signal
--------------------------------------------------------------------------------
  Bus2IP_Reset <= '0' after 5*PERIOD_CAN_CLK;
  -- Wait for 6 CAN_CLK Periods after Bus2IP_Reset is deasserted
  wait for PERIOD_CAN_CLK*6;
	
--------------------------------------------------------------------------------
-- Write to the Transfer Layer Configuration Registers (BRPR, BTR)
-- Read the registers
-- Check if the values written are equal to the values read from the registers
--------------------------------------------------------------------------------
  
  REPORT "Timing checks are valid" SEVERITY NOTE;
  
  -- Write X"00000001" to the Baud Rate Prescalar Register
  REGWRITE (SYS_CLK,ADDR_BRPR,X"00000001",Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr
            ,Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Hex value of 1 was written into the BRPR register"
  SEVERITY NOTE;
	
  -- Read the Baud Rate Prescalar Register 
  REGREAD(SYS_CLK,ADDR_BRPR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
          Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " BRPR Register was read"
  SEVERITY NOTE;
	
  -- Check the value that was written with the value that was read
  ASSERT (X"00000001" = REG_READ) 
  REPORT "Value Written to BRPR Register /= Value Read from  BRPR Register"
  SEVERITY ERROR;

  if (X"00000001" /= REG_READ) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if; 
	
  -- Write  X"000000B8 to the Bit Timing Register"
  REGWRITE (SYS_CLK,ADDR_BTR,X"000000B8",Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
            Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Hex value of B8 was written into the BTR register"
  SEVERITY NOTE;
			
  -- Read the Bit Timing Register 
  REGREAD(SYS_CLK,ADDR_BTR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
          Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " BTR Register was read"
  SEVERITY NOTE;
	
  -- Check the value that was written with the value that was read
  ASSERT (X"000000B8" = REG_READ) 
  REPORT "Value Written to BTR Register /= Value Read from BTR Register"
  SEVERITY ERROR;

  if (X"000000B8" /= REG_READ) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if; 
--------------------------------------------------------------------------------
-- Write to the Interrupt Enable Register
-- Read the Interrupt Enable Register
-- Check if the value written is equal to the value read from the register
--------------------------------------------------------------------------------		
  -- Write to the Interrupt Enable Register to enable
  -- TXBFLL and RXOK interrupts
  REGWRITE (SYS_CLK,ADDR_IER,X"00000018",Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
            Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Hex value of 18 was written into the IER register"
  SEVERITY NOTE;
	  	
  -- Read the Interrupt Enable Register
  REGREAD(SYS_CLK,ADDR_IER,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
          Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " IER Register was read"
  SEVERITY NOTE;
	
  -- Check the value that was written with the value that was read
  ASSERT (X"00000018" = REG_READ) 
  REPORT "Value Written to IER Register /= Value Read from IER Register"
  SEVERITY ERROR;

  if (X"00000018" /= REG_READ) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;  

     
--------------------------------------------------------------------------------
-- Write to the Mode Select Register, Software Reset Register
-- Read the registers
-- Check if the values written are equal to the values read from the registers
--------------------------------------------------------------------------------
	
  -- Write to the Mode Select Register to select Loop Back Mode
  REGWRITE (SYS_CLK,ADDR_MSR,X"00000002",Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
            Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Hex value of 2 was written into the MSR register"
  SEVERITY NOTE;
			
  -- Read the Mode Select Register
  REGREAD(SYS_CLK,ADDR_MSR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
	        Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " MSR Register was read"
  SEVERITY NOTE;
			
  -- Check the value that was written with the value that was read
  ASSERT (X"00000002" = REG_READ) 
  REPORT "Value Written to MSR Register /= Value Read from MSR Register"
  SEVERITY ERROR;
	
  if (X"00000002" /= REG_READ) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;  
	
  -- Write to the Software Reset Register to set CEN = '1'
  REGWRITE (SYS_CLK,ADDR_SRR,X"00000002",Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
            Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Hex value of 2 was written into the SRR register"
  SEVERITY NOTE;
			
  -- Read the Software Reset Register
  REGREAD(SYS_CLK,ADDR_SRR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
          Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " SRR Register was read"
  SEVERITY NOTE;
	
  -- Check the vale that was written with the value that was read
  ASSERT (X"00000002" = REG_READ) 
  REPORT "Value Written to SRR Register /= Value Read from SRR Register"
  SEVERITY ERROR;
	  	
  if (X"00000002" /= REG_READ) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;  

--------------------------------------------------------------------------------
-- Write a Standard Data Frame to with DLC = 5 to the TX HPB
-- Read the Interrupt Status Register (TXBFLL is set)
-- Clear the Interrupt Status Register
--------------------------------------------------------------------------------
	  	
  -- Write a Standard Data Frame with DLC = 5 to the TX HPB
  TXHPBWRITE (SYS_CLK,X"4B200000",X"50000000",X"0EAFAC43",X"CB000000",
              Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Message 1 with ID:4B200000, DLC:50000000, DW1:0EAFAC43 ,DW2:CB000000 was written into TXHPB"
  SEVERITY NOTE;  	

  -- Wait till the Interrupt Line goes high
  wait until IP2Bus_IntrEvent = '1';
		
  -- Read the Interrupt Status Register
  REGREAD(SYS_CLK,ADDR_ISR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
          Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
  ASSERT false
  REPORT "Interrupt due to TXBFLL bit:ISR Register was read"
  SEVERITY NOTE;
	    
  -- Report the bits in the ISR that are set
  REPORTISR (REG_READ);
  
  -- Write to the Interrupt Clear Register to clear the Interrupts
  ICRWRITE (SYS_CLK,ADDR_ICR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
            Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " ICR Register was written to clear the Interrupts"
  SEVERITY NOTE;
	
  -- Wait for 2 clock cycles 
  wait until SYS_CLK'event and SYS_CLK = '1';
  wait until SYS_CLK'event and SYS_CLK = '1';
					
 --------------------------------------------------------------------------------		
-- Wait till the Interrupt line goes high
-- Read the RX FIFO 
-- Clear all the bits in the Interrupt Status Register
--------------------------------------------------------------------------------
  wait until IP2Bus_IntrEvent = '1';

  -- Read the Interrupt Status Register
  REGREAD(SYS_CLK,ADDR_ISR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
          Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Interrupt due to RXOK bit:ISR Register was read"
  SEVERITY NOTE;
  
  -- Report the bits in the ISR that are set
  REPORTISR (REG_READ);
	
  if (REG_READ(24) = '1') then
    -- Read a Message from the RX FIFO
    RXFIFOREAD(SYS_CLK,RXF_ID,RXF_DLC,RXF_DW1,RXF_DW2,Bus2IP_CS,Bus2IP_RNW,
             Bus2IP_Addr,Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);	
    ASSERT false
    REPORT " RX FIFO was read"
    SEVERITY NOTE;    
  end if;

  -- Check the sent message with the message read 
  ASSERT (X"4B200000" = RXF_ID)
  REPORT " ID written was not the id received"
  SEVERITY ERROR;  
  if (X"4B200000" /= RXF_ID) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;  
	
  ASSERT (X"50000000" = RXF_DLC)
  REPORT " DLC written was not the DLC received"
  SEVERITY ERROR;  
  if (X"50000000" /= RXF_DLC) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;  
 
  ASSERT (X"0EAFAC43" = RXF_DW1)
  REPORT " DW1 written was not the DW1 received"
  SEVERITY ERROR;  
  if (X"0EAFAC43" /= RXF_DW1) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;  
 
  ASSERT (X"CB" = RXF_DW2(0 to 7))
  REPORT " DW2 written was not the DW2 received"
  SEVERITY ERROR;   
   if (X"CB" /= RXF_DW2(0 to 7)) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;

  -- Clear the Interrupt Status Register
  ICRWRITE (SYS_CLK,ADDR_ICR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
            Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " ICR Register was written to clear the interrupts"
  SEVERITY NOTE;
	
  -- Wait for 2 clock cycles 
  wait until SYS_CLK'event and SYS_CLK = '1';
  wait until SYS_CLK'event and SYS_CLK = '1';
	
--------------------------------------------------------------------------------
-- Write a Standard Data Frame
--------------------------------------------------------------------------------
  -- Write a Standard Data Frame with DLC = 8 to the TX FIFO
  TXFIFOWRITE (SYS_CLK,X"4B200000",X"80000000",X"0EAFAC43",X"CBFFAB31",
               Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Message 2 with ID:4B200000, DLC:80000000, DW1:0EAFAC43 ,DW2:CBFFAB31 was written into TXFIFO"
  SEVERITY NOTE;  

  wait until IP2Bus_IntrEvent = '1';

  -- Read the Interrupt Status Register
  REGREAD(SYS_CLK,ADDR_ISR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
          Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Interrupt due to RXOK bit:ISR Register was read"
  SEVERITY NOTE;
  
  -- Report the bits in the ISR that are set
  REPORTISR (REG_READ);
	
  if (REG_READ(24) = '1') then
    -- Read a Message from the RX FIFO
    RXFIFOREAD(SYS_CLK,RXF_ID,RXF_DLC,RXF_DW1,RXF_DW2,Bus2IP_CS,Bus2IP_RNW,
               Bus2IP_Addr,Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);	
    ASSERT false
    REPORT " RX FIFO was read"
    SEVERITY NOTE;    
  end if;

  -- Check the sent message with the message read 
  ASSERT (X"4B200000" = RXF_ID)
  REPORT " ID written was not the id received"
  SEVERITY ERROR;  
  if (X"4B200000" /= RXF_ID) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;
 
  ASSERT (X"80000000" = RXF_DLC)
  REPORT " DLC written was not the DLC received"
  SEVERITY ERROR; 
  if (X"80000000" /= RXF_DLC) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;
  
  ASSERT (X"0EAFAC43" = RXF_DW1)
  REPORT " DW1 written was not the DW1 received"
  SEVERITY ERROR;  
  if (X"0EAFAC43" /= RXF_DW1) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;  
 
  ASSERT (X"CBFFAB31" = RXF_DW2)
  REPORT " DW2 written was not the DW2 received"
  SEVERITY ERROR;   
  if (X"CBFFAB31" /= RXF_DW2) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;  

  -- Clear the Interrupt Status Register
  ICRWRITE (SYS_CLK,ADDR_ICR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
            Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " ICR Register was written to clear the interrupts"
  SEVERITY NOTE;
	
  -- Wait for 2 clock cycles 
  wait until SYS_CLK'event and SYS_CLK = '1';
  wait until SYS_CLK'event and SYS_CLK = '1';
--------------------------------------------------------------------------------
-- Write a Standard Remote Frame
-------------------------------------------------------------------------------- 	
  -- Write a Standard Remote Frame 
  TXFIFOWRITE (SYS_CLK,X"4B300000",X"00000000",X"00000000",X"00000000",
               Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Message 3 with ID:4B300000, DLC:00000000, DW1:00000000 ,DW2:00000000 was written into TXFIFO"
  SEVERITY NOTE;  
	
  wait until IP2Bus_IntrEvent = '1';

  -- Read the Interrupt Status Register
  REGREAD(SYS_CLK,ADDR_ISR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
          Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Interrupt due to RXOK bit:ISR Register was read"
  SEVERITY NOTE;
  
  -- Report the bits in the ISR that are set
  REPORTISR (REG_READ);
	
  if (REG_READ(24) = '1') then
    -- Read a Message from the RX FIFO
    RXFIFOREAD(SYS_CLK,RXF_ID,RXF_DLC,RXF_DW1,RXF_DW2,Bus2IP_CS,Bus2IP_RNW,
               Bus2IP_Addr,Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);	
    ASSERT false
    REPORT " RX FIFO was read"
    SEVERITY NOTE;    
  end if;

  -- Check the sent message with the message read 
  ASSERT (X"4B300000" = RXF_ID)
  REPORT " ID written was not the id received"
  SEVERITY ERROR;  
  if (X"4B300000" /= RXF_ID) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if; 
 
  ASSERT (X"00000000" = RXF_DLC)
  REPORT " DLC written was not the DLC received"
  SEVERITY ERROR; 
  if (X"00000000" /= RXF_DLC) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;   
    
  -- Clear the Interrupt Status Register
  ICRWRITE (SYS_CLK,ADDR_ICR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
            Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " ICR Register was written to clear the interrupts"
  SEVERITY NOTE;
	
  -- Wait for 2 clock cycles 
  wait until SYS_CLK'event and SYS_CLK = '1';
  wait until SYS_CLK'event and SYS_CLK = '1';

--------------------------------------------------------------------------------
-- Write an Extended Data Frame
-------------------------------------------------------------------------------- 	
  -- Extended Data Frame
  TXFIFOWRITE (SYS_CLK,X"4B3FCBAE",X"80000000",X"0FAB6CDE",X"EB4A5D98",
               Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Message 4 with ID:4B3FCBAE, DLC:80000000, DW1:0FAB6CDE ,DW2:EB4A5D98 was written into TXFIFO"
  SEVERITY NOTE;  

  wait until IP2Bus_IntrEvent = '1';


  -- Read the Interrupt Status Register
  REGREAD(SYS_CLK,ADDR_ISR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
          Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Interrupt due to RXOK bit:ISR Register was read"
  SEVERITY NOTE;
  
  -- Report the bits in the ISR that are set
  REPORTISR (REG_READ);
	
  if (REG_READ(24) = '1') then
    -- Read a Message from the RX FIFO
    RXFIFOREAD(SYS_CLK,RXF_ID,RXF_DLC,RXF_DW1,RXF_DW2,Bus2IP_CS,Bus2IP_RNW,
               Bus2IP_Addr,Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);	
    ASSERT false
    REPORT " RX FIFO was read"
    SEVERITY NOTE;    
  end if;

  -- Check the sent message with the message read 
  ASSERT (X"4B3FCBAE" = RXF_ID)
  REPORT " ID written was not the id received"
  SEVERITY ERROR;  
  if (X"4B3FCBAE" /= RXF_ID) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;
 
  ASSERT (X"80000000" = RXF_DLC)
  REPORT " DLC written was not the DLC received"
  SEVERITY ERROR;  
  if (X"80000000" /= RXF_DLC) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;
 
  ASSERT (X"0FAB6CDE" = RXF_DW1)
  REPORT " DW1 written was not the DW1 received"
  SEVERITY ERROR;   
  if (X"0FAB6CDE" /= RXF_DW1) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;

  ASSERT (X"EB4A5D98" = RXF_DW2)
  REPORT " DW2 written was not the DW2 received"
  SEVERITY ERROR;   
  if (X"EB4A5D98" /= RXF_DW2) then
    ERROR_CNT <= ERROR_CNT + 1;
  end if;

  -- Clear the Interrupt Status Register
  ICRWRITE (SYS_CLK,ADDR_ICR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
            Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " ICR Register was written to clear the interrupts"
  SEVERITY NOTE;
	
  -- Wait for 2 clock cycles 
  wait until SYS_CLK'event and SYS_CLK = '1';
  wait until SYS_CLK'event and SYS_CLK = '1';

                

--------------------------------------------------------------------------------
-- Write an Extended Remote Frame
-------------------------------------------------------------------------------- 	

  -- Extended Remote Frame
  TXFIFOWRITE (SYS_CLK,X"7CF8DEAF",X"00000000",X"00000000",X"00000000",
               Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Message 5 with ID:7CF8DEAF, DLC:00000000, DW1:00000000 ,DW2:00000000 was written into TXFIFO"
  SEVERITY NOTE;  
	
  -- Wait till the Interrupt Line goes high
  wait until IP2Bus_IntrEvent = '1';
	
  -- Read the Interrupt Status Register
  REGREAD(SYS_CLK,ADDR_ISR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
          Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " Interrupt: ISR Register was read"
  SEVERITY NOTE;
  -- Report the bits in the ISR that are set
  REPORTISR (REG_READ);
 
  if (REG_READ(24) = '1') then
    -- Read a Message from the RX FIFO
    RXFIFOREAD(SYS_CLK,RXF_ID,RXF_DLC,RXF_DW1,RXF_DW2,Bus2IP_CS,Bus2IP_RNW,
               Bus2IP_Addr,Bus2IP_Data,IP2Bus_Data,IP2Bus_Ack);	
    ASSERT false
    REPORT " RX FIFO was read"
    SEVERITY NOTE;    
  
    -- Check the sent message with the message read 
    ASSERT (X"7CF8DEAF" = RXF_ID)
    REPORT " ID written was not the id received"
    SEVERITY ERROR;  
    if (X"7CF8DEAF" /= RXF_ID) then
      ERROR_CNT <= ERROR_CNT + 1;
    end if; 
 
    ASSERT (X"00000000" = RXF_DLC)
    REPORT " DLC written was not the DLC received"
    SEVERITY ERROR; 
    if (X"00000000" /= RXF_DLC) then
      ERROR_CNT <= ERROR_CNT + 1;
    end if;
 
  elsif (REG_READ(30) = '1') then
    ASSERT false
    REPORT "TXOK interrupt was set, RXOK interrupt was not set: Message not received"
    SEVERITY NOTE;
 
  end if;

  -- Write to the Interrupt Clear Register to clear the Interrupts
  ICRWRITE (SYS_CLK,ADDR_ICR,REG_READ,Bus2IP_CS,Bus2IP_RNW,Bus2IP_Addr,
            Bus2IP_Data,IP2Bus_Ack);
  ASSERT false
  REPORT " ICR Register was written to clear the interrupts"
  SEVERITY NOTE;
  REPORT "Timing checks are not valid" SEVERITY NOTE;
  -- Wait for 2 clock cycles 
  wait until SYS_CLK'event and SYS_CLK = '1';
  wait until SYS_CLK'event and SYS_CLK = '1';

  if (ERROR_CNT > 0) then
    REPORT "############ TEST FAILED ################"
    SEVERITY NOTE;
  else
    REPORT "############ TEST PASSED ################"
    SEVERITY NOTE;
  end if;

  REPORT "Simulation stopped"
  SEVERITY FAILURE;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end process;

  -- ##############
   -- Safety timeout
   -- ##############
   process(Bus2IP_Reset,SYS_CLK)
   begin
      if (Bus2IP_Reset = '1') then
         opb_timeout_cnt    <= (others => '0');
      elsif rising_edge(SYS_CLK) then
         opb_timeout_cnt    <= opb_timeout_cnt + 1;
      end if;
   end process;

  process
  begin
    wait until opb_timeout_cnt = X"FFFF";
    REPORT "##### ERROR: Timeout - Simulation did not complete as expected #####"
    SEVERITY ERROR;
    wait for 20 ns;
    REPORT "SIMULATION STOPPED"
    SEVERITY FAILURE;
    wait;
  end process;

u1: can_v3_2_top
  port map (
    CAN_PHY_TX        =>  CAN_PHY_TX_I, 
    CAN_PHY_RX        =>  CAN_PHY_TX_I, 
   -- External I/Os
    SYS_CLK           =>  SYS_CLK,
    CAN_CLK           =>  CAN_CLK,
    Bus2IP_Reset      =>  Bus2IP_Reset,
    Bus2IP_Data       =>  Bus2IP_Data,
    Bus2IP_RNW        =>  Bus2IP_RNW,
    Bus2IP_Addr       =>  Bus2IP_Addr_core,
    Bus2IP_CS         =>  Bus2IP_CS,
    IP2Bus_Data       =>  IP2Bus_Data,
    IP2Bus_Ack        =>  IP2Bus_Ack,
    IP2Bus_IntrEvent  =>  IP2Bus_IntrEvent,
    IP2Bus_Error      =>  IP2Bus_Error
    );
end test;

	
		
