<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Qd" />
        <signal name="XLXN_26" />
        <signal name="XLXN_22" />
        <signal name="XLXN_19" />
        <signal name="XLXN_18" />
        <signal name="XLXN_38" />
        <signal name="clk" />
        <signal name="Rc" />
        <signal name="XLXN_9" />
        <signal name="XLXN_8" />
        <signal name="XLXN_7" />
        <signal name="XLXN_6" />
        <signal name="XLXN_5" />
        <signal name="Qc" />
        <signal name="Qb" />
        <signal name="Qa" />
        <port polarity="Output" name="Qd" />
        <port polarity="Input" name="clk" />
        <port polarity="Output" name="Rc" />
        <port polarity="Output" name="Qc" />
        <port polarity="Output" name="Qb" />
        <port polarity="Output" name="Qa" />
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
        </blockdef>
        <blockdef name="xnor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
            <circle r="8" cx="220" cy="-96" />
            <line x2="256" y1="-96" y2="-96" x1="228" />
            <line x2="60" y1="-28" y2="-28" x1="60" />
        </blockdef>
        <blockdef name="nor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="216" y1="-96" y2="-96" x1="256" />
            <circle r="12" cx="204" cy="-96" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
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
        <blockdef name="nor4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="216" y1="-160" y2="-160" x1="256" />
            <circle r="12" cx="204" cy="-160" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
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
        <block symbolname="nor4" name="XLXI_10">
            <blockpin signalname="XLXN_26" name="I0" />
            <blockpin signalname="XLXN_22" name="I1" />
            <blockpin signalname="XLXN_19" name="I2" />
            <blockpin signalname="XLXN_18" name="I3" />
            <blockpin signalname="Rc" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_14">
            <blockpin signalname="Qd" name="I" />
            <blockpin signalname="XLXN_26" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_13">
            <blockpin signalname="Qc" name="I" />
            <blockpin signalname="XLXN_22" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_12">
            <blockpin signalname="Qb" name="I" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_11">
            <blockpin signalname="Qa" name="I" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="nor3" name="XLXI_9">
            <blockpin signalname="XLXN_22" name="I0" />
            <blockpin signalname="XLXN_19" name="I1" />
            <blockpin signalname="XLXN_18" name="I2" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="nor2" name="XLXI_8">
            <blockpin signalname="XLXN_19" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="xnor2" name="XLXI_7">
            <blockpin signalname="XLXN_19" name="I0" />
            <blockpin signalname="Qa" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="xnor2" name="XLXI_6">
            <blockpin signalname="XLXN_26" name="I0" />
            <blockpin signalname="XLXN_9" name="I1" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="xnor2" name="XLXI_5">
            <blockpin signalname="XLXN_22" name="I0" />
            <blockpin signalname="XLXN_8" name="I1" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="fd" name="XLXI_4">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_6" name="D" />
            <blockpin signalname="Qd" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_3">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_5" name="D" />
            <blockpin signalname="Qc" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_2">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_7" name="D" />
            <blockpin signalname="Qb" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_1">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_18" name="D" />
            <blockpin signalname="Qa" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1696" y="2464" name="XLXI_10" orien="R0" />
        <instance x="1264" y="2112" name="XLXI_14" orien="R0" />
        <instance x="1264" y="1760" name="XLXI_13" orien="R0" />
        <instance x="1264" y="1408" name="XLXI_12" orien="R0" />
        <instance x="1264" y="1008" name="XLXI_11" orien="R0" />
        <instance x="1680" y="2000" name="XLXI_9" orien="R0" />
        <instance x="1680" y="1600" name="XLXI_8" orien="R0" />
        <instance x="1968" y="1440" name="XLXI_7" orien="R0" />
        <instance x="1968" y="2144" name="XLXI_6" orien="R0" />
        <instance x="1968" y="1792" name="XLXI_5" orien="R0" />
        <instance x="2256" y="2304" name="XLXI_4" orien="R0" />
        <instance x="2256" y="1952" name="XLXI_3" orien="R0" />
        <instance x="2256" y="1600" name="XLXI_2" orien="R0" />
        <instance x="2256" y="1232" name="XLXI_1" orien="R0" />
        <branch name="Qd">
            <wire x2="1216" y1="1952" y2="2080" x1="1216" />
            <wire x2="1264" y1="2080" y2="2080" x1="1216" />
            <wire x2="2704" y1="1952" y2="1952" x1="1216" />
            <wire x2="2704" y1="1952" y2="2048" x1="2704" />
            <wire x2="2832" y1="2048" y2="2048" x1="2704" />
            <wire x2="2704" y1="2048" y2="2048" x1="2640" />
        </branch>
        <branch name="XLXN_26">
            <wire x2="1536" y1="2080" y2="2080" x1="1488" />
            <wire x2="1968" y1="2080" y2="2080" x1="1536" />
            <wire x2="1536" y1="2080" y2="2400" x1="1536" />
            <wire x2="1696" y1="2400" y2="2400" x1="1536" />
        </branch>
        <branch name="XLXN_22">
            <wire x2="1568" y1="1728" y2="1728" x1="1488" />
            <wire x2="1968" y1="1728" y2="1728" x1="1568" />
            <wire x2="1568" y1="1728" y2="1936" x1="1568" />
            <wire x2="1568" y1="1936" y2="2336" x1="1568" />
            <wire x2="1696" y1="2336" y2="2336" x1="1568" />
            <wire x2="1680" y1="1936" y2="1936" x1="1568" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="1600" y1="1376" y2="1376" x1="1488" />
            <wire x2="1968" y1="1376" y2="1376" x1="1600" />
            <wire x2="1600" y1="1376" y2="1536" x1="1600" />
            <wire x2="1680" y1="1536" y2="1536" x1="1600" />
            <wire x2="1600" y1="1536" y2="1872" x1="1600" />
            <wire x2="1680" y1="1872" y2="1872" x1="1600" />
            <wire x2="1600" y1="1872" y2="2272" x1="1600" />
            <wire x2="1696" y1="2272" y2="2272" x1="1600" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="1632" y1="976" y2="976" x1="1488" />
            <wire x2="2256" y1="976" y2="976" x1="1632" />
            <wire x2="1632" y1="976" y2="1472" x1="1632" />
            <wire x2="1680" y1="1472" y2="1472" x1="1632" />
            <wire x2="1632" y1="1472" y2="1808" x1="1632" />
            <wire x2="1680" y1="1808" y2="1808" x1="1632" />
            <wire x2="1632" y1="1808" y2="2208" x1="1632" />
            <wire x2="1696" y1="2208" y2="2208" x1="1632" />
        </branch>
        <branch name="clk">
            <wire x2="2240" y1="2176" y2="2176" x1="1328" />
            <wire x2="2256" y1="2176" y2="2176" x1="2240" />
            <wire x2="2256" y1="1104" y2="1104" x1="2240" />
            <wire x2="2240" y1="1104" y2="1472" x1="2240" />
            <wire x2="2256" y1="1472" y2="1472" x1="2240" />
            <wire x2="2240" y1="1472" y2="1824" x1="2240" />
            <wire x2="2256" y1="1824" y2="1824" x1="2240" />
            <wire x2="2240" y1="1824" y2="2176" x1="2240" />
        </branch>
        <branch name="Rc">
            <wire x2="2832" y1="2304" y2="2304" x1="1952" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1952" y1="1872" y2="1872" x1="1936" />
            <wire x2="1952" y1="1872" y2="2016" x1="1952" />
            <wire x2="1968" y1="2016" y2="2016" x1="1952" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1952" y1="1504" y2="1504" x1="1936" />
            <wire x2="1952" y1="1504" y2="1664" x1="1952" />
            <wire x2="1968" y1="1664" y2="1664" x1="1952" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="2256" y1="1344" y2="1344" x1="2224" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="2256" y1="2048" y2="2048" x1="2224" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="2256" y1="1696" y2="1696" x1="2224" />
        </branch>
        <branch name="Qc">
            <wire x2="2688" y1="1584" y2="1584" x1="1216" />
            <wire x2="2688" y1="1584" y2="1696" x1="2688" />
            <wire x2="2832" y1="1696" y2="1696" x1="2688" />
            <wire x2="1216" y1="1584" y2="1728" x1="1216" />
            <wire x2="1264" y1="1728" y2="1728" x1="1216" />
            <wire x2="2688" y1="1696" y2="1696" x1="2640" />
        </branch>
        <branch name="Qb">
            <wire x2="2688" y1="1216" y2="1216" x1="1216" />
            <wire x2="2688" y1="1216" y2="1344" x1="2688" />
            <wire x2="2832" y1="1344" y2="1344" x1="2688" />
            <wire x2="1216" y1="1216" y2="1376" x1="1216" />
            <wire x2="1264" y1="1376" y2="1376" x1="1216" />
            <wire x2="2688" y1="1344" y2="1344" x1="2640" />
        </branch>
        <branch name="Qa">
            <wire x2="1216" y1="832" y2="976" x1="1216" />
            <wire x2="1264" y1="976" y2="976" x1="1216" />
            <wire x2="1840" y1="832" y2="832" x1="1216" />
            <wire x2="2704" y1="832" y2="832" x1="1840" />
            <wire x2="2704" y1="832" y2="976" x1="2704" />
            <wire x2="2832" y1="976" y2="976" x1="2704" />
            <wire x2="1840" y1="832" y2="1312" x1="1840" />
            <wire x2="1968" y1="1312" y2="1312" x1="1840" />
            <wire x2="2704" y1="976" y2="976" x1="2640" />
        </branch>
        <iomarker fontsize="28" x="1328" y="2176" name="clk" orien="R180" />
        <iomarker fontsize="28" x="2832" y="2304" name="Rc" orien="R0" />
        <iomarker fontsize="28" x="2832" y="2048" name="Qd" orien="R0" />
        <iomarker fontsize="28" x="2832" y="1696" name="Qc" orien="R0" />
        <iomarker fontsize="28" x="2832" y="1344" name="Qb" orien="R0" />
        <iomarker fontsize="28" x="2832" y="976" name="Qa" orien="R0" />
    </sheet>
</drawing>