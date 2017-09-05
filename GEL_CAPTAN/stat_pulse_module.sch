<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="master_clk" />
        <signal name="adc_fifo_overflow" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="ethernet_fifo_overflow" />
        <signal name="reset" />
        <signal name="new_peak" />
        <signal name="ethernet_fifo_in_en" />
        <signal name="stat_ethernet_fifo_in_en" />
        <signal name="stat_b_data(63:0)" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="new_stat" />
        <port polarity="Input" name="master_clk" />
        <port polarity="Input" name="adc_fifo_overflow" />
        <port polarity="Input" name="ethernet_fifo_overflow" />
        <port polarity="Input" name="reset" />
        <port polarity="Input" name="new_peak" />
        <port polarity="Input" name="ethernet_fifo_in_en" />
        <port polarity="Output" name="stat_ethernet_fifo_in_en" />
        <port polarity="Output" name="stat_b_data(63:0)" />
        <port polarity="Output" name="new_stat" />
        <blockdef name="stat_pulse">
            <timestamp>2017-8-4T18:5:12</timestamp>
            <line x2="608" y1="160" y2="160" x1="544" />
            <line x2="608" y1="32" y2="32" x1="544" />
            <line x2="608" y1="96" y2="96" x1="544" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="608" y1="-352" y2="-352" x1="544" />
            <rect width="64" x="544" y="-44" height="24" />
            <line x2="608" y1="-32" y2="-32" x1="544" />
            <rect width="480" x="64" y="-384" height="576" />
        </blockdef>
        <blockdef name="ild">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <block symbolname="stat_pulse" name="XLXI_1">
            <blockpin signalname="master_clk" name="master_clk" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_7" name="adc_fifo_overflow" />
            <blockpin signalname="XLXN_8" name="ethernet_fifo_overflow" />
            <blockpin signalname="new_peak" name="new_peak" />
            <blockpin signalname="ethernet_fifo_in_en" name="ethernet_fifo_in_en" />
            <blockpin signalname="XLXN_19" name="adc_fifo_overflow_lat_res" />
            <blockpin signalname="XLXN_21" name="ethernet_fifo_overflow_lat_res" />
            <blockpin signalname="stat_ethernet_fifo_in_en" name="stat_ethernet_fifo_in_en" />
            <blockpin signalname="stat_b_data(63:0)" name="tx_data(63:0)" />
            <blockpin signalname="new_stat" name="new_stat" />
        </block>
        <block symbolname="ild" name="XLXI_2">
            <blockpin signalname="adc_fifo_overflow" name="D" />
            <blockpin signalname="XLXN_19" name="G" />
            <blockpin signalname="XLXN_7" name="Q" />
        </block>
        <block symbolname="ild" name="XLXI_3">
            <blockpin signalname="ethernet_fifo_overflow" name="D" />
            <blockpin signalname="XLXN_21" name="G" />
            <blockpin signalname="XLXN_8" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1392" y="1552" name="XLXI_1" orien="R0">
        </instance>
        <branch name="master_clk">
            <wire x2="1392" y1="1200" y2="1200" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1200" name="master_clk" orien="R180" />
        <instance x="384" y="1536" name="XLXI_2" orien="R0" />
        <instance x="400" y="1968" name="XLXI_3" orien="R0" />
        <branch name="adc_fifo_overflow">
            <wire x2="384" y1="1280" y2="1280" x1="352" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1072" y1="1280" y2="1280" x1="768" />
            <wire x2="1072" y1="1280" y2="1328" x1="1072" />
            <wire x2="1392" y1="1328" y2="1328" x1="1072" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1088" y1="1712" y2="1712" x1="784" />
            <wire x2="1088" y1="1392" y2="1712" x1="1088" />
            <wire x2="1392" y1="1392" y2="1392" x1="1088" />
        </branch>
        <branch name="ethernet_fifo_overflow">
            <wire x2="400" y1="1712" y2="1712" x1="336" />
        </branch>
        <iomarker fontsize="28" x="352" y="1280" name="adc_fifo_overflow" orien="R180" />
        <iomarker fontsize="28" x="336" y="1712" name="ethernet_fifo_overflow" orien="R180" />
        <branch name="reset">
            <wire x2="1392" y1="1264" y2="1264" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1264" name="reset" orien="R180" />
        <branch name="new_peak">
            <wire x2="1392" y1="1456" y2="1456" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1456" name="new_peak" orien="R180" />
        <branch name="ethernet_fifo_in_en">
            <wire x2="1392" y1="1520" y2="1520" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1520" name="ethernet_fifo_in_en" orien="R180" />
        <branch name="stat_ethernet_fifo_in_en">
            <wire x2="2016" y1="1200" y2="1200" x1="2000" />
        </branch>
        <branch name="stat_b_data(63:0)">
            <wire x2="2016" y1="1520" y2="1520" x1="2000" />
        </branch>
        <iomarker fontsize="28" x="2016" y="1200" name="stat_ethernet_fifo_in_en" orien="R0" />
        <iomarker fontsize="28" x="2016" y="1520" name="stat_b_data(63:0)" orien="R0" />
        <branch name="XLXN_19">
            <wire x2="368" y1="1408" y2="1984" x1="368" />
            <wire x2="2128" y1="1984" y2="1984" x1="368" />
            <wire x2="384" y1="1408" y2="1408" x1="368" />
            <wire x2="2128" y1="1584" y2="1584" x1="2000" />
            <wire x2="2128" y1="1584" y2="1984" x1="2128" />
        </branch>
        <branch name="XLXN_21">
            <wire x2="400" y1="1840" y2="1840" x1="336" />
            <wire x2="336" y1="1840" y2="1968" x1="336" />
            <wire x2="2096" y1="1968" y2="1968" x1="336" />
            <wire x2="2096" y1="1648" y2="1648" x1="2000" />
            <wire x2="2096" y1="1648" y2="1968" x1="2096" />
        </branch>
        <branch name="new_stat">
            <wire x2="2032" y1="1712" y2="1712" x1="2000" />
        </branch>
        <iomarker fontsize="28" x="2032" y="1712" name="new_stat" orien="R0" />
    </sheet>
</drawing>