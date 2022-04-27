<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A(3:0)" />
        <signal name="A(3)" />
        <signal name="A(2)" />
        <signal name="A(1)" />
        <signal name="A(0)" />
        <signal name="B(3:0)" />
        <signal name="B(3)" />
        <signal name="B(2)" />
        <signal name="B(1)" />
        <signal name="B(0)" />
        <signal name="O(3:0)" />
        <signal name="O(3)" />
        <signal name="O(2)" />
        <signal name="O(1)" />
        <signal name="O(0)" />
        <port polarity="Input" name="A(3:0)" />
        <port polarity="Input" name="B(3:0)" />
        <port polarity="Output" name="O(3:0)" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="B(3)" name="I0" />
            <blockpin signalname="A(3)" name="I1" />
            <blockpin signalname="O(3)" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_6">
            <blockpin signalname="B(2)" name="I0" />
            <blockpin signalname="A(2)" name="I1" />
            <blockpin signalname="O(2)" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_7">
            <blockpin signalname="B(1)" name="I0" />
            <blockpin signalname="A(1)" name="I1" />
            <blockpin signalname="O(1)" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_8">
            <blockpin signalname="B(0)" name="I0" />
            <blockpin signalname="A(0)" name="I1" />
            <blockpin signalname="O(0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1328" y="1248" name="XLXI_5" orien="R0" />
        <instance x="1328" y="1392" name="XLXI_6" orien="R0" />
        <instance x="1328" y="1536" name="XLXI_7" orien="R0" />
        <instance x="1328" y="1680" name="XLXI_8" orien="R0" />
        <branch name="A(3:0)">
            <wire x2="1040" y1="1104" y2="1104" x1="960" />
            <wire x2="1040" y1="1104" y2="1120" x1="1040" />
            <wire x2="1040" y1="1120" y2="1264" x1="1040" />
            <wire x2="1040" y1="1264" y2="1408" x1="1040" />
            <wire x2="1040" y1="1408" y2="1552" x1="1040" />
        </branch>
        <bustap x2="1136" y1="1120" y2="1120" x1="1040" />
        <branch name="A(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1232" y="1120" type="branch" />
            <wire x2="1232" y1="1120" y2="1120" x1="1136" />
            <wire x2="1328" y1="1120" y2="1120" x1="1232" />
        </branch>
        <bustap x2="1136" y1="1264" y2="1264" x1="1040" />
        <branch name="A(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1232" y="1264" type="branch" />
            <wire x2="1232" y1="1264" y2="1264" x1="1136" />
            <wire x2="1328" y1="1264" y2="1264" x1="1232" />
        </branch>
        <bustap x2="1136" y1="1408" y2="1408" x1="1040" />
        <branch name="A(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1232" y="1408" type="branch" />
            <wire x2="1232" y1="1408" y2="1408" x1="1136" />
            <wire x2="1328" y1="1408" y2="1408" x1="1232" />
        </branch>
        <bustap x2="1136" y1="1552" y2="1552" x1="1040" />
        <branch name="A(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1232" y="1552" type="branch" />
            <wire x2="1232" y1="1552" y2="1552" x1="1136" />
            <wire x2="1328" y1="1552" y2="1552" x1="1232" />
        </branch>
        <branch name="B(3:0)">
            <wire x2="1200" y1="1168" y2="1168" x1="960" />
            <wire x2="1200" y1="1168" y2="1184" x1="1200" />
            <wire x2="1200" y1="1184" y2="1328" x1="1200" />
            <wire x2="1200" y1="1328" y2="1472" x1="1200" />
            <wire x2="1200" y1="1472" y2="1616" x1="1200" />
        </branch>
        <bustap x2="1296" y1="1184" y2="1184" x1="1200" />
        <branch name="B(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1312" y="1184" type="branch" />
            <wire x2="1312" y1="1184" y2="1184" x1="1296" />
            <wire x2="1328" y1="1184" y2="1184" x1="1312" />
        </branch>
        <bustap x2="1296" y1="1328" y2="1328" x1="1200" />
        <branch name="B(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1312" y="1328" type="branch" />
            <wire x2="1312" y1="1328" y2="1328" x1="1296" />
            <wire x2="1328" y1="1328" y2="1328" x1="1312" />
        </branch>
        <bustap x2="1296" y1="1472" y2="1472" x1="1200" />
        <branch name="B(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1312" y="1472" type="branch" />
            <wire x2="1312" y1="1472" y2="1472" x1="1296" />
            <wire x2="1328" y1="1472" y2="1472" x1="1312" />
        </branch>
        <bustap x2="1296" y1="1616" y2="1616" x1="1200" />
        <branch name="B(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1312" y="1616" type="branch" />
            <wire x2="1312" y1="1616" y2="1616" x1="1296" />
            <wire x2="1328" y1="1616" y2="1616" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="960" y="1104" name="A(3:0)" orien="R180" />
        <iomarker fontsize="28" x="960" y="1168" name="B(3:0)" orien="R180" />
        <branch name="O(3:0)">
            <wire x2="1808" y1="1152" y2="1296" x1="1808" />
            <wire x2="1808" y1="1296" y2="1440" x1="1808" />
            <wire x2="1808" y1="1440" y2="1584" x1="1808" />
            <wire x2="1808" y1="1584" y2="1600" x1="1808" />
            <wire x2="1984" y1="1600" y2="1600" x1="1808" />
        </branch>
        <bustap x2="1712" y1="1152" y2="1152" x1="1808" />
        <branch name="O(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1152" type="branch" />
            <wire x2="1648" y1="1152" y2="1152" x1="1584" />
            <wire x2="1712" y1="1152" y2="1152" x1="1648" />
        </branch>
        <bustap x2="1712" y1="1296" y2="1296" x1="1808" />
        <branch name="O(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1296" type="branch" />
            <wire x2="1648" y1="1296" y2="1296" x1="1584" />
            <wire x2="1712" y1="1296" y2="1296" x1="1648" />
        </branch>
        <bustap x2="1712" y1="1440" y2="1440" x1="1808" />
        <branch name="O(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1440" type="branch" />
            <wire x2="1648" y1="1440" y2="1440" x1="1584" />
            <wire x2="1712" y1="1440" y2="1440" x1="1648" />
        </branch>
        <bustap x2="1712" y1="1584" y2="1584" x1="1808" />
        <branch name="O(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1584" type="branch" />
            <wire x2="1648" y1="1584" y2="1584" x1="1584" />
            <wire x2="1712" y1="1584" y2="1584" x1="1648" />
        </branch>
        <iomarker fontsize="28" x="1984" y="1600" name="O(3:0)" orien="R0" />
    </sheet>
</drawing>