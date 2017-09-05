<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_11" />
        <signal name="CLOCK_INIT" />
        <signal name="in_sig" />
        <signal name="XLXN_36" />
        <signal name="XLXN_37" />
        <signal name="XLXN_39" />
        <signal name="XLXN_41" />
        <signal name="XLXN_45" />
        <signal name="XLXN_46" />
        <signal name="XLXN_48" />
        <signal name="XLXN_50" />
        <signal name="XLXN_54" />
        <signal name="XLXN_55" />
        <signal name="XLXN_57" />
        <signal name="XLXN_59" />
        <signal name="RESET_INIT" />
        <port polarity="Input" name="CLOCK_INIT" />
        <port polarity="Input" name="in_sig" />
        <port polarity="Output" name="RESET_INIT" />
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
        </blockdef>
        <block symbolname="fd" name="XLXI_7">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_7" name="D" />
            <blockpin signalname="XLXN_41" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_3">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_8" name="D" />
            <blockpin signalname="XLXN_7" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_2">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_11" name="D" />
            <blockpin signalname="XLXN_8" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_1">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="in_sig" name="D" />
            <blockpin signalname="XLXN_11" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_36">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_36" name="D" />
            <blockpin signalname="XLXN_50" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_37">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_37" name="D" />
            <blockpin signalname="XLXN_36" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_38">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_39" name="D" />
            <blockpin signalname="XLXN_37" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_39">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_41" name="D" />
            <blockpin signalname="XLXN_39" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_40">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_45" name="D" />
            <blockpin signalname="XLXN_59" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_41">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_46" name="D" />
            <blockpin signalname="XLXN_45" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_42">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_48" name="D" />
            <blockpin signalname="XLXN_46" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_43">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_50" name="D" />
            <blockpin signalname="XLXN_48" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_44">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_54" name="D" />
            <blockpin signalname="RESET_INIT" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_45">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_55" name="D" />
            <blockpin signalname="XLXN_54" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_46">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_57" name="D" />
            <blockpin signalname="XLXN_55" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_47">
            <attr value="1" name="INIT">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="CLOCK_INIT" name="C" />
            <blockpin signalname="XLXN_59" name="D" />
            <blockpin signalname="XLXN_57" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2560" y="624" name="XLXI_7" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2480" y="496" type="branch" />
            <wire x2="2560" y1="496" y2="496" x1="2480" />
        </branch>
        <instance x="1840" y="624" name="XLXI_3" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1760" y="496" type="branch" />
            <wire x2="1840" y1="496" y2="496" x1="1760" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="2560" y1="368" y2="368" x1="2224" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1824" y1="368" y2="368" x1="1520" />
            <wire x2="1840" y1="368" y2="368" x1="1824" />
        </branch>
        <instance x="1136" y="624" name="XLXI_2" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1056" y="496" type="branch" />
            <wire x2="1136" y1="496" y2="496" x1="1056" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1136" y1="368" y2="368" x1="832" />
        </branch>
        <instance x="448" y="624" name="XLXI_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <wire x2="448" y1="496" y2="496" x1="352" />
        </branch>
        <branch name="in_sig">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="256" y="368" type="branch" />
            <wire x2="256" y1="368" y2="368" x1="192" />
            <wire x2="448" y1="368" y2="368" x1="256" />
        </branch>
        <iomarker fontsize="28" x="352" y="496" name="CLOCK_INIT" orien="R180" />
        <instance x="2560" y="1168" name="XLXI_36" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2480" y="1040" type="branch" />
            <wire x2="2560" y1="1040" y2="1040" x1="2480" />
        </branch>
        <instance x="1840" y="1168" name="XLXI_37" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1760" y="1040" type="branch" />
            <wire x2="1840" y1="1040" y2="1040" x1="1760" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="2560" y1="912" y2="912" x1="2224" />
        </branch>
        <branch name="XLXN_37">
            <wire x2="1824" y1="912" y2="912" x1="1520" />
            <wire x2="1840" y1="912" y2="912" x1="1824" />
        </branch>
        <instance x="1136" y="1168" name="XLXI_38" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1056" y="1040" type="branch" />
            <wire x2="1136" y1="1040" y2="1040" x1="1056" />
        </branch>
        <branch name="XLXN_39">
            <wire x2="1136" y1="912" y2="912" x1="832" />
        </branch>
        <instance x="448" y="1168" name="XLXI_39" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="XLXN_41">
            <attrtext style="alignment:SOFT-TCENTER" attrname="Name" x="256" y="912" type="branch" />
            <wire x2="256" y1="640" y2="912" x1="256" />
            <wire x2="448" y1="912" y2="912" x1="256" />
            <wire x2="3168" y1="640" y2="640" x1="256" />
            <wire x2="3168" y1="368" y2="368" x1="2944" />
            <wire x2="3168" y1="368" y2="640" x1="3168" />
        </branch>
        <instance x="2560" y="1744" name="XLXI_40" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2480" y="1616" type="branch" />
            <wire x2="2560" y1="1616" y2="1616" x1="2480" />
        </branch>
        <instance x="1840" y="1744" name="XLXI_41" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1760" y="1616" type="branch" />
            <wire x2="1840" y1="1616" y2="1616" x1="1760" />
        </branch>
        <branch name="XLXN_45">
            <wire x2="2560" y1="1488" y2="1488" x1="2224" />
        </branch>
        <branch name="XLXN_46">
            <wire x2="1824" y1="1488" y2="1488" x1="1520" />
            <wire x2="1840" y1="1488" y2="1488" x1="1824" />
        </branch>
        <instance x="1136" y="1744" name="XLXI_42" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1056" y="1616" type="branch" />
            <wire x2="1136" y1="1616" y2="1616" x1="1056" />
        </branch>
        <branch name="XLXN_48">
            <wire x2="1136" y1="1488" y2="1488" x1="832" />
        </branch>
        <instance x="448" y="1744" name="XLXI_43" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="352" y="1616" type="branch" />
            <wire x2="448" y1="1616" y2="1616" x1="352" />
        </branch>
        <branch name="XLXN_50">
            <attrtext style="alignment:SOFT-TCENTER" attrname="Name" x="256" y="1488" type="branch" />
            <wire x2="256" y1="1200" y2="1488" x1="256" />
            <wire x2="448" y1="1488" y2="1488" x1="256" />
            <wire x2="3168" y1="1200" y2="1200" x1="256" />
            <wire x2="3168" y1="912" y2="912" x1="2944" />
            <wire x2="3168" y1="912" y2="1200" x1="3168" />
        </branch>
        <instance x="2560" y="2256" name="XLXI_44" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2480" y="2128" type="branch" />
            <wire x2="2560" y1="2128" y2="2128" x1="2480" />
        </branch>
        <instance x="1840" y="2256" name="XLXI_45" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1760" y="2128" type="branch" />
            <wire x2="1840" y1="2128" y2="2128" x1="1760" />
        </branch>
        <branch name="XLXN_54">
            <wire x2="2560" y1="2000" y2="2000" x1="2224" />
        </branch>
        <branch name="XLXN_55">
            <wire x2="1824" y1="2000" y2="2000" x1="1520" />
            <wire x2="1840" y1="2000" y2="2000" x1="1824" />
        </branch>
        <instance x="1136" y="2256" name="XLXI_46" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1056" y="2128" type="branch" />
            <wire x2="1136" y1="2128" y2="2128" x1="1056" />
        </branch>
        <branch name="XLXN_57">
            <wire x2="1136" y1="2000" y2="2000" x1="832" />
        </branch>
        <instance x="448" y="2256" name="XLXI_47" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-408" type="instance" />
        </instance>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="352" y="2128" type="branch" />
            <wire x2="448" y1="2128" y2="2128" x1="352" />
        </branch>
        <branch name="XLXN_59">
            <attrtext style="alignment:SOFT-TCENTER" attrname="Name" x="256" y="2000" type="branch" />
            <wire x2="256" y1="1744" y2="2000" x1="256" />
            <wire x2="448" y1="2000" y2="2000" x1="256" />
            <wire x2="3168" y1="1744" y2="1744" x1="256" />
            <wire x2="3168" y1="1488" y2="1488" x1="2944" />
            <wire x2="3168" y1="1488" y2="1744" x1="3168" />
        </branch>
        <branch name="RESET_INIT">
            <wire x2="3168" y1="2000" y2="2000" x1="2944" />
        </branch>
        <branch name="CLOCK_INIT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="352" y="1040" type="branch" />
            <wire x2="448" y1="1040" y2="1040" x1="352" />
        </branch>
        <iomarker fontsize="28" x="3168" y="2000" name="RESET_INIT" orien="R0" />
        <iomarker fontsize="28" x="192" y="368" name="in_sig" orien="R180" />
    </sheet>
</drawing>