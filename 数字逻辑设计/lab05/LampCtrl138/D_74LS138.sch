<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A" />
        <signal name="B" />
        <signal name="G" />
        <signal name="XLXN_4" />
        <signal name="G2A" />
        <signal name="G2B" />
        <signal name="C" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_34" />
        <signal name="XLXN_35" />
        <signal name="XLXN_36" />
        <signal name="XLXN_37" />
        <signal name="XLXN_38" />
        <signal name="XLXN_39" />
        <signal name="XLXN_40" />
        <signal name="XLXN_41" />
        <signal name="XLXN_43" />
        <signal name="XLXN_44" />
        <signal name="XLXN_45" />
        <signal name="XLXN_46" />
        <signal name="Y(7:0)" />
        <signal name="Y(7)" />
        <signal name="Y(6)" />
        <signal name="Y(5)" />
        <signal name="Y(4)" />
        <signal name="Y(3)" />
        <signal name="Y(2)" />
        <signal name="Y(1)" />
        <signal name="Y(0)" />
        <signal name="XLXN_71" />
        <signal name="XLXN_72" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="G" />
        <port polarity="Input" name="G2A" />
        <port polarity="Input" name="G2B" />
        <port polarity="Input" name="C" />
        <port polarity="Output" name="Y(7:0)" />
        <blockdef name="nand3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="216" y1="-128" y2="-128" x1="256" />
            <circle r="12" cx="204" cy="-128" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="nor3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="216" y1="-128" y2="-128" x1="256" />
            <circle r="12" cx="204" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
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
        <block symbolname="nand3" name="XLXI_1">
            <blockpin signalname="XLXN_46" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="XLXN_29" name="I2" />
            <blockpin signalname="Y(7)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_2">
            <blockpin signalname="XLXN_46" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="XLXN_31" name="I2" />
            <blockpin signalname="Y(6)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_3">
            <blockpin signalname="XLXN_46" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="XLXN_33" name="I2" />
            <blockpin signalname="Y(5)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_4">
            <blockpin signalname="XLXN_46" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="XLXN_35" name="I2" />
            <blockpin signalname="Y(4)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_5">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="XLXN_29" name="I2" />
            <blockpin signalname="Y(3)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_6">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="XLXN_31" name="I2" />
            <blockpin signalname="Y(2)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_7">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="XLXN_33" name="I2" />
            <blockpin signalname="Y(1)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_8">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="XLXN_35" name="I2" />
            <blockpin signalname="Y(0)" name="O" />
        </block>
        <block symbolname="nor3" name="XLXI_9">
            <blockpin signalname="G2B" name="I0" />
            <blockpin signalname="G2A" name="I1" />
            <blockpin signalname="XLXN_4" name="I2" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_10">
            <blockpin signalname="G" name="I" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_11">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="XLXN_20" name="I1" />
            <blockpin signalname="XLXN_33" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_12">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_35" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_13">
            <blockpin signalname="XLXN_25" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_31" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_14">
            <blockpin signalname="XLXN_25" name="I0" />
            <blockpin signalname="XLXN_20" name="I1" />
            <blockpin signalname="XLXN_29" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_15">
            <blockpin signalname="C" name="I" />
            <blockpin signalname="XLXN_46" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_16">
            <blockpin signalname="A" name="I" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_17">
            <blockpin signalname="B" name="I" />
            <blockpin signalname="XLXN_25" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1680" y="544" name="XLXI_1" orien="R0" />
        <instance x="1680" y="784" name="XLXI_2" orien="R0" />
        <instance x="1680" y="1008" name="XLXI_3" orien="R0" />
        <instance x="1680" y="1216" name="XLXI_4" orien="R0" />
        <instance x="1680" y="1440" name="XLXI_5" orien="R0" />
        <instance x="1680" y="1664" name="XLXI_6" orien="R0" />
        <instance x="1680" y="1920" name="XLXI_7" orien="R0" />
        <instance x="1680" y="2128" name="XLXI_8" orien="R0" />
        <instance x="816" y="2128" name="XLXI_9" orien="R0" />
        <instance x="272" y="1968" name="XLXI_10" orien="R0" />
        <instance x="800" y="976" name="XLXI_11" orien="R0" />
        <instance x="800" y="1184" name="XLXI_12" orien="R0" />
        <instance x="800" y="736" name="XLXI_13" orien="R0" />
        <instance x="800" y="512" name="XLXI_14" orien="R0" />
        <instance x="800" y="1328" name="XLXI_15" orien="R0" />
        <instance x="336" y="544" name="XLXI_16" orien="R0" />
        <instance x="336" y="800" name="XLXI_17" orien="R0" />
        <branch name="A">
            <wire x2="224" y1="512" y2="512" x1="80" />
            <wire x2="320" y1="512" y2="512" x1="224" />
            <wire x2="336" y1="512" y2="512" x1="320" />
            <wire x2="224" y1="512" y2="608" x1="224" />
            <wire x2="720" y1="608" y2="608" x1="224" />
            <wire x2="800" y1="608" y2="608" x1="720" />
            <wire x2="720" y1="608" y2="1056" x1="720" />
            <wire x2="800" y1="1056" y2="1056" x1="720" />
        </branch>
        <branch name="B">
            <wire x2="256" y1="768" y2="768" x1="80" />
            <wire x2="320" y1="768" y2="768" x1="256" />
            <wire x2="336" y1="768" y2="768" x1="320" />
            <wire x2="256" y1="768" y2="912" x1="256" />
            <wire x2="800" y1="912" y2="912" x1="256" />
            <wire x2="256" y1="912" y2="1120" x1="256" />
            <wire x2="800" y1="1120" y2="1120" x1="256" />
        </branch>
        <branch name="G">
            <wire x2="272" y1="1936" y2="1936" x1="96" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="816" y1="1936" y2="1936" x1="496" />
        </branch>
        <branch name="G2A">
            <wire x2="816" y1="2000" y2="2000" x1="208" />
        </branch>
        <branch name="G2B">
            <wire x2="816" y1="2064" y2="2064" x1="208" />
        </branch>
        <iomarker fontsize="28" x="208" y="2064" name="G2B" orien="R180" />
        <iomarker fontsize="28" x="208" y="2000" name="G2A" orien="R180" />
        <iomarker fontsize="28" x="96" y="1936" name="G" orien="R180" />
        <branch name="C">
            <wire x2="688" y1="1408" y2="1408" x1="80" />
            <wire x2="1472" y1="1408" y2="1408" x1="688" />
            <wire x2="1680" y1="1408" y2="1408" x1="1472" />
            <wire x2="1472" y1="1408" y2="1600" x1="1472" />
            <wire x2="1680" y1="1600" y2="1600" x1="1472" />
            <wire x2="1472" y1="1600" y2="1856" x1="1472" />
            <wire x2="1472" y1="1856" y2="2064" x1="1472" />
            <wire x2="1680" y1="2064" y2="2064" x1="1472" />
            <wire x2="1680" y1="1856" y2="1856" x1="1472" />
            <wire x2="800" y1="1296" y2="1296" x1="688" />
            <wire x2="688" y1="1296" y2="1408" x1="688" />
            <wire x2="1680" y1="1376" y2="1392" x1="1680" />
            <wire x2="1680" y1="1392" y2="1408" x1="1680" />
        </branch>
        <iomarker fontsize="28" x="80" y="768" name="B" orien="R180" />
        <iomarker fontsize="28" x="80" y="512" name="A" orien="R180" />
        <iomarker fontsize="28" x="80" y="1408" name="C" orien="R180" />
        <branch name="XLXN_17">
            <wire x2="1568" y1="2000" y2="2000" x1="1072" />
            <wire x2="1680" y1="2000" y2="2000" x1="1568" />
            <wire x2="1680" y1="416" y2="416" x1="1568" />
            <wire x2="1568" y1="416" y2="656" x1="1568" />
            <wire x2="1680" y1="656" y2="656" x1="1568" />
            <wire x2="1568" y1="656" y2="880" x1="1568" />
            <wire x2="1680" y1="880" y2="880" x1="1568" />
            <wire x2="1568" y1="880" y2="1088" x1="1568" />
            <wire x2="1680" y1="1088" y2="1088" x1="1568" />
            <wire x2="1568" y1="1088" y2="1312" x1="1568" />
            <wire x2="1680" y1="1312" y2="1312" x1="1568" />
            <wire x2="1568" y1="1312" y2="1536" x1="1568" />
            <wire x2="1680" y1="1536" y2="1536" x1="1568" />
            <wire x2="1568" y1="1536" y2="1792" x1="1568" />
            <wire x2="1680" y1="1792" y2="1792" x1="1568" />
            <wire x2="1568" y1="1792" y2="2000" x1="1568" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="672" y1="512" y2="512" x1="560" />
            <wire x2="672" y1="512" y2="848" x1="672" />
            <wire x2="800" y1="848" y2="848" x1="672" />
            <wire x2="672" y1="384" y2="512" x1="672" />
            <wire x2="800" y1="384" y2="384" x1="672" />
        </branch>
        <branch name="XLXN_25">
            <wire x2="656" y1="768" y2="768" x1="560" />
            <wire x2="800" y1="448" y2="448" x1="656" />
            <wire x2="656" y1="448" y2="672" x1="656" />
            <wire x2="656" y1="672" y2="768" x1="656" />
            <wire x2="800" y1="672" y2="672" x1="656" />
        </branch>
        <branch name="XLXN_29">
            <wire x2="1360" y1="416" y2="416" x1="1056" />
            <wire x2="1360" y1="416" y2="1248" x1="1360" />
            <wire x2="1680" y1="1248" y2="1248" x1="1360" />
            <wire x2="1360" y1="352" y2="416" x1="1360" />
            <wire x2="1680" y1="352" y2="352" x1="1360" />
        </branch>
        <branch name="XLXN_31">
            <wire x2="1344" y1="640" y2="640" x1="1056" />
            <wire x2="1344" y1="640" y2="1472" x1="1344" />
            <wire x2="1680" y1="1472" y2="1472" x1="1344" />
            <wire x2="1344" y1="592" y2="640" x1="1344" />
            <wire x2="1680" y1="592" y2="592" x1="1344" />
        </branch>
        <branch name="XLXN_33">
            <wire x2="1328" y1="880" y2="880" x1="1056" />
            <wire x2="1328" y1="880" y2="1728" x1="1328" />
            <wire x2="1680" y1="1728" y2="1728" x1="1328" />
            <wire x2="1328" y1="816" y2="880" x1="1328" />
            <wire x2="1680" y1="816" y2="816" x1="1328" />
        </branch>
        <branch name="XLXN_35">
            <wire x2="1312" y1="1088" y2="1088" x1="1056" />
            <wire x2="1312" y1="1088" y2="1936" x1="1312" />
            <wire x2="1680" y1="1936" y2="1936" x1="1312" />
            <wire x2="1312" y1="1024" y2="1088" x1="1312" />
            <wire x2="1680" y1="1024" y2="1024" x1="1312" />
        </branch>
        <branch name="XLXN_46">
            <wire x2="1296" y1="1296" y2="1296" x1="1024" />
            <wire x2="1296" y1="1152" y2="1296" x1="1296" />
            <wire x2="1472" y1="1152" y2="1152" x1="1296" />
            <wire x2="1680" y1="1152" y2="1152" x1="1472" />
            <wire x2="1680" y1="480" y2="480" x1="1472" />
            <wire x2="1472" y1="480" y2="720" x1="1472" />
            <wire x2="1680" y1="720" y2="720" x1="1472" />
            <wire x2="1472" y1="720" y2="944" x1="1472" />
            <wire x2="1680" y1="944" y2="944" x1="1472" />
            <wire x2="1472" y1="944" y2="1152" x1="1472" />
        </branch>
        <iomarker fontsize="28" x="2400" y="1024" name="Y(7:0)" orien="R0" />
        <branch name="Y(7:0)">
            <wire x2="2288" y1="608" y2="640" x1="2288" />
            <wire x2="2288" y1="640" y2="656" x1="2288" />
            <wire x2="2288" y1="656" y2="672" x1="2288" />
            <wire x2="2288" y1="672" y2="736" x1="2288" />
            <wire x2="2288" y1="736" y2="752" x1="2288" />
            <wire x2="2288" y1="752" y2="832" x1="2288" />
            <wire x2="2288" y1="832" y2="912" x1="2288" />
            <wire x2="2288" y1="912" y2="944" x1="2288" />
            <wire x2="2288" y1="944" y2="1024" x1="2288" />
            <wire x2="2400" y1="1024" y2="1024" x1="2288" />
            <wire x2="2288" y1="1024" y2="1072" x1="2288" />
            <wire x2="2288" y1="1072" y2="1120" x1="2288" />
            <wire x2="2288" y1="1120" y2="1152" x1="2288" />
            <wire x2="2288" y1="1152" y2="1216" x1="2288" />
            <wire x2="2288" y1="1216" y2="1248" x1="2288" />
            <wire x2="2288" y1="1248" y2="1312" x1="2288" />
            <wire x2="2288" y1="1312" y2="1344" x1="2288" />
            <wire x2="2288" y1="1344" y2="1424" x1="2288" />
            <wire x2="2288" y1="1424" y2="1488" x1="2288" />
        </branch>
        <bustap x2="2192" y1="640" y2="640" x1="2288" />
        <branch name="Y(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2160" y="640" type="branch" />
            <wire x2="2128" y1="416" y2="416" x1="1936" />
            <wire x2="2128" y1="416" y2="640" x1="2128" />
            <wire x2="2160" y1="640" y2="640" x1="2128" />
            <wire x2="2192" y1="640" y2="640" x1="2160" />
        </branch>
        <bustap x2="2192" y1="752" y2="752" x1="2288" />
        <branch name="Y(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2168" y="752" type="branch" />
            <wire x2="2144" y1="656" y2="656" x1="1936" />
            <wire x2="2144" y1="656" y2="752" x1="2144" />
            <wire x2="2168" y1="752" y2="752" x1="2144" />
            <wire x2="2192" y1="752" y2="752" x1="2168" />
        </branch>
        <bustap x2="2192" y1="832" y2="832" x1="2288" />
        <branch name="Y(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2160" y="832" type="branch" />
            <wire x2="2128" y1="880" y2="880" x1="1936" />
            <wire x2="2160" y1="832" y2="832" x1="2128" />
            <wire x2="2192" y1="832" y2="832" x1="2160" />
            <wire x2="2128" y1="832" y2="880" x1="2128" />
        </branch>
        <bustap x2="2192" y1="912" y2="912" x1="2288" />
        <branch name="Y(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2168" y="912" type="branch" />
            <wire x2="2144" y1="1088" y2="1088" x1="1936" />
            <wire x2="2168" y1="912" y2="912" x1="2144" />
            <wire x2="2192" y1="912" y2="912" x1="2168" />
            <wire x2="2144" y1="912" y2="1088" x1="2144" />
        </branch>
        <bustap x2="2192" y1="1072" y2="1072" x1="2288" />
        <branch name="Y(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2160" y="1072" type="branch" />
            <wire x2="2032" y1="1312" y2="1312" x1="1936" />
            <wire x2="2032" y1="1072" y2="1312" x1="2032" />
            <wire x2="2128" y1="1072" y2="1072" x1="2032" />
            <wire x2="2160" y1="1072" y2="1072" x1="2128" />
            <wire x2="2192" y1="1072" y2="1072" x1="2160" />
        </branch>
        <bustap x2="2192" y1="1152" y2="1152" x1="2288" />
        <branch name="Y(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2160" y="1152" type="branch" />
            <wire x2="2048" y1="1536" y2="1536" x1="1936" />
            <wire x2="2048" y1="1152" y2="1536" x1="2048" />
            <wire x2="2128" y1="1152" y2="1152" x1="2048" />
            <wire x2="2160" y1="1152" y2="1152" x1="2128" />
            <wire x2="2192" y1="1152" y2="1152" x1="2160" />
        </branch>
        <bustap x2="2192" y1="1248" y2="1248" x1="2288" />
        <branch name="Y(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2160" y="1248" type="branch" />
            <wire x2="2128" y1="1792" y2="1792" x1="1936" />
            <wire x2="2160" y1="1248" y2="1248" x1="2128" />
            <wire x2="2192" y1="1248" y2="1248" x1="2160" />
            <wire x2="2128" y1="1248" y2="1792" x1="2128" />
        </branch>
        <bustap x2="2192" y1="1344" y2="1344" x1="2288" />
        <branch name="Y(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2168" y="1344" type="branch" />
            <wire x2="2144" y1="2000" y2="2000" x1="1936" />
            <wire x2="2168" y1="1344" y2="1344" x1="2144" />
            <wire x2="2192" y1="1344" y2="1344" x1="2168" />
            <wire x2="2144" y1="1344" y2="2000" x1="2144" />
        </branch>
    </sheet>
</drawing>