<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S" />
        <signal name="R" />
        <signal name="Q" />
        <signal name="QN" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <port polarity="Input" name="S" />
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
            <blockpin signalname="QN" name="I0" />
            <blockpin signalname="S" name="I1" />
            <blockpin signalname="Q" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_2">
            <blockpin signalname="R" name="I0" />
            <blockpin signalname="Q" name="I1" />
            <blockpin signalname="QN" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1136" y="1328" name="XLXI_1" orien="R0" />
        <instance x="1136" y="1536" name="XLXI_2" orien="R0" />
        <branch name="S">
            <wire x2="1136" y1="1200" y2="1200" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="1104" y="1200" name="S" orien="R180" />
        <branch name="R">
            <wire x2="1136" y1="1472" y2="1472" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="1104" y="1472" name="R" orien="R180" />
        <branch name="Q">
            <wire x2="1120" y1="1296" y2="1408" x1="1120" />
            <wire x2="1136" y1="1408" y2="1408" x1="1120" />
            <wire x2="1472" y1="1296" y2="1296" x1="1120" />
            <wire x2="1408" y1="1232" y2="1232" x1="1392" />
            <wire x2="1472" y1="1232" y2="1232" x1="1408" />
            <wire x2="1568" y1="1232" y2="1232" x1="1472" />
            <wire x2="1472" y1="1232" y2="1296" x1="1472" />
        </branch>
        <branch name="QN">
            <wire x2="1136" y1="1264" y2="1264" x1="1056" />
            <wire x2="1056" y1="1264" y2="1360" x1="1056" />
            <wire x2="1472" y1="1360" y2="1360" x1="1056" />
            <wire x2="1472" y1="1360" y2="1440" x1="1472" />
            <wire x2="1568" y1="1440" y2="1440" x1="1472" />
            <wire x2="1408" y1="1440" y2="1440" x1="1392" />
            <wire x2="1472" y1="1440" y2="1440" x1="1408" />
        </branch>
        <iomarker fontsize="28" x="1568" y="1440" name="QN" orien="R0" />
        <iomarker fontsize="28" x="1568" y="1232" name="Q" orien="R0" />
    </sheet>
</drawing>