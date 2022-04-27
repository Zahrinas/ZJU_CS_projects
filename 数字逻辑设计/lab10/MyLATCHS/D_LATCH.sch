<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="D" />
        <signal name="C" />
        <signal name="Q" />
        <signal name="QN" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <port polarity="Input" name="D" />
        <port polarity="Input" name="C" />
        <port polarity="Output" name="Q" />
        <port polarity="Output" name="QN" />
        <blockdef name="nand2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="216" y1="-96" y2="-96" x1="256" />
            <circle r="12" cx="204" cy="-96" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="nand2" name="XLXI_1">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="D" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_2">
            <blockpin signalname="XLXN_1" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_3">
            <blockpin signalname="XLXN_8" name="I0" />
            <blockpin signalname="Q" name="I1" />
            <blockpin signalname="QN" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_4">
            <blockpin signalname="QN" name="I0" />
            <blockpin signalname="XLXN_7" name="I1" />
            <blockpin signalname="Q" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_5">
            <blockpin signalname="D" name="I" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1328" y="976" name="XLXI_1" orien="R0" />
        <instance x="1328" y="1344" name="XLXI_2" orien="R0" />
        <instance x="1744" y="1312" name="XLXI_3" orien="R0" />
        <instance x="1744" y="1008" name="XLXI_4" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1328" y1="1280" y2="1280" x1="1296" />
        </branch>
        <instance x="1072" y="1312" name="XLXI_5" orien="R0" />
        <branch name="D">
            <wire x2="1056" y1="848" y2="848" x1="976" />
            <wire x2="1328" y1="848" y2="848" x1="1056" />
            <wire x2="1056" y1="848" y2="1280" x1="1056" />
            <wire x2="1072" y1="1280" y2="1280" x1="1056" />
        </branch>
        <branch name="C">
            <wire x2="1296" y1="1056" y2="1056" x1="976" />
            <wire x2="1296" y1="1056" y2="1216" x1="1296" />
            <wire x2="1328" y1="1216" y2="1216" x1="1296" />
            <wire x2="1328" y1="912" y2="912" x1="1296" />
            <wire x2="1296" y1="912" y2="1056" x1="1296" />
        </branch>
        <branch name="Q">
            <wire x2="1664" y1="1104" y2="1184" x1="1664" />
            <wire x2="1744" y1="1184" y2="1184" x1="1664" />
            <wire x2="2064" y1="1104" y2="1104" x1="1664" />
            <wire x2="2064" y1="912" y2="912" x1="2000" />
            <wire x2="2160" y1="912" y2="912" x1="2064" />
            <wire x2="2064" y1="912" y2="1104" x1="2064" />
        </branch>
        <branch name="QN">
            <wire x2="1744" y1="944" y2="944" x1="1680" />
            <wire x2="1680" y1="944" y2="1072" x1="1680" />
            <wire x2="2080" y1="1072" y2="1072" x1="1680" />
            <wire x2="2080" y1="1072" y2="1216" x1="2080" />
            <wire x2="2160" y1="1216" y2="1216" x1="2080" />
            <wire x2="2080" y1="1216" y2="1216" x1="2000" />
        </branch>
        <iomarker fontsize="28" x="976" y="848" name="D" orien="R180" />
        <iomarker fontsize="28" x="976" y="1056" name="C" orien="R180" />
        <branch name="XLXN_7">
            <wire x2="1744" y1="880" y2="880" x1="1584" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1744" y1="1248" y2="1248" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="2160" y="912" name="Q" orien="R0" />
        <iomarker fontsize="28" x="2160" y="1216" name="QN" orien="R0" />
    </sheet>
</drawing>