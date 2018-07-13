# SimVision Command Script (Tue Mar 07 18:23:21 IST 2007)

#
# preferences
#
preferences set default-time-units ns
preferences set signal-type-colors {assertion #FF0000 output #FFA500 group #0099FF inout #00FFFF input #FFFF00 fiber #FF99FF errorsignal #FF0000 unknown #FFFFFF overlay #0099FF internal #00FF00 reference #FFFFFF}
preferences set txe-locate-add-fibers 1
preferences set txe-view-hold 0
preferences set txe-navigate-search-locate 0
preferences set sb-module-only 0
preferences set verilog-colors {
        HiZ #ff9900
        StrX #ff0000
        Sm #00ff99
        Me #0000ff
        We #00ffff
        La #ff00ff
        Pu #9900ff
        St #00ff00
        Su #ff0099
        0 #00ff00
        1 #00ff00
        X #ff0000
        Z #ff9900
        other #ffff00
}
preferences set txe-navigate-waveform-locate 1
preferences set txe-view-hidden 0
preferences set toolbar-TimeSearch-WaveWindow {
  usual
  shown 0
  position -row 0 -pos 2
}
preferences set sfb-colors {
        register #beded1
        variable #beded1
        assignStmt gray85
        force #faa385
}
preferences set txe-search-show-linenumbers 1
preferences set toolbar-NavSignalList-WaveWindow {
  usual
  shown 0
  position -row 0 -pos 1
}
preferences set toolbar-txe_waveform_toggle-WaveWindow {
  usual
  position -anchor e
}
preferences set toolbar-Windows-SrcBrowser {
  usual
  hide icheck
}
preferences set toolbar-Windows-WaveWindow {
  usual
  hide icheck
  position -pos 3
}
preferences set txe-navigate-waveform-next-child 0
preferences set delete-unused-groups-on-exit 0
preferences set toolbar-Windows-WatchList {
  usual
  hide icheck
}
preferences set toolbar-WaveZoom-WaveWindow {
  usual
  position -row 0 -pos 4
}
preferences set vhdl-colors {
        U #9900ff
        X #ff0000
        0 #00ff00
        1 #00ff00
        Z #ff9900
        W #ff0000
        L #00ffff
        H #00ffff
        - #0000ff
}
preferences set txe-locate-scroll-x 1
preferences set txe-locate-scroll-y 1
preferences set txe-locate-pop-waveform 1

#
# mmaps
#
mmap new -reuse -name {Boolean as Logic} -contents {
{%c=FALSE -edgepriority 1 -linecolor #00ff00 -shape low}
{%c=TRUE -edgepriority 1 -linecolor #00ff00 -shape high}
}
mmap new -reuse -name {Example Map} -contents {
{%b=11???? -bgcolor orange -label REG:%x -linecolor yellow -shape bus}
{%x=1F -bgcolor red -label ERROR -linecolor white -shape EVENT}
{%x=2C -bgcolor red -label ERROR -linecolor white -shape EVENT}
{%x=* -label %x -linecolor gray -shape bus}
}

#
# Design Browser windows
#
if {[catch {window new WatchList -name "Design Browser 1" -geometry 700x500+6+21}] != ""} {
    window geometry "Design Browser 1" 700x500+6+21
}
window target "Design Browser 1" on
browser using {Design Browser 1}
browser timecontrol set -lock 0

#
# Waveform windows
#
if {[catch {window new WaveWindow -name "Waveform 1" -geometry 1009x576+7+0}] != ""} {
    window geometry "Waveform 1" 1009x576+7+0
}
window target "Waveform 1" on
waveform using {Waveform 1}
waveform sidebar visibility partial
waveform set \
    -primarycursor TimeA \
    -signalnames name \
    -signalwidth 175 \
    -units ns \
    -valuewidth 75
cursor set -using TimeA -time 6,547,530,000,000fs
cursor set -using TimeA -marching 1
waveform baseline set -time 0

set id [waveform add -signals [list simulator:::SYS_CLK \
	simulator:::CAN_CLK \
	simulator:::Bus2IP_Reset \
	simulator:::Bus2IP_CS \
	simulator:::Bus2IP_RNW \
	simulator:::Bus2IP_Addr \
	simulator:::Bus2IP_Data \
	simulator:::IP2Bus_Ack \
	simulator:::IP2Bus_Data \
	simulator:::IP2Bus_Error \
	simulator:::IP2Bus_IntrEvent \
	simulator:::RXF_ID \
	simulator:::RXF_DLC \
	simulator:::RXF_DW1 \
	simulator:::RXF_DW2 \
	simulator:::REG_READ \
	simulator:::CAN_PHY_TX_I \
	simulator:::WAIT_PROC ]]

waveform xview limits 0 700us

simcontrol run -time 700us
