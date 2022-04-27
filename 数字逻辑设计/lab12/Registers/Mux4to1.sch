<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S(1:0)" />
        <signal name="S(0)" />
        <signal name="I0" />
        <signal name="I1" />
        <signal name="I2" />
        <signal name="I3" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="O" />
        <signal name="XLXN_24" />
        <signal name="S(1)" />
        <port polarity="Input" name="S(1:0)" />
        <port polarity="Input" name="I0" />
        <port polarity="Input" name="I1" />
        <port polarity="Input" name="I2" />
        <port polarity="Input" name="I3" />
        <port polarity="Output" name="O" />
        <blockdef name="m2_1b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <circle r="20" cx="76" cy="-160" />
            <line x2="56" y1="-160" y2="-160" x1="0" />
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
        </blockdef>
        <block symbolname="m2_1b1" name="XLXI_5">
            <blockpin signalname="I0" name="D0" />
            <blockpin signalname="I1" name="D1" />
            <blockpin signalname="S(0)" name="S0" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="m2_1b1" name="XLXI_7">
            <blockpin signalname="I2" name="D0" />
            <blockpin signalname="I3" name="D1" />
            <blockpin signalname="S(0)" name="S0" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="m2_1b1" name="XLXI_8">
            <blockpin signalname="XLXN_19" name="D0" />
            <blockpin signalname="XLXN_20" name="D1" />
            <blockpin signalname="S(1)" name="S0" />
            <blockpin signalname="O" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1136" y="992" name="XLXI_7" orien="R0" />
        <instance x="1136" y="736" name="XLXI_5" orien="R0" />
        <branch name="S(1:0)">
            <wire x2="848" y1="464" y2="464" x1="720" />
            <wire x2="1520" y1="464" y2="464" x1="848" />
            <wire x2="1520" y1="464" y2="832" x1="1520" />
            <wire x2="848" y1="464" y2="704" x1="848" />
            <wire x2="848" y1="704" y2="960" x1="848" />
        </branch>
        <bustap x2="944" y1="960" y2="960" x1="848" />
        <branch name="S(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="960" type="branch" />
            <wire x2="1040" y1="960" y2="960" x1="944" />
            <wire x2="1136" y1="960" y2="960" x1="1040" />
        </branch>
        <bustap x2="944" y1="704" y2="704" x1="848" />
        <branch name="S(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="704" type="branch" />
            <wire x2="1040" y1="704" y2="704" x1="944" />
            <wire x2="1136" y1="704" y2="704" x1="1040" />
        </branch>
        <branch name="I0">
            <wire x2="1120" y1="576" y2="576" x1="1104" />
            <wire x2="1136" y1="576" y2="576" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="1104" y="576" name="I0" orien="R180" />
        <branch name="I1">
            <wire x2="1120" y1="640" y2="640" x1="1104" />
            <wire x2="1136" y1="640" y2="640" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="1104" y="640" name="I1" orien="R180" />
        <branch name="I2">
            <wire x2="1136" y1="832" y2="832" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="1104" y="832" name="I2" orien="R180" />
        <branch name="I3">
            <wire x2="1136" y1="896" y2="896" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="1104" y="896" name="I3" orien="R180" />
        <branch name="XLXN_20">
            <wire x2="1456" y1="768" y2="864" x1="1456" />
            <wire x2="1760" y1="768" y2="768" x1="1456" />
        </branch>
        <branch name="O">
            <wire x2="2096" y1="736" y2="736" x1="2080" />
            <wire x2="2112" y1="736" y2="736" x1="2096" />
        </branch>
        <instance x="1760" y="864" name="XLXI_8" orien="R0" />
        <branch name="XLXN_19">
            <wire x2="1456" y1="608" y2="704" x1="1456" />
            <wire x2="1744" y1="704" y2="704" x1="1456" />
            <wire x2="1760" y1="704" y2="704" x1="1744" />
        </branch>
        <bustap x2="1616" y1="832" y2="832" x1="1520" />
        <branch name="S(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1688" y="832" type="branch" />
            <wire x2="1688" y1="832" y2="832" x1="1616" />
            <wire x2="1760" y1="832" y2="832" x1="1688" />
        </branch>
        <iomarker fontsize="28" x="720" y="464" name="S(1:0)" orien="R180" />
        <iomarker fontsize="28" x="2112" y="736" name="O" orien="R0" />
    </sheet>
</drawing>