<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="D2" />
        <signal name="D3" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="D0" />
        <signal name="D1" />
        <signal name="XLXN_38" />
        <signal name="XLXN_39" />
        <signal name="XLXN_40" />
        <signal name="XLXN_41" />
        <signal name="XLXN_42" />
        <signal name="XLXN_43" />
        <signal name="XLXN_44" />
        <signal name="XLXN_45" />
        <signal name="XLXN_46" />
        <signal name="XLXN_47" />
        <signal name="XLXN_48" />
        <signal name="XLXN_49" />
        <signal name="XLXN_50" />
        <signal name="XLXN_51" />
        <signal name="XLXN_53" />
        <signal name="XLXN_54" />
        <signal name="XLXN_55" />
        <signal name="XLXN_58" />
        <signal name="XLXN_59" />
        <signal name="XLXN_60" />
        <signal name="XLXN_61" />
        <signal name="XLXN_62" />
        <signal name="XLXN_63" />
        <signal name="XLXN_64" />
        <signal name="XLXN_65" />
        <signal name="XLXN_66" />
        <signal name="XLXN_67" />
        <signal name="XLXN_68" />
        <signal name="g" />
        <signal name="f" />
        <signal name="e" />
        <signal name="d" />
        <signal name="c" />
        <signal name="b" />
        <signal name="a" />
        <signal name="point" />
        <signal name="p" />
        <signal name="LE" />
        <port polarity="Input" name="D2" />
        <port polarity="Input" name="D3" />
        <port polarity="Input" name="D0" />
        <port polarity="Input" name="D1" />
        <port polarity="Output" name="g" />
        <port polarity="Output" name="f" />
        <port polarity="Output" name="e" />
        <port polarity="Output" name="d" />
        <port polarity="Output" name="c" />
        <port polarity="Output" name="b" />
        <port polarity="Output" name="a" />
        <port polarity="Input" name="point" />
        <port polarity="Output" name="p" />
        <port polarity="Input" name="LE" />
        <blockdef name="and4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="144" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="and4" name="XLXI_1">
            <blockpin signalname="XLXN_10" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="XLXN_38" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_2">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_13" name="I3" />
            <blockpin signalname="XLXN_39" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_3">
            <blockpin signalname="XLXN_11" name="I0" />
            <blockpin signalname="XLXN_14" name="I1" />
            <blockpin signalname="XLXN_13" name="I2" />
            <blockpin signalname="XLXN_40" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_4">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="XLXN_13" name="I2" />
            <blockpin signalname="XLXN_41" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_5">
            <blockpin signalname="D1" name="I0" />
            <blockpin signalname="XLXN_14" name="I1" />
            <blockpin signalname="XLXN_13" name="I2" />
            <blockpin signalname="XLXN_42" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_6">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_14" name="I1" />
            <blockpin signalname="XLXN_13" name="I2" />
            <blockpin signalname="XLXN_43" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_7">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="XLXN_14" name="I2" />
            <blockpin signalname="XLXN_44" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_8">
            <blockpin signalname="XLXN_11" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="XLXN_13" name="I2" />
            <blockpin signalname="XLXN_45" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_10">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_13" name="I1" />
            <blockpin signalname="XLXN_46" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_11">
            <blockpin signalname="XLXN_10" name="I0" />
            <blockpin signalname="XLXN_14" name="I1" />
            <blockpin signalname="D1" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="XLXN_47" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_12">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_48" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_13">
            <blockpin signalname="D1" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="D3" name="I2" />
            <blockpin signalname="XLXN_49" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_14">
            <blockpin signalname="XLXN_10" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="XLXN_14" name="I2" />
            <blockpin signalname="XLXN_13" name="I3" />
            <blockpin signalname="XLXN_50" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_15">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D3" name="I2" />
            <blockpin signalname="XLXN_51" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_16">
            <blockpin signalname="XLXN_10" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="D3" name="I2" />
            <blockpin signalname="XLXN_61" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_17">
            <blockpin signalname="XLXN_10" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_53" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_18">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_13" name="I3" />
            <blockpin signalname="XLXN_54" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_19">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="XLXN_14" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="XLXN_55" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_20">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="XLXN_59" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_21">
            <blockpin signalname="XLXN_10" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_13" name="I3" />
            <blockpin signalname="XLXN_60" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_22">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_14" name="I1" />
            <blockpin signalname="XLXN_11" name="I2" />
            <blockpin signalname="XLXN_13" name="I3" />
            <blockpin signalname="XLXN_58" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_23">
            <blockpin signalname="XLXN_38" name="I0" />
            <blockpin signalname="XLXN_39" name="I1" />
            <blockpin signalname="XLXN_40" name="I2" />
            <blockpin signalname="XLXN_62" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_24">
            <blockpin signalname="XLXN_41" name="I0" />
            <blockpin signalname="XLXN_42" name="I1" />
            <blockpin signalname="XLXN_43" name="I2" />
            <blockpin signalname="XLXN_59" name="I3" />
            <blockpin signalname="XLXN_63" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_25">
            <blockpin signalname="XLXN_44" name="I0" />
            <blockpin signalname="XLXN_45" name="I1" />
            <blockpin signalname="XLXN_46" name="I2" />
            <blockpin signalname="XLXN_64" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_26">
            <blockpin signalname="XLXN_47" name="I0" />
            <blockpin signalname="XLXN_48" name="I1" />
            <blockpin signalname="XLXN_60" name="I2" />
            <blockpin signalname="XLXN_58" name="I3" />
            <blockpin signalname="XLXN_65" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_27">
            <blockpin signalname="XLXN_49" name="I0" />
            <blockpin signalname="XLXN_50" name="I1" />
            <blockpin signalname="XLXN_61" name="I2" />
            <blockpin signalname="XLXN_66" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_28">
            <blockpin signalname="XLXN_51" name="I0" />
            <blockpin signalname="XLXN_61" name="I1" />
            <blockpin signalname="XLXN_53" name="I2" />
            <blockpin signalname="XLXN_54" name="I3" />
            <blockpin signalname="XLXN_67" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_29">
            <blockpin signalname="XLXN_55" name="I0" />
            <blockpin signalname="XLXN_59" name="I1" />
            <blockpin signalname="XLXN_60" name="I2" />
            <blockpin signalname="XLXN_58" name="I3" />
            <blockpin signalname="XLXN_68" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_30">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_62" name="I1" />
            <blockpin signalname="g" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_31">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_63" name="I1" />
            <blockpin signalname="f" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_32">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_64" name="I1" />
            <blockpin signalname="e" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_33">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_65" name="I1" />
            <blockpin signalname="d" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_34">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_66" name="I1" />
            <blockpin signalname="c" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_35">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_67" name="I1" />
            <blockpin signalname="b" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_36">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_68" name="I1" />
            <blockpin signalname="a" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_37">
            <blockpin signalname="D0" name="I" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_38">
            <blockpin signalname="D1" name="I" />
            <blockpin signalname="XLXN_11" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_39">
            <blockpin signalname="D2" name="I" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_40">
            <blockpin signalname="D3" name="I" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_41">
            <blockpin signalname="point" name="I" />
            <blockpin signalname="p" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="-32" y="1584" name="XLXI_1" orien="R90" />
        <instance x="192" y="1584" name="XLXI_2" orien="R90" />
        <instance x="416" y="1584" name="XLXI_3" orien="R90" />
        <instance x="576" y="1584" name="XLXI_4" orien="R90" />
        <instance x="736" y="1584" name="XLXI_5" orien="R90" />
        <instance x="896" y="1584" name="XLXI_6" orien="R90" />
        <instance x="1056" y="1584" name="XLXI_7" orien="R90" />
        <instance x="1216" y="1584" name="XLXI_8" orien="R90" />
        <instance x="1392" y="1584" name="XLXI_10" orien="R90" />
        <instance x="1504" y="1584" name="XLXI_11" orien="R90" />
        <instance x="1728" y="1584" name="XLXI_12" orien="R90" />
        <instance x="1888" y="1584" name="XLXI_13" orien="R90" />
        <instance x="2048" y="1584" name="XLXI_14" orien="R90" />
        <instance x="2272" y="1584" name="XLXI_15" orien="R90" />
        <instance x="2432" y="1584" name="XLXI_16" orien="R90" />
        <instance x="2592" y="1584" name="XLXI_17" orien="R90" />
        <instance x="2752" y="1584" name="XLXI_18" orien="R90" />
        <instance x="2976" y="1584" name="XLXI_19" orien="R90" />
        <instance x="3200" y="1584" name="XLXI_20" orien="R90" />
        <instance x="3424" y="1584" name="XLXI_21" orien="R90" />
        <instance x="3648" y="1584" name="XLXI_22" orien="R90" />
        <instance x="224" y="2032" name="XLXI_23" orien="R90" />
        <instance x="704" y="2032" name="XLXI_24" orien="R90" />
        <instance x="1216" y="2032" name="XLXI_25" orien="R90" />
        <instance x="1600" y="2032" name="XLXI_26" orien="R90" />
        <instance x="1984" y="2032" name="XLXI_27" orien="R90" />
        <instance x="2480" y="2032" name="XLXI_28" orien="R90" />
        <instance x="3312" y="2032" name="XLXI_29" orien="R90" />
        <instance x="224" y="2496" name="XLXI_30" orien="R90" />
        <instance x="736" y="2496" name="XLXI_31" orien="R90" />
        <instance x="1216" y="2496" name="XLXI_32" orien="R90" />
        <instance x="1632" y="2496" name="XLXI_33" orien="R90" />
        <instance x="1984" y="2496" name="XLXI_34" orien="R90" />
        <instance x="2512" y="2496" name="XLXI_35" orien="R90" />
        <instance x="3344" y="2496" name="XLXI_36" orien="R90" />
        <branch name="D2">
            <wire x2="160" y1="1024" y2="1584" x1="160" />
            <wire x2="384" y1="1024" y2="1024" x1="160" />
            <wire x2="384" y1="1024" y2="1584" x1="384" />
            <wire x2="1344" y1="1024" y2="1024" x1="384" />
            <wire x2="1344" y1="1024" y2="1584" x1="1344" />
            <wire x2="1920" y1="1024" y2="1024" x1="1344" />
            <wire x2="1920" y1="1024" y2="1584" x1="1920" />
            <wire x2="2016" y1="1024" y2="1024" x1="1920" />
            <wire x2="2016" y1="1024" y2="1584" x1="2016" />
            <wire x2="2560" y1="1024" y2="1024" x1="2016" />
            <wire x2="2560" y1="1024" y2="1584" x1="2560" />
            <wire x2="2784" y1="1024" y2="1024" x1="2560" />
            <wire x2="2784" y1="1024" y2="1584" x1="2784" />
            <wire x2="2944" y1="1024" y2="1024" x1="2784" />
            <wire x2="2944" y1="1024" y2="1584" x1="2944" />
            <wire x2="3392" y1="1024" y2="1024" x1="2944" />
            <wire x2="3504" y1="1024" y2="1024" x1="3392" />
            <wire x2="3616" y1="1024" y2="1024" x1="3504" />
            <wire x2="3616" y1="1024" y2="1584" x1="3616" />
            <wire x2="3392" y1="1024" y2="1584" x1="3392" />
            <wire x2="3504" y1="640" y2="1024" x1="3504" />
            <wire x2="3632" y1="640" y2="640" x1="3504" />
            <wire x2="3632" y1="640" y2="704" x1="3632" />
            <wire x2="3632" y1="576" y2="640" x1="3632" />
        </branch>
        <branch name="D3">
            <wire x2="224" y1="1056" y2="1584" x1="224" />
            <wire x2="1760" y1="1056" y2="1056" x1="224" />
            <wire x2="1760" y1="1056" y2="1584" x1="1760" />
            <wire x2="2080" y1="1056" y2="1056" x1="1760" />
            <wire x2="2080" y1="1056" y2="1584" x1="2080" />
            <wire x2="2464" y1="1056" y2="1056" x1="2080" />
            <wire x2="2464" y1="1056" y2="1584" x1="2464" />
            <wire x2="2624" y1="1056" y2="1056" x1="2464" />
            <wire x2="2624" y1="1056" y2="1584" x1="2624" />
            <wire x2="3232" y1="1056" y2="1056" x1="2624" />
            <wire x2="3232" y1="1056" y2="1584" x1="3232" />
            <wire x2="3456" y1="1056" y2="1056" x1="3232" />
            <wire x2="3456" y1="1056" y2="1584" x1="3456" />
            <wire x2="3792" y1="1056" y2="1056" x1="3456" />
            <wire x2="3792" y1="640" y2="1056" x1="3792" />
            <wire x2="3904" y1="640" y2="640" x1="3792" />
            <wire x2="3904" y1="640" y2="704" x1="3904" />
            <wire x2="3904" y1="576" y2="640" x1="3904" />
        </branch>
        <iomarker fontsize="28" x="3168" y="576" name="D0" orien="R270" />
        <branch name="XLXN_13">
            <wire x2="448" y1="1344" y2="1584" x1="448" />
            <wire x2="608" y1="1344" y2="1344" x1="448" />
            <wire x2="608" y1="1344" y2="1584" x1="608" />
            <wire x2="768" y1="1344" y2="1344" x1="608" />
            <wire x2="768" y1="1344" y2="1584" x1="768" />
            <wire x2="928" y1="1344" y2="1344" x1="768" />
            <wire x2="928" y1="1344" y2="1584" x1="928" />
            <wire x2="1088" y1="1344" y2="1344" x1="928" />
            <wire x2="1088" y1="1344" y2="1584" x1="1088" />
            <wire x2="1408" y1="1344" y2="1344" x1="1088" />
            <wire x2="1408" y1="1344" y2="1584" x1="1408" />
            <wire x2="1520" y1="1344" y2="1344" x1="1408" />
            <wire x2="1520" y1="1344" y2="1584" x1="1520" />
            <wire x2="2304" y1="1344" y2="1344" x1="1520" />
            <wire x2="2304" y1="1344" y2="1584" x1="2304" />
            <wire x2="3008" y1="1344" y2="1344" x1="2304" />
            <wire x2="3008" y1="1344" y2="1584" x1="3008" />
            <wire x2="3680" y1="1344" y2="1344" x1="3008" />
            <wire x2="3680" y1="1344" y2="1584" x1="3680" />
            <wire x2="3904" y1="1344" y2="1344" x1="3680" />
            <wire x2="3904" y1="1344" y2="1584" x1="3904" />
            <wire x2="3904" y1="928" y2="1344" x1="3904" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="544" y1="1312" y2="1584" x1="544" />
            <wire x2="864" y1="1312" y2="1312" x1="544" />
            <wire x2="864" y1="1312" y2="1584" x1="864" />
            <wire x2="1024" y1="1312" y2="1312" x1="864" />
            <wire x2="1024" y1="1312" y2="1584" x1="1024" />
            <wire x2="1248" y1="1312" y2="1312" x1="1024" />
            <wire x2="1248" y1="1312" y2="1584" x1="1248" />
            <wire x2="1632" y1="1312" y2="1312" x1="1248" />
            <wire x2="1632" y1="1312" y2="1584" x1="1632" />
            <wire x2="2240" y1="1312" y2="1312" x1="1632" />
            <wire x2="2240" y1="1312" y2="1584" x1="2240" />
            <wire x2="3168" y1="1312" y2="1312" x1="2240" />
            <wire x2="3168" y1="1312" y2="1584" x1="3168" />
            <wire x2="3632" y1="1312" y2="1312" x1="3168" />
            <wire x2="3776" y1="1312" y2="1312" x1="3632" />
            <wire x2="3776" y1="1312" y2="1584" x1="3776" />
            <wire x2="3632" y1="928" y2="1312" x1="3632" />
        </branch>
        <branch name="D0">
            <wire x2="256" y1="960" y2="1584" x1="256" />
            <wire x2="640" y1="960" y2="960" x1="256" />
            <wire x2="640" y1="960" y2="1584" x1="640" />
            <wire x2="960" y1="960" y2="960" x1="640" />
            <wire x2="960" y1="960" y2="1584" x1="960" />
            <wire x2="1120" y1="960" y2="960" x1="960" />
            <wire x2="1120" y1="960" y2="1584" x1="1120" />
            <wire x2="1456" y1="960" y2="960" x1="1120" />
            <wire x2="1456" y1="960" y2="1584" x1="1456" />
            <wire x2="1792" y1="960" y2="960" x1="1456" />
            <wire x2="1792" y1="960" y2="1584" x1="1792" />
            <wire x2="2336" y1="960" y2="960" x1="1792" />
            <wire x2="2336" y1="960" y2="1584" x1="2336" />
            <wire x2="2816" y1="960" y2="960" x1="2336" />
            <wire x2="2992" y1="960" y2="960" x1="2816" />
            <wire x2="3040" y1="960" y2="960" x1="2992" />
            <wire x2="3040" y1="960" y2="1584" x1="3040" />
            <wire x2="3264" y1="960" y2="960" x1="3040" />
            <wire x2="3264" y1="960" y2="1584" x1="3264" />
            <wire x2="3712" y1="960" y2="960" x1="3264" />
            <wire x2="3712" y1="960" y2="1584" x1="3712" />
            <wire x2="2816" y1="960" y2="1584" x1="2816" />
            <wire x2="3168" y1="640" y2="640" x1="2992" />
            <wire x2="3168" y1="640" y2="704" x1="3168" />
            <wire x2="2992" y1="640" y2="960" x1="2992" />
            <wire x2="3168" y1="576" y2="640" x1="3168" />
        </branch>
        <instance x="3136" y="704" name="XLXI_37" orien="R90" />
        <branch name="XLXN_10">
            <wire x2="32" y1="1248" y2="1584" x1="32" />
            <wire x2="1568" y1="1248" y2="1248" x1="32" />
            <wire x2="1568" y1="1248" y2="1584" x1="1568" />
            <wire x2="2112" y1="1248" y2="1248" x1="1568" />
            <wire x2="2112" y1="1248" y2="1584" x1="2112" />
            <wire x2="2496" y1="1248" y2="1248" x1="2112" />
            <wire x2="2496" y1="1248" y2="1584" x1="2496" />
            <wire x2="2656" y1="1248" y2="1248" x1="2496" />
            <wire x2="3168" y1="1248" y2="1248" x1="2656" />
            <wire x2="3488" y1="1248" y2="1248" x1="3168" />
            <wire x2="3488" y1="1248" y2="1584" x1="3488" />
            <wire x2="2656" y1="1248" y2="1584" x1="2656" />
            <wire x2="3168" y1="928" y2="1248" x1="3168" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="96" y1="1280" y2="1584" x1="96" />
            <wire x2="480" y1="1280" y2="1280" x1="96" />
            <wire x2="480" y1="1280" y2="1584" x1="480" />
            <wire x2="1184" y1="1280" y2="1280" x1="480" />
            <wire x2="1184" y1="1280" y2="1584" x1="1184" />
            <wire x2="1280" y1="1280" y2="1280" x1="1184" />
            <wire x2="1280" y1="1280" y2="1584" x1="1280" />
            <wire x2="2880" y1="1280" y2="1280" x1="1280" />
            <wire x2="2880" y1="1280" y2="1584" x1="2880" />
            <wire x2="3328" y1="1280" y2="1280" x1="2880" />
            <wire x2="3328" y1="1280" y2="1584" x1="3328" />
            <wire x2="3376" y1="1280" y2="1280" x1="3328" />
            <wire x2="3552" y1="1280" y2="1280" x1="3376" />
            <wire x2="3552" y1="1280" y2="1584" x1="3552" />
            <wire x2="3840" y1="1280" y2="1280" x1="3552" />
            <wire x2="3840" y1="1280" y2="1584" x1="3840" />
            <wire x2="3376" y1="928" y2="1280" x1="3376" />
        </branch>
        <instance x="3344" y="704" name="XLXI_38" orien="R90" />
        <iomarker fontsize="28" x="3376" y="576" name="D1" orien="R270" />
        <branch name="D1">
            <wire x2="320" y1="992" y2="1584" x1="320" />
            <wire x2="704" y1="992" y2="992" x1="320" />
            <wire x2="704" y1="992" y2="1584" x1="704" />
            <wire x2="800" y1="992" y2="992" x1="704" />
            <wire x2="800" y1="992" y2="1584" x1="800" />
            <wire x2="1696" y1="992" y2="992" x1="800" />
            <wire x2="1696" y1="992" y2="1584" x1="1696" />
            <wire x2="1856" y1="992" y2="992" x1="1696" />
            <wire x2="1856" y1="992" y2="1584" x1="1856" />
            <wire x2="1952" y1="992" y2="992" x1="1856" />
            <wire x2="1952" y1="992" y2="1584" x1="1952" />
            <wire x2="2176" y1="992" y2="992" x1="1952" />
            <wire x2="2176" y1="992" y2="1584" x1="2176" />
            <wire x2="2400" y1="992" y2="992" x1="2176" />
            <wire x2="2400" y1="992" y2="1584" x1="2400" />
            <wire x2="2720" y1="992" y2="992" x1="2400" />
            <wire x2="2720" y1="992" y2="1584" x1="2720" />
            <wire x2="3104" y1="992" y2="992" x1="2720" />
            <wire x2="3104" y1="992" y2="1584" x1="3104" />
            <wire x2="3312" y1="992" y2="992" x1="3104" />
            <wire x2="3312" y1="640" y2="992" x1="3312" />
            <wire x2="3376" y1="640" y2="640" x1="3312" />
            <wire x2="3376" y1="640" y2="704" x1="3376" />
            <wire x2="3376" y1="576" y2="640" x1="3376" />
        </branch>
        <instance x="3600" y="704" name="XLXI_39" orien="R90" />
        <iomarker fontsize="28" x="3632" y="576" name="D2" orien="R270" />
        <instance x="3872" y="704" name="XLXI_40" orien="R90" />
        <iomarker fontsize="28" x="3904" y="576" name="D3" orien="R270" />
        <branch name="XLXN_38">
            <wire x2="128" y1="1840" y2="2032" x1="128" />
            <wire x2="288" y1="2032" y2="2032" x1="128" />
        </branch>
        <branch name="XLXN_39">
            <wire x2="352" y1="1840" y2="2032" x1="352" />
        </branch>
        <branch name="XLXN_40">
            <wire x2="544" y1="2032" y2="2032" x1="416" />
            <wire x2="544" y1="1840" y2="2032" x1="544" />
        </branch>
        <branch name="XLXN_41">
            <wire x2="704" y1="1840" y2="2032" x1="704" />
            <wire x2="768" y1="2032" y2="2032" x1="704" />
        </branch>
        <branch name="XLXN_42">
            <wire x2="832" y1="1936" y2="2032" x1="832" />
            <wire x2="864" y1="1936" y2="1936" x1="832" />
            <wire x2="864" y1="1840" y2="1936" x1="864" />
        </branch>
        <branch name="XLXN_43">
            <wire x2="896" y1="1936" y2="2032" x1="896" />
            <wire x2="1024" y1="1936" y2="1936" x1="896" />
            <wire x2="1024" y1="1840" y2="1936" x1="1024" />
        </branch>
        <branch name="XLXN_44">
            <wire x2="1184" y1="1840" y2="2032" x1="1184" />
            <wire x2="1280" y1="2032" y2="2032" x1="1184" />
        </branch>
        <branch name="XLXN_45">
            <wire x2="1344" y1="1840" y2="2032" x1="1344" />
        </branch>
        <branch name="XLXN_46">
            <wire x2="1488" y1="2032" y2="2032" x1="1408" />
            <wire x2="1488" y1="1840" y2="2032" x1="1488" />
        </branch>
        <branch name="XLXN_47">
            <wire x2="1664" y1="1840" y2="2032" x1="1664" />
        </branch>
        <branch name="XLXN_48">
            <wire x2="1728" y1="1936" y2="2032" x1="1728" />
            <wire x2="1856" y1="1936" y2="1936" x1="1728" />
            <wire x2="1856" y1="1840" y2="1936" x1="1856" />
        </branch>
        <branch name="XLXN_49">
            <wire x2="2016" y1="1840" y2="2032" x1="2016" />
            <wire x2="2048" y1="2032" y2="2032" x1="2016" />
        </branch>
        <branch name="XLXN_50">
            <wire x2="2208" y1="1888" y2="1888" x1="2112" />
            <wire x2="2112" y1="1888" y2="2032" x1="2112" />
            <wire x2="2208" y1="1840" y2="1888" x1="2208" />
        </branch>
        <branch name="XLXN_51">
            <wire x2="2400" y1="1840" y2="2032" x1="2400" />
            <wire x2="2544" y1="2032" y2="2032" x1="2400" />
        </branch>
        <branch name="XLXN_53">
            <wire x2="2672" y1="1936" y2="2032" x1="2672" />
            <wire x2="2720" y1="1936" y2="1936" x1="2672" />
            <wire x2="2720" y1="1840" y2="1936" x1="2720" />
        </branch>
        <branch name="XLXN_54">
            <wire x2="2912" y1="2032" y2="2032" x1="2736" />
            <wire x2="2912" y1="1840" y2="2032" x1="2912" />
        </branch>
        <branch name="XLXN_55">
            <wire x2="3136" y1="1840" y2="2032" x1="3136" />
            <wire x2="3376" y1="2032" y2="2032" x1="3136" />
        </branch>
        <branch name="XLXN_58">
            <wire x2="3808" y1="2000" y2="2000" x1="1856" />
            <wire x2="3808" y1="2000" y2="2032" x1="3808" />
            <wire x2="1856" y1="2000" y2="2032" x1="1856" />
            <wire x2="3808" y1="2032" y2="2032" x1="3568" />
            <wire x2="3808" y1="1840" y2="2000" x1="3808" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="960" y1="1984" y2="2032" x1="960" />
            <wire x2="3360" y1="1984" y2="1984" x1="960" />
            <wire x2="3440" y1="1984" y2="1984" x1="3360" />
            <wire x2="3440" y1="1984" y2="2032" x1="3440" />
            <wire x2="3360" y1="1840" y2="1984" x1="3360" />
        </branch>
        <branch name="XLXN_60">
            <wire x2="1792" y1="1952" y2="2032" x1="1792" />
            <wire x2="3504" y1="1952" y2="1952" x1="1792" />
            <wire x2="3504" y1="1952" y2="2032" x1="3504" />
            <wire x2="3584" y1="1952" y2="1952" x1="3504" />
            <wire x2="3584" y1="1840" y2="1952" x1="3584" />
        </branch>
        <branch name="XLXN_61">
            <wire x2="2176" y1="1936" y2="2032" x1="2176" />
            <wire x2="2560" y1="1936" y2="1936" x1="2176" />
            <wire x2="2608" y1="1936" y2="1936" x1="2560" />
            <wire x2="2608" y1="1936" y2="2032" x1="2608" />
            <wire x2="2560" y1="1840" y2="1936" x1="2560" />
        </branch>
        <branch name="XLXN_62">
            <wire x2="352" y1="2288" y2="2496" x1="352" />
        </branch>
        <branch name="XLXN_63">
            <wire x2="864" y1="2288" y2="2496" x1="864" />
        </branch>
        <branch name="XLXN_64">
            <wire x2="1344" y1="2288" y2="2496" x1="1344" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="1760" y1="2288" y2="2496" x1="1760" />
        </branch>
        <branch name="XLXN_66">
            <wire x2="2112" y1="2288" y2="2496" x1="2112" />
        </branch>
        <branch name="XLXN_67">
            <wire x2="2640" y1="2288" y2="2496" x1="2640" />
        </branch>
        <branch name="XLXN_68">
            <wire x2="3472" y1="2288" y2="2496" x1="3472" />
        </branch>
        <branch name="g">
            <wire x2="320" y1="2752" y2="2784" x1="320" />
        </branch>
        <iomarker fontsize="28" x="320" y="2784" name="g" orien="R90" />
        <branch name="f">
            <wire x2="832" y1="2752" y2="2784" x1="832" />
        </branch>
        <iomarker fontsize="28" x="832" y="2784" name="f" orien="R90" />
        <branch name="e">
            <wire x2="1312" y1="2752" y2="2784" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1312" y="2784" name="e" orien="R90" />
        <branch name="d">
            <wire x2="1728" y1="2752" y2="2784" x1="1728" />
        </branch>
        <iomarker fontsize="28" x="1728" y="2784" name="d" orien="R90" />
        <branch name="c">
            <wire x2="2080" y1="2752" y2="2784" x1="2080" />
        </branch>
        <iomarker fontsize="28" x="2080" y="2784" name="c" orien="R90" />
        <branch name="b">
            <wire x2="2608" y1="2752" y2="2784" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2608" y="2784" name="b" orien="R90" />
        <branch name="a">
            <wire x2="3440" y1="2752" y2="2784" x1="3440" />
        </branch>
        <iomarker fontsize="28" x="3440" y="2784" name="a" orien="R90" />
        <instance x="4128" y="2320" name="XLXI_41" orien="R90" />
        <branch name="point">
            <wire x2="4160" y1="608" y2="2304" x1="4160" />
            <wire x2="4160" y1="2304" y2="2320" x1="4160" />
        </branch>
        <branch name="p">
            <wire x2="4160" y1="2544" y2="2560" x1="4160" />
            <wire x2="4160" y1="2560" y2="2784" x1="4160" />
        </branch>
        <iomarker fontsize="28" x="4160" y="2784" name="p" orien="R90" />
        <iomarker fontsize="28" x="4160" y="608" name="point" orien="R270" />
        <branch name="LE">
            <wire x2="800" y1="2352" y2="2352" x1="288" />
            <wire x2="1280" y1="2352" y2="2352" x1="800" />
            <wire x2="1696" y1="2352" y2="2352" x1="1280" />
            <wire x2="2048" y1="2352" y2="2352" x1="1696" />
            <wire x2="2576" y1="2352" y2="2352" x1="2048" />
            <wire x2="3408" y1="2352" y2="2352" x1="2576" />
            <wire x2="3888" y1="2352" y2="2352" x1="3408" />
            <wire x2="3408" y1="2352" y2="2496" x1="3408" />
            <wire x2="2576" y1="2352" y2="2496" x1="2576" />
            <wire x2="2048" y1="2352" y2="2496" x1="2048" />
            <wire x2="1696" y1="2352" y2="2368" x1="1696" />
            <wire x2="1696" y1="2368" y2="2496" x1="1696" />
            <wire x2="1280" y1="2352" y2="2496" x1="1280" />
            <wire x2="800" y1="2352" y2="2496" x1="800" />
            <wire x2="288" y1="2352" y2="2496" x1="288" />
        </branch>
        <iomarker fontsize="28" x="3888" y="2352" name="LE" orien="R0" />
    </sheet>
</drawing>