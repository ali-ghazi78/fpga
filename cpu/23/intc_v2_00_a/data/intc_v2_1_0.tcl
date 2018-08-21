##############################################################################
#
# (c) Copyright 2005-2009 Xilinx, Inc. All rights reserved.
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

## @BEGIN_CHANGELOG 
##
##     09/17/07 ecm  Removed the PCI specific connections
##              Moved to the Linux MLD.
##     10/24/07 rpm  Fixed KIND_OF_INTR bug in canonicals and
##              also generalized match on external interrupts
##     06/25/09 sdm  Updated so that canonical definitions are
##              not generated when instance name matches
##              canonical name
##    
## @END_CHANGELOG

############################################################
# Global interrupt handlers array, default handler routine
############################################################
array set interrupt_handlers ""
set default_interrupt_handler "XNullHandler"


############################################################
# DRC procedure
############################################################
proc intc_drc {drv_handle} {

}


############################################################
# "generate" procedure
############################################################
proc generate {drv_handle} {

    # Generate the following definitions in xparameters.h
    # 2. BASEADDR, HIGHADDR, C_NUM_INTR_INPUTS, XPAR_INTC_MAX_NUM_INTR_INPUTS
    xdefine_max $drv_handle "xparameters.h" "XPAR_INTC_MAX_NUM_INTR_INPUTS" "C_NUM_INTR_INPUTS"
    xdefine_if_all $drv_handle "xparameters.h" "XIntc" "C_HAS_IPR"
    intc_define_use_dcr $drv_handle "xparameters.h" "XIntc"
    xdefine_include_file $drv_handle "xparameters.h" "XIntc" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" "C_KIND_OF_INTR"


    # Define XPAR_SINGLE_DEVICE_ID
    set periphs [xget_periphs $drv_handle]
    set count [llength $periphs]

    if {$count == 1} {
        xdefine_with_names $drv_handle [xget_periphs $drv_handle] "xparameters.h" "XPAR_INTC_SINGLE_BASEADDR" "C_BASEADDR" "XPAR_INTC_SINGLE_HIGHADDR" "C_HIGHADDR" "XPAR_INTC_SINGLE_DEVICE_ID" "DEVICE_ID"
    }

    xdefine_config_file  $drv_handle "xintc_g.c" "XIntc" "DEVICE_ID" "C_BASEADDR" "C_KIND_OF_INTR"
    set config_inc [xopen_include_file "xparameters.h"]

    # Generate config table, vector tables
    intc_define_config_file $drv_handle $periphs $config_inc

    close $config_inc

    # Generate canonical xparameters
    xdefine_canonical_xpars $drv_handle "xparameters.h" "Intc" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" "C_KIND_OF_INTR"
}

