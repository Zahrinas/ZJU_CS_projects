<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S2" />
        <signal name="S3" />
        <signal name="F" />
        <signal name="XLXN_10" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="Y(7:0)" />
        <signal name="Y(6)" />
        <signal name="Y(5)" />
        <signal name="Y(3)" />
        <signal name="Y(0)" />
        <signal name="S1" />
        <port polarity="Input" name="S2" />
        <port polarity="Input" name="S3" />
        <port polarity="Output" name="F" />
        <port polarity="Input" name="S1" />
        <blockdef name="D_74LS138">
            <timestamp>2021-10-18T8:56:13</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="nand4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="216" y1="-160" y2="-160" x1="256" />
            <circle r="12" cx="204" cy="-160" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="64" y1="-112" y2="-112" x1="144" />
        </blockdef>
        <block symbolname="D_74LS138" name="XLXI_1">
            <blockpin signalname="S1" name="A" />
            <blockpin signalname="S2" name="B" />
            <blockpin signalname="XLXN_10" name="G" />
            <blockpin signalname="XLXN_13" name="G2A" />
            <blockpin signalname="XLXN_12" name="G2B" />
            <blockpin signalname="S3" name="C" />
            <blockpin signalname="Y(7:0)" name="Y(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_3">
            <blockpin signalname="XLXN_13" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_4">
            <blockpin signalname="XLXN_12" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_5">
            <blockpin signalname="XLXN_10" name="P" />
        </block>
        <block symbolname="nand4" name="XLXI_8">
            <blockpin signalname="Y(0)" name="I0" />
            <blockpin signalname="Y(3)" name="I1" />
            <blockpin signalname="Y(5)" name="I2" />
            <blockpin signalname="Y(6)" name="I3" />
            <blockpin signalname="F" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1552" y="1040" name="XLXI_1" orien="R0">
        </instance>
        <branch name="S2">
            <wire x2="1536" y1="752" y2="752" x1="1472" />
            <wire x2="1552" y1="752" y2="752" x1="1536" />
        </branch>
        <branch name="S3">
            <wire x2="1536" y1="1008" y2="1008" x1="1472" />
            <wire x2="1552" y1="1008" y2="1008" x1="1536" />
        </branch>
        <branch name="F">
            <wire x2="2496" y1="848" y2="848" x1="2480" />
        </branch>
        <iomarker fontsize="28" x="2496" y="848" name="F" orien="R0" />
        <iomarker fontsize="28" x="1472" y="752" name="S2" orien="R180" />
        <instance x="1248" y="960" name="XLXI_3" orien="R0" />
        <instance x="1248" y="1104" name="XLXI_4" orien="R0" />
        <instance x="1248" y="1232" name="XLXI_5" orien="R0" />
        <branch name="XLXN_10">
            <wire x2="1312" y1="1232" y2="1312" x1="1312" />
            <wire x2="1536" y1="1312" y2="1312" x1="1312" />
            <wire x2="1552" y1="816" y2="816" x1="1536" />
            <wire x2="1536" y1="816" y2="1312" x1="1536" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1552" y1="944" y2="944" x1="1312" />
            <wire x2="1312" y1="944" y2="976" x1="1312" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1312" y1="768" y2="832" x1="1312" />
            <wire x2="1376" y1="768" y2="768" x1="1312" />
            <wire x2="1376" y1="768" y2="880" x1="1376" />
            <wire x2="1552" y1="880" y2="880" x1="1376" />
        </branch>
        <iomarker fontsize="28" x="1472" y="1008" name="S3" orien="R180" />
        <branch name="Y(7:0)">
            <wire x2="1952" y1="688" y2="688" x1="1936" />
            <wire x2="2032" y1="688" y2="688" x1="1952" />
            <wire x2="2032" y1="688" y2="752" x1="2032" />
            <wire x2="2032" y1="752" y2="816" x1="2032" />
            <wire x2="2032" y1="816" y2="880" x1="2032" />
            <wire x2="2032" y1="880" y2="944" x1="2032" />
            <wire x2="2032" y1="944" y2="1040" x1="2032" />
        </branch>
        <bustap x2="2128" y1="752" y2="752" x1="2032" />
        <branch name="Y(6)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2168" y="752" type="branch" />
            <wire x2="2176" y1="752" y2="752" x1="2128" />
            <wire x2="2224" y1="752" y2="752" x1="2176" />
        </branch>
        <bustap x2="2128" y1="816" y2="816" x1="2032" />
        <branch name="Y(5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2168" y="816" type="branch" />
            <wire x2="2176" y1="816" y2="816" x1="2128" />
            <wire x2="2224" y1="816" y2="816" x1="2176" />
        </branch>
        <bustap x2="2128" y1="880" y2="880" x1="2032" />
        <branch name="Y(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2168" y="880" type="branch" />
            <wire x2="2176" y1="880" y2="880" x1="2128" />
            <wire x2="2224" y1="880" y2="880" x1="2176" />
        </branch>
        <bustap x2="2128" y1="944" y2="944" x1="2032" />
        <branch name="Y(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2168" y="944" type="branch" />
            <wire x2="2176" y1="944" y2="944" x1="2128" />
            <wire x2="2224" y1="944" y2="944" x1="2176" />
        </branch>
        <instance x="2224" y="1008" name="XLXI_8" orien="R0" />
        <branch name="S1">
            <wire x2="1552" y1="688" y2="688" x1="1472" />
        </branch>
        <iomarker fontsize="28" x="1472" y="688" name="S1" orien="R180" />
    </sheet>
</drawing>