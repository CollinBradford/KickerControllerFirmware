--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : DATA_MANAGER.vhf
-- /___/   /\     Timestamp : 08/02/2011 18:00:40
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family virtex4 -flat -suppress -vhdl C:/Captan/FastADC/FAST_ADC_FW_01/FAST_ADC_FW_/GEL_CAPTAN/DATA_MANAGER.vhf -w C:/Captan/FastADC/FAST_ADC_FW_01/FAST_ADC_FW_/GEL_CAPTAN/DATA_MANAGER.sch
--Design Name: DATA_MANAGER
--Device: virtex4
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity M2_1_MXILINX_DATA_MANAGER is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_DATA_MANAGER;

architecture BEHAVIORAL of M2_1_MXILINX_DATA_MANAGER is
   attribute BOX_TYPE   : string ;
   signal M0 : std_logic;
   signal M1 : std_logic;
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   I_36_7 : AND2B1
      port map (I0=>S0,
                I1=>D0,
                O=>M0);
   
   I_36_8 : OR2
      port map (I0=>M1,
                I1=>M0,
                O=>O);
   
   I_36_9 : AND2
      port map (I0=>D1,
                I1=>S0,
                O=>M1);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity DATA_MANAGER is
   port ( b_data                 : in    std_logic_vector (63 downto 0); 
          b_data_we              : in    std_logic; 
          b_end_packet           : in    std_logic; 
          gec_user_busy          : in    std_logic; 
          gec_user_crc_err       : in    std_logic; 
          gec_user_rx_data_out   : in    std_logic_vector (7 downto 0); 
          gec_user_rx_size_out   : in    std_logic_vector (10 downto 0); 
          gec_user_rx_valid_out  : in    std_logic; 
          gec_user_tx_enable_out : in    std_logic; 
          MASTER_CLK             : in    std_logic; 
          reset                  : in    std_logic; 
          reset_n                : in    std_logic; 
          tx_data                : in    std_logic_vector (63 downto 0); 
          b_enable               : out   std_logic; 
          gec_user_trigger       : out   std_logic; 
          gec_user_tx_data_in    : out   std_logic_vector (7 downto 0); 
          gec_user_tx_size_in    : out   std_logic_vector (10 downto 0); 
          ram_addr               : out   std_logic_vector (63 downto 0); 
          ram_wren               : out   std_logic; 
          rx_data                : out   std_logic_vector (63 downto 0));
end DATA_MANAGER;

