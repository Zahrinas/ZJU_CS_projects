<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Hexs(15:0)" />
        <signal name="Hexs(3:0)" />
        <signal name="Hexs(7:4)" />
        <signal name="Hexs(11:8)" />
        <signal name="Hexs(15:12)" />
        <signal name="XLXN_6" />
        <signal name="point(3:0)" />
        <signal name="point(3)" />
        <signal name="point(2)" />
        <signal name="point(1)" />
        <signal name="point(0)" />
        <signal name="LES(3:0)" />
        <signal name="LES(3)" />
        <signal name="LES(2)" />
        <signal name="LES(1)" />
        <signal name="LES(0)" />
        <signal name="Scan(1:0)" />
        <signal name="Scan(1)" />
        <signal name="Scan(0)" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="HEX(3:0)" />
        <signal name="AN(3:0)" />
        <signal name="AN(3)" />
        <signal name="AN(2)" />
        <signal name="AN(1)" />
        <signal name="AN(0)" />
        <signal name="p" />
        <signal name="LE" />
        <port polarity="Input" name="Hexs(15:0)" />
        <port polarity="Input" name="point(3:0)" />
        <port polarity="Input" name="LES(3:0)" />
        <port polarity="Input" name="Scan(1:0)" />
        <port polarity="Output" name="HEX(3:0)" />
        <port polarity="Output" name="AN(3:0)" />
        <port polarity="Output" name="p" />
        <port polarity="Output" name="LE" />
        <blockdef name="Mux4to1b4">
            <timestamp>2021-11-13T6:21:43</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="m4_1e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-416" y2="-416" x1="0" />
            <line x2="96" y1="-352" y2="-352" x1="0" />
            <line x2="96" y1="-288" y2="-288" x1="0" />
            <line x2="96" y1="-224" y2="-224" x1="0" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-320" y2="-320" x1="320" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-96" y2="-96" x1="176" />
            <line x2="176" y1="-208" y2="-96" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="224" />
            <line x2="224" y1="-216" y2="-32" x1="224" />
            <line x2="96" y1="-224" y2="-192" x1="256" />
            <line x2="256" y1="-416" y2="-224" x1="256" />
            <line x2="256" y1="-448" y2="-416" x1="96" />
            <line x2="96" y1="-192" y2="-448" x1="96" />
            <line x2="96" y1="-160" y2="-160" x1="128" />
            <line x2="128" y1="-200" y2="-160" x1="128" />
        </blockdef>
        <blockdef name="d2_4e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <block symbolname="m4_1e" name="XLXI_2">
            <blockpin signalname="point(0)" name="D0" />
            <blockpin signalname="point(1)" name="D1" />
            <blockpin signalname="point(2)" name="D2" />
            <blockpin signalname="point(3)" name="D3" />
            <blockpin signalname="XLXN_6" name="E" />
            <blockpin signalname="Scan(0)" name="S0" />
            <blockpin signalname="Scan(1)" name="S1" />
            <blockpin signalname="p" name="O" />
        </block>
        <block symbolname="d2_4e" name="XLXI_3">
            <blockpin signalname="Scan(0)" name="A0" />
            <blockpin signalname="Scan(1)" name="A1" />
            <blockpin signalname="XLXN_6" name="E" />
            <blockpin signalname="XLXN_30" name="D0" />
            <blockpin signalname="XLXN_29" name="D1" />
            <blockpin signalname="XLXN_28" name="D2" />
            <blockpin signalname="XLXN_27" name="D3" />
        </block>
        <block symbolname="m4_1e" name="XLXI_4">
            <blockpin signalname="LES(0)" name="D0" />
            <blockpin signalname="LES(1)" name="D1" />
            <blockpin signalname="LES(2)" name="D2" />
            <blockpin signalname="LES(3)" name="D3" />
            <blockpin signalname="XLXN_6" name="E" />
            <blockpin signalname="Scan(0)" name="S0" />
            <blockpin signalname="Scan(1)" name="S1" />
            <blockpin signalname="LE" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_5">
            <blockpin signalname="XLXN_6" name="P" />
        </block>
        <block symbolname="inv4" name="XLXI_6">
            <blockpin signalname="XLXN_27" name="I0" />
            <blockpin signalname="XLXN_28" name="I1" />
            <blockpin signalname="XLXN_29" name="I2" />
            <blockpin signalname="XLXN_30" name="I3" />
            <blockpin signalname="AN(3)" name="O0" />
            <blockpin signalname="AN(2)" name="O1" />
            <blockpin signalname="AN(1)" name="O2" />
            <blockpin signalname="AN(0)" name="O3" />
        </block>
        <block symbolname="Mux4to1b4" name="XLXI_7">
            <blockpin signalname="Scan(1:0)" name="s(1:0)" />
            <blockpin signalname="Hexs(3:0)" name="I0(3:0)" />
            <blockpin signalname="Hexs(11:8)" name="I2(3:0)" />
            <blockpin signalname="Hexs(15:12)" name="I3(3:0)" />
            <blockpin signalname="Hexs(7:4)" name="I1(3:0)" />
            <blockpin signalname="HEX(3:0)" name="o(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="Hexs(15:0)">
            <wire x2="752" y1="624" y2="624" x1="672" />
            <wire x2="752" y1="432" y2="496" x1="752" />
            <wire x2="752" y1="496" y2="560" x1="752" />
            <wire x2="752" y1="560" y2="624" x1="752" />
        </branch>
        <iomarker fontsize="28" x="672" y="624" name="Hexs(15:0)" orien="R180" />
        <bustap x2="848" y1="432" y2="432" x1="752" />
        <branch name="Hexs(3:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="984" y="432" type="branch" />
            <wire x2="992" y1="432" y2="432" x1="848" />
            <wire x2="1120" y1="432" y2="432" x1="992" />
        </branch>
        <bustap x2="848" y1="624" y2="624" x1="752" />
        <branch name="Hexs(7:4)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="984" y="624" type="branch" />
            <wire x2="992" y1="624" y2="624" x1="848" />
            <wire x2="1120" y1="624" y2="624" x1="992" />
        </branch>
        <bustap x2="848" y1="496" y2="496" x1="752" />
        <branch name="Hexs(11:8)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="984" y="496" type="branch" />
            <wire x2="992" y1="496" y2="496" x1="848" />
            <wire x2="1120" y1="496" y2="496" x1="992" />
        </branch>
        <bustap x2="848" y1="560" y2="560" x1="752" />
        <branch name="Hexs(15:12)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="984" y="560" type="branch" />
            <wire x2="992" y1="560" y2="560" x1="848" />
            <wire x2="1120" y1="560" y2="560" x1="992" />
        </branch>
        <instance x="1056" y="1216" name="XLXI_2" orien="R0" />
        <instance x="1040" y="1872" name="XLXI_4" orien="R0" />
        <instance x="960" y="768" name="XLXI_5" orien="R0" />
        <branch name="XLXN_6">
            <wire x2="1024" y1="768" y2="1184" x1="1024" />
            <wire x2="1024" y1="1184" y2="1840" x1="1024" />
            <wire x2="1040" y1="1840" y2="1840" x1="1024" />
            <wire x2="1024" y1="1840" y2="2432" x1="1024" />
            <wire x2="1056" y1="2432" y2="2432" x1="1024" />
            <wire x2="1056" y1="1184" y2="1184" x1="1024" />
        </branch>
        <instance x="1056" y="2560" name="XLXI_3" orien="R0" />
        <branch name="point(3:0)">
            <wire x2="752" y1="992" y2="992" x1="688" />
            <wire x2="752" y1="800" y2="864" x1="752" />
            <wire x2="752" y1="864" y2="928" x1="752" />
            <wire x2="752" y1="928" y2="992" x1="752" />
        </branch>
        <iomarker fontsize="28" x="688" y="992" name="point(3:0)" orien="R180" />
        <bustap x2="848" y1="992" y2="992" x1="752" />
        <branch name="point(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="952" y="992" type="branch" />
            <wire x2="960" y1="992" y2="992" x1="848" />
            <wire x2="1056" y1="992" y2="992" x1="960" />
        </branch>
        <bustap x2="848" y1="928" y2="928" x1="752" />
        <branch name="point(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="952" y="928" type="branch" />
            <wire x2="960" y1="928" y2="928" x1="848" />
            <wire x2="1056" y1="928" y2="928" x1="960" />
        </branch>
        <bustap x2="848" y1="864" y2="864" x1="752" />
        <branch name="point(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="952" y="864" type="branch" />
            <wire x2="960" y1="864" y2="864" x1="848" />
            <wire x2="1056" y1="864" y2="864" x1="960" />
        </branch>
        <bustap x2="848" y1="800" y2="800" x1="752" />
        <branch name="point(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="952" y="800" type="branch" />
            <wire x2="960" y1="800" y2="800" x1="848" />
            <wire x2="1056" y1="800" y2="800" x1="960" />
        </branch>
        <branch name="LES(3:0)">
            <wire x2="752" y1="1648" y2="1648" x1="688" />
            <wire x2="752" y1="1456" y2="1520" x1="752" />
            <wire x2="752" y1="1520" y2="1584" x1="752" />
            <wire x2="752" y1="1584" y2="1648" x1="752" />
        </branch>
        <iomarker fontsize="28" x="688" y="1648" name="LES(3:0)" orien="R180" />
        <bustap x2="848" y1="1648" y2="1648" x1="752" />
        <branch name="LES(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1648" type="branch" />
            <wire x2="944" y1="1648" y2="1648" x1="848" />
            <wire x2="1040" y1="1648" y2="1648" x1="944" />
        </branch>
        <bustap x2="848" y1="1584" y2="1584" x1="752" />
        <branch name="LES(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1584" type="branch" />
            <wire x2="944" y1="1584" y2="1584" x1="848" />
            <wire x2="1040" y1="1584" y2="1584" x1="944" />
        </branch>
        <bustap x2="848" y1="1520" y2="1520" x1="752" />
        <branch name="LES(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1520" type="branch" />
            <wire x2="944" y1="1520" y2="1520" x1="848" />
            <wire x2="1040" y1="1520" y2="1520" x1="944" />
        </branch>
        <bustap x2="848" y1="1456" y2="1456" x1="752" />
        <branch name="LES(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1456" type="branch" />
            <wire x2="944" y1="1456" y2="1456" x1="848" />
            <wire x2="1040" y1="1456" y2="1456" x1="944" />
        </branch>
        <branch name="Scan(1:0)">
            <wire x2="880" y1="288" y2="288" x1="656" />
            <wire x2="880" y1="288" y2="368" x1="880" />
            <wire x2="1120" y1="368" y2="368" x1="880" />
            <wire x2="880" y1="368" y2="1056" x1="880" />
            <wire x2="880" y1="1056" y2="1120" x1="880" />
            <wire x2="880" y1="1120" y2="1712" x1="880" />
            <wire x2="880" y1="1712" y2="1776" x1="880" />
            <wire x2="880" y1="1776" y2="2240" x1="880" />
            <wire x2="880" y1="2240" y2="2304" x1="880" />
        </branch>
        <iomarker fontsize="28" x="656" y="288" name="Scan(1:0)" orien="R180" />
        <bustap x2="976" y1="1120" y2="1120" x1="880" />
        <branch name="Scan(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1016" y="1120" type="branch" />
            <wire x2="1024" y1="1120" y2="1120" x1="976" />
            <wire x2="1056" y1="1120" y2="1120" x1="1024" />
        </branch>
        <bustap x2="976" y1="1056" y2="1056" x1="880" />
        <branch name="Scan(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1016" y="1056" type="branch" />
            <wire x2="1024" y1="1056" y2="1056" x1="976" />
            <wire x2="1056" y1="1056" y2="1056" x1="1024" />
        </branch>
        <bustap x2="976" y1="1776" y2="1776" x1="880" />
        <branch name="Scan(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1008" y="1776" type="branch" />
            <wire x2="1008" y1="1776" y2="1776" x1="976" />
            <wire x2="1040" y1="1776" y2="1776" x1="1008" />
        </branch>
        <bustap x2="976" y1="1712" y2="1712" x1="880" />
        <branch name="Scan(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1008" y="1712" type="branch" />
            <wire x2="1008" y1="1712" y2="1712" x1="976" />
            <wire x2="1040" y1="1712" y2="1712" x1="1008" />
        </branch>
        <bustap x2="976" y1="2304" y2="2304" x1="880" />
        <branch name="Scan(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1016" y="2304" type="branch" />
            <wire x2="1024" y1="2304" y2="2304" x1="976" />
            <wire x2="1056" y1="2304" y2="2304" x1="1024" />
        </branch>
        <bustap x2="976" y1="2240" y2="2240" x1="880" />
        <branch name="Scan(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1016" y="2240" type="branch" />
            <wire x2="1024" y1="2240" y2="2240" x1="976" />
            <wire x2="1056" y1="2240" y2="2240" x1="1024" />
        </branch>
        <branch name="XLXN_27">
            <wire x2="1472" y1="2432" y2="2432" x1="1440" />
        </branch>
        <branch name="XLXN_28">
            <wire x2="1472" y1="2368" y2="2368" x1="1440" />
        </branch>
        <branch name="XLXN_29">
            <wire x2="1472" y1="2304" y2="2304" x1="1440" />
        </branch>
        <branch name="XLXN_30">
            <wire x2="1472" y1="2240" y2="2240" x1="1440" />
        </branch>
        <instance x="1472" y="2464" name="XLXI_6" orien="R0" />
        <branch name="HEX(3:0)">
            <wire x2="1536" y1="368" y2="368" x1="1504" />
        </branch>
        <iomarker fontsize="28" x="1536" y="368" name="HEX(3:0)" orien="R0" />
        <iomarker fontsize="28" x="2048" y="2480" name="AN(3:0)" orien="R0" />
        <branch name="AN(3:0)">
            <wire x2="1952" y1="2240" y2="2304" x1="1952" />
            <wire x2="1952" y1="2304" y2="2368" x1="1952" />
            <wire x2="1952" y1="2368" y2="2432" x1="1952" />
            <wire x2="1952" y1="2432" y2="2480" x1="1952" />
            <wire x2="2048" y1="2480" y2="2480" x1="1952" />
        </branch>
        <bustap x2="1856" y1="2432" y2="2432" x1="1952" />
        <branch name="AN(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="2432" type="branch" />
            <wire x2="1776" y1="2432" y2="2432" x1="1696" />
            <wire x2="1856" y1="2432" y2="2432" x1="1776" />
        </branch>
        <bustap x2="1856" y1="2368" y2="2368" x1="1952" />
        <branch name="AN(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="2368" type="branch" />
            <wire x2="1776" y1="2368" y2="2368" x1="1696" />
            <wire x2="1856" y1="2368" y2="2368" x1="1776" />
        </branch>
        <bustap x2="1856" y1="2304" y2="2304" x1="1952" />
        <branch name="AN(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="2304" type="branch" />
            <wire x2="1776" y1="2304" y2="2304" x1="1696" />
            <wire x2="1856" y1="2304" y2="2304" x1="1776" />
        </branch>
        <bustap x2="1856" y1="2240" y2="2240" x1="1952" />
        <branch name="AN(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="2240" type="branch" />
            <wire x2="1776" y1="2240" y2="2240" x1="1696" />
            <wire x2="1856" y1="2240" y2="2240" x1="1776" />
        </branch>
        <branch name="p">
            <wire x2="1408" y1="896" y2="896" x1="1376" />
        </branch>
        <iomarker fontsize="28" x="1408" y="896" name="p" orien="R0" />
        <branch name="LE">
            <wire x2="1392" y1="1552" y2="1552" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="1392" y="1552" name="LE" orien="R0" />
        <instance x="1120" y="656" name="XLXI_7" orien="R0">
        </instance>
    </sheet>
</drawing>