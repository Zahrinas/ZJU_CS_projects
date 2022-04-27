<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="S" />
        <signal name="C" />
        <signal name="R" />
        <signal name="Q" />
        <signal name="QN" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <port polarity="Input" name="S" />
        <port polarity="Input" name="C" />
        <port polarity="Input" name="R" />
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
        <block symbolname="nand2" name="XLXI_1">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="S" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_2">
            <blockpin signalname="R" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_3">
            <blockpin signalname="QN" name="I0" />
            <blockpin signalname="XLXN_1" name="I1" />
            <blockpin signalname="Q" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_4">
            <blockpin signalname="XLXN_2" name="I0" />
            <blockpin signalname="Q" name="I1" />
            <blockpin signalname="QN" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1680" y="1488" name="XLXI_4" orien="R0" />
        <instance x="1680" y="1264" name="XLXI_3" orien="R0" />
        <instance x="1296" y="1520" name="XLXI_2" orien="R0" />
        <instance x="1296" y="1232" name="XLXI_1" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1680" y1="1136" y2="1136" x1="1552" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1680" y1="1424" y2="1424" x1="1552" />
        </branch>
        <branch name="S">
            <wire x2="1296" y1="1104" y2="1104" x1="1136" />
        </branch>
        <branch name="C">
            <wire x2="1232" y1="1280" y2="1280" x1="1136" />
            <wire x2="1232" y1="1280" y2="1392" x1="1232" />
            <wire x2="1296" y1="1392" y2="1392" x1="1232" />
            <wire x2="1296" y1="1168" y2="1168" x1="1232" />
            <wire x2="1232" y1="1168" y2="1280" x1="1232" />
        </branch>
        <branch name="R">
            <wire x2="1296" y1="1456" y2="1456" x1="1136" />
        </branch>
        <branch name="Q">
            <wire x2="1984" y1="1248" y2="1248" x1="1664" />
            <wire x2="1664" y1="1248" y2="1360" x1="1664" />
            <wire x2="1680" y1="1360" y2="1360" x1="1664" />
            <wire x2="1984" y1="1168" y2="1168" x1="1936" />
            <wire x2="2064" y1="1168" y2="1168" x1="1984" />
            <wire x2="1984" y1="1168" y2="1248" x1="1984" />
        </branch>
        <branch name="QN">
            <wire x2="1680" y1="1200" y2="1200" x1="1616" />
            <wire x2="1616" y1="1200" y2="1312" x1="1616" />
            <wire x2="1984" y1="1312" y2="1312" x1="1616" />
            <wire x2="1984" y1="1312" y2="1392" x1="1984" />
            <wire x2="2064" y1="1392" y2="1392" x1="1984" />
            <wire x2="1984" y1="1392" y2="1392" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="1136" y="1104" name="S" orien="R180" />
        <iomarker fontsize="28" x="1136" y="1456" name="R" orien="R180" />
        <iomarker fontsize="28" x="1136" y="1280" name="C" orien="R180" />
        <iomarker fontsize="28" x="2064" y="1392" name="QN" orien="R0" />
        <iomarker fontsize="28" x="2064" y="1168" name="Q" orien="R0" />
    </sheet>
</drawing>