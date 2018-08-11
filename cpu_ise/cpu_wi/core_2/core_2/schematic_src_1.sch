<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="reset" />
        <signal name="clock" />
        <signal name="gpo1(31:0)" />
        <signal name="gpo1(7:0)" />
        <signal name="gpo1(23:8)" />
        <signal name="gpo1(24)" />
        <signal name="tx" />
        <signal name="gio(0)" />
        <signal name="led" />
        <signal name="gio(31:0)" />
        <signal name="gio1(31:0)" />
        <port polarity="Input" name="reset" />
        <port polarity="Input" name="clock" />
        <port polarity="Output" name="tx" />
        <port polarity="Output" name="led" />
        <blockdef name="microblaze_mcs_v1_4">
            <timestamp>2018-7-21T0:27:27</timestamp>
            <rect width="704" x="32" y="32" height="1696" />
            <line x2="32" y1="80" y2="80" x1="0" />
            <line x2="32" y1="112" y2="112" x1="0" />
            <line x2="736" y1="80" y2="80" x1="768" />
            <line x2="32" y1="144" y2="144" x1="0" />
            <line x2="32" y1="304" y2="304" style="linewidth:W" x1="0" />
            <line x2="32" y1="336" y2="336" style="linewidth:W" x1="0" />
            <line x2="32" y1="368" y2="368" style="linewidth:W" x1="0" />
            <line x2="32" y1="400" y2="400" style="linewidth:W" x1="0" />
            <line x2="736" y1="784" y2="784" style="linewidth:W" x1="768" />
            <line x2="736" y1="816" y2="816" style="linewidth:W" x1="768" />
            <line x2="736" y1="848" y2="848" style="linewidth:W" x1="768" />
            <line x2="736" y1="880" y2="880" style="linewidth:W" x1="768" />
            <line x2="736" y1="912" y2="912" x1="768" />
            <line x2="32" y1="432" y2="432" style="linewidth:W" x1="0" />
        </blockdef>
        <blockdef name="my_usart">
            <timestamp>2018-7-21T1:23:40</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-192" y2="-192" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="my_usart" name="XLXI_5">
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="clock" name="clock" />
            <blockpin name="rx_pin" />
            <blockpin signalname="gpo1(24)" name="transmit" />
            <blockpin signalname="gpo1(23:8)" name="prescaler(15:0)" />
            <blockpin signalname="gpo1(7:0)" name="data(7:0)" />
            <blockpin signalname="led" name="led" />
            <blockpin signalname="tx" name="tx_pin" />
            <blockpin signalname="gio(0)" name="uart_busy" />
        </block>
        <block symbolname="microblaze_mcs_v1_4" name="XLXI_6">
            <blockpin signalname="clock" name="clk" />
            <blockpin signalname="reset" name="reset" />
            <blockpin name="uart_tx" />
            <blockpin name="uart_rx" />
            <blockpin signalname="gpo1(31:0)" name="gpi1(31:0)" />
            <blockpin name="gpi2(31:0)" />
            <blockpin name="gpi3(31:0)" />
            <blockpin name="gpi4(31:0)" />
            <blockpin signalname="gio1(31:0)" name="gpo1(31:0)" />
            <blockpin name="gpo2(31:0)" />
            <blockpin name="gpo3(31:0)" />
            <blockpin name="gpo4(31:0)" />
            <blockpin name="intc_irq" />
            <blockpin name="intc_interrupt(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="gpo1(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2576" y="560" type="branch" />
            <wire x2="2576" y1="560" y2="560" x1="2448" />
            <wire x2="2784" y1="560" y2="560" x1="2576" />
        </branch>
        <branch name="gpo1(23:8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2576" y="496" type="branch" />
            <wire x2="2576" y1="496" y2="496" x1="2448" />
            <wire x2="2784" y1="496" y2="496" x1="2576" />
        </branch>
        <branch name="gpo1(24)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2576" y="432" type="branch" />
            <wire x2="2576" y1="432" y2="432" x1="2448" />
            <wire x2="2784" y1="432" y2="432" x1="2576" />
        </branch>
        <branch name="gpo1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="320" type="branch" />
            <wire x2="2352" y1="320" y2="320" x1="2272" />
            <wire x2="2352" y1="320" y2="432" x1="2352" />
            <wire x2="2352" y1="432" y2="496" x1="2352" />
            <wire x2="2352" y1="496" y2="560" x1="2352" />
            <wire x2="2352" y1="560" y2="592" x1="2352" />
        </branch>
        <bustap x2="2448" y1="432" y2="432" x1="2352" />
        <bustap x2="2448" y1="496" y2="496" x1="2352" />
        <bustap x2="2448" y1="560" y2="560" x1="2352" />
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2688" y="240" type="branch" />
            <wire x2="2784" y1="240" y2="240" x1="2688" />
        </branch>
        <branch name="clock">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2688" y="304" type="branch" />
            <wire x2="2784" y1="304" y2="304" x1="2688" />
        </branch>
        <branch name="tx">
            <wire x2="3264" y1="400" y2="400" x1="3168" />
        </branch>
        <branch name="gio(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3184" y="560" type="branch" />
            <wire x2="3184" y1="560" y2="560" x1="3168" />
            <wire x2="3264" y1="560" y2="560" x1="3184" />
            <wire x2="3264" y1="560" y2="640" x1="3264" />
        </branch>
        <branch name="led">
            <wire x2="3264" y1="240" y2="240" x1="3168" />
        </branch>
        <iomarker fontsize="28" x="3264" y="400" name="tx" orien="R0" />
        <iomarker fontsize="28" x="3264" y="240" name="led" orien="R0" />
        <bustap x2="3264" y1="640" y2="640" x1="3168" />
        <branch name="gio(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="688" type="branch" />
            <wire x2="3040" y1="688" y2="688" x1="3024" />
            <wire x2="3168" y1="688" y2="688" x1="3040" />
            <wire x2="3168" y1="624" y2="640" x1="3168" />
            <wire x2="3168" y1="640" y2="688" x1="3168" />
        </branch>
        <branch name="clock">
            <wire x2="448" y1="1904" y2="1904" x1="256" />
        </branch>
        <iomarker fontsize="28" x="256" y="1904" name="clock" orien="R180" />
        <branch name="reset">
            <wire x2="448" y1="2016" y2="2016" x1="256" />
        </branch>
        <iomarker fontsize="28" x="256" y="2016" name="reset" orien="R180" />
        <instance x="2784" y="592" name="XLXI_5" orien="R0">
        </instance>
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="416" y="960" type="branch" />
            <wire x2="432" y1="960" y2="960" x1="416" />
            <wire x2="608" y1="960" y2="960" x1="432" />
        </branch>
        <branch name="gio1(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1408" y="1632" type="branch" />
            <wire x2="1408" y1="1632" y2="1632" x1="1376" />
            <wire x2="1616" y1="1632" y2="1632" x1="1408" />
        </branch>
        <branch name="clock">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="432" y="928" type="branch" />
            <wire x2="448" y1="928" y2="928" x1="432" />
            <wire x2="608" y1="928" y2="928" x1="448" />
        </branch>
        <instance x="608" y="848" name="XLXI_6" orien="R0">
        </instance>
        <branch name="gpo1(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="1152" type="branch" />
            <wire x2="464" y1="1152" y2="1152" x1="400" />
            <wire x2="512" y1="1152" y2="1152" x1="464" />
            <wire x2="608" y1="1152" y2="1152" x1="512" />
        </branch>
    </sheet>
</drawing>