proc intc_define_use_dcr {drv_handle file_name drv_string} {

    # Get all peripherals connected to this driver
    set periphs [xget_periphs $drv_handle]

    set use_dcr 2
    foreach periph $periphs {
    set busif_handle [xget_handle $periph "BUS_INTERFACE" *]
    if { [llength $busif_handle] != 1} {
        error "Internal error.  The interrupt controller has multiple bus interfaces." "" "libgen_error"
        return
    }
    set busif_type [xget_value $busif_handle "SUBPROPERTY" "BUS_STD"]
    if { [string compare -nocase "DCR" $busif_type] == 0} {
        set dcr_bus_name [xget_value $busif_handle]
        set mhs_handle [xget_handle $periph "parent"]
        set bus_master [xget_connected_busifs_handle $mhs_handle $dcr_bus_name "master"]
        if { [llength $bus_master] != 1 } {
        error "DCR bus $dcr_bus_name should have exactly one master." "" "libgen_error"
        return
        }
        set bus_master [xget_handle $bus_master "parent"]
        set periph_type [xget_value $bus_master "OPTION" "IPTYPE"]
        if { [string compare -nocase "PROCESSOR" $periph_type] == 0} {
        # Processor is the master on a DCR bus.  use_dcr should be 1
        if { $use_dcr == 0 } {
            error "The intc driver is being used with both DCR and PLB/OPB interrupt controllers.  The driver needs to access all interrupt controllers over DCR only or over PLB/OPB only." "" "libgen_error"
        } else {
            set use_dcr 1
        }
        } else {
        # Bridge is the master on a DCR bus. use_dcr should be 0
        if { $use_dcr == 1 } {
            error "The intc driver is being used with both DCR and PLB/OPB interrupt controllers.  The driver needs to access all interrupt controllers over DCR only or over PLB/OPB only." "" "libgen_error"
        } else {
            set use_dcr 0
        }
        }
    } else {
        # PLB/OPB interrupt controller. use_dcr should be 0
        if { $use_dcr == 1 } {
        error "The intc driver is being used with both DCR and PLB/OPB interrupt controllers.  The driver needs to access all interrupt controllers over DCR only or over PLB/OPB only." "" "libgen_error"
        } else {
        set use_dcr 0
        }
    }
    }

    # Got the value of use_dcr.  Write to the output file.
    set file_handle [xopen_include_file $file_name]
    puts $file_handle "#define [xget_dname $drv_string "USE_DCR"] $use_dcr"
    close $file_handle

    # Warn the user that use_dcr has been computed automatically
    # Do not issue this as this is taken care of in C code to handle deprecated parameters
    #puts "WARNING: The parameter USE_DCR for the intc driver has been deprecated.  Any reference to this parameter in the MSS file will be ignored."
}



##########################################################################
# Generate Configuration C file xintc_g.c
# This file has the Config Table and vector tables for each intc instance
# as required by Xilinx intc driver
##########################################################################

proc intc_define_config_file {drv_handle periphs config_inc} {

    variable interrupt_handlers
    variable default_interrupt_handler

    # set isr_options to be XIN_SVC_SGL_ISR_OPTION as defined in xintc.h
    set isr_options XIN_SVC_SGL_ISR_OPTION
    set file_name "xintc_g.c"
    set drv_string "XIntc"
    set args [list "DEVICE_ID" "C_BASEADDR" "C_KIND_OF_INTR"]
    set filename [file join "src" $file_name]
    file delete $filename
    set config_file [open $filename w]
    xprint_generated_header $config_file "Driver configuration"
    puts $config_file "#include \"xparameters.h\""
    puts $config_file "#include \"[string tolower $drv_string].h\""
    puts $config_file "\n"

    set tmp_filename [file join "src" "tmpconfig.c"]
    set tmp_config_file [open $tmp_filename w]

    puts $tmp_config_file "\n/*"
    puts $tmp_config_file "* The configuration table for devices"
    puts $tmp_config_file "*/\n"
    puts $tmp_config_file [format "%s_Config %s_ConfigTable\[\] =" $drv_string $drv_string]
    puts $tmp_config_file "\{"

    set start_comma ""
    foreach periph $periphs {
    puts $tmp_config_file [format "%s\t\{" $start_comma]
    set comma ""
    foreach arg $args {
        # Check if this is a driver parameter or a peripheral parameter
        set value [xget_value $drv_handle "PARAMETER" $arg]
        if {[llength $value] == 0} {
        puts -nonewline $tmp_config_file [format "%s\t\t%s" $comma [xget_name $periph $arg]]
        } else {
        puts -nonewline $tmp_config_file [format "%s\t\t%s" $comma [xget_dname $drv_string $arg]]
        }
        set comma ",\n"
    }
    # add the OPTIONS as an arg to the config table - default OPTIONS value is XIN_SVC_SGL_ISR_OPTION
    puts -nonewline $tmp_config_file [format "%s\t\t%s" $comma $isr_options]

    # generate the vector table for this intc instance
    intc_define_vector_table $periph $config_inc $tmp_config_file

    puts $config_inc "\n/******************************************************************/\n"

    puts -nonewline $tmp_config_file "\n\t\}"
    set start_comma ",\n"
    }
    puts $tmp_config_file "\n\};"
    close $tmp_config_file

    # Write out the extern definitions of handlers...
    foreach elem [array names interrupt_handlers] {
    puts $config_file [format "extern void %s (void *);" $elem ]
    }

    # copy over the tmp_config_file contents to config_file
    set tmp_config_file [open $tmp_filename r]
    while {![eof $tmp_config_file]} {
        gets $tmp_config_file line
    puts $config_file $line
    }
    close $tmp_config_file
    file delete -force $tmp_filename

    close $config_file
}

