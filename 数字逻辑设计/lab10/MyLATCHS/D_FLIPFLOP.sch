<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="C" />
        <signal name="SN" />
        <signal name="RN" />
        <signal name="XLXN_5" />
        <signal name="D" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="QN" />
        <signal name="Q" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <port polarity="Input" name="C" />
        <port polarity="Input" name="SN" />
        <port polarity="Input" name="RN" />
        <port polarity="Input" name="D" />
        <port polarity="Output" name="QN" />
        <port polarity="Output" name="Q" />
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
        <block symbolname="nand3" name="XLXI_1">
            <blockpin signalname="XLXN_16" name="I0" />
            <blockpin signalname="XLXN_12" name="I1" />
            <blockpin signalname="SN" name="I2" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_2">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="RN" name="I1" />
            <blockpin signalname="XLXN_17" name="I2" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_3">
            <blockpin signalname="XLXN_12" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_16" name="I2" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_4">
            <blockpin signalname="RN" name="I0" />
            <blockpin signalname="D" name="I1" />
            <blockpin signalname="XLXN_13" name="I2" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_5">
            <blockpin signalname="QN" name="I0" />
            <blockpin signalname="XLXN_16" name="I1" />
            <blockpin signalname="SN" name="I2" />
            <blockpin signalname="Q" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_6">
            <blockpin signalname="RN" name="I0" />
            <blockpin signalname="XLXN_13" name="I1" />
            <blockpin signalname="Q" name="I2" />
            <blockpin signalname="QN" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1472" y="1344" name="XLXI_1" orien="R0" />
        <instance x="1472" y="1536" name="XLXI_2" orien="R0" />
        <instance x="1472" y="1760" name="XLXI_3" orien="R0" />
        <instance x="1472" y="1952" name="XLXI_4" orien="R0" />
        <instance x="1968" y="1536" name="XLXI_5" orien="R0" />
        <instance x="1968" y="1760" name="XLXI_6" orien="R0" />
        <branch name="C">
            <wire x2="1136" y1="1472" y2="1472" x1="992" />
            <wire x2="1136" y1="1472" y2="1632" x1="1136" />
            <wire x2="1472" y1="1632" y2="1632" x1="1136" />
            <wire x2="1472" y1="1472" y2="1472" x1="1136" />
        </branch>
        <branch name="SN">
            <wire x2="1120" y1="1152" y2="1152" x1="1008" />
            <wire x2="1472" y1="1152" y2="1152" x1="1120" />
            <wire x2="1968" y1="1120" y2="1120" x1="1120" />
            <wire x2="1968" y1="1120" y2="1344" x1="1968" />
            <wire x2="1120" y1="1120" y2="1152" x1="1120" />
        </branch>
        <branch name="RN">
            <wire x2="1248" y1="1888" y2="1888" x1="1008" />
            <wire x2="1472" y1="1888" y2="1888" x1="1248" />
            <wire x2="1248" y1="1888" y2="1920" x1="1248" />
            <wire x2="1968" y1="1920" y2="1920" x1="1248" />
            <wire x2="1472" y1="1408" y2="1408" x1="1248" />
            <wire x2="1248" y1="1408" y2="1888" x1="1248" />
            <wire x2="1968" y1="1696" y2="1920" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="992" y="1472" name="C" orien="R180" />
        <iomarker fontsize="28" x="1008" y="1152" name="SN" orien="R180" />
        <branch name="D">
            <wire x2="1472" y1="1824" y2="1824" x1="992" />
        </branch>
        <iomarker fontsize="28" x="992" y="1824" name="D" orien="R180" />
        <iomarker fontsize="28" x="1008" y="1888" name="RN" orien="R180" />
        <branch name="QN">
            <wire x2="1952" y1="1472" y2="1536" x1="1952" />
            <wire x2="2304" y1="1536" y2="1536" x1="1952" />
            <wire x2="2304" y1="1536" y2="1632" x1="2304" />
            <wire x2="2352" y1="1632" y2="1632" x1="2304" />
            <wire x2="1968" y1="1472" y2="1472" x1="1952" />
            <wire x2="2304" y1="1632" y2="1632" x1="2224" />
        </branch>
        <branch name="Q">
            <wire x2="2304" y1="1504" y2="1504" x1="1904" />
            <wire x2="1904" y1="1504" y2="1568" x1="1904" />
            <wire x2="1968" y1="1568" y2="1568" x1="1904" />
            <wire x2="2304" y1="1408" y2="1408" x1="2224" />
            <wire x2="2304" y1="1408" y2="1504" x1="2304" />
            <wire x2="2352" y1="1408" y2="1408" x1="2304" />
        </branch>
        <iomarker fontsize="28" x="2352" y="1408" name="Q" orien="R0" />
        <iomarker fontsize="28" x="2352" y="1632" name="QN" orien="R0" />
        <branch name="XLXN_12">
            <wire x2="1472" y1="1216" y2="1216" x1="1040" />
            <wire x2="1040" y1="1216" y2="1952" x1="1040" />
            <wire x2="1744" y1="1952" y2="1952" x1="1040" />
            <wire x2="1472" y1="1696" y2="1744" x1="1472" />
            <wire x2="1744" y1="1744" y2="1744" x1="1472" />
            <wire x2="1744" y1="1744" y2="1824" x1="1744" />
            <wire x2="1744" y1="1824" y2="1952" x1="1744" />
            <wire x2="1744" y1="1824" y2="1824" x1="1728" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1744" y1="1712" y2="1712" x1="1392" />
            <wire x2="1392" y1="1712" y2="1760" x1="1392" />
            <wire x2="1472" y1="1760" y2="1760" x1="1392" />
            <wire x2="1744" y1="1632" y2="1632" x1="1728" />
            <wire x2="1968" y1="1632" y2="1632" x1="1744" />
            <wire x2="1744" y1="1632" y2="1712" x1="1744" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="1472" y1="1280" y2="1328" x1="1472" />
            <wire x2="1744" y1="1328" y2="1328" x1="1472" />
            <wire x2="1744" y1="1328" y2="1408" x1="1744" />
            <wire x2="1968" y1="1408" y2="1408" x1="1744" />
            <wire x2="1744" y1="1408" y2="1488" x1="1744" />
            <wire x2="1472" y1="1488" y2="1568" x1="1472" />
            <wire x2="1744" y1="1488" y2="1488" x1="1472" />
            <wire x2="1744" y1="1408" y2="1408" x1="1728" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="1408" y1="1296" y2="1344" x1="1408" />
            <wire x2="1472" y1="1344" y2="1344" x1="1408" />
            <wire x2="1808" y1="1296" y2="1296" x1="1408" />
            <wire x2="1808" y1="1216" y2="1216" x1="1728" />
            <wire x2="1808" y1="1216" y2="1296" x1="1808" />
        </branch>
    </sheet>
</drawing>