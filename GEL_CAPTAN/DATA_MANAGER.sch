<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="data_fifo_rd_data(63:0)" />
        <signal name="tx_info_fifo_src_sel" />
        <signal name="tx_info_fifo_empty" />
        <signal name="tx_info_fifo_data_burst(15:0)" />
        <signal name="tx_info_fifo_wren_burst" />
        <signal name="tx_info_fifo_full" />
        <signal name="tx_info_fifo_rden" />
        <signal name="reset" />
        <signal name="tx_info_fifo_wren_comm" />
        <signal name="tx_info_fifo_data_comm(15:0)" />
        <signal name="tx_info_fifo_dout(15:0)" />
        <signal name="tx_data_fifo_src_sel" />
        <signal name="tx_data_fifo_wren_comm" />
        <signal name="tx_data_fifo_read_enable" />
        <signal name="tx_data_fifo_wren_burst" />
        <signal name="tx_data_fifo_full" />
        <signal name="MASTER_CLK" />
        <signal name="reset_n" />
        <signal name="rx_info_fifo_empty" />
        <signal name="rx_info_fifo_rden" />
        <signal name="info_fifo_rd_data(15:0)" />
        <signal name="rx_data(63:0)" />
        <signal name="rx_data_fifo_read_enable" />
        <signal name="burst_done" />
        <signal name="burst_stop" />
        <signal name="burst_start" />
        <signal name="rx_fifo_reset" />
        <signal name="gec_user_rx_size_out(10:0)" />
        <signal name="gec_user_crc_err" />
        <signal name="gec_user_rx_valid_out" />
        <signal name="gec_user_rx_data_out(7:0)" />
        <signal name="gec_user_busy" />
        <signal name="gec_user_tx_enable_out" />
        <signal name="b_data_we" />
        <signal name="ram_wren" />
        <signal name="ram_addr(63:0)" />
        <signal name="gec_user_tx_data_in(7:0)" />
        <signal name="gec_user_tx_size_in(10:0)" />
        <signal name="gec_user_trigger" />
        <signal name="b_enable" />
        <signal name="XLXN_443" />
        <signal name="tx_data_fifo_rden" />
        <signal name="data_fifo_rden_en" />
        <signal name="start_delay_count" />
        <signal name="delay_count" />
        <signal name="clear_delay_count" />
        <signal name="data_fifo_empty" />
        <signal name="tx_info_fifo_din(15:0)" />
        <signal name="tx_info_fifo_wr_en" />
        <signal name="tx_data_fifo_din(63:0)" />
        <signal name="tx_data_fifo_wr_en" />
        <signal name="tx_data(63:0)" />
        <signal name="b_data(63:0)" />
        <signal name="tx_data_fifo_empty" />
        <signal name="tx_fifo_reset_sig" />
        <signal name="data_fifo_full" />
        <signal name="XLXN_342" />
        <signal name="info_fifo_wr_data(15:0)" />
        <signal name="data_fifo_wr_data(63:0)" />
        <signal name="info_fifo_wren" />
        <signal name="data_fifo_wren" />
        <signal name="crc_err_flag" />
        <signal name="rx_data_fifo_empty" />
        <signal name="XLXN_463" />
        <signal name="XLXN_1735" />
        <signal name="tx_fifo_reset" />
        <signal name="b_end_packet" />
        <signal name="rx_fifo_reset_sig" />
        <port polarity="Input" name="reset" />
        <port polarity="Input" name="MASTER_CLK" />
        <port polarity="Input" name="reset_n" />
        <port polarity="Output" name="rx_data(63:0)" />
        <port polarity="Input" name="gec_user_rx_size_out(10:0)" />
        <port polarity="Input" name="gec_user_crc_err" />
        <port polarity="Input" name="gec_user_rx_valid_out" />
        <port polarity="Input" name="gec_user_rx_data_out(7:0)" />
        <port polarity="Input" name="gec_user_busy" />
        <port polarity="Input" name="gec_user_tx_enable_out" />
        <port polarity="Input" name="b_data_we" />
        <port polarity="Output" name="ram_wren" />
        <port polarity="Output" name="ram_addr(63:0)" />
        <port polarity="Output" name="gec_user_tx_data_in(7:0)" />
        <port polarity="Output" name="gec_user_tx_size_in(10:0)" />
        <port polarity="Output" name="gec_user_trigger" />
        <port polarity="Output" name="b_enable" />
        <port polarity="Input" name="tx_data(63:0)" />
        <port polarity="Input" name="b_data(63:0)" />
        <port polarity="Input" name="b_end_packet" />
        <blockdef name="m2_1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
        </blockdef>
        <blockdef name="MUX16_2">
            <timestamp>2008-6-18T18:41:56</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="INFO_FIFO_0">
            <timestamp>2008-6-10T19:16:26</timestamp>
            <rect width="256" x="64" y="-320" height="388" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="48" y2="48" x1="64" />
            <line x2="0" y1="0" y2="0" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-128" y2="-128" x1="320" />
            <line x2="384" y1="0" y2="0" x1="320" />
        </blockdef>
        <blockdef name="MUX64_2">
            <timestamp>2008-6-18T18:43:41</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="DATA_FIFO_0">
            <timestamp>2008-7-30T13:9:21</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <blockdef name="GEC_TX_SEQ_CTL_8">
            <timestamp>2008-8-8T15:14:7</timestamp>
            <rect width="592" x="64" y="-768" height="768" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="720" y1="-736" y2="-736" x1="656" />
            <line x2="720" y1="-640" y2="-640" x1="656" />
            <line x2="720" y1="-544" y2="-544" x1="656" />
            <line x2="720" y1="-448" y2="-448" x1="656" />
            <line x2="720" y1="-352" y2="-352" x1="656" />
            <line x2="720" y1="-256" y2="-256" x1="656" />
            <rect width="64" x="656" y="-172" height="24" />
            <line x2="720" y1="-160" y2="-160" x1="656" />
            <rect width="64" x="656" y="-76" height="24" />
            <line x2="720" y1="-64" y2="-64" x1="656" />
        </blockdef>
        <blockdef name="GEC_RX_CTL_8">
            <timestamp>2008-8-1T14:55:56</timestamp>
            <rect width="624" x="64" y="-576" height="576" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="752" y1="-544" y2="-544" x1="688" />
            <line x2="752" y1="-416" y2="-416" x1="688" />
            <line x2="752" y1="-288" y2="-288" x1="688" />
            <rect width="64" x="688" y="-172" height="24" />
            <line x2="752" y1="-160" y2="-160" x1="688" />
            <rect width="64" x="688" y="-44" height="24" />
            <line x2="752" y1="-32" y2="-32" x1="688" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="delay_counter">
            <timestamp>2008-8-1T16:35:53</timestamp>
            <rect width="352" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="480" y1="-224" y2="-224" x1="416" />
        </blockdef>
        <blockdef name="RAM_COMM_DEC_9">
            <timestamp>2009-1-6T22:53:45</timestamp>
            <line x2="736" y1="32" y2="32" x1="672" />
            <line x2="736" y1="96" y2="96" x1="672" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-752" y2="-752" x1="64" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <line x2="0" y1="-528" y2="-528" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <rect width="64" x="0" y="-204" height="24" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="0" y="-92" height="24" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <line x2="736" y1="-864" y2="-864" x1="672" />
            <line x2="736" y1="-800" y2="-800" x1="672" />
            <line x2="736" y1="-672" y2="-672" x1="672" />
            <line x2="736" y1="-608" y2="-608" x1="672" />
            <line x2="736" y1="-544" y2="-544" x1="672" />
            <line x2="736" y1="-480" y2="-480" x1="672" />
            <line x2="736" y1="-416" y2="-416" x1="672" />
            <line x2="736" y1="-352" y2="-352" x1="672" />
            <line x2="736" y1="-288" y2="-288" x1="672" />
            <line x2="736" y1="-224" y2="-224" x1="672" />
            <rect width="64" x="672" y="-172" height="24" />
            <line x2="736" y1="-160" y2="-160" x1="672" />
            <rect width="64" x="672" y="-108" height="24" />
            <line x2="736" y1="-96" y2="-96" x1="672" />
            <rect width="64" x="672" y="-44" height="24" />
            <line x2="736" y1="-32" y2="-32" x1="672" />
            <rect width="608" x="64" y="-896" height="1024" />
        </blockdef>
        <blockdef name="burst_controller_sm">
            <timestamp>2011-4-8T15:19:13</timestamp>
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="448" y1="32" y2="32" x1="384" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
            <rect width="320" x="64" y="-448" height="576" />
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
        <block symbolname="vcc" name="XLXI_3511">
            <blockpin signalname="XLXN_443" name="P" />
        </block>
        <block symbolname="GEC_TX_SEQ_CTL_8" name="XLXI_3513">
            <blockpin signalname="XLXN_443" name="block_en" />
            <blockpin signalname="MASTER_CLK" name="clk" />
            <blockpin signalname="data_fifo_empty" name="data_fifo_empty" />
            <blockpin name="data_fifo_rderr" />
            <blockpin signalname="delay_count" name="delay_count" />
            <blockpin signalname="gec_user_busy" name="gec_user_busy" />
            <blockpin signalname="gec_user_tx_enable_out" name="gec_user_tx_enable_out" />
            <blockpin signalname="tx_info_fifo_empty" name="info_fifo_empty" />
            <blockpin name="info_fifo_rderr" />
            <blockpin signalname="reset_n" name="reset_n" />
            <blockpin signalname="data_fifo_rd_data(63:0)" name="data_fifo_rd_data(63:0)" />
            <blockpin signalname="tx_info_fifo_dout(15:0)" name="info_fifo_rd_data(15:0)" />
            <blockpin signalname="clear_delay_count" name="clear_delay_count" />
            <blockpin signalname="tx_data_fifo_rden" name="data_fifo_rden" />
            <blockpin signalname="data_fifo_rden_en" name="data_fifo_rden_en" />
            <blockpin signalname="gec_user_trigger" name="gec_user_trigger" />
            <blockpin signalname="tx_info_fifo_rden" name="info_fifo_rden" />
            <blockpin signalname="start_delay_count" name="start_delay_count" />
            <blockpin signalname="gec_user_tx_data_in(7:0)" name="gec_user_tx_data_in(7:0)" />
            <blockpin signalname="gec_user_tx_size_in(10:0)" name="gec_user_tx_size_in(10:0)" />
        </block>
        <block symbolname="delay_counter" name="XLXI_3514">
            <blockpin signalname="clear_delay_count" name="clear_delay_count" />
            <blockpin signalname="MASTER_CLK" name="clock" />
            <blockpin signalname="reset_n" name="reset_n" />
            <blockpin signalname="start_delay_count" name="start_delay_count" />
            <blockpin signalname="delay_count" name="delay_count" />
        </block>
        <block symbolname="and2" name="XLXI_3512">
            <blockpin signalname="tx_data_fifo_rden" name="I0" />
            <blockpin signalname="data_fifo_rden_en" name="I1" />
            <blockpin signalname="tx_data_fifo_read_enable" name="O" />
        </block>
        <block symbolname="INFO_FIFO_0" name="TX_INFO_FIFO">
            <blockpin signalname="tx_info_fifo_wr_en" name="wr_en" />
            <blockpin signalname="MASTER_CLK" name="clk" />
            <blockpin signalname="tx_fifo_reset_sig" name="srst" />
            <blockpin signalname="tx_info_fifo_din(15:0)" name="din(15:0)" />
            <blockpin signalname="tx_info_fifo_rden" name="rd_en" />
            <blockpin signalname="tx_info_fifo_dout(15:0)" name="dout(15:0)" />
            <blockpin signalname="tx_info_fifo_empty" name="empty" />
            <blockpin signalname="tx_info_fifo_full" name="full" />
        </block>
        <block symbolname="MUX16_2" name="XLXI_3526">
            <blockpin signalname="tx_info_fifo_src_sel" name="sel" />
            <blockpin signalname="tx_info_fifo_data_comm(15:0)" name="in0(15:0)" />
            <blockpin signalname="tx_info_fifo_data_burst(15:0)" name="in1(15:0)" />
            <blockpin signalname="tx_info_fifo_din(15:0)" name="muxout(15:0)" />
        </block>
        <block symbolname="m2_1" name="XLXI_3527">
            <blockpin signalname="tx_info_fifo_wren_comm" name="D0" />
            <blockpin signalname="tx_info_fifo_wren_burst" name="D1" />
            <blockpin signalname="tx_info_fifo_src_sel" name="S0" />
            <blockpin signalname="tx_info_fifo_wr_en" name="O" />
        </block>
        <block symbolname="MUX64_2" name="XLXI_3531">
            <blockpin signalname="tx_data_fifo_src_sel" name="sel" />
            <blockpin signalname="tx_data(63:0)" name="in0(63:0)" />
            <blockpin signalname="b_data(63:0)" name="in1(63:0)" />
            <blockpin signalname="tx_data_fifo_din(63:0)" name="muxout(63:0)" />
        </block>
        <block symbolname="m2_1" name="XLXI_3532">
            <blockpin signalname="tx_data_fifo_wren_comm" name="D0" />
            <blockpin signalname="tx_data_fifo_wren_burst" name="D1" />
            <blockpin signalname="tx_data_fifo_src_sel" name="S0" />
            <blockpin signalname="tx_data_fifo_wr_en" name="O" />
        </block>
        <block symbolname="DATA_FIFO_0" name="TX_DATA_FIFO">
            <blockpin signalname="MASTER_CLK" name="clk" />
            <blockpin signalname="tx_data_fifo_read_enable" name="rd_en" />
            <blockpin signalname="tx_fifo_reset_sig" name="srst" />
            <blockpin signalname="tx_data_fifo_wr_en" name="wr_en" />
            <blockpin signalname="tx_data_fifo_din(63:0)" name="din(63:0)" />
            <blockpin signalname="tx_data_fifo_empty" name="empty" />
            <blockpin signalname="tx_data_fifo_full" name="full" />
            <blockpin signalname="data_fifo_rd_data(63:0)" name="dout(63:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_3364">
            <blockpin signalname="XLXN_342" name="P" />
        </block>
        <block symbolname="GEC_RX_CTL_8" name="XLXI_3365">
            <blockpin signalname="XLXN_342" name="block_en" />
            <blockpin signalname="MASTER_CLK" name="clock" />
            <blockpin signalname="data_fifo_full" name="data_fifo_full" />
            <blockpin name="data_fifo_wrerr" />
            <blockpin signalname="gec_user_crc_err" name="gec_user_crc_err" />
            <blockpin signalname="gec_user_rx_valid_out" name="gec_user_rx_valid_out" />
            <blockpin signalname="reset_n" name="reset_n" />
            <blockpin signalname="gec_user_rx_data_out(7:0)" name="gec_user_rx_data_out(7:0)" />
            <blockpin signalname="gec_user_rx_size_out(10:0)" name="gec_user_rx_size_out(10:0)" />
            <blockpin signalname="crc_err_flag" name="crc_err_flag" />
            <blockpin signalname="data_fifo_wren" name="data_fifo_wren" />
            <blockpin signalname="info_fifo_wren" name="info_fifo_wren" />
            <blockpin signalname="data_fifo_wr_data(63:0)" name="data_fifo_q_w_data(63:0)" />
            <blockpin signalname="info_fifo_wr_data(15:0)" name="info_fifo_wr_data(15:0)" />
        </block>
        <block symbolname="INFO_FIFO_0" name="RX_INFO_FIFO">
            <blockpin signalname="info_fifo_wren" name="wr_en" />
            <blockpin signalname="MASTER_CLK" name="clk" />
            <blockpin signalname="rx_fifo_reset_sig" name="srst" />
            <blockpin signalname="info_fifo_wr_data(15:0)" name="din(15:0)" />
            <blockpin signalname="rx_info_fifo_rden" name="rd_en" />
            <blockpin signalname="info_fifo_rd_data(15:0)" name="dout(15:0)" />
            <blockpin signalname="rx_info_fifo_empty" name="empty" />
            <blockpin name="full" />
        </block>
        <block symbolname="DATA_FIFO_0" name="RX_DATA_FIFO">
            <blockpin signalname="MASTER_CLK" name="clk" />
            <blockpin signalname="rx_data_fifo_read_enable" name="rd_en" />
            <blockpin signalname="rx_fifo_reset_sig" name="srst" />
            <blockpin signalname="data_fifo_wren" name="wr_en" />
            <blockpin signalname="data_fifo_wr_data(63:0)" name="din(63:0)" />
            <blockpin signalname="rx_data_fifo_empty" name="empty" />
            <blockpin name="full" />
            <blockpin signalname="rx_data(63:0)" name="dout(63:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_3401">
            <blockpin signalname="XLXN_463" name="P" />
        </block>
        <block symbolname="RAM_COMM_DEC_9" name="XLXI_3506">
            <blockpin signalname="XLXN_463" name="block_en" />
            <blockpin signalname="burst_done" name="burst_done" />
            <blockpin signalname="MASTER_CLK" name="clock" />
            <blockpin signalname="reset_n" name="reset_n" />
            <blockpin signalname="rx_info_fifo_empty" name="rx_info_fifo_empty" />
            <blockpin signalname="tx_info_fifo_full" name="tx_info_fifo_full" />
            <blockpin signalname="rx_data(63:0)" name="rx_data_fifo_rd_data(63:0)" />
            <blockpin signalname="info_fifo_rd_data(15:0)" name="rx_info_fifo_rd_data(15:0)" />
            <blockpin signalname="burst_start" name="burst_start" />
            <blockpin signalname="burst_stop" name="burst_stop" />
            <blockpin name="ram_en" />
            <blockpin signalname="ram_wren" name="ram_wren" />
            <blockpin signalname="rx_data_fifo_read_enable" name="rx_data_fifo_rden" />
            <blockpin signalname="rx_fifo_reset" name="Rx_FIFO_Reset" />
            <blockpin signalname="rx_info_fifo_rden" name="rx_info_fifo_rden" />
            <blockpin signalname="tx_data_fifo_src_sel" name="tx_data_fifo_src_sel" />
            <blockpin signalname="tx_data_fifo_wren_comm" name="tx_data_fifo_wren" />
            <blockpin signalname="tx_fifo_reset" name="Tx_FIFO_Reset" />
            <blockpin signalname="tx_info_fifo_src_sel" name="tx_info_fifo_src_sel" />
            <blockpin signalname="tx_info_fifo_wren_comm" name="tx_info_fifo_wren" />
            <blockpin signalname="ram_addr(63:0)" name="ram_addr(63:0)" />
            <blockpin name="state_diag(0:5)" />
            <blockpin signalname="tx_info_fifo_data_comm(15:0)" name="tx_info_fifo_wr_data(15:0)" />
        </block>
        <block symbolname="burst_controller_sm" name="XLXI_2539">
            <blockpin signalname="b_data_we" name="b_data_we" />
            <blockpin signalname="XLXN_1735" name="b_end_burst" />
            <blockpin signalname="b_end_packet" name="b_end_packet" />
            <blockpin signalname="burst_start" name="burst_start" />
            <blockpin signalname="burst_stop" name="burst_stop" />
            <blockpin signalname="MASTER_CLK" name="clk" />
            <blockpin signalname="reset_n" name="reset_n" />
            <blockpin signalname="tx_data_fifo_full" name="tx_data_full" />
            <blockpin signalname="tx_info_fifo_full" name="tx_info_full" />
            <blockpin signalname="b_enable" name="b_enable" />
            <blockpin signalname="burst_done" name="burst_done" />
            <blockpin signalname="tx_data_fifo_wren_burst" name="tx_data_we" />
            <blockpin signalname="tx_info_fifo_wren_burst" name="tx_info_we" />
            <blockpin signalname="tx_info_fifo_data_burst(15:0)" name="tx_info(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_3540">
            <blockpin signalname="XLXN_1735" name="G" />
        </block>
        <block symbolname="or2" name="XLXI_3541">
            <blockpin signalname="rx_fifo_reset" name="I0" />
            <blockpin signalname="reset" name="I1" />
            <blockpin signalname="rx_fifo_reset_sig" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_3505">
            <blockpin signalname="tx_fifo_reset" name="I0" />
            <blockpin signalname="reset" name="I1" />
            <blockpin signalname="tx_fifo_reset_sig" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="reset">
            <wire x2="640" y1="176" y2="176" x1="416" />
        </branch>
        <branch name="reset_n">
            <wire x2="640" y1="224" y2="224" x1="416" />
        </branch>
        <branch name="MASTER_CLK">
            <wire x2="640" y1="128" y2="128" x1="416" />
        </branch>
        <branch name="gec_user_crc_err">
            <wire x2="640" y1="272" y2="272" x1="416" />
        </branch>
        <branch name="gec_user_rx_valid_out">
            <wire x2="640" y1="320" y2="320" x1="416" />
        </branch>
        <branch name="gec_user_rx_data_out(7:0)">
            <wire x2="640" y1="368" y2="368" x1="416" />
        </branch>
        <branch name="gec_user_rx_size_out(10:0)">
            <wire x2="640" y1="416" y2="416" x1="416" />
        </branch>
        <branch name="gec_user_busy">
            <wire x2="640" y1="464" y2="464" x1="416" />
        </branch>
        <branch name="gec_user_tx_enable_out">
            <wire x2="640" y1="512" y2="512" x1="400" />
        </branch>
        <branch name="b_data_we">
            <wire x2="640" y1="560" y2="560" x1="400" />
        </branch>
        <iomarker fontsize="28" x="416" y="176" name="reset" orien="R180" />
        <iomarker fontsize="28" x="416" y="224" name="reset_n" orien="R180" />
        <iomarker fontsize="28" x="416" y="128" name="MASTER_CLK" orien="R180" />
        <iomarker fontsize="28" x="416" y="272" name="gec_user_crc_err" orien="R180" />
        <iomarker fontsize="28" x="416" y="320" name="gec_user_rx_valid_out" orien="R180" />
        <iomarker fontsize="28" x="416" y="368" name="gec_user_rx_data_out(7:0)" orien="R180" />
        <iomarker fontsize="28" x="416" y="416" name="gec_user_rx_size_out(10:0)" orien="R180" />
        <iomarker fontsize="28" x="416" y="464" name="gec_user_busy" orien="R180" />
        <iomarker fontsize="28" x="400" y="512" name="gec_user_tx_enable_out" orien="R180" />
        <iomarker fontsize="28" x="400" y="560" name="b_data_we" orien="R180" />
        <instance x="704" y="2912" name="XLXI_3511" orien="R270" />
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="704" y="2912" type="branch" />
            <wire x2="928" y1="2912" y2="2912" x1="704" />
        </branch>
        <branch name="data_fifo_empty">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="704" y="2976" type="branch" />
            <wire x2="928" y1="2976" y2="2976" x1="704" />
        </branch>
        <branch name="XLXN_443">
            <wire x2="928" y1="2848" y2="2848" x1="704" />
        </branch>
        <branch name="tx_info_fifo_empty">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="704" y="3296" type="branch" />
            <wire x2="928" y1="3296" y2="3296" x1="704" />
        </branch>
        <branch name="gec_user_tx_enable_out">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="704" y="3232" type="branch" />
            <wire x2="928" y1="3232" y2="3232" x1="704" />
        </branch>
        <branch name="gec_user_busy">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="704" y="3168" type="branch" />
            <wire x2="928" y1="3168" y2="3168" x1="704" />
        </branch>
        <branch name="reset_n">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="704" y="3424" type="branch" />
            <wire x2="928" y1="3424" y2="3424" x1="704" />
        </branch>
        <branch name="tx_data_fifo_rden">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2000" y="2944" type="branch" />
            <wire x2="2000" y1="2944" y2="2944" x1="1648" />
        </branch>
        <branch name="gec_user_trigger">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1904" y="3136" type="branch" />
            <wire x2="1904" y1="3136" y2="3136" x1="1648" />
        </branch>
        <branch name="tx_info_fifo_rden">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1904" y="3232" type="branch" />
            <wire x2="1904" y1="3232" y2="3232" x1="1648" />
        </branch>
        <branch name="gec_user_tx_size_in(10:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1904" y="3520" type="branch" />
            <wire x2="1904" y1="3520" y2="3520" x1="1648" />
        </branch>
        <branch name="gec_user_tx_data_in(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1904" y="3424" type="branch" />
            <wire x2="1904" y1="3424" y2="3424" x1="1648" />
        </branch>
        <branch name="data_fifo_rden_en">
            <wire x2="2448" y1="3040" y2="3040" x1="1648" />
        </branch>
        <branch name="start_delay_count">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1904" y="3328" type="branch" />
            <wire x2="1904" y1="3328" y2="3328" x1="1648" />
        </branch>
        <branch name="delay_count">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="704" y="3104" type="branch" />
            <wire x2="928" y1="3104" y2="3104" x1="704" />
        </branch>
        <branch name="clear_delay_count">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1904" y="2848" type="branch" />
            <wire x2="1904" y1="2848" y2="2848" x1="1648" />
        </branch>
        <branch name="data_fifo_rd_data(63:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="688" y="3488" type="branch" />
            <wire x2="928" y1="3488" y2="3488" x1="688" />
        </branch>
        <branch name="tx_info_fifo_dout(15:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="704" y="3552" type="branch" />
            <wire x2="928" y1="3552" y2="3552" x1="704" />
        </branch>
        <instance x="928" y="3584" name="XLXI_3513" orien="R0">
        </instance>
        <instance x="1056" y="3920" name="XLXI_3514" orien="R0">
        </instance>
        <branch name="clear_delay_count">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="848" y="3696" type="branch" />
            <wire x2="1056" y1="3696" y2="3696" x1="848" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="848" y="3760" type="branch" />
            <wire x2="1056" y1="3760" y2="3760" x1="848" />
        </branch>
        <branch name="reset_n">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="848" y="3824" type="branch" />
            <wire x2="1056" y1="3824" y2="3824" x1="848" />
        </branch>
        <branch name="start_delay_count">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="848" y="3888" type="branch" />
            <wire x2="1056" y1="3888" y2="3888" x1="848" />
        </branch>
        <branch name="delay_count">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1712" y="3696" type="branch" />
            <wire x2="1712" y1="3696" y2="3696" x1="1536" />
        </branch>
        <branch name="tx_data_fifo_read_enable">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2752" y="3072" type="branch" />
            <wire x2="2752" y1="3072" y2="3072" x1="2704" />
        </branch>
        <branch name="tx_data_fifo_rden">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2336" y="3104" type="branch" />
            <wire x2="2448" y1="3104" y2="3104" x1="2336" />
        </branch>
        <instance x="2448" y="3168" name="XLXI_3512" orien="R0" />
        <instance x="5088" y="3184" name="TX_INFO_FIFO" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="16" y="-408" type="instance" />
        </instance>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4848" y="3232" type="branch" />
            <wire x2="5088" y1="3232" y2="3232" x1="4848" />
        </branch>
        <branch name="tx_info_fifo_din(15:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4896" y="2896" type="branch" />
            <wire x2="4896" y1="2896" y2="2896" x1="4784" />
            <wire x2="5088" y1="2896" y2="2896" x1="4896" />
        </branch>
        <branch name="tx_info_fifo_dout(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5856" y="2896" type="branch" />
            <wire x2="5856" y1="2896" y2="2896" x1="5472" />
        </branch>
        <instance x="4400" y="3056" name="XLXI_3526" orien="R0">
        </instance>
        <branch name="tx_info_fifo_data_comm(15:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4224" y="2960" type="branch" />
            <wire x2="4400" y1="2960" y2="2960" x1="4224" />
        </branch>
        <instance x="4000" y="3344" name="XLXI_3527" orien="R0" />
        <branch name="tx_info_fifo_src_sel">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3936" y="3312" type="branch" />
            <wire x2="4000" y1="3312" y2="3312" x1="3936" />
        </branch>
        <branch name="tx_info_fifo_wr_en">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4912" y="3088" type="branch" />
            <wire x2="4432" y1="3216" y2="3216" x1="4320" />
            <wire x2="4432" y1="3088" y2="3216" x1="4432" />
            <wire x2="4912" y1="3088" y2="3088" x1="4432" />
            <wire x2="5088" y1="3088" y2="3088" x1="4912" />
        </branch>
        <branch name="tx_info_fifo_wren_comm">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3936" y="3184" type="branch" />
            <wire x2="4000" y1="3184" y2="3184" x1="3936" />
        </branch>
        <branch name="tx_fifo_reset_sig">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4864" y="3184" type="branch" />
            <wire x2="5088" y1="3184" y2="3184" x1="4864" />
        </branch>
        <branch name="tx_info_fifo_rden">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4864" y="3136" type="branch" />
            <wire x2="5088" y1="3136" y2="3136" x1="4864" />
        </branch>
        <branch name="tx_info_fifo_full">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5760" y="3184" type="branch" />
            <wire x2="5760" y1="3184" y2="3184" x1="5472" />
        </branch>
        <branch name="tx_info_fifo_wren_burst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3936" y="3248" type="branch" />
            <wire x2="4000" y1="3248" y2="3248" x1="3936" />
        </branch>
        <branch name="tx_info_fifo_data_burst(15:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4224" y="3024" type="branch" />
            <wire x2="4400" y1="3024" y2="3024" x1="4224" />
        </branch>
        <branch name="tx_info_fifo_empty">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5728" y="3056" type="branch" />
            <wire x2="5728" y1="3056" y2="3056" x1="5472" />
        </branch>
        <branch name="tx_info_fifo_src_sel">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4224" y="2896" type="branch" />
            <wire x2="4400" y1="2896" y2="2896" x1="4224" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5728" y="3520" type="branch" />
            <wire x2="5952" y1="3520" y2="3520" x1="5728" />
        </branch>
        <branch name="tx_data_fifo_din(63:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="5648" y="3776" type="branch" />
            <wire x2="5648" y1="3776" y2="3776" x1="5376" />
            <wire x2="5952" y1="3776" y2="3776" x1="5648" />
        </branch>
        <instance x="4992" y="3936" name="XLXI_3531" orien="R0">
        </instance>
        <instance x="4720" y="3696" name="XLXI_3532" orien="R0" />
        <branch name="tx_data_fifo_src_sel">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4480" y="3664" type="branch" />
            <wire x2="4720" y1="3664" y2="3664" x1="4480" />
        </branch>
        <branch name="tx_data_fifo_src_sel">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4752" y="3776" type="branch" />
            <wire x2="4992" y1="3776" y2="3776" x1="4752" />
        </branch>
        <branch name="tx_data_fifo_wren_comm">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4496" y="3536" type="branch" />
            <wire x2="4720" y1="3536" y2="3536" x1="4496" />
        </branch>
        <branch name="tx_data_fifo_wr_en">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="5584" y="3712" type="branch" />
            <wire x2="5376" y1="3568" y2="3568" x1="5040" />
            <wire x2="5376" y1="3568" y2="3712" x1="5376" />
            <wire x2="5584" y1="3712" y2="3712" x1="5376" />
            <wire x2="5952" y1="3712" y2="3712" x1="5584" />
        </branch>
        <branch name="tx_data_fifo_read_enable">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5728" y="3584" type="branch" />
            <wire x2="5952" y1="3584" y2="3584" x1="5728" />
        </branch>
        <branch name="data_fifo_rd_data(63:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6624" y="3776" type="branch" />
            <wire x2="6624" y1="3776" y2="3776" x1="6336" />
        </branch>
        <branch name="tx_data(63:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4752" y="3840" type="branch" />
            <wire x2="4992" y1="3840" y2="3840" x1="4752" />
        </branch>
        <branch name="tx_data_fifo_wren_burst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4496" y="3600" type="branch" />
            <wire x2="4720" y1="3600" y2="3600" x1="4496" />
        </branch>
        <branch name="b_data(63:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4752" y="3904" type="branch" />
            <wire x2="4992" y1="3904" y2="3904" x1="4752" />
        </branch>
        <branch name="tx_data_fifo_empty">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6608" y="3520" type="branch" />
            <wire x2="6608" y1="3520" y2="3520" x1="6336" />
        </branch>
        <instance x="5952" y="3808" name="TX_DATA_FIFO" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="16" y="-408" type="instance" />
        </instance>
        <branch name="gec_user_rx_size_out(10:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1664" y="1168" type="branch" />
            <wire x2="1904" y1="1168" y2="1168" x1="1664" />
        </branch>
        <branch name="reset_n">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1664" y="1040" type="branch" />
            <wire x2="1904" y1="1040" y2="1040" x1="1664" />
        </branch>
        <branch name="data_fifo_full">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1664" y="784" type="branch" />
            <wire x2="1904" y1="784" y2="784" x1="1664" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1664" y="720" type="branch" />
            <wire x2="1904" y1="720" y2="720" x1="1664" />
        </branch>
        <instance x="1664" y="720" name="XLXI_3364" orien="R270" />
        <branch name="XLXN_342">
            <wire x2="1904" y1="656" y2="656" x1="1664" />
        </branch>
        <branch name="gec_user_crc_err">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1664" y="912" type="branch" />
            <wire x2="1904" y1="912" y2="912" x1="1664" />
        </branch>
        <branch name="gec_user_rx_valid_out">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1664" y="976" type="branch" />
            <wire x2="1904" y1="976" y2="976" x1="1664" />
        </branch>
        <branch name="gec_user_rx_data_out(7:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1664" y="1104" type="branch" />
            <wire x2="1904" y1="1104" y2="1104" x1="1664" />
        </branch>
        <branch name="info_fifo_wr_data(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="1168" type="branch" />
            <wire x2="2944" y1="1168" y2="1168" x1="2656" />
        </branch>
        <branch name="data_fifo_wr_data(63:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="1040" type="branch" />
            <wire x2="2944" y1="1040" y2="1040" x1="2656" />
        </branch>
        <branch name="info_fifo_wren">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="912" type="branch" />
            <wire x2="2960" y1="912" y2="912" x1="2656" />
        </branch>
        <branch name="data_fifo_wren">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="784" type="branch" />
            <wire x2="2960" y1="784" y2="784" x1="2656" />
        </branch>
        <branch name="crc_err_flag">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="656" type="branch" />
            <wire x2="2960" y1="656" y2="656" x1="2656" />
        </branch>
        <instance x="1904" y="1200" name="XLXI_3365" orien="R0">
        </instance>
        <branch name="rx_fifo_reset_sig">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="688" type="branch" />
            <wire x2="4192" y1="688" y2="688" x1="3952" />
        </branch>
        <branch name="info_fifo_rd_data(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4752" y="400" type="branch" />
            <wire x2="4752" y1="400" y2="400" x1="4576" />
        </branch>
        <branch name="info_fifo_wren">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="592" type="branch" />
            <wire x2="4192" y1="592" y2="592" x1="3952" />
        </branch>
        <branch name="rx_info_fifo_rden">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="640" type="branch" />
            <wire x2="4192" y1="640" y2="640" x1="3952" />
        </branch>
        <branch name="info_fifo_wr_data(15:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="400" type="branch" />
            <wire x2="4192" y1="400" y2="400" x1="3952" />
        </branch>
        <instance x="4192" y="688" name="RX_INFO_FIFO" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="16" y="-408" type="instance" />
        </instance>
        <branch name="rx_info_fifo_empty">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4864" y="560" type="branch" />
            <wire x2="4864" y1="560" y2="560" x1="4576" />
        </branch>
        <branch name="rx_data(63:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5200" y="1264" type="branch" />
            <wire x2="5200" y1="1264" y2="1264" x1="4928" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4336" y="1008" type="branch" />
            <wire x2="4544" y1="1008" y2="1008" x1="4336" />
        </branch>
        <branch name="rx_fifo_reset_sig">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4336" y="1136" type="branch" />
            <wire x2="4544" y1="1136" y2="1136" x1="4336" />
        </branch>
        <branch name="data_fifo_wr_data(63:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4336" y="1264" type="branch" />
            <wire x2="4544" y1="1264" y2="1264" x1="4336" />
        </branch>
        <branch name="data_fifo_wren">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4336" y="1200" type="branch" />
            <wire x2="4544" y1="1200" y2="1200" x1="4336" />
        </branch>
        <branch name="rx_data_fifo_read_enable">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4320" y="1072" type="branch" />
            <wire x2="4544" y1="1072" y2="1072" x1="4320" />
        </branch>
        <branch name="rx_data_fifo_empty">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5248" y="1008" type="branch" />
            <wire x2="5248" y1="1008" y2="1008" x1="4928" />
        </branch>
        <instance x="4544" y="1296" name="RX_DATA_FIFO" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="32" y="-408" type="instance" />
        </instance>
        <instance x="2672" y="1760" name="XLXI_3401" orien="R270" />
        <instance x="3040" y="2560" name="XLXI_3506" orien="R0">
        </instance>
        <branch name="XLXN_463">
            <wire x2="3040" y1="1696" y2="1696" x1="2672" />
        </branch>
        <branch name="burst_done">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2816" y="1808" type="branch" />
            <wire x2="3040" y1="1808" y2="1808" x1="2816" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2736" y="1920" type="branch" />
            <wire x2="3040" y1="1920" y2="1920" x1="2736" />
        </branch>
        <branch name="reset_n">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2736" y="2032" type="branch" />
            <wire x2="3040" y1="2032" y2="2032" x1="2736" />
        </branch>
        <branch name="rx_info_fifo_empty">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2720" y="2144" type="branch" />
            <wire x2="3040" y1="2144" y2="2144" x1="2720" />
        </branch>
        <branch name="tx_info_fifo_full">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2720" y="2256" type="branch" />
            <wire x2="3040" y1="2256" y2="2256" x1="2720" />
        </branch>
        <branch name="info_fifo_rd_data(15:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2736" y="2480" type="branch" />
            <wire x2="3040" y1="2480" y2="2480" x1="2736" />
        </branch>
        <branch name="rx_data(63:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2784" y="2368" type="branch" />
            <wire x2="3040" y1="2368" y2="2368" x1="2784" />
        </branch>
        <branch name="burst_stop">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3952" y="1760" type="branch" />
            <wire x2="3952" y1="1760" y2="1760" x1="3776" />
        </branch>
        <branch name="burst_start">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3968" y="1696" type="branch" />
            <wire x2="3968" y1="1696" y2="1696" x1="3776" />
        </branch>
        <branch name="rx_data_fifo_read_enable">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4000" y="2016" type="branch" />
            <wire x2="4000" y1="2016" y2="2016" x1="3776" />
        </branch>
        <branch name="tx_info_fifo_src_sel">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4016" y="2272" type="branch" />
            <wire x2="4016" y1="2272" y2="2272" x1="3776" />
        </branch>
        <branch name="tx_info_fifo_wren_comm">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4016" y="2336" type="branch" />
            <wire x2="4016" y1="2336" y2="2336" x1="3776" />
        </branch>
        <branch name="tx_data_fifo_src_sel">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4016" y="2144" type="branch" />
            <wire x2="4016" y1="2144" y2="2144" x1="3776" />
        </branch>
        <branch name="tx_data_fifo_wren_comm">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4016" y="2208" type="branch" />
            <wire x2="4016" y1="2208" y2="2208" x1="3776" />
        </branch>
        <branch name="ram_addr(63:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4048" y="2400" type="branch" />
            <wire x2="4048" y1="2400" y2="2400" x1="3776" />
        </branch>
        <branch name="rx_info_fifo_rden">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3984" y="2080" type="branch" />
            <wire x2="3984" y1="2080" y2="2080" x1="3776" />
        </branch>
        <branch name="ram_wren">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4064" y="1952" type="branch" />
            <wire x2="4064" y1="1952" y2="1952" x1="3776" />
        </branch>
        <branch name="tx_info_fifo_data_comm(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4032" y="2528" type="branch" />
            <wire x2="4032" y1="2528" y2="2528" x1="3776" />
        </branch>
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3040" y="4832" type="branch" />
            <wire x2="3264" y1="4832" y2="4832" x1="3040" />
        </branch>
        <instance x="3264" y="4928" name="XLXI_2539" orien="R0">
        </instance>
        <branch name="tx_info_fifo_wren_burst">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3920" y="4768" type="branch" />
            <wire x2="3920" y1="4768" y2="4768" x1="3712" />
        </branch>
        <branch name="tx_info_fifo_data_burst(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3936" y="4896" type="branch" />
            <wire x2="3936" y1="4896" y2="4896" x1="3712" />
        </branch>
        <branch name="reset_n">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="4896" type="branch" />
            <wire x2="3264" y1="4896" y2="4896" x1="3024" />
        </branch>
        <branch name="burst_stop">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3040" y="4768" type="branch" />
            <wire x2="3264" y1="4768" y2="4768" x1="3040" />
        </branch>
        <branch name="burst_start">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3040" y="4704" type="branch" />
            <wire x2="3264" y1="4704" y2="4704" x1="3040" />
        </branch>
        <branch name="burst_done">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3904" y="4640" type="branch" />
            <wire x2="3904" y1="4640" y2="4640" x1="3712" />
        </branch>
        <branch name="b_enable">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3904" y="4512" type="branch" />
            <wire x2="3904" y1="4512" y2="4512" x1="3712" />
        </branch>
        <branch name="b_data_we">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3056" y="4512" type="branch" />
            <wire x2="3264" y1="4512" y2="4512" x1="3056" />
        </branch>
        <branch name="tx_data_fifo_full">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="4960" type="branch" />
            <wire x2="3264" y1="4960" y2="4960" x1="3024" />
        </branch>
        <branch name="tx_data_fifo_wren_burst">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3936" y="4960" type="branch" />
            <wire x2="3936" y1="4960" y2="4960" x1="3712" />
        </branch>
        <branch name="tx_info_fifo_full">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="5024" type="branch" />
            <wire x2="3264" y1="5024" y2="5024" x1="3024" />
        </branch>
        <instance x="2736" y="4704" name="XLXI_3540" orien="R0" />
        <branch name="XLXN_1735">
            <wire x2="3216" y1="4576" y2="4576" x1="2800" />
            <wire x2="3264" y1="4576" y2="4576" x1="3216" />
        </branch>
        <branch name="ram_wren">
            <wire x2="6384" y1="160" y2="160" x1="6128" />
        </branch>
        <branch name="ram_addr(63:0)">
            <wire x2="6384" y1="224" y2="224" x1="6128" />
        </branch>
        <branch name="gec_user_tx_data_in(7:0)">
            <wire x2="6384" y1="288" y2="288" x1="6128" />
        </branch>
        <branch name="gec_user_tx_size_in(10:0)">
            <wire x2="6384" y1="352" y2="352" x1="6128" />
        </branch>
        <branch name="gec_user_trigger">
            <wire x2="6384" y1="416" y2="416" x1="6128" />
        </branch>
        <branch name="rx_data(63:0)">
            <wire x2="6384" y1="480" y2="480" x1="6128" />
        </branch>
        <branch name="b_enable">
            <wire x2="6384" y1="544" y2="544" x1="6128" />
        </branch>
        <iomarker fontsize="28" x="6384" y="160" name="ram_wren" orien="R0" />
        <iomarker fontsize="28" x="6384" y="224" name="ram_addr(63:0)" orien="R0" />
        <iomarker fontsize="28" x="6384" y="288" name="gec_user_tx_data_in(7:0)" orien="R0" />
        <iomarker fontsize="28" x="6384" y="352" name="gec_user_tx_size_in(10:0)" orien="R0" />
        <iomarker fontsize="28" x="6384" y="416" name="gec_user_trigger" orien="R0" />
        <iomarker fontsize="28" x="6384" y="480" name="rx_data(63:0)" orien="R0" />
        <iomarker fontsize="28" x="6384" y="544" name="b_enable" orien="R0" />
        <branch name="tx_data(63:0)">
            <wire x2="640" y1="608" y2="608" x1="400" />
        </branch>
        <iomarker fontsize="28" x="400" y="608" name="tx_data(63:0)" orien="R180" />
        <branch name="b_data(63:0)">
            <wire x2="640" y1="656" y2="656" x1="400" />
        </branch>
        <iomarker fontsize="28" x="400" y="656" name="b_data(63:0)" orien="R180" />
        <branch name="rx_fifo_reset">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4064" y="2592" type="branch" />
            <wire x2="4064" y1="2592" y2="2592" x1="3776" />
        </branch>
        <branch name="tx_fifo_reset">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4064" y="2656" type="branch" />
            <wire x2="4064" y1="2656" y2="2656" x1="3776" />
        </branch>
        <branch name="tx_data_fifo_full">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6608" y="3648" type="branch" />
            <wire x2="6448" y1="3648" y2="3648" x1="6336" />
            <wire x2="6608" y1="3648" y2="3648" x1="6448" />
        </branch>
        <branch name="b_end_packet">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3040" y="4640" type="branch" />
            <wire x2="3264" y1="4640" y2="4640" x1="3040" />
        </branch>
        <branch name="b_end_packet">
            <wire x2="640" y1="704" y2="704" x1="400" />
        </branch>
        <iomarker fontsize="28" x="400" y="704" name="b_end_packet" orien="R180" />
        <branch name="MASTER_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="736" type="branch" />
            <wire x2="4192" y1="736" y2="736" x1="3952" />
        </branch>
        <instance x="4672" y="1584" name="XLXI_3541" orien="R0" />
        <branch name="rx_fifo_reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4544" y="1520" type="branch" />
            <wire x2="4672" y1="1520" y2="1520" x1="4544" />
        </branch>
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4448" y="1456" type="branch" />
            <wire x2="4672" y1="1456" y2="1456" x1="4448" />
        </branch>
        <branch name="rx_fifo_reset_sig">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5088" y="1488" type="branch" />
            <wire x2="5088" y1="1488" y2="1488" x1="4928" />
        </branch>
        <instance x="5664" y="4144" name="XLXI_3505" orien="R0" />
        <branch name="reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5440" y="4016" type="branch" />
            <wire x2="5664" y1="4016" y2="4016" x1="5440" />
        </branch>
        <branch name="tx_fifo_reset">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5536" y="4080" type="branch" />
            <wire x2="5664" y1="4080" y2="4080" x1="5536" />
        </branch>
        <branch name="tx_fifo_reset_sig">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6080" y="4048" type="branch" />
            <wire x2="6080" y1="4048" y2="4048" x1="5920" />
        </branch>
        <branch name="tx_fifo_reset_sig">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5840" y="3648" type="branch" />
            <wire x2="5952" y1="3648" y2="3648" x1="5840" />
        </branch>
    </sheet>
</drawing>