<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="S" />
        <signal name="C" />
        <signal name="R" />
        <signal name="Q" />
        <signal name="QN" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <port polarity="Input" name="S" />
        <port polarity="Input" name="C" />
        <port polarity="Input" name="R" />
        <port polarity="Output" name="Q" />
        <port polarity="Output" name="QN" />
        <blockdef name="CSR_LATCH">
            <timestamp>2021-12-12T8:10:0</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
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
        <block symbolname="CSR_LATCH" name="XLXI_1">
            <blockpin signalname="S" name="S" />
            <blockpin signalname="C" name="C" />
            <blockpin signalname="R" name="R" />
            <blockpin signalname="XLXN_7" name="Q" />
            <blockpin signalname="XLXN_8" name="QN" />
        </block>
        <block symbolname="CSR_LATCH" name="XLXI_2">
            <blockpin signalname="XLXN_7" name="S" />
            <blockpin signalname="XLXN_1" name="C" />
            <blockpin signalname="XLXN_8" name="R" />
            <blockpin signalname="Q" name="Q" />
            <blockpin signalname="QN" name="QN" />
        </block>
        <block symbolname="inv" name="XLXI_3">
            <blockpin signalname="C" name="I" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1280" y="1408" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1888" y="1408" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1440" y="1584" name="XLXI_3" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1776" y1="1552" y2="1552" x1="1664" />
            <wire x2="1776" y1="1312" y2="1552" x1="1776" />
            <wire x2="1888" y1="1312" y2="1312" x1="1776" />
        </branch>
        <branch name="S">
            <wire x2="1264" y1="1248" y2="1248" x1="1104" />
            <wire x2="1280" y1="1248" y2="1248" x1="1264" />
        </branch>
        <branch name="C">
            <wire x2="1232" y1="1312" y2="1312" x1="1104" />
            <wire x2="1264" y1="1312" y2="1312" x1="1232" />
            <wire x2="1280" y1="1312" y2="1312" x1="1264" />
            <wire x2="1232" y1="1312" y2="1552" x1="1232" />
            <wire x2="1440" y1="1552" y2="1552" x1="1232" />
        </branch>
        <branch name="R">
            <wire x2="1264" y1="1376" y2="1376" x1="1104" />
            <wire x2="1280" y1="1376" y2="1376" x1="1264" />
        </branch>
        <branch name="Q">
            <wire x2="2304" y1="1248" y2="1248" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="2304" y="1248" name="Q" orien="R0" />
        <branch name="QN">
            <wire x2="2304" y1="1376" y2="1376" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="2304" y="1376" name="QN" orien="R0" />
        <iomarker fontsize="28" x="1104" y="1312" name="C" orien="R180" />
        <iomarker fontsize="28" x="1104" y="1376" name="R" orien="R180" />
        <iomarker fontsize="28" x="1104" y="1248" name="S" orien="R180" />
        <branch name="XLXN_7">
            <wire x2="1888" y1="1248" y2="1248" x1="1664" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1888" y1="1376" y2="1376" x1="1664" />
        </branch>
    </sheet>
</drawing>