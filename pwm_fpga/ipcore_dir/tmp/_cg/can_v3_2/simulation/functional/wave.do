
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {System Signals}
add wave -noupdate -format Logic /can_v3_2_tb/SYS_CLK
add wave -noupdate -format Logic /can_v3_2_tb/CAN_CLK
add wave -noupdate -format Logic /can_v3_2_tb/CAN_PHY_TX_I
add wave -noupdate -format Logic /can_v3_2_tb/Bus2IP_Reset
add wave -noupdate -format Logic /can_v3_2_tb/Bus2IP_CS
add wave -noupdate -format Logic /can_v3_2_tb/Bus2IP_RNW
add wave -noupdate -format Literal -radix hexadecimal /can_v3_2_tb/Bus2IP_Addr
add wave -noupdate -format Literal -radix hexadecimal /can_v3_2_tb/Bus2IP_Data
add wave -noupdate -format Literal -radix hexadecimal /can_v3_2_tb/IP2Bus_Data
add wave -noupdate -format Literal -radix hexadecimal /can_v3_2_tb/REG_READ
add wave -noupdate -format Logic /can_v3_2_tb/IP2Bus_Ack
add wave -noupdate -format Logic /can_v3_2_tb/IP2Bus_IntrEvent
add wave -noupdate -format Logic /can_v3_2_tb/IP2Bus_Error

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {185393 ps} 0}
WaveRestoreZoom {0 ps} {2100 ns}
configure wave -namecolwidth 208
configure wave -valuecolwidth 137
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