proc intc_define_vector_table {periph config_inc config_file} {

    variable interrupt_handlers
    variable default_interrupt_handler

    set periph_name [xget_value $periph "NAME"]
    # Get ports that are driving the interrupt
    set source_ports [xget_interrupt_sources $periph]
    set num_intr_inputs [xget_value $periph "PARAMETER" "C_NUM_INTR_INPUTS" ]
    if {$num_intr_inputs != [llength $source_ports]} {
    #error "Internal error: Num intr inputs $num_intr_inputs not the same as length of xget_interrupt_sources [llength $source_ports]" "" "libgen_error"

    error "Internal error: Number of interrupt inputs on $periph_name ($num_intr_inputs) is not the same as length of total number of interrupt sources ([llength $source_ports]). If any interrupt source is a vector then libgen does not support this use case" "" "libgen_error"
    return
    }
    set i 0

    foreach source_port $source_ports {
    if {[llength $source_port] == 0} {
        set source_port_name($i) ""
        set source_name($i) ""
        set source_interrupt_handler($i) $default_interrupt_handler
        incr i
        continue
    }
    set source_port_name($i) [xget_value $source_port "NAME"]
    set source_periph [xget_handle $source_port "PARENT"]
    set source_name($i) [xget_value $source_periph "NAME"]
    if {[llength $source_name($i)] == 0} {
        error "Periph [xget_value $source_periph "OPTION" "IPNAME"] does not have a name" "" "libgen_error"
        return
    }
    set port_type($i) [xget_port_type $source_port]
    set source_driver [xget_swhandle $source_name($i)]
    set source_interrupt_handler($i) $default_interrupt_handler

    if {[string compare -nocase $source_driver ""] != 0} {
        set int_array [xget_handle $source_driver "ARRAY" "interrupt_handler"]
        if {[string compare -nocase $int_array ""] != 0} {
        set int_array_elems [xget_handle $int_array "ELEMENTS" "*"]
        foreach int_array_elem $int_array_elems {
            set int_port [xget_value $int_array_elem "PARAMETER" "int_port"]
            set mhs_handle [xget_value $int_array_elem "PARAMETER" "mhsinst"]
            if {[string compare -nocase $int_port $source_port_name($i)] == 0 && \
                $mhs_handle == $source_periph } {
            set source_interrupt_handler($i) [xget_value $int_array_elem "PARAMETER" "int_handler"]
            # copy this handler to interrupt_handlers
            set arrsize [array size interrupt_handlers]
            intc_add_handler $source_interrupt_handler($i)
            set source_handler_arg($i) [xget_value $int_array_elem "PARAMETER" "int_handler_arg"]
            if {[string compare -nocase $source_handler_arg($i) DEVICE_ID] == 0 } {
                set source_handler_arg($i) [xget_name $source_periph "DEVICE_ID"]
            } else {
                set source_handler_arg($i) [xget_name $source_periph "C_BASEADDR"]
            }
            break;
            }
        }
        }
    }

    incr i
    }

    #Check if default_interrupt_handler has to have an extern definition
    if {[array size interrupt_handlers] < [llength $source_ports]} {
    intc_add_handler $default_interrupt_handler
    }

    #Write vector table to the config_file
    set num_intr_inputs [xget_value $periph "PARAMETER" "C_NUM_INTR_INPUTS" ]
    puts -nonewline $config_file ",\n\t\t\{"
    set comma "\n"
    for {set i 0} {$i < $num_intr_inputs} {incr i} {
    puts $config_file [format "%s\t\t\t\{" $comma ]
    puts $config_file [format "\t\t\t\t%s," $source_interrupt_handler($i) ]
    if {[llength $source_name($i)] == 0} {
        puts $config_file "\t\t\t\t(void *)XNULL"
    } else {
        puts $config_inc [format "#define XPAR_%s_%s_MASK %#08X" [string toupper $source_name($i)] [string toupper $source_port_name($i)] [expr 1 << $i]]
        puts $config_inc [format "#define XPAR_%s_%s_%s_INTR %d" [string toupper $periph_name] [string toupper $source_name($i)] [string toupper $source_port_name($i)] $i]

        if {[string compare -nocase "global" $port_type($i) ] != 0 && \
            [string compare $source_interrupt_handler($i) $default_interrupt_handler ] != 0} {
        puts $config_file [format "\t\t\t\t(void *) %s" $source_handler_arg($i)]
        } else {
        puts $config_file "\t\t\t\t(void *) XNULL"
        }

    }
    puts -nonewline $config_file "\t\t\t\}"
    set comma ",\n"
    }

    puts $config_file "\n\t\t\}"
}

