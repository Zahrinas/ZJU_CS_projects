<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="SW(7:0)" />
        <signal name="SW(7)" />
        <signal name="SW(6)" />
        <signal name="SW(5)" />
        <signal name="SW(4)" />
        <signal name="SW(3)" />
        <signal name="SW(2)" />
        <signal name="SW(1)" />
        <signal name="SW(0)" />
        <signal name="AN(3:0)" />
        <signal name="AN(3)" />
        <signal name="AN(2)" />
        <signal name="AN(1)" />
        <signal name="AN(0)" />
        <signal name="BTN(1:0)" />
        <signal name="BTN(1)" />
        <signal name="BTN(0)" />
        <signal name="SEGMENT(7:0)" />
        <signal name="SEGMENT(7)" />
        <signal name="SEGMENT(6)" />
        <signal name="SEGMENT(5)" />
        <signal name="SEGMENT(4)" />
        <signal name="SEGMENT(3)" />
        <signal name="SEGMENT(2)" />
        <signal name="SEGMENT(1)" />
        <signal name="SEGMENT(0)" />
        <port polarity="Input" name="SW(7:0)" />
        <port polarity="Output" name="AN(3:0)" />
        <port polarity="Input" name="BTN(1:0)" />
        <port polarity="Output" name="SEGMENT(7:0)" />
        <blockdef name="MyMC14495">
            <timestamp>2021-10-25T9:11:52</timestamp>
            <rect width="256" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="inv4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="160" y1="-96" y2="-96" x1="224" />
            <line x2="160" y1="-160" y2="-160" x1="224" />
            <line x2="160" y1="-224" y2="-224" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-96" y2="-96" x1="0" />
            <line x2="64" y1="-160" y2="-160" x1="0" />
            <line x2="64" y1="-224" y2="-224" x1="0" />
            <line x2="128" y1="-256" y2="-224" x1="64" />
            <line x2="64" y1="-224" y2="-192" x1="128" />
            <line x2="64" y1="-192" y2="-256" x1="64" />
            <circle r="16" cx="144" cy="-32" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="128" y1="-128" y2="-96" x1="64" />
            <line x2="64" y1="-96" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="-128" x1="64" />
            <circle r="16" cx="144" cy="-96" />
            <line x2="128" y1="-192" y2="-160" x1="64" />
            <line x2="64" y1="-160" y2="-128" x1="128" />
            <line x2="64" y1="-128" y2="-192" x1="64" />
            <circle r="16" cx="144" cy="-160" />
            <circle r="16" cx="144" cy="-224" />
        </blockdef>
        <block symbolname="MyMC14495" name="XLXI_2">
            <blockpin signalname="SW(2)" name="D2" />
            <blockpin signalname="SW(3)" name="D3" />
            <blockpin signalname="SW(0)" name="D0" />
            <blockpin signalname="SW(1)" name="D1" />
            <blockpin signalname="BTN(1)" name="point" />
            <blockpin signalname="BTN(0)" name="LE" />
            <blockpin signalname="SEGMENT(6)" name="g" />
            <blockpin signalname="SEGMENT(5)" name="f" />
            <blockpin signalname="SEGMENT(4)" name="e" />
            <blockpin signalname="SEGMENT(3)" name="d" />
            <blockpin signalname="SEGMENT(2)" name="c" />
            <blockpin signalname="SEGMENT(1)" name="b" />
            <blockpin signalname="SEGMENT(0)" name="a" />
            <blockpin signalname="SEGMENT(7)" name="p" />
        </block>
        <block symbolname="inv4" name="XLXI_3">
            <blockpin signalname="SW(4)" name="I0" />
            <blockpin signalname="SW(5)" name="I1" />
            <blockpin signalname="SW(6)" name="I2" />
            <blockpin signalname="SW(7)" name="I3" />
            <blockpin signalname="AN(0)" name="O0" />
            <blockpin signalname="AN(1)" name="O1" />
            <blockpin signalname="AN(2)" name="O2" />
            <blockpin signalname="AN(3)" name="O3" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1392" y="1360" name="XLXI_2" orien="R0">
        </instance>
        <branch name="SW(7:0)">
            <wire x2="896" y1="1760" y2="1760" x1="624" />
            <wire x2="896" y1="1760" y2="1824" x1="896" />
            <wire x2="896" y1="1824" y2="1920" x1="896" />
            <wire x2="896" y1="848" y2="880" x1="896" />
            <wire x2="896" y1="880" y2="960" x1="896" />
            <wire x2="896" y1="960" y2="1040" x1="896" />
            <wire x2="896" y1="1040" y2="1120" x1="896" />
            <wire x2="896" y1="1120" y2="1632" x1="896" />
            <wire x2="896" y1="1632" y2="1696" x1="896" />
            <wire x2="896" y1="1696" y2="1760" x1="896" />
        </branch>
        <iomarker fontsize="28" x="624" y="1760" name="SW(7:0)" orien="R180" />
        <instance x="1280" y="1856" name="XLXI_3" orien="R0" />
        <bustap x2="992" y1="1632" y2="1632" x1="896" />
        <branch name="SW(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1136" y="1632" type="branch" />
            <wire x2="1136" y1="1632" y2="1632" x1="992" />
            <wire x2="1280" y1="1632" y2="1632" x1="1136" />
        </branch>
        <bustap x2="992" y1="1696" y2="1696" x1="896" />
        <branch name="SW(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1136" y="1696" type="branch" />
            <wire x2="1136" y1="1696" y2="1696" x1="992" />
            <wire x2="1280" y1="1696" y2="1696" x1="1136" />
        </branch>
        <bustap x2="992" y1="1760" y2="1760" x1="896" />
        <branch name="SW(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1136" y="1760" type="branch" />
            <wire x2="1136" y1="1760" y2="1760" x1="992" />
            <wire x2="1280" y1="1760" y2="1760" x1="1136" />
        </branch>
        <bustap x2="992" y1="1824" y2="1824" x1="896" />
        <branch name="SW(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1136" y="1824" type="branch" />
            <wire x2="1136" y1="1824" y2="1824" x1="992" />
            <wire x2="1280" y1="1824" y2="1824" x1="1136" />
        </branch>
        <bustap x2="992" y1="960" y2="960" x1="896" />
        <branch name="SW(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1192" y="960" type="branch" />
            <wire x2="1192" y1="960" y2="960" x1="992" />
            <wire x2="1392" y1="960" y2="960" x1="1192" />
        </branch>
        <bustap x2="992" y1="880" y2="880" x1="896" />
        <branch name="SW(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1192" y="880" type="branch" />
            <wire x2="1192" y1="880" y2="880" x1="992" />
            <wire x2="1392" y1="880" y2="880" x1="1192" />
        </branch>
        <bustap x2="992" y1="1120" y2="1120" x1="896" />
        <branch name="SW(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1192" y="1120" type="branch" />
            <wire x2="1192" y1="1120" y2="1120" x1="992" />
            <wire x2="1392" y1="1120" y2="1120" x1="1192" />
        </branch>
        <bustap x2="992" y1="1040" y2="1040" x1="896" />
        <branch name="SW(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1192" y="1040" type="branch" />
            <wire x2="1192" y1="1040" y2="1040" x1="992" />
            <wire x2="1392" y1="1040" y2="1040" x1="1192" />
        </branch>
        <branch name="AN(3:0)">
            <wire x2="1696" y1="1552" y2="1632" x1="1696" />
            <wire x2="1696" y1="1632" y2="1696" x1="1696" />
            <wire x2="1696" y1="1696" y2="1760" x1="1696" />
            <wire x2="1696" y1="1760" y2="1824" x1="1696" />
            <wire x2="1696" y1="1824" y2="1920" x1="1696" />
            <wire x2="1920" y1="1920" y2="1920" x1="1696" />
        </branch>
        <iomarker fontsize="28" x="1920" y="1920" name="AN(3:0)" orien="R0" />
        <bustap x2="1600" y1="1632" y2="1632" x1="1696" />
        <branch name="AN(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1552" y="1632" type="branch" />
            <wire x2="1552" y1="1632" y2="1632" x1="1504" />
            <wire x2="1600" y1="1632" y2="1632" x1="1552" />
        </branch>
        <bustap x2="1600" y1="1696" y2="1696" x1="1696" />
        <branch name="AN(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1552" y="1696" type="branch" />
            <wire x2="1552" y1="1696" y2="1696" x1="1504" />
            <wire x2="1600" y1="1696" y2="1696" x1="1552" />
        </branch>
        <bustap x2="1600" y1="1760" y2="1760" x1="1696" />
        <branch name="AN(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1552" y="1760" type="branch" />
            <wire x2="1552" y1="1760" y2="1760" x1="1504" />
            <wire x2="1600" y1="1760" y2="1760" x1="1552" />
        </branch>
        <bustap x2="1600" y1="1824" y2="1824" x1="1696" />
        <branch name="AN(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1552" y="1824" type="branch" />
            <wire x2="1552" y1="1824" y2="1824" x1="1504" />
            <wire x2="1600" y1="1824" y2="1824" x1="1552" />
        </branch>
        <branch name="BTN(1:0)">
            <wire x2="1200" y1="1328" y2="1328" x1="1104" />
            <wire x2="1200" y1="1152" y2="1200" x1="1200" />
            <wire x2="1200" y1="1200" y2="1280" x1="1200" />
            <wire x2="1200" y1="1280" y2="1328" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1104" y="1328" name="BTN(1:0)" orien="R180" />
        <bustap x2="1296" y1="1200" y2="1200" x1="1200" />
        <branch name="BTN(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1344" y="1200" type="branch" />
            <wire x2="1344" y1="1200" y2="1200" x1="1296" />
            <wire x2="1392" y1="1200" y2="1200" x1="1344" />
        </branch>
        <bustap x2="1296" y1="1280" y2="1280" x1="1200" />
        <branch name="BTN(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1344" y="1280" type="branch" />
            <wire x2="1344" y1="1280" y2="1280" x1="1296" />
            <wire x2="1392" y1="1280" y2="1280" x1="1344" />
        </branch>
        <branch name="SEGMENT(7:0)">
            <wire x2="1968" y1="848" y2="880" x1="1968" />
            <wire x2="1968" y1="880" y2="944" x1="1968" />
            <wire x2="1968" y1="944" y2="1008" x1="1968" />
            <wire x2="1968" y1="1008" y2="1072" x1="1968" />
            <wire x2="1968" y1="1072" y2="1136" x1="1968" />
            <wire x2="1968" y1="1136" y2="1200" x1="1968" />
            <wire x2="1968" y1="1200" y2="1264" x1="1968" />
            <wire x2="1968" y1="1264" y2="1328" x1="1968" />
            <wire x2="1968" y1="1328" y2="1360" x1="1968" />
            <wire x2="2176" y1="1360" y2="1360" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="2176" y="1360" name="SEGMENT(7:0)" orien="R0" />
        <bustap x2="1872" y1="1328" y2="1328" x1="1968" />
        <branch name="SEGMENT(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1824" y="1328" type="branch" />
            <wire x2="1824" y1="1328" y2="1328" x1="1776" />
            <wire x2="1872" y1="1328" y2="1328" x1="1824" />
        </branch>
        <bustap x2="1872" y1="880" y2="880" x1="1968" />
        <branch name="SEGMENT(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1824" y="880" type="branch" />
            <wire x2="1824" y1="880" y2="880" x1="1776" />
            <wire x2="1872" y1="880" y2="880" x1="1824" />
        </branch>
        <bustap x2="1872" y1="944" y2="944" x1="1968" />
        <branch name="SEGMENT(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1824" y="944" type="branch" />
            <wire x2="1824" y1="944" y2="944" x1="1776" />
            <wire x2="1872" y1="944" y2="944" x1="1824" />
        </branch>
        <bustap x2="1872" y1="1008" y2="1008" x1="1968" />
        <branch name="SEGMENT(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1824" y="1008" type="branch" />
            <wire x2="1824" y1="1008" y2="1008" x1="1776" />
            <wire x2="1872" y1="1008" y2="1008" x1="1824" />
        </branch>
        <bustap x2="1872" y1="1072" y2="1072" x1="1968" />
        <branch name="SEGMENT(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1824" y="1072" type="branch" />
            <wire x2="1824" y1="1072" y2="1072" x1="1776" />
            <wire x2="1872" y1="1072" y2="1072" x1="1824" />
        </branch>
        <bustap x2="1872" y1="1136" y2="1136" x1="1968" />
        <branch name="SEGMENT(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1824" y="1136" type="branch" />
            <wire x2="1824" y1="1136" y2="1136" x1="1776" />
            <wire x2="1872" y1="1136" y2="1136" x1="1824" />
        </branch>
        <bustap x2="1872" y1="1200" y2="1200" x1="1968" />
        <branch name="SEGMENT(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1824" y="1200" type="branch" />
            <wire x2="1824" y1="1200" y2="1200" x1="1776" />
            <wire x2="1872" y1="1200" y2="1200" x1="1824" />
        </branch>
        <bustap x2="1872" y1="1264" y2="1264" x1="1968" />
        <branch name="SEGMENT(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1824" y="1264" type="branch" />
            <wire x2="1824" y1="1264" y2="1264" x1="1776" />
            <wire x2="1872" y1="1264" y2="1264" x1="1824" />
        </branch>
    </sheet>
</drawing>