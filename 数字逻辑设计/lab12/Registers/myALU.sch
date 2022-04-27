<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S(1:0)" />
        <signal name="XLXN_4(3:0)" />
        <signal name="XLXN_5(3:0)" />
        <signal name="XLXN_6(3:0)" />
        <signal name="XLXN_7" />
        <signal name="XLXN_10" />
        <signal name="S(0)" />
        <signal name="A(3:0)" />
        <signal name="B(3:0)" />
        <signal name="Cout" />
        <signal name="C(3:0)" />
        <port polarity="Input" name="S(1:0)" />
        <port polarity="Input" name="A(3:0)" />
        <port polarity="Input" name="B(3:0)" />
        <port polarity="Output" name="Cout" />
        <port polarity="Output" name="C(3:0)" />
        <blockdef name="AddSub4b">
            <timestamp>2021-11-15T8:39:5</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="Mux4to1b4">
            <timestamp>2021-11-13T6:2:53</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="Mux4to1">
            <timestamp>2021-11-15T8:47:25</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="myAnd2b4">
            <timestamp>2021-11-15T8:51:17</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="myOr2b4">
            <timestamp>2021-11-15T8:56:2</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="AddSub4b" name="XLXI_1">
            <blockpin signalname="A(3:0)" name="A(3:0)" />
            <blockpin signalname="B(3:0)" name="B(3:0)" />
            <blockpin signalname="S(0)" name="Ctrl" />
            <blockpin signalname="XLXN_4(3:0)" name="S(3:0)" />
            <blockpin signalname="XLXN_7" name="Cout" />
        </block>
        <block symbolname="Mux4to1b4" name="XLXI_2">
            <blockpin signalname="S(1:0)" name="s(1:0)" />
            <blockpin signalname="XLXN_4(3:0)" name="I0(3:0)" />
            <blockpin signalname="XLXN_5(3:0)" name="I2(3:0)" />
            <blockpin signalname="XLXN_6(3:0)" name="I3(3:0)" />
            <blockpin signalname="XLXN_4(3:0)" name="I1(3:0)" />
            <blockpin signalname="C(3:0)" name="o(3:0)" />
        </block>
        <block symbolname="Mux4to1" name="XLXI_3">
            <blockpin signalname="S(1:0)" name="S(1:0)" />
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="XLXN_7" name="I1" />
            <blockpin signalname="XLXN_10" name="I2" />
            <blockpin signalname="XLXN_10" name="I3" />
            <blockpin signalname="Cout" name="O" />
        </block>
        <block symbolname="myAnd2b4" name="XLXI_4">
            <blockpin signalname="A(3:0)" name="A(3:0)" />
            <blockpin signalname="B(3:0)" name="B(3:0)" />
            <blockpin signalname="XLXN_5(3:0)" name="O(3:0)" />
        </block>
        <block symbolname="myOr2b4" name="XLXI_5">
            <blockpin signalname="A(3:0)" name="A(3:0)" />
            <blockpin signalname="B(3:0)" name="B(3:0)" />
            <blockpin signalname="XLXN_6(3:0)" name="O(3:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_6">
            <blockpin signalname="XLXN_10" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2080" y="1552" name="XLXI_3" orien="R0">
        </instance>
        <instance x="2080" y="1152" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1040" y="1232" name="XLXI_4" orien="R0">
        </instance>
        <instance x="1040" y="1440" name="XLXI_5" orien="R0">
        </instance>
        <branch name="S(1:0)">
            <wire x2="768" y1="672" y2="672" x1="720" />
            <wire x2="1616" y1="672" y2="672" x1="768" />
            <wire x2="1616" y1="672" y2="864" x1="1616" />
            <wire x2="1616" y1="864" y2="1264" x1="1616" />
            <wire x2="2080" y1="1264" y2="1264" x1="1616" />
            <wire x2="2080" y1="864" y2="864" x1="1616" />
            <wire x2="768" y1="672" y2="928" x1="768" />
        </branch>
        <branch name="XLXN_4(3:0)">
            <wire x2="1728" y1="800" y2="800" x1="1424" />
            <wire x2="1728" y1="800" y2="928" x1="1728" />
            <wire x2="1728" y1="928" y2="1120" x1="1728" />
            <wire x2="2080" y1="1120" y2="1120" x1="1728" />
            <wire x2="2080" y1="928" y2="928" x1="1728" />
        </branch>
        <branch name="XLXN_5(3:0)">
            <wire x2="1424" y1="992" y2="1136" x1="1424" />
            <wire x2="2080" y1="992" y2="992" x1="1424" />
        </branch>
        <branch name="XLXN_6(3:0)">
            <wire x2="1488" y1="1344" y2="1344" x1="1424" />
            <wire x2="2080" y1="1056" y2="1056" x1="1488" />
            <wire x2="1488" y1="1056" y2="1344" x1="1488" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="2080" y1="1456" y2="1456" x1="1824" />
            <wire x2="1824" y1="1456" y2="1520" x1="1824" />
            <wire x2="2080" y1="1520" y2="1520" x1="1824" />
            <wire x2="1824" y1="1520" y2="1552" x1="1824" />
        </branch>
        <instance x="1760" y="1680" name="XLXI_6" orien="R0" />
        <instance x="1040" y="960" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_7">
            <wire x2="1552" y1="928" y2="928" x1="1424" />
            <wire x2="1552" y1="928" y2="1328" x1="1552" />
            <wire x2="1824" y1="1328" y2="1328" x1="1552" />
            <wire x2="2080" y1="1328" y2="1328" x1="1824" />
            <wire x2="1824" y1="1328" y2="1392" x1="1824" />
            <wire x2="2080" y1="1392" y2="1392" x1="1824" />
        </branch>
        <bustap x2="864" y1="928" y2="928" x1="768" />
        <branch name="S(0)">
            <wire x2="960" y1="928" y2="928" x1="864" />
            <wire x2="1040" y1="928" y2="928" x1="960" />
        </branch>
        <branch name="A(3:0)">
            <wire x2="880" y1="800" y2="800" x1="720" />
            <wire x2="1040" y1="800" y2="800" x1="880" />
            <wire x2="880" y1="800" y2="1136" x1="880" />
            <wire x2="1040" y1="1136" y2="1136" x1="880" />
            <wire x2="880" y1="1136" y2="1344" x1="880" />
            <wire x2="1040" y1="1344" y2="1344" x1="880" />
        </branch>
        <iomarker fontsize="28" x="720" y="800" name="A(3:0)" orien="R180" />
        <branch name="B(3:0)">
            <wire x2="960" y1="864" y2="864" x1="720" />
            <wire x2="1040" y1="864" y2="864" x1="960" />
            <wire x2="960" y1="864" y2="1200" x1="960" />
            <wire x2="1040" y1="1200" y2="1200" x1="960" />
            <wire x2="960" y1="1200" y2="1408" x1="960" />
            <wire x2="1040" y1="1408" y2="1408" x1="960" />
        </branch>
        <iomarker fontsize="28" x="720" y="864" name="B(3:0)" orien="R180" />
        <branch name="Cout">
            <wire x2="2496" y1="1264" y2="1264" x1="2464" />
        </branch>
        <iomarker fontsize="28" x="2496" y="1264" name="Cout" orien="R0" />
        <branch name="C(3:0)">
            <wire x2="2496" y1="864" y2="864" x1="2464" />
        </branch>
        <iomarker fontsize="28" x="2496" y="864" name="C(3:0)" orien="R0" />
        <iomarker fontsize="28" x="720" y="672" name="S(1:0)" orien="R180" />
    </sheet>
</drawing>