################################################
# This procedure creates a unique list of
# handlers that needs to have an extern defn.
# in xparameters.h
################################################
proc intc_add_handler {handler} {

    variable interrupt_handlers

    set interrupt_handlers($handler) 1
}


#
# Given a list of arguments, define each as a canonical constant name, using
# the driver name, in an include file.
#
proc xdefine_canonical_xpars {drv_handle file_name drv_string args} {
    # Open include file
    set file_handle [xopen_include_file $file_name]

    # Get all the peripherals connected to this driver
    set periphs [xget_periphs $drv_handle]

    # Get the names of all the peripherals connected to this driver
    foreach periph $periphs {
        set peripheral_name [string toupper [xget_hw_name $periph]]
        lappend peripherals $peripheral_name
    }

    # Get possible canonical names for all the peripherals connected to this driver
    set device_id 0
    foreach periph $periphs {
        set canonical_name [string toupper [format "%s_%s" $drv_string $device_id]]
        lappend canonicals $canonical_name
        
        # Create a list of IDs of the peripherals whose hardware instance name
        # doesn't match the canonical name. These IDs can be used later to
        # generate canonical definitions
        if { [lsearch $peripherals $canonical_name] < 0 } {
            lappend indices $device_id
        }
        incr device_id
    }

    set i 0
    foreach periph $periphs {
        set periph_name [string toupper [xget_hw_name $periph]]

        # Generate canonical definitions only for the peripherals whose
        # canonical name is not the same as hardware instance name
        if { [lsearch $canonicals $periph_name] < 0 } {
            puts $file_handle "/* Canonical definitions for peripheral $periph_name */"
            set canonical_name [format "%s_%s" $drv_string [lindex $indices $i]]

            foreach arg $args {
                set lvalue [xget_dname $canonical_name $arg]

    # The commented out rvalue is the name of the instance-specific constant
    #           set rvalue [xget_name $periph $arg]

                # The rvalue set below is the actual value of the parameter
                set rvalue [xget_param_value $periph $arg]
                if {[llength $rvalue] == 0} {
                    set rvalue 0
                }
                set rvalue [xformat_addr_string $rvalue $arg]
    
                puts $file_handle "#define $lvalue $rvalue"

            }
            puts $file_handle ""
            incr i
        }
    }

    #
    # Now redefine the Interrupt ID constants
    #
    xredefine_intc $drv_handle $file_handle

    puts $file_handle "\n/******************************************************************/\n"
    close $file_handle
}