architecture BEHAVIORAL of DATA_MANAGER is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal burst_done                           : std_logic;
   signal burst_start                          : std_logic;
   signal burst_stop                           : std_logic;
   signal clear_delay_count                    : std_logic;
   signal crc_err_flag                         : std_logic;
   signal data_fifo_empty                      : std_logic;
   signal data_fifo_full                       : std_logic;
   signal data_fifo_rden_en                    : std_logic;
   signal data_fifo_rd_data                    : std_logic_vector (63 downto 0);
   signal data_fifo_wren                       : std_logic;
   signal data_fifo_wr_data                    : std_logic_vector (63 downto 0);
   signal delay_count                          : std_logic;
   signal info_fifo_rd_data                    : std_logic_vector (15 downto 0);
   signal info_fifo_wren                       : std_logic;
   signal info_fifo_wr_data                    : std_logic_vector (15 downto 0);
   signal rx_data_fifo_empty                   : std_logic;
   signal rx_data_fifo_read_enable             : std_logic;
   signal rx_fifo_reset                        : std_logic;
   signal rx_fifo_reset_sig                    : std_logic;
   signal rx_info_fifo_empty                   : std_logic;
   signal rx_info_fifo_rden                    : std_logic;
   signal start_delay_count                    : std_logic;
   signal tx_data_fifo_din                     : std_logic_vector (63 downto 0);
   signal tx_data_fifo_empty                   : std_logic;
   signal tx_data_fifo_full                    : std_logic;
   signal tx_data_fifo_rden                    : std_logic;
   signal tx_data_fifo_read_enable             : std_logic;
   signal tx_data_fifo_src_sel                 : std_logic;
   signal tx_data_fifo_wren_burst              : std_logic;
   signal tx_data_fifo_wren_comm               : std_logic;
   signal tx_data_fifo_wr_en                   : std_logic;
   signal tx_fifo_reset                        : std_logic;
   signal tx_fifo_reset_sig                    : std_logic;
   signal tx_info_fifo_data_burst              : std_logic_vector (15 downto 0);
   signal tx_info_fifo_data_comm               : std_logic_vector (15 downto 0);
   signal tx_info_fifo_din                     : std_logic_vector (15 downto 0);
   signal tx_info_fifo_dout                    : std_logic_vector (15 downto 0);
   signal tx_info_fifo_empty                   : std_logic;
   signal tx_info_fifo_full                    : std_logic;
   signal tx_info_fifo_rden                    : std_logic;
   signal tx_info_fifo_src_sel                 : std_logic;
   signal tx_info_fifo_wren_burst              : std_logic;
   signal tx_info_fifo_wren_comm               : std_logic;
   signal tx_info_fifo_wr_en                   : std_logic;
   signal XLXN_342                             : std_logic;
   signal XLXN_443                             : std_logic;
   signal XLXN_463                             : std_logic;
   signal XLXN_1735                            : std_logic;
   signal rx_data_DUMMY                        : std_logic_vector (63 downto 0);
   signal XLXI_3365_data_fifo_wrerr_openSignal : std_logic;
   signal XLXI_3513_data_fifo_rderr_openSignal : std_logic;
   signal XLXI_3513_info_fifo_rderr_openSignal : std_logic;
   component DATA_FIFO_0
      port ( clk   : in    std_logic; 
             rd_en : in    std_logic; 
             srst  : in    std_logic; 
             wr_en : in    std_logic; 
             din   : in    std_logic_vector (63 downto 0); 
             empty : out   std_logic; 
             full  : out   std_logic; 
             dout  : out   std_logic_vector (63 downto 0));
   end component;
   
   component INFO_FIFO_0
      port ( wr_en : in    std_logic; 
             clk   : in    std_logic; 
             srst  : in    std_logic; 
             din   : in    std_logic_vector (15 downto 0); 
             rd_en : in    std_logic; 
             dout  : out   std_logic_vector (15 downto 0); 
             empty : out   std_logic; 
             full  : out   std_logic);
   end component;
   
   component burst_controller_sm
      port ( b_data_we    : in    std_logic; 
             b_end_burst  : in    std_logic; 
             b_end_packet : in    std_logic; 
             burst_start  : in    std_logic; 
             burst_stop   : in    std_logic; 
             clk          : in    std_logic; 
             reset_n      : in    std_logic; 
             tx_data_full : in    std_logic; 
             tx_info_full : in    std_logic; 
             b_enable     : out   std_logic; 
             burst_done   : out   std_logic; 
             tx_data_we   : out   std_logic; 
             tx_info_we   : out   std_logic; 
             tx_info      : out   std_logic_vector (15 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GEC_RX_CTL_8
      port ( block_en              : in    std_logic; 
             clock                 : in    std_logic; 
             data_fifo_full        : in    std_logic; 
             data_fifo_wrerr       : in    std_logic; 
             gec_user_crc_err      : in    std_logic; 
             gec_user_rx_valid_out : in    std_logic; 
             reset_n               : in    std_logic; 
             gec_user_rx_data_out  : in    std_logic_vector (7 downto 0); 
             gec_user_rx_size_out  : in    std_logic_vector (10 downto 0); 
             crc_err_flag          : out   std_logic; 
             data_fifo_wren        : out   std_logic; 
             info_fifo_wren        : out   std_logic; 
             data_fifo_q_w_data    : out   std_logic_vector (63 downto 0); 
             info_fifo_wr_data     : out   std_logic_vector (15 downto 0));
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component RAM_COMM_DEC_9
      port ( block_en             : in    std_logic; 
             burst_done           : in    std_logic; 
             clock                : in    std_logic; 
             reset_n              : in    std_logic; 
             rx_info_fifo_empty   : in    std_logic; 
             tx_info_fifo_full    : in    std_logic; 
             rx_data_fifo_rd_data : in    std_logic_vector (63 downto 0); 
             rx_info_fifo_rd_data : in    std_logic_vector (15 downto 0); 
             burst_start          : out   std_logic; 
             burst_stop           : out   std_logic; 
             ram_en               : out   std_logic; 
             ram_wren             : out   std_logic; 
             rx_data_fifo_rden    : out   std_logic; 
             Rx_FIFO_Reset        : out   std_logic; 
             rx_info_fifo_rden    : out   std_logic; 
             tx_data_fifo_src_sel : out   std_logic; 
             tx_data_fifo_wren    : out   std_logic; 
             Tx_FIFO_Reset        : out   std_logic; 
             tx_info_fifo_src_sel : out   std_logic; 
             tx_info_fifo_wren    : out   std_logic; 
             ram_addr             : out   std_logic_vector (63 downto 0); 
             state_diag           : out   std_logic_vector (0 to 5); 
             tx_info_fifo_wr_data : out   std_logic_vector (15 downto 0));
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component GEC_TX_SEQ_CTL_8
      port ( block_en               : in    std_logic; 
             clk                    : in    std_logic; 
             data_fifo_empty        : in    std_logic; 
             data_fifo_rderr        : in    std_logic; 
             delay_count            : in    std_logic; 
             gec_user_busy          : in    std_logic; 
             gec_user_tx_enable_out : in    std_logic; 
             info_fifo_empty        : in    std_logic; 
             info_fifo_rderr        : in    std_logic; 
             reset_n                : in    std_logic; 
             data_fifo_rd_data      : in    std_logic_vector (63 downto 0); 
             info_fifo_rd_data      : in    std_logic_vector (15 downto 0); 
             clear_delay_count      : out   std_logic; 
             data_fifo_rden         : out   std_logic; 
             data_fifo_rden_en      : out   std_logic; 
             gec_user_trigger       : out   std_logic; 
             info_fifo_rden         : out   std_logic; 
             start_delay_count      : out   std_logic; 
             gec_user_tx_data_in    : out   std_logic_vector (7 downto 0); 
             gec_user_tx_size_in    : out   std_logic_vector (10 downto 0));
   end component;
   
   component delay_counter
      port ( clear_delay_count : in    std_logic; 
             clock             : in    std_logic; 
             reset_n           : in    std_logic; 
             start_delay_count : in    std_logic; 
             delay_count       : out   std_logic);
   end component;
   
   component MUX16_2
      port ( sel    : in    std_logic; 
             in0    : in    std_logic_vector (15 downto 0); 
             in1    : in    std_logic_vector (15 downto 0); 
             muxout : out   std_logic_vector (15 downto 0));
   end component;
   
   component M2_1_MXILINX_DATA_MANAGER
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component MUX64_2
      port ( sel    : in    std_logic; 
             in0    : in    std_logic_vector (63 downto 0); 
             in1    : in    std_logic_vector (63 downto 0); 
             muxout : out   std_logic_vector (63 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_3527 : label is "XLXI_3527_0";
   attribute HU_SET of XLXI_3532 : label is "XLXI_3532_1";
begin
   rx_data(63 downto 0) <= rx_data_DUMMY(63 downto 0);
   RX_DATA_FIFO : DATA_FIFO_0
      port map (clk=>MASTER_CLK,
                din(63 downto 0)=>data_fifo_wr_data(63 downto 0),
                rd_en=>rx_data_fifo_read_enable,
                srst=>rx_fifo_reset_sig,
                wr_en=>data_fifo_wren,
                dout(63 downto 0)=>rx_data_DUMMY(63 downto 0),
                empty=>rx_data_fifo_empty,
                full=>open);
   
   RX_INFO_FIFO : INFO_FIFO_0
      port map (clk=>MASTER_CLK,
                din(15 downto 0)=>info_fifo_wr_data(15 downto 0),
                rd_en=>rx_info_fifo_rden,
                srst=>rx_fifo_reset_sig,
                wr_en=>info_fifo_wren,
                dout(15 downto 0)=>info_fifo_rd_data(15 downto 0),
                empty=>rx_info_fifo_empty,
                full=>open);
   
   TX_DATA_FIFO : DATA_FIFO_0
      port map (clk=>MASTER_CLK,
                din(63 downto 0)=>tx_data_fifo_din(63 downto 0),
                rd_en=>tx_data_fifo_read_enable,
                srst=>tx_fifo_reset_sig,
                wr_en=>tx_data_fifo_wr_en,
                dout(63 downto 0)=>data_fifo_rd_data(63 downto 0),
                empty=>tx_data_fifo_empty,
                full=>tx_data_fifo_full);
   
   TX_INFO_FIFO : INFO_FIFO_0
      port map (clk=>MASTER_CLK,
                din(15 downto 0)=>tx_info_fifo_din(15 downto 0),
                rd_en=>tx_info_fifo_rden,
                srst=>tx_fifo_reset_sig,
                wr_en=>tx_info_fifo_wr_en,
                dout(15 downto 0)=>tx_info_fifo_dout(15 downto 0),
                empty=>tx_info_fifo_empty,
                full=>tx_info_fifo_full);
   
   XLXI_2539 : burst_controller_sm
      port map (burst_start=>burst_start,
                burst_stop=>burst_stop,
                b_data_we=>b_data_we,
                b_end_burst=>XLXN_1735,
                b_end_packet=>b_end_packet,
                clk=>MASTER_CLK,
                reset_n=>reset_n,
                tx_data_full=>tx_data_fifo_full,
                tx_info_full=>tx_info_fifo_full,
                burst_done=>burst_done,
                b_enable=>b_enable,
                tx_data_we=>tx_data_fifo_wren_burst,
                tx_info(15 downto 0)=>tx_info_fifo_data_burst(15 downto 0),
                tx_info_we=>tx_info_fifo_wren_burst);
   
   XLXI_3364 : VCC
      port map (P=>XLXN_342);
   
   XLXI_3365 : GEC_RX_CTL_8
      port map (block_en=>XLXN_342,
                clock=>MASTER_CLK,
                data_fifo_full=>data_fifo_full,
                data_fifo_wrerr=>XLXI_3365_data_fifo_wrerr_openSignal,
                gec_user_crc_err=>gec_user_crc_err,
                gec_user_rx_data_out(7 downto 0)=>gec_user_rx_data_out(7 downto 
            0),
                gec_user_rx_size_out(10 downto 0)=>gec_user_rx_size_out(10 
            downto 0),
                gec_user_rx_valid_out=>gec_user_rx_valid_out,
                reset_n=>reset_n,
                crc_err_flag=>crc_err_flag,
                data_fifo_q_w_data(63 downto 0)=>data_fifo_wr_data(63 downto 0),
                data_fifo_wren=>data_fifo_wren,
                info_fifo_wren=>info_fifo_wren,
                info_fifo_wr_data(15 downto 0)=>info_fifo_wr_data(15 downto 0));
   
   XLXI_3401 : VCC
      port map (P=>XLXN_463);
   
   XLXI_3505 : OR2
      port map (I0=>tx_fifo_reset,
                I1=>reset,
                O=>tx_fifo_reset_sig);
   
   XLXI_3506 : RAM_COMM_DEC_9
      port map (block_en=>XLXN_463,
                burst_done=>burst_done,
                clock=>MASTER_CLK,
                reset_n=>reset_n,
                rx_data_fifo_rd_data(63 downto 0)=>rx_data_DUMMY(63 downto 0),
                rx_info_fifo_empty=>rx_info_fifo_empty,
                rx_info_fifo_rd_data(15 downto 0)=>info_fifo_rd_data(15 downto 
            0),
                tx_info_fifo_full=>tx_info_fifo_full,
                burst_start=>burst_start,
                burst_stop=>burst_stop,
                ram_addr(63 downto 0)=>ram_addr(63 downto 0),
                ram_en=>open,
                ram_wren=>ram_wren,
                rx_data_fifo_rden=>rx_data_fifo_read_enable,
                Rx_FIFO_Reset=>rx_fifo_reset,
                rx_info_fifo_rden=>rx_info_fifo_rden,
                state_diag=>open,
                tx_data_fifo_src_sel=>tx_data_fifo_src_sel,
                tx_data_fifo_wren=>tx_data_fifo_wren_comm,
                Tx_FIFO_Reset=>tx_fifo_reset,
                tx_info_fifo_src_sel=>tx_info_fifo_src_sel,
                tx_info_fifo_wren=>tx_info_fifo_wren_comm,
                tx_info_fifo_wr_data(15 downto 0)=>tx_info_fifo_data_comm(15 
            downto 0));
   
   XLXI_3511 : VCC
      port map (P=>XLXN_443);
   
   XLXI_3512 : AND2
      port map (I0=>tx_data_fifo_rden,
                I1=>data_fifo_rden_en,
                O=>tx_data_fifo_read_enable);
   
   XLXI_3513 : GEC_TX_SEQ_CTL_8
      port map (block_en=>XLXN_443,
                clk=>MASTER_CLK,
                data_fifo_empty=>data_fifo_empty,
                data_fifo_rderr=>XLXI_3513_data_fifo_rderr_openSignal,
                data_fifo_rd_data(63 downto 0)=>data_fifo_rd_data(63 downto 0),
                delay_count=>delay_count,
                gec_user_busy=>gec_user_busy,
                gec_user_tx_enable_out=>gec_user_tx_enable_out,
                info_fifo_empty=>tx_info_fifo_empty,
                info_fifo_rderr=>XLXI_3513_info_fifo_rderr_openSignal,
                info_fifo_rd_data(15 downto 0)=>tx_info_fifo_dout(15 downto 0),
                reset_n=>reset_n,
                clear_delay_count=>clear_delay_count,
                data_fifo_rden=>tx_data_fifo_rden,
                data_fifo_rden_en=>data_fifo_rden_en,
                gec_user_trigger=>gec_user_trigger,
                gec_user_tx_data_in(7 downto 0)=>gec_user_tx_data_in(7 downto 0),
                gec_user_tx_size_in(10 downto 0)=>gec_user_tx_size_in(10 downto 
            0),
                info_fifo_rden=>tx_info_fifo_rden,
                start_delay_count=>start_delay_count);
   
   XLXI_3514 : delay_counter
      port map (clear_delay_count=>clear_delay_count,
                clock=>MASTER_CLK,
                reset_n=>reset_n,
                start_delay_count=>start_delay_count,
                delay_count=>delay_count);
   
   XLXI_3526 : MUX16_2
      port map (in0(15 downto 0)=>tx_info_fifo_data_comm(15 downto 0),
                in1(15 downto 0)=>tx_info_fifo_data_burst(15 downto 0),
                sel=>tx_info_fifo_src_sel,
                muxout(15 downto 0)=>tx_info_fifo_din(15 downto 0));
   
   XLXI_3527 : M2_1_MXILINX_DATA_MANAGER
      port map (D0=>tx_info_fifo_wren_comm,
                D1=>tx_info_fifo_wren_burst,
                S0=>tx_info_fifo_src_sel,
                O=>tx_info_fifo_wr_en);
   
   XLXI_3531 : MUX64_2
      port map (in0(63 downto 0)=>tx_data(63 downto 0),
                in1(63 downto 0)=>b_data(63 downto 0),
                sel=>tx_data_fifo_src_sel,
                muxout(63 downto 0)=>tx_data_fifo_din(63 downto 0));
   
   XLXI_3532 : M2_1_MXILINX_DATA_MANAGER
      port map (D0=>tx_data_fifo_wren_comm,
                D1=>tx_data_fifo_wren_burst,
                S0=>tx_data_fifo_src_sel,
                O=>tx_data_fifo_wr_en);
   
   XLXI_3540 : GND
      port map (G=>XLXN_1735);
   
   XLXI_3541 : OR2
      port map (I0=>rx_fifo_reset,
                I1=>reset,
                O=>rx_fifo_reset_sig);
   
end BEHAVIORAL;


