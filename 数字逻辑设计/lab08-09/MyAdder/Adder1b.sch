<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="A" />
        <signal name="B" />
        <signal name="Cin" />
        <signal name="S" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="Cout" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="Cin" />
        <port polarity="Output" name="S" />
        <port polarity="Output" name="Cout" />
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
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
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <block symbolname="xor2" name="XLXI_1">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_2">
            <blockpin signalname="Cin" name="I0" />
            <blockpin signalname="XLXN_1" name="I1" />
            <blockpin signalname="S" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="Cin" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="Cin" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_6">
            <blockpin signalname="XLXN_10" name="I0" />
            <blockpin signalname="XLXN_9" name="I1" />
            <blockpin signalname="XLXN_8" name="I2" />
            <blockpin signalname="Cout" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1184" y="576" name="XLXI_1" orien="R0" />
        <instance x="1472" y="656" name="XLXI_2" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1456" y1="480" y2="480" x1="1440" />
            <wire x2="1456" y1="480" y2="528" x1="1456" />
            <wire x2="1472" y1="528" y2="528" x1="1456" />
        </branch>
        <branch name="A">
            <wire x2="848" y1="448" y2="448" x1="736" />
            <wire x2="1168" y1="448" y2="448" x1="848" />
            <wire x2="1184" y1="448" y2="448" x1="1168" />
            <wire x2="848" y1="448" y2="832" x1="848" />
            <wire x2="1184" y1="832" y2="832" x1="848" />
            <wire x2="848" y1="832" y2="1152" x1="848" />
            <wire x2="1184" y1="1152" y2="1152" x1="848" />
        </branch>
        <branch name="B">
            <wire x2="928" y1="512" y2="512" x1="736" />
            <wire x2="1168" y1="512" y2="512" x1="928" />
            <wire x2="1184" y1="512" y2="512" x1="1168" />
            <wire x2="928" y1="512" y2="896" x1="928" />
            <wire x2="1184" y1="896" y2="896" x1="928" />
            <wire x2="928" y1="896" y2="992" x1="928" />
            <wire x2="1184" y1="992" y2="992" x1="928" />
        </branch>
        <branch name="Cin">
            <wire x2="1040" y1="592" y2="592" x1="736" />
            <wire x2="1456" y1="592" y2="592" x1="1040" />
            <wire x2="1472" y1="592" y2="592" x1="1456" />
            <wire x2="1040" y1="592" y2="1056" x1="1040" />
            <wire x2="1184" y1="1056" y2="1056" x1="1040" />
            <wire x2="1040" y1="1056" y2="1216" x1="1040" />
            <wire x2="1184" y1="1216" y2="1216" x1="1040" />
        </branch>
        <branch name="S">
            <wire x2="1760" y1="560" y2="560" x1="1728" />
        </branch>
        <iomarker fontsize="28" x="1760" y="560" name="S" orien="R0" />
        <instance x="1184" y="960" name="XLXI_3" orien="R0" />
        <instance x="1184" y="1120" name="XLXI_4" orien="R0" />
        <instance x="1184" y="1280" name="XLXI_5" orien="R0" />
        <instance x="1488" y="1152" name="XLXI_6" orien="R0" />
        <branch name="XLXN_8">
            <wire x2="1488" y1="864" y2="864" x1="1440" />
            <wire x2="1488" y1="864" y2="960" x1="1488" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1488" y1="1024" y2="1024" x1="1440" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="1488" y1="1184" y2="1184" x1="1440" />
            <wire x2="1488" y1="1088" y2="1184" x1="1488" />
        </branch>
        <branch name="Cout">
            <wire x2="1760" y1="1024" y2="1024" x1="1744" />
        </branch>
        <iomarker fontsize="28" x="1760" y="1024" name="Cout" orien="R0" />
        <iomarker fontsize="28" x="736" y="592" name="Cin" orien="R180" />
        <iomarker fontsize="28" x="736" y="512" name="B" orien="R180" />
        <iomarker fontsize="28" x="736" y="448" name="A" orien="R180" />
    </sheet>
</drawing>