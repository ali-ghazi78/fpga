##############################################################################
#
# (c) Copyright 2004-2009 Xilinx, Inc. All rights reserved.
#
# This file contains confidential and proprietary information of Xilinx, Inc.
# and is protected under U.S. and international copyright and other
# intellectual property laws.
#
# DISCLAIMER
# This disclaimer is not a license and does not grant any rights to the
# materials distributed herewith. Except as otherwise provided in a valid
# license issued to you by Xilinx, and to the maximum extent permitted by
# applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
# FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
# IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
# MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
# and (2) Xilinx shall not be liable (whether in contract or tort, including
# negligence, or under any other theory of liability) for any loss or damage
# of any kind or nature related to, arising under or in connection with these
# materials, including for any direct, or any indirect, special, incidental,
# or consequential loss or damage (including loss of data, profits, goodwill,
# or any type of loss or damage suffered as a result of any action brought by
# a third party) even if such damage or loss was reasonably foreseeable or
# Xilinx had been advised of the possibility of the same.
#
# CRITICAL APPLICATIONS
# Xilinx products are not designed or intended to be fail-safe, or for use in
# any application requiring fail-safe performance, such as life-support or
# safety devices or systems, Class III medical devices, nuclear facilities,
# applications related to the deployment of airbags, or any other applications
# that could lead to death, personal injury, or severe property or
# environmental damage (individually and collectively, "Critical
# Applications"). Customer assumes the sole risk and liability of any use of
# Xilinx products in Critical Applications, subject only to applicable laws
# and regulations governing limitations on product liability.
#
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
# AT ALL TIMES.
#
##############################################################################

## @BEGIN_CHANGELOG EDK_I_SP1
##
##  - Initial Revision
##
## @END_CHANGELOG

# Uses $XILINX_EDK/bin/lib/xillib_sw.tcl

# -----------------------------------------------------------------
# Software Project Types (swproj):
#   0 : MemoryTest - Calls basic  memorytest routines from common driver dir
#   1 : PeripheralTest - Calls any existing polled_example and/or selftest
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# TCL Procedures:
# -----------------------------------------------------------------

proc gen_include_files {swproj mhsinst} {

    if {$swproj == 0} {
	return ""
    }
    if {$swproj == 1} {
        set ifintr [get_intr $mhsinst]

	#PPC is 1, MB is 2
	
	if {$ifintr == 1} {
	    set inc_file_lines {xintc.h xil_exception.h intc_header.h}
	    return $inc_file_lines
	} else {
	    set inc_file_lines {xintc.h intc_header.h}
	    return $inc_file_lines    
	}
	
    }
}

proc gen_src_files {swproj mhsinst} {
  if {$swproj == 0} {
    return ""
  }
  if {$swproj == 1} {
    set inc_file_lines {examples/xintc_tapp_example.c data/intc_header.h}
    return $inc_file_lines
  }
}

proc gen_testfunc_def {swproj mhsinst} {
    return ""
}

proc gen_init_code {swproj mhsinst} {
  return ""
}

proc gen_testfunc_call {swproj mhsinst} {

  if {$swproj == 0} {
    return ""
  }
 
  set ipname [xget_value $mhsinst "NAME"] 
  set deviceid [xget_name $mhsinst "DEVICE_ID"]
  set hasStdout [xhas_stdout $mhsinst]
  set intcvar [xget_intc_drv_var]
  set testfunc_call ""

  if {${hasStdout} == 0} {
      
      append testfunc_call "

   {
      int status;
                        
      status = IntcSelfTestExample(${deviceid});

   }"
  
      set ifintr [get_intr $mhsinst]
      if {$ifintr != 0} {
          append testfunc_call " 
	
   {
       int Status;

       Status = IntcInterruptSetup(&${intcvar}, ${deviceid});

   }"
      }
      
  } else {
      
      append testfunc_call "

   {
      int status;
      
      print(\"\\r\\n Runnning IntcSelfTestExample() for ${ipname}...\\r\\n\");
      
      status = IntcSelfTestExample(${deviceid});
      
      if (status == 0) {
         print(\"IntcSelfTestExample PASSED\\r\\n\");
      }
      else {
         print(\"IntcSelfTestExample FAILED\\r\\n\");
      }
   }"

      set ifintr [get_intr $mhsinst]
      if {$ifintr != 0} {

          append testfunc_call " 
	
   {
       int Status;

       Status = IntcInterruptSetup(&${intcvar}, ${deviceid});
       if (Status == 0) {
          print(\"Intc Interrupt Setup PASSED\\r\\n\");
       } 
       else {
         print(\"Intc Interrupt Setup FAILED\\r\\n\");
      } 
   }"
      
      }
  }
  return $testfunc_call
  
}

proc get_intr {mhsinst} {

    set irqValue [xget_hw_port_value $mhsinst "Irq"]
    set mhsHandle [xget_hw_parent_handle $mhsinst]
    if {$irqValue != ""} {
        set procSinkHandle [xget_hw_connected_ports_handle $mhsHandle $irqValue "sink"]

                    if {$procSinkHandle != ""} {
                        set procSinkName [xget_hw_name $procSinkHandle]
                        set procVisiblePPC440 [string match $procSinkName "EICC440EXTIRQ"]
                        set procVisiblePPC [string match $procSinkName "EICC405EXTINPUTIRQ"]
                        set procVisibleMB [string match $procSinkName "INTERRUPT"]
                        if {$procVisiblePPC440 == 1} {
                            return 1
                        }
                        if {$procVisiblePPC == 1} {
                            return 1
                        }
                        if {$procVisibleMB == 1} {
                            return 2
                        }
                    }
    }
    return 0
}

