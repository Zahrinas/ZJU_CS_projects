<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A" />
        <signal name="XLXN_2" />
        <signal name="B" />
        <signal name="Ctrl" />
        <signal name="Cin" />
        <signal name="S" />
        <signal name="Cout" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="Ctrl" />
        <port polarity="Input" name="Cin" />
        <port polarity="Output" name="S" />
        <port polarity="Output" name="Cout" />
        <blockdef name="Adder1b">
            <timestamp>2021-11-15T8:21:11</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
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
        <block symbolname="Adder1b" name="XLXI_1">
            <blockpin signalname="A" name="A" />
            <blockpin signalname="XLXN_2" name="B" />
            <blockpin signalname="Cin" name="Cin" />
            <blockpin signalname="S" name="S" />
            <blockpin signalname="Cout" name="Cout" />
        </block>
        <block symbolname="xor2" name="XLXI_2">
            <blockpin signalname="Ctrl" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1840" y="1488" name="XLXI_1" orien="R0">
        </instance>
        <branch name="A">
            <wire x2="1824" y1="1328" y2="1328" x1="1488" />
            <wire x2="1840" y1="1328" y2="1328" x1="1824" />
        </branch>
        <instance x="1184" y="1488" name="XLXI_2" orien="R0" />
        <iomarker fontsize="28" x="1488" y="1328" name="A" orien="R180" />
        <branch name="XLXN_2">
            <wire x2="1840" y1="1392" y2="1392" x1="1440" />
        </branch>
        <branch name="B">
            <wire x2="1184" y1="1360" y2="1360" x1="1152" />
        </branch>
        <iomarker fontsize="28" x="1152" y="1360" name="B" orien="R180" />
        <branch name="Ctrl">
            <wire x2="1184" y1="1424" y2="1424" x1="1152" />
        </branch>
        <iomarker fontsize="28" x="1152" y="1424" name="Ctrl" orien="R180" />
        <branch name="Cin">
            <wire x2="1824" y1="1456" y2="1456" x1="1488" />
            <wire x2="1840" y1="1456" y2="1456" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1488" y="1456" name="Cin" orien="R180" />
        <branch name="S">
            <wire x2="2256" y1="1328" y2="1328" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="2256" y="1328" name="S" orien="R0" />
        <branch name="Cout">
            <wire x2="2256" y1="1456" y2="1456" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="2256" y="1456" name="Cout" orien="R0" />
    </sheet>
</drawing>