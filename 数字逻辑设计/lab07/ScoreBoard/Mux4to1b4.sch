<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="s(1:0)" />
        <signal name="s(0)" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="s(1)" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="I0(3:0)" />
        <signal name="I0(3)" />
        <signal name="I0(2)" />
        <signal name="I0(1)" />
        <signal name="I0(0)" />
        <signal name="I2(3:0)" />
        <signal name="I2(3)" />
        <signal name="I2(2)" />
        <signal name="I2(1)" />
        <signal name="I2(0)" />
        <signal name="I3(3:0)" />
        <signal name="I3(3)" />
        <signal name="I3(2)" />
        <signal name="I3(1)" />
        <signal name="I3(0)" />
        <signal name="XLXN_67" />
        <signal name="XLXN_68" />
        <signal name="XLXN_70" />
        <signal name="XLXN_71" />
        <signal name="XLXN_72" />
        <signal name="XLXN_73" />
        <signal name="XLXN_74" />
        <signal name="XLXN_75" />
        <signal name="XLXN_76" />
        <signal name="XLXN_77" />
        <signal name="XLXN_78" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <signal name="XLXN_81" />
        <signal name="XLXN_82" />
        <signal name="XLXN_83" />
        <signal name="o(3:0)" />
        <signal name="o(3)" />
        <signal name="o(2)" />
        <signal name="o(1)" />
        <signal name="o(0)" />
        <signal name="I1(3)" />
        <signal name="I1(2)" />
        <signal name="I1(1)" />
        <signal name="I1(0)" />
        <signal name="I1(3:0)" />
        <port polarity="Input" name="s(1:0)" />
        <port polarity="Input" name="I0(3:0)" />
        <port polarity="Input" name="I2(3:0)" />
        <port polarity="Input" name="I3(3:0)" />
        <port polarity="Output" name="o(3:0)" />
        <port polarity="Input" name="I1(3:0)" />
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
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <block symbolname="inv" name="XLXI_1">
            <blockpin signalname="s(1)" name="I" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_2">
            <blockpin signalname="s(0)" name="I" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="XLXN_3" name="I0" />
            <blockpin signalname="XLXN_2" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="s(0)" name="I0" />
            <blockpin signalname="XLXN_2" name="I1" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="s(1)" name="I0" />
            <blockpin signalname="XLXN_3" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_6">
            <blockpin signalname="s(1)" name="I0" />
            <blockpin signalname="s(0)" name="I1" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_7">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="I0(0)" name="I1" />
            <blockpin signalname="XLXN_67" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_8">
            <blockpin signalname="XLXN_6" name="I0" />
            <blockpin signalname="I1(0)" name="I1" />
            <blockpin signalname="XLXN_68" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_9">
            <blockpin signalname="XLXN_8" name="I0" />
            <blockpin signalname="I2(0)" name="I1" />
            <blockpin signalname="XLXN_70" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_10">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="I3(0)" name="I1" />
            <blockpin signalname="XLXN_71" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_11">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="I0(1)" name="I1" />
            <blockpin signalname="XLXN_72" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_12">
            <blockpin signalname="XLXN_6" name="I0" />
            <blockpin signalname="I1(1)" name="I1" />
            <blockpin signalname="XLXN_73" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_13">
            <blockpin signalname="XLXN_8" name="I0" />
            <blockpin signalname="I2(1)" name="I1" />
            <blockpin signalname="XLXN_74" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_14">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="I3(1)" name="I1" />
            <blockpin signalname="XLXN_75" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_15">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="I0(2)" name="I1" />
            <blockpin signalname="XLXN_76" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_16">
            <blockpin signalname="XLXN_6" name="I0" />
            <blockpin signalname="I1(2)" name="I1" />
            <blockpin signalname="XLXN_77" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_17">
            <blockpin signalname="XLXN_8" name="I0" />
            <blockpin signalname="I2(2)" name="I1" />
            <blockpin signalname="XLXN_78" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_18">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="I3(2)" name="I1" />
            <blockpin signalname="XLXN_79" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_19">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="I0(3)" name="I1" />
            <blockpin signalname="XLXN_80" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_20">
            <blockpin signalname="XLXN_6" name="I0" />
            <blockpin signalname="I1(3)" name="I1" />
            <blockpin signalname="XLXN_81" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_21">
            <blockpin signalname="XLXN_8" name="I0" />
            <blockpin signalname="I2(3)" name="I1" />
            <blockpin signalname="XLXN_82" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_22">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="I3(3)" name="I1" />
            <blockpin signalname="XLXN_83" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_27">
            <blockpin signalname="XLXN_71" name="I0" />
            <blockpin signalname="XLXN_70" name="I1" />
            <blockpin signalname="XLXN_68" name="I2" />
            <blockpin signalname="XLXN_67" name="I3" />
            <blockpin signalname="o(0)" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_29">
            <blockpin signalname="XLXN_75" name="I0" />
            <blockpin signalname="XLXN_74" name="I1" />
            <blockpin signalname="XLXN_73" name="I2" />
            <blockpin signalname="XLXN_72" name="I3" />
            <blockpin signalname="o(1)" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_31">
            <blockpin signalname="XLXN_79" name="I0" />
            <blockpin signalname="XLXN_78" name="I1" />
            <blockpin signalname="XLXN_77" name="I2" />
            <blockpin signalname="XLXN_76" name="I3" />
            <blockpin signalname="o(2)" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_32">
            <blockpin signalname="XLXN_83" name="I0" />
            <blockpin signalname="XLXN_82" name="I1" />
            <blockpin signalname="XLXN_81" name="I2" />
            <blockpin signalname="XLXN_80" name="I3" />
            <blockpin signalname="o(3)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="400" y="256" name="XLXI_1" orien="R0" />
        <instance x="400" y="320" name="XLXI_2" orien="R0" />
        <instance x="784" y="352" name="XLXI_3" orien="R0" />
        <instance x="784" y="480" name="XLXI_4" orien="R0" />
        <instance x="784" y="608" name="XLXI_5" orien="R0" />
        <instance x="784" y="736" name="XLXI_6" orien="R0" />
        <branch name="s(1:0)">
            <wire x2="256" y1="224" y2="288" x1="256" />
            <wire x2="256" y1="288" y2="352" x1="256" />
        </branch>
        <bustap x2="352" y1="224" y2="224" x1="256" />
        <bustap x2="352" y1="288" y2="288" x1="256" />
        <branch name="s(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="376" y="288" type="branch" />
            <wire x2="368" y1="288" y2="288" x1="352" />
            <wire x2="368" y1="288" y2="416" x1="368" />
            <wire x2="368" y1="416" y2="608" x1="368" />
            <wire x2="784" y1="608" y2="608" x1="368" />
            <wire x2="784" y1="416" y2="416" x1="368" />
            <wire x2="384" y1="288" y2="288" x1="368" />
            <wire x2="400" y1="288" y2="288" x1="384" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="720" y1="224" y2="224" x1="624" />
            <wire x2="784" y1="224" y2="224" x1="720" />
            <wire x2="720" y1="224" y2="352" x1="720" />
            <wire x2="784" y1="352" y2="352" x1="720" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="656" y1="288" y2="288" x1="624" />
            <wire x2="784" y1="288" y2="288" x1="656" />
            <wire x2="656" y1="288" y2="480" x1="656" />
            <wire x2="784" y1="480" y2="480" x1="656" />
        </branch>
        <branch name="s(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="376" y="224" type="branch" />
            <wire x2="368" y1="144" y2="144" x1="160" />
            <wire x2="368" y1="144" y2="224" x1="368" />
            <wire x2="384" y1="224" y2="224" x1="368" />
            <wire x2="400" y1="224" y2="224" x1="384" />
            <wire x2="160" y1="144" y2="544" x1="160" />
            <wire x2="784" y1="544" y2="544" x1="160" />
            <wire x2="160" y1="544" y2="672" x1="160" />
            <wire x2="784" y1="672" y2="672" x1="160" />
            <wire x2="368" y1="224" y2="224" x1="352" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1056" y1="640" y2="640" x1="1040" />
            <wire x2="1056" y1="640" y2="704" x1="1056" />
            <wire x2="1056" y1="704" y2="1280" x1="1056" />
            <wire x2="1056" y1="1280" y2="1856" x1="1056" />
            <wire x2="2064" y1="1856" y2="1856" x1="1056" />
            <wire x2="1056" y1="1856" y2="2416" x1="1056" />
            <wire x2="2064" y1="2416" y2="2416" x1="1056" />
            <wire x2="2064" y1="1280" y2="1280" x1="1056" />
            <wire x2="2064" y1="704" y2="704" x1="1056" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1088" y1="384" y2="384" x1="1040" />
            <wire x2="1088" y1="384" y2="448" x1="1088" />
            <wire x2="1088" y1="448" y2="1024" x1="1088" />
            <wire x2="1088" y1="1024" y2="1600" x1="1088" />
            <wire x2="2064" y1="1600" y2="1600" x1="1088" />
            <wire x2="1088" y1="1600" y2="2160" x1="1088" />
            <wire x2="2064" y1="2160" y2="2160" x1="1088" />
            <wire x2="2064" y1="1024" y2="1024" x1="1088" />
            <wire x2="2064" y1="448" y2="448" x1="1088" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1104" y1="256" y2="256" x1="1040" />
            <wire x2="1104" y1="256" y2="320" x1="1104" />
            <wire x2="1104" y1="320" y2="896" x1="1104" />
            <wire x2="1104" y1="896" y2="1472" x1="1104" />
            <wire x2="2064" y1="1472" y2="1472" x1="1104" />
            <wire x2="1104" y1="1472" y2="2032" x1="1104" />
            <wire x2="2064" y1="2032" y2="2032" x1="1104" />
            <wire x2="2064" y1="896" y2="896" x1="1104" />
            <wire x2="2064" y1="320" y2="320" x1="1104" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1072" y1="512" y2="512" x1="1040" />
            <wire x2="1072" y1="512" y2="576" x1="1072" />
            <wire x2="1072" y1="576" y2="1152" x1="1072" />
            <wire x2="1072" y1="1152" y2="1728" x1="1072" />
            <wire x2="2064" y1="1728" y2="1728" x1="1072" />
            <wire x2="1072" y1="1728" y2="2288" x1="1072" />
            <wire x2="2064" y1="2288" y2="2288" x1="1072" />
            <wire x2="2064" y1="1152" y2="1152" x1="1072" />
            <wire x2="2064" y1="576" y2="576" x1="1072" />
        </branch>
        <branch name="I0(3:0)">
            <wire x2="1264" y1="1408" y2="1408" x1="352" />
            <wire x2="1264" y1="1408" y2="1968" x1="1264" />
            <wire x2="1264" y1="256" y2="832" x1="1264" />
            <wire x2="1264" y1="832" y2="1408" x1="1264" />
        </branch>
        <bustap x2="1360" y1="1968" y2="1968" x1="1264" />
        <branch name="I0(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1432" y="1968" type="branch" />
            <wire x2="1440" y1="1968" y2="1968" x1="1360" />
            <wire x2="2064" y1="1968" y2="1968" x1="1440" />
        </branch>
        <bustap x2="1360" y1="1408" y2="1408" x1="1264" />
        <branch name="I0(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1432" y="1408" type="branch" />
            <wire x2="1440" y1="1408" y2="1408" x1="1360" />
            <wire x2="2064" y1="1408" y2="1408" x1="1440" />
        </branch>
        <bustap x2="1360" y1="832" y2="832" x1="1264" />
        <branch name="I0(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1432" y="832" type="branch" />
            <wire x2="1440" y1="832" y2="832" x1="1360" />
            <wire x2="2064" y1="832" y2="832" x1="1440" />
        </branch>
        <bustap x2="1360" y1="256" y2="256" x1="1264" />
        <branch name="I0(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1432" y="256" type="branch" />
            <wire x2="1440" y1="256" y2="256" x1="1360" />
            <wire x2="2064" y1="256" y2="256" x1="1440" />
        </branch>
        <branch name="I2(3:0)">
            <wire x2="1568" y1="1664" y2="1664" x1="352" />
            <wire x2="1568" y1="1664" y2="2224" x1="1568" />
            <wire x2="1568" y1="512" y2="1088" x1="1568" />
            <wire x2="1568" y1="1088" y2="1664" x1="1568" />
        </branch>
        <bustap x2="1664" y1="2224" y2="2224" x1="1568" />
        <branch name="I2(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1688" y="2224" type="branch" />
            <wire x2="1696" y1="2224" y2="2224" x1="1664" />
            <wire x2="2064" y1="2224" y2="2224" x1="1696" />
        </branch>
        <bustap x2="1664" y1="1664" y2="1664" x1="1568" />
        <branch name="I2(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1688" y="1664" type="branch" />
            <wire x2="1696" y1="1664" y2="1664" x1="1664" />
            <wire x2="2064" y1="1664" y2="1664" x1="1696" />
        </branch>
        <bustap x2="1664" y1="1088" y2="1088" x1="1568" />
        <branch name="I2(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1688" y="1088" type="branch" />
            <wire x2="1696" y1="1088" y2="1088" x1="1664" />
            <wire x2="2064" y1="1088" y2="1088" x1="1696" />
        </branch>
        <bustap x2="1664" y1="512" y2="512" x1="1568" />
        <branch name="I2(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1688" y="512" type="branch" />
            <wire x2="1696" y1="512" y2="512" x1="1664" />
            <wire x2="2064" y1="512" y2="512" x1="1696" />
        </branch>
        <instance x="2064" y="384" name="XLXI_7" orien="R0" />
        <instance x="2064" y="512" name="XLXI_8" orien="R0" />
        <instance x="2064" y="640" name="XLXI_9" orien="R0" />
        <instance x="2064" y="768" name="XLXI_10" orien="R0" />
        <instance x="2064" y="960" name="XLXI_11" orien="R0" />
        <instance x="2064" y="1088" name="XLXI_12" orien="R0" />
        <instance x="2064" y="1216" name="XLXI_13" orien="R0" />
        <instance x="2064" y="1344" name="XLXI_14" orien="R0" />
        <instance x="2064" y="1536" name="XLXI_15" orien="R0" />
        <instance x="2064" y="1664" name="XLXI_16" orien="R0" />
        <instance x="2064" y="1792" name="XLXI_17" orien="R0" />
        <instance x="2064" y="1920" name="XLXI_18" orien="R0" />
        <instance x="2064" y="2096" name="XLXI_19" orien="R0" />
        <instance x="2064" y="2224" name="XLXI_20" orien="R0" />
        <instance x="2064" y="2352" name="XLXI_21" orien="R0" />
        <instance x="2064" y="2480" name="XLXI_22" orien="R0" />
        <branch name="I3(3:0)">
            <wire x2="1744" y1="1792" y2="1792" x1="352" />
            <wire x2="1744" y1="1792" y2="2352" x1="1744" />
            <wire x2="1744" y1="640" y2="1216" x1="1744" />
            <wire x2="1744" y1="1216" y2="1792" x1="1744" />
        </branch>
        <bustap x2="1840" y1="2352" y2="2352" x1="1744" />
        <branch name="I3(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1952" y="2352" type="branch" />
            <wire x2="1952" y1="2352" y2="2352" x1="1840" />
            <wire x2="2064" y1="2352" y2="2352" x1="1952" />
        </branch>
        <bustap x2="1840" y1="1792" y2="1792" x1="1744" />
        <branch name="I3(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1952" y="1792" type="branch" />
            <wire x2="1952" y1="1792" y2="1792" x1="1840" />
            <wire x2="2064" y1="1792" y2="1792" x1="1952" />
        </branch>
        <bustap x2="1840" y1="1216" y2="1216" x1="1744" />
        <branch name="I3(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1952" y="1216" type="branch" />
            <wire x2="1952" y1="1216" y2="1216" x1="1840" />
            <wire x2="2064" y1="1216" y2="1216" x1="1952" />
        </branch>
        <bustap x2="1840" y1="640" y2="640" x1="1744" />
        <branch name="I3(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1952" y="640" type="branch" />
            <wire x2="1952" y1="640" y2="640" x1="1840" />
            <wire x2="2064" y1="640" y2="640" x1="1952" />
        </branch>
        <instance x="2496" y="640" name="XLXI_27" orien="R0" />
        <instance x="2512" y="1216" name="XLXI_29" orien="R0" />
        <instance x="2528" y="1776" name="XLXI_31" orien="R0" />
        <instance x="2528" y="2352" name="XLXI_32" orien="R0" />
        <branch name="XLXN_67">
            <wire x2="2496" y1="288" y2="288" x1="2320" />
            <wire x2="2496" y1="288" y2="384" x1="2496" />
        </branch>
        <branch name="XLXN_68">
            <wire x2="2400" y1="416" y2="416" x1="2320" />
            <wire x2="2400" y1="416" y2="448" x1="2400" />
            <wire x2="2496" y1="448" y2="448" x1="2400" />
        </branch>
        <branch name="XLXN_70">
            <wire x2="2400" y1="544" y2="544" x1="2320" />
            <wire x2="2400" y1="512" y2="544" x1="2400" />
            <wire x2="2496" y1="512" y2="512" x1="2400" />
        </branch>
        <branch name="XLXN_71">
            <wire x2="2496" y1="672" y2="672" x1="2320" />
            <wire x2="2496" y1="576" y2="672" x1="2496" />
        </branch>
        <branch name="XLXN_72">
            <wire x2="2512" y1="864" y2="864" x1="2320" />
            <wire x2="2512" y1="864" y2="960" x1="2512" />
        </branch>
        <branch name="XLXN_73">
            <wire x2="2416" y1="992" y2="992" x1="2320" />
            <wire x2="2416" y1="992" y2="1024" x1="2416" />
            <wire x2="2512" y1="1024" y2="1024" x1="2416" />
        </branch>
        <branch name="XLXN_74">
            <wire x2="2416" y1="1120" y2="1120" x1="2320" />
            <wire x2="2416" y1="1088" y2="1120" x1="2416" />
            <wire x2="2512" y1="1088" y2="1088" x1="2416" />
        </branch>
        <branch name="XLXN_75">
            <wire x2="2512" y1="1248" y2="1248" x1="2320" />
            <wire x2="2512" y1="1152" y2="1248" x1="2512" />
        </branch>
        <branch name="XLXN_76">
            <wire x2="2528" y1="1440" y2="1440" x1="2320" />
            <wire x2="2528" y1="1440" y2="1520" x1="2528" />
        </branch>
        <branch name="XLXN_77">
            <wire x2="2416" y1="1568" y2="1568" x1="2320" />
            <wire x2="2416" y1="1568" y2="1584" x1="2416" />
            <wire x2="2528" y1="1584" y2="1584" x1="2416" />
        </branch>
        <branch name="XLXN_78">
            <wire x2="2416" y1="1696" y2="1696" x1="2320" />
            <wire x2="2416" y1="1648" y2="1696" x1="2416" />
            <wire x2="2528" y1="1648" y2="1648" x1="2416" />
        </branch>
        <branch name="XLXN_79">
            <wire x2="2528" y1="1824" y2="1824" x1="2320" />
            <wire x2="2528" y1="1712" y2="1824" x1="2528" />
        </branch>
        <branch name="XLXN_80">
            <wire x2="2528" y1="2000" y2="2000" x1="2320" />
            <wire x2="2528" y1="2000" y2="2096" x1="2528" />
        </branch>
        <branch name="XLXN_81">
            <wire x2="2416" y1="2128" y2="2128" x1="2320" />
            <wire x2="2416" y1="2128" y2="2160" x1="2416" />
            <wire x2="2528" y1="2160" y2="2160" x1="2416" />
        </branch>
        <branch name="XLXN_82">
            <wire x2="2416" y1="2256" y2="2256" x1="2320" />
            <wire x2="2416" y1="2224" y2="2256" x1="2416" />
            <wire x2="2528" y1="2224" y2="2224" x1="2416" />
        </branch>
        <branch name="XLXN_83">
            <wire x2="2528" y1="2384" y2="2384" x1="2320" />
            <wire x2="2528" y1="2288" y2="2384" x1="2528" />
        </branch>
        <branch name="o(3:0)">
            <wire x2="3040" y1="480" y2="1056" x1="3040" />
            <wire x2="3040" y1="1056" y2="1312" x1="3040" />
            <wire x2="3232" y1="1312" y2="1312" x1="3040" />
            <wire x2="3040" y1="1312" y2="1616" x1="3040" />
            <wire x2="3040" y1="1616" y2="2192" x1="3040" />
        </branch>
        <bustap x2="2944" y1="2192" y2="2192" x1="3040" />
        <branch name="o(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2864" y="2192" type="branch" />
            <wire x2="2864" y1="2192" y2="2192" x1="2784" />
            <wire x2="2944" y1="2192" y2="2192" x1="2864" />
        </branch>
        <bustap x2="2944" y1="1616" y2="1616" x1="3040" />
        <branch name="o(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2864" y="1616" type="branch" />
            <wire x2="2864" y1="1616" y2="1616" x1="2784" />
            <wire x2="2944" y1="1616" y2="1616" x1="2864" />
        </branch>
        <bustap x2="2944" y1="1056" y2="1056" x1="3040" />
        <branch name="o(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2856" y="1056" type="branch" />
            <wire x2="2864" y1="1056" y2="1056" x1="2768" />
            <wire x2="2944" y1="1056" y2="1056" x1="2864" />
        </branch>
        <bustap x2="2944" y1="480" y2="480" x1="3040" />
        <branch name="o(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2848" y="480" type="branch" />
            <wire x2="2848" y1="480" y2="480" x1="2752" />
            <wire x2="2944" y1="480" y2="480" x1="2848" />
        </branch>
        <bustap x2="1456" y1="2096" y2="2096" x1="1360" />
        <branch name="I1(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="2096" type="branch" />
            <wire x2="1760" y1="2096" y2="2096" x1="1456" />
            <wire x2="2064" y1="2096" y2="2096" x1="1760" />
        </branch>
        <bustap x2="1456" y1="1536" y2="1536" x1="1360" />
        <branch name="I1(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="1536" type="branch" />
            <wire x2="1760" y1="1536" y2="1536" x1="1456" />
            <wire x2="2064" y1="1536" y2="1536" x1="1760" />
        </branch>
        <bustap x2="1456" y1="960" y2="960" x1="1360" />
        <branch name="I1(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="960" type="branch" />
            <wire x2="1760" y1="960" y2="960" x1="1456" />
            <wire x2="2064" y1="960" y2="960" x1="1760" />
        </branch>
        <bustap x2="1456" y1="384" y2="384" x1="1360" />
        <branch name="I1(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="384" type="branch" />
            <wire x2="1760" y1="384" y2="384" x1="1456" />
            <wire x2="2064" y1="384" y2="384" x1="1760" />
        </branch>
        <branch name="I1(3:0)">
            <wire x2="1360" y1="1536" y2="1536" x1="352" />
            <wire x2="1360" y1="1536" y2="2096" x1="1360" />
            <wire x2="1360" y1="384" y2="960" x1="1360" />
            <wire x2="1360" y1="960" y2="1536" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="256" y="352" name="s(1:0)" orien="R90" />
        <iomarker fontsize="28" x="352" y="1408" name="I0(3:0)" orien="R180" />
        <iomarker fontsize="28" x="352" y="1664" name="I2(3:0)" orien="R180" />
        <iomarker fontsize="28" x="352" y="1792" name="I3(3:0)" orien="R180" />
        <iomarker fontsize="28" x="3232" y="1312" name="o(3:0)" orien="R0" />
        <iomarker fontsize="28" x="352" y="1536" name="I1(3:0)" orien="R180" />
    </sheet>
</drawing>