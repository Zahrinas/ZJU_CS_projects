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
        <signal name="Ctrl" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="S(3:0)" />
        <signal name="S(3)" />
        <signal name="S(2)" />
        <signal name="S(1)" />
        <signal name="S(0)" />
        <signal name="Cout" />
        <port polarity="Input" name="A(3:0)" />
        <port polarity="Input" name="B(3:0)" />
        <port polarity="Input" name="Ctrl" />
        <port polarity="Output" name="S(3:0)" />
        <port polarity="Output" name="Cout" />
        <blockdef name="AddSub1b">
            <timestamp>2021-11-15T8:23:37</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="AddSub1b" name="XLXI_1">
            <blockpin signalname="A(0)" name="A" />
            <blockpin signalname="B(0)" name="B" />
            <blockpin signalname="Ctrl" name="Ctrl" />
            <blockpin signalname="Ctrl" name="Cin" />
            <blockpin signalname="S(0)" name="S" />
            <blockpin signalname="XLXN_16" name="Cout" />
        </block>
        <block symbolname="AddSub1b" name="XLXI_3">
            <blockpin signalname="A(1)" name="A" />
            <blockpin signalname="B(1)" name="B" />
            <blockpin signalname="Ctrl" name="Ctrl" />
            <blockpin signalname="XLXN_16" name="Cin" />
            <blockpin signalname="S(1)" name="S" />
            <blockpin signalname="XLXN_17" name="Cout" />
        </block>
        <block symbolname="AddSub1b" name="XLXI_4">
            <blockpin signalname="A(2)" name="A" />
            <blockpin signalname="B(2)" name="B" />
            <blockpin signalname="Ctrl" name="Ctrl" />
            <blockpin signalname="XLXN_17" name="Cin" />
            <blockpin signalname="S(2)" name="S" />
            <blockpin signalname="XLXN_18" name="Cout" />
        </block>
        <block symbolname="AddSub1b" name="XLXI_5">
            <blockpin signalname="A(3)" name="A" />
            <blockpin signalname="B(3)" name="B" />
            <blockpin signalname="Ctrl" name="Ctrl" />
            <blockpin signalname="XLXN_18" name="Cin" />
            <blockpin signalname="S(3)" name="S" />
            <blockpin signalname="Cout" name="Cout" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1376" y="1328" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1376" y="1680" name="XLXI_3" orien="R0">
        </instance>
        <instance x="1376" y="2032" name="XLXI_4" orien="R0">
        </instance>
        <instance x="1376" y="2384" name="XLXI_5" orien="R0">
        </instance>
        <branch name="A(3:0)">
            <wire x2="704" y1="1088" y2="1088" x1="592" />
            <wire x2="704" y1="1088" y2="1104" x1="704" />
            <wire x2="704" y1="1104" y2="1456" x1="704" />
            <wire x2="704" y1="1456" y2="1808" x1="704" />
            <wire x2="704" y1="1808" y2="2160" x1="704" />
        </branch>
        <bustap x2="800" y1="2160" y2="2160" x1="704" />
        <branch name="A(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1088" y="2160" type="branch" />
            <wire x2="1088" y1="2160" y2="2160" x1="800" />
            <wire x2="1376" y1="2160" y2="2160" x1="1088" />
        </branch>
        <bustap x2="800" y1="1808" y2="1808" x1="704" />
        <branch name="A(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1088" y="1808" type="branch" />
            <wire x2="1088" y1="1808" y2="1808" x1="800" />
            <wire x2="1376" y1="1808" y2="1808" x1="1088" />
        </branch>
        <bustap x2="800" y1="1456" y2="1456" x1="704" />
        <branch name="A(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1088" y="1456" type="branch" />
            <wire x2="1088" y1="1456" y2="1456" x1="800" />
            <wire x2="1376" y1="1456" y2="1456" x1="1088" />
        </branch>
        <bustap x2="800" y1="1104" y2="1104" x1="704" />
        <branch name="A(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1088" y="1104" type="branch" />
            <wire x2="1088" y1="1104" y2="1104" x1="800" />
            <wire x2="1376" y1="1104" y2="1104" x1="1088" />
        </branch>
        <iomarker fontsize="28" x="592" y="1088" name="A(3:0)" orien="R180" />
        <branch name="B(3:0)">
            <wire x2="880" y1="1152" y2="1152" x1="592" />
            <wire x2="880" y1="1152" y2="1168" x1="880" />
            <wire x2="880" y1="1168" y2="1520" x1="880" />
            <wire x2="880" y1="1520" y2="1872" x1="880" />
            <wire x2="880" y1="1872" y2="2224" x1="880" />
        </branch>
        <bustap x2="976" y1="2224" y2="2224" x1="880" />
        <branch name="B(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1176" y="2224" type="branch" />
            <wire x2="1176" y1="2224" y2="2224" x1="976" />
            <wire x2="1376" y1="2224" y2="2224" x1="1176" />
        </branch>
        <bustap x2="976" y1="1872" y2="1872" x1="880" />
        <branch name="B(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1176" y="1872" type="branch" />
            <wire x2="1176" y1="1872" y2="1872" x1="976" />
            <wire x2="1376" y1="1872" y2="1872" x1="1176" />
        </branch>
        <bustap x2="976" y1="1520" y2="1520" x1="880" />
        <branch name="B(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1176" y="1520" type="branch" />
            <wire x2="1176" y1="1520" y2="1520" x1="976" />
            <wire x2="1376" y1="1520" y2="1520" x1="1176" />
        </branch>
        <bustap x2="976" y1="1168" y2="1168" x1="880" />
        <branch name="B(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1176" y="1168" type="branch" />
            <wire x2="1176" y1="1168" y2="1168" x1="976" />
            <wire x2="1376" y1="1168" y2="1168" x1="1176" />
        </branch>
        <iomarker fontsize="28" x="592" y="1152" name="B(3:0)" orien="R180" />
        <branch name="Ctrl">
            <wire x2="1040" y1="1232" y2="1232" x1="592" />
            <wire x2="1376" y1="1232" y2="1232" x1="1040" />
            <wire x2="1040" y1="1232" y2="1296" x1="1040" />
            <wire x2="1376" y1="1296" y2="1296" x1="1040" />
            <wire x2="1040" y1="1296" y2="1584" x1="1040" />
            <wire x2="1376" y1="1584" y2="1584" x1="1040" />
            <wire x2="1040" y1="1584" y2="1936" x1="1040" />
            <wire x2="1376" y1="1936" y2="1936" x1="1040" />
            <wire x2="1040" y1="1936" y2="2288" x1="1040" />
            <wire x2="1376" y1="2288" y2="2288" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="592" y="1232" name="Ctrl" orien="R180" />
        <branch name="XLXN_16">
            <wire x2="1312" y1="1360" y2="1648" x1="1312" />
            <wire x2="1376" y1="1648" y2="1648" x1="1312" />
            <wire x2="1840" y1="1360" y2="1360" x1="1312" />
            <wire x2="1840" y1="1296" y2="1296" x1="1760" />
            <wire x2="1840" y1="1296" y2="1360" x1="1840" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="1312" y1="1712" y2="2000" x1="1312" />
            <wire x2="1376" y1="2000" y2="2000" x1="1312" />
            <wire x2="1840" y1="1712" y2="1712" x1="1312" />
            <wire x2="1840" y1="1648" y2="1648" x1="1760" />
            <wire x2="1840" y1="1648" y2="1712" x1="1840" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="1840" y1="2080" y2="2080" x1="1312" />
            <wire x2="1312" y1="2080" y2="2352" x1="1312" />
            <wire x2="1376" y1="2352" y2="2352" x1="1312" />
            <wire x2="1840" y1="2000" y2="2000" x1="1760" />
            <wire x2="1840" y1="2000" y2="2080" x1="1840" />
        </branch>
        <branch name="S(3:0)">
            <wire x2="1952" y1="1104" y2="1456" x1="1952" />
            <wire x2="1952" y1="1456" y2="1808" x1="1952" />
            <wire x2="1952" y1="1808" y2="2160" x1="1952" />
            <wire x2="1952" y1="2160" y2="2176" x1="1952" />
            <wire x2="2144" y1="2176" y2="2176" x1="1952" />
        </branch>
        <bustap x2="1856" y1="2160" y2="2160" x1="1952" />
        <branch name="S(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1808" y="2160" type="branch" />
            <wire x2="1808" y1="2160" y2="2160" x1="1760" />
            <wire x2="1856" y1="2160" y2="2160" x1="1808" />
        </branch>
        <bustap x2="1856" y1="1808" y2="1808" x1="1952" />
        <branch name="S(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1808" y="1808" type="branch" />
            <wire x2="1808" y1="1808" y2="1808" x1="1760" />
            <wire x2="1856" y1="1808" y2="1808" x1="1808" />
        </branch>
        <bustap x2="1856" y1="1456" y2="1456" x1="1952" />
        <branch name="S(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1808" y="1456" type="branch" />
            <wire x2="1808" y1="1456" y2="1456" x1="1760" />
            <wire x2="1856" y1="1456" y2="1456" x1="1808" />
        </branch>
        <bustap x2="1856" y1="1104" y2="1104" x1="1952" />
        <branch name="S(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1808" y="1104" type="branch" />
            <wire x2="1808" y1="1104" y2="1104" x1="1760" />
            <wire x2="1856" y1="1104" y2="1104" x1="1808" />
        </branch>
        <iomarker fontsize="28" x="2144" y="2176" name="S(3:0)" orien="R0" />
        <branch name="Cout">
            <wire x2="2144" y1="2352" y2="2352" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="2144" y="2352" name="Cout" orien="R0" />
    </sheet>
</drawing>