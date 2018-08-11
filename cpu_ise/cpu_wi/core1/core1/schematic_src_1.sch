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
        <blockdef name="my_usart">
            <timestamp>2018-7-20T22:41:49</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-192" y2="-192" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="320" y1="-224" y2="-224" x1="384" />
        </blockdef>
        <blockdef name="microblaze_mcs_v1_4">
            <timestamp>2018-7-20T23:51:0</timestamp>
            <rect width="384" x="64" y="-640" height="640" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-528" y2="-528" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <rect width="64" x="0" y="-380" height="24" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-220" height="24" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="512" y1="-608" y2="-608" x1="448" />
            <line x2="512" y1="-544" y2="-544" x1="448" />
            <line x2="512" y1="-480" y2="-480" x1="448" />
            <line x2="512" y1="-416" y2="-416" x1="448" />
            <line x2="512" y1="-352" y2="-352" x1="448" />
            <line x2="512" y1="-288" y2="-288" x1="448" />
            <rect width="64" x="448" y="-236" height="24" />
            <line x2="512" y1="-224" y2="-224" x1="448" />
            <rect width="64" x="448" y="-172" height="24" />
            <line x2="512" y1="-160" y2="-160" x1="448" />
            <rect width="64" x="448" y="-108" height="24" />
            <line x2="512" y1="-96" y2="-96" x1="448" />
            <rect width="64" x="448" y="-44" height="24" />
            <line x2="512" y1="-32" y2="-32" x1="448" />
        </blockdef>
        <block symbolname="my_usart" name="XLXI_3">
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="clock" name="clock" />
            <blockpin signalname="gpo1(24)" name="transmit" />
            <blockpin signalname="gpo1(23:8)" name="prescaler(15:0)" />
            <blockpin signalname="gpo1(7:0)" name="data(7:0)" />
            <blockpin signalname="led" name="led" />
            <blockpin signalname="tx" name="tx_pin" />
            <blockpin signalname="gio(0)" name="uart_busy" />
            <blockpin name="rx_pin" />
        </block>
        <block symbolname="microblaze_mcs_v1_4" name="XLXI_4">
            <blockpin signalname="clock" name="Clk" />
            <blockpin signalname="reset" name="Reset" />
            <blockpin name="UART_Rx" />
            <blockpin signalname="gio1(31:0)" name="GPI1(31:0)" />
            <blockpin name="GPI2(31:0)" />
            <blockpin name="GPI3(31:0)" />
            <blockpin name="GPI4(31:0)" />
            <blockpin name="INTC_Interrupt(15:0)" />
            <blockpin name="UART_Tx" />
            <blockpin name="GPI1_Interrupt" />
            <blockpin name="GPI2_Interrupt" />
            <blockpin name="GPI3_Interrupt" />
            <blockpin name="GPI4_Interrupt" />
            <blockpin name="INTC_IRQ" />
            <blockpin signalname="gpo1(31:0)" name="GPO1(31:0)" />
            <blockpin name="GPO2(31:0)" />
            <blockpin name="GPO3(31:0)" />
            <blockpin name="GPO4(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="clock">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="336" y="288" type="branch" />
            <wire x2="512" y1="288" y2="288" x1="336" />
        </branch>
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
        <instance x="2784" y="592" name="XLXI_3" orien="R0">
        </instance>
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
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="320" y="368" type="branch" />
            <wire x2="512" y1="368" y2="368" x1="320" />
        </branch>
        <branch name="gpo1(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1232" y="672" type="branch" />
            <wire x2="1232" y1="672" y2="672" x1="1024" />
        </branch>
        <branch name="gio1(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="304" y="528" type="branch" />
            <wire x2="304" y1="528" y2="528" x1="272" />
            <wire x2="512" y1="528" y2="528" x1="304" />
        </branch>
        <instance x="512" y="896" name="XLXI_4" orien="R0">
        </instance>
    </sheet>
</drawing>