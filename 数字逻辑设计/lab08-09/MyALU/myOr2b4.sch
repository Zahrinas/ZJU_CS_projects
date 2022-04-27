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
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="or2" name="XLXI_8">
            <blockpin signalname="B(3)" name="I0" />
            <blockpin signalname="A(3)" name="I1" />
            <blockpin signalname="O(3)" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_9">
            <blockpin signalname="B(2)" name="I0" />
            <blockpin signalname="A(2)" name="I1" />
            <blockpin signalname="O(2)" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_10">
            <blockpin signalname="B(1)" name="I0" />
            <blockpin signalname="A(1)" name="I1" />
            <blockpin signalname="O(1)" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_11">
            <blockpin signalname="B(0)" name="I0" />
            <blockpin signalname="A(0)" name="I1" />
            <blockpin signalname="O(0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="A(3:0)">
            <wire x2="1104" y1="1088" y2="1088" x1="1024" />
            <wire x2="1104" y1="1088" y2="1104" x1="1104" />
            <wire x2="1104" y1="1104" y2="1248" x1="1104" />
            <wire x2="1104" y1="1248" y2="1392" x1="1104" />
            <wire x2="1104" y1="1392" y2="1536" x1="1104" />
        </branch>
        <bustap x2="1200" y1="1104" y2="1104" x1="1104" />
        <branch name="A(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="1104" type="branch" />
            <wire x2="1296" y1="1104" y2="1104" x1="1200" />
            <wire x2="1392" y1="1104" y2="1104" x1="1296" />
        </branch>
        <bustap x2="1200" y1="1248" y2="1248" x1="1104" />
        <branch name="A(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="1248" type="branch" />
            <wire x2="1296" y1="1248" y2="1248" x1="1200" />
            <wire x2="1392" y1="1248" y2="1248" x1="1296" />
        </branch>
        <bustap x2="1200" y1="1392" y2="1392" x1="1104" />
        <branch name="A(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="1392" type="branch" />
            <wire x2="1296" y1="1392" y2="1392" x1="1200" />
            <wire x2="1392" y1="1392" y2="1392" x1="1296" />
        </branch>
        <bustap x2="1200" y1="1536" y2="1536" x1="1104" />
        <branch name="A(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="1536" type="branch" />
            <wire x2="1296" y1="1536" y2="1536" x1="1200" />
            <wire x2="1392" y1="1536" y2="1536" x1="1296" />
        </branch>
        <branch name="B(3:0)">
            <wire x2="1264" y1="1152" y2="1152" x1="1024" />
            <wire x2="1264" y1="1152" y2="1168" x1="1264" />
            <wire x2="1264" y1="1168" y2="1312" x1="1264" />
            <wire x2="1264" y1="1312" y2="1456" x1="1264" />
            <wire x2="1264" y1="1456" y2="1600" x1="1264" />
        </branch>
        <bustap x2="1360" y1="1168" y2="1168" x1="1264" />
        <branch name="B(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1168" type="branch" />
            <wire x2="1376" y1="1168" y2="1168" x1="1360" />
            <wire x2="1392" y1="1168" y2="1168" x1="1376" />
        </branch>
        <bustap x2="1360" y1="1312" y2="1312" x1="1264" />
        <branch name="B(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1312" type="branch" />
            <wire x2="1376" y1="1312" y2="1312" x1="1360" />
            <wire x2="1392" y1="1312" y2="1312" x1="1376" />
        </branch>
        <bustap x2="1360" y1="1456" y2="1456" x1="1264" />
        <branch name="B(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1456" type="branch" />
            <wire x2="1376" y1="1456" y2="1456" x1="1360" />
            <wire x2="1392" y1="1456" y2="1456" x1="1376" />
        </branch>
        <bustap x2="1360" y1="1600" y2="1600" x1="1264" />
        <branch name="B(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1600" type="branch" />
            <wire x2="1376" y1="1600" y2="1600" x1="1360" />
            <wire x2="1392" y1="1600" y2="1600" x1="1376" />
        </branch>
        <branch name="O(3:0)">
            <wire x2="1872" y1="1136" y2="1280" x1="1872" />
            <wire x2="1872" y1="1280" y2="1424" x1="1872" />
            <wire x2="1872" y1="1424" y2="1568" x1="1872" />
            <wire x2="1872" y1="1568" y2="1584" x1="1872" />
            <wire x2="2048" y1="1584" y2="1584" x1="1872" />
        </branch>
        <bustap x2="1776" y1="1136" y2="1136" x1="1872" />
        <branch name="O(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1712" y="1136" type="branch" />
            <wire x2="1712" y1="1136" y2="1136" x1="1648" />
            <wire x2="1776" y1="1136" y2="1136" x1="1712" />
        </branch>
        <bustap x2="1776" y1="1280" y2="1280" x1="1872" />
        <branch name="O(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1712" y="1280" type="branch" />
            <wire x2="1712" y1="1280" y2="1280" x1="1648" />
            <wire x2="1776" y1="1280" y2="1280" x1="1712" />
        </branch>
        <bustap x2="1776" y1="1424" y2="1424" x1="1872" />
        <branch name="O(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1712" y="1424" type="branch" />
            <wire x2="1712" y1="1424" y2="1424" x1="1648" />
            <wire x2="1776" y1="1424" y2="1424" x1="1712" />
        </branch>
        <bustap x2="1776" y1="1568" y2="1568" x1="1872" />
        <branch name="O(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1712" y="1568" type="branch" />
            <wire x2="1712" y1="1568" y2="1568" x1="1648" />
            <wire x2="1776" y1="1568" y2="1568" x1="1712" />
        </branch>
        <iomarker fontsize="28" x="1024" y="1088" name="A(3:0)" orien="R180" />
        <iomarker fontsize="28" x="1024" y="1152" name="B(3:0)" orien="R180" />
        <iomarker fontsize="28" x="2048" y="1584" name="O(3:0)" orien="R0" />
        <instance x="1392" y="1232" name="XLXI_8" orien="R0" />
        <instance x="1392" y="1376" name="XLXI_9" orien="R0" />
        <instance x="1392" y="1520" name="XLXI_10" orien="R0" />
        <instance x="1392" y="1664" name="XLXI_11" orien="R0" />
    </sheet>
</drawing>