################################################
#
# intc redefines
#
################################################
proc xredefine_intc {drvhandle config_inc} {


    # Next define interrupt IDs for each connected peripheral

    set periphs [xget_periphs $drvhandle]
    set device_id 0
    set periph_name [string toupper "intc"]

    foreach periph $periphs {

        # Get the edk based name of peripheral for printing redefines
        set edk_periph_name [xget_value $periph "NAME"]

        # Get ports that are driving the interrupt
        set source_ports [xget_interrupt_sources $periph]
        set i 0
        lappend source_list
        foreach source_port $source_ports {
            set source_port_name($i) [xget_value $source_port "NAME"]
            set source_periph($i) [xget_handle $source_port "PARENT"]
            set source_name($i) [xget_value $source_periph($i) "NAME"]

            lappend source_list $source_name($i)
            incr i
        }

        set num_intr_inputs [xget_value $periph "PARAMETER" "C_NUM_INTR_INPUTS" ]
        for {set i 0} {$i < $num_intr_inputs} {incr i} {

            # Skip global (external) ports
            set port_type [xget_port_type $source_periph($i)]
            if {[string compare -nocase $port_type "global"] == 0} {
                continue
            }

            set drv [xget_swhandle $source_name($i)]
            set iptype [xget_value $source_periph($i) "OPTION" "IPTYPE"]

#            if {[llength $source_name($i)] != 0 && [llength $drv] != 0 && [string compare -nocase $iptype "PERIPHERAL"] == 0}
            if {[llength $source_name($i)] != 0 && [llength $drv] != 0} {

                set instance [xfind_instance $drv $source_name($i)]
                set drvname [xget_value $drv "NAME"]

                #
                # Handle reference cores, which have non-reference driver names
                #
                if {[string compare -nocase $drvname "touchscreen_ref"] == 0} {
                    set drvname "touchscreen"
                } elseif {[string compare -nocase $drvname "ps2_ref"] == 0} {
                    set drvname "ps2"
                    set instance [expr $instance*2]
                    if {[string match -nocase  "*SYS_INTR2" $source_port_name($i)] == 1} {
                        incr instance
                    }
                }

                #
                # Define the interrupt vector IDs in xparameters.h for each core
                # that is connected to this intc.
                #
                set drvname [string toupper $drvname]

                #
                # Treat sources with multiple interrupt ports slightly different
                # by including the interrupt port name in the canonical constant
                # name
                #
                if { [lcount $source_list $source_name($i)] > 1} {
                    set first_part [format "#define XPAR_%s_%s_%s_%s_%s_VEC_ID" $periph_name $device_id $drvname $instance [string toupper $source_port_name($i)]]
                } else {
                    set first_part [format "#define XPAR_%s_%s_%s_%s_VEC_ID" $periph_name $device_id $drvname $instance]
                }

                set second_part [format "XPAR_%s_%s_%s_INTR" [string toupper $edk_periph_name] [string toupper $source_name($i)] [string toupper $source_port_name($i)] ]

                if {[string compare -nocase $drvname "generic"] != 0} {
                    puts $config_inc "$first_part $second_part"
                }
            }
        }
        incr device_id
    }
}

###################################################################
#
# Get the number of elements in the given list that match the
# given entry.  Assume elements are strings.
#
###################################################################
proc lcount {list match_entry} {

    set len [llength $list]
    set count 0

    for {set i 0} {$i < $len} {incr i} {
        set entry [lindex $list $i]
        if { [string compare -nocase $entry $match_entry] == 0} {
            incr count
        }
    }

    return $count
}


###################################################################
#
# Get the HW instance number for a particular device. This will be used to enumerate
# the vector ID defines if more than one interrupt from the core is connected to the
# interrupt controller.
#
###################################################################
proc xfind_instance {drvhandle instname} {

    set instlist [xget_periphs $drvhandle]
    set i 0
    foreach inst $instlist {
        set name [xget_value $inst "NAME"]
        if {[string compare -nocase $instname $name] == 0} {
            return $i
        }
        incr i
    }
    set i 0
    return $i
}

###################################################################
#
# Get the type of port, whether it is "local" (from an IP), or
# "global" (from external source).
#
###################################################################
proc xget_port_type {periph} {
    set mhs [xget_handle $periph "PARENT"]
    if {[llength $mhs] == 0} {
        return "global"
    } else {
        return "local"
    }
}




