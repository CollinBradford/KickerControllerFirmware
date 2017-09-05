--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : gigabit_ethernet_controller.vhf
-- /___/   /\     Timestamp : 08/02/2011 18:00:43
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family virtex4 -flat -suppress -vhdl C:/Captan/FastADC/FAST_ADC_FW_01/FAST_ADC_FW_/GEL_CAPTAN/gigabit_ethernet_controller.vhf -w C:/Captan/FastADC/FAST_ADC_FW_01/FAST_ADC_FW_/GEL_CAPTAN/gigabit_ethernet_controller.sch
--Design Name: gigabit_ethernet_controller
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

entity gigabit_ethernet_controller is
   port ( GMII_RXD           : in    std_logic_vector (7 downto 0); 
          GMII_RX_CLK        : in    std_logic; 
          GMII_RX_DV         : in    std_logic; 
          GMII_RX_ER         : in    std_logic; 
          reset              : in    std_logic; 
          user_addrs         : in    std_logic_vector (7 downto 0); 
          user_test_mode     : in    std_logic; 
          user_trigger       : in    std_logic; 
          user_tx_data_in    : in    std_logic_vector (7 downto 0); 
          user_tx_size_in    : in    std_logic_vector (10 downto 0); 
          crc_err            : out   std_logic; 
          GMII_TXD           : out   std_logic_vector (7 downto 0); 
          GMII_TX_EN         : out   std_logic; 
          GMII_TX_ER         : out   std_logic; 
          GTX_CLK            : out   std_logic; 
          user_busy          : out   std_logic; 
          user_rx_data_out   : out   std_logic_vector (7 downto 0); 
          user_rx_size_out   : out   std_logic_vector (10 downto 0); 
          user_rx_valid_out  : out   std_logic; 
          user_tx_enable_out : out   std_logic);
end gigabit_ethernet_controller;

architecture BEHAVIORAL of gigabit_ethernet_controller is
   signal crc_chk_en         : std_logic;
   signal crc_chk_err        : std_logic;
   signal crc_gen_en         : std_logic;
   signal crc_gen_init       : std_logic;
   signal crc_gen_rd         : std_logic;
   signal crc_init           : std_logic;
   signal crc_out            : std_logic_vector (7 downto 0);
   signal rx_data            : std_logic_vector (7 downto 0);
   signal rx_dv              : std_logic;
   signal rx_er              : std_logic;
   signal txd_sig            : std_logic_vector (7 downto 0);
   component CRC_chk
      port ( Reset      : in    std_logic; 
             Clk        : in    std_logic; 
             CRC_init   : in    std_logic; 
             CRC_en     : in    std_logic; 
             CRC_chk_en : in    std_logic; 
             CRC_data   : in    std_logic_vector (7 downto 0); 
             CRC_err    : out   std_logic);
   end component;
   
   component CRC_gen
      port ( Reset      : in    std_logic; 
             Clk        : in    std_logic; 
             Init       : in    std_logic; 
             Data_en    : in    std_logic; 
             CRC_rd     : in    std_logic; 
             Frame_data : in    std_logic_vector (7 downto 0); 
             CRC_end    : out   std_logic; 
             CRC_out    : out   std_logic_vector (7 downto 0));
   end component;
   
   component CRC_splice
      port ( rd      : in    std_logic; 
             data    : in    std_logic_vector (7 downto 0); 
             crc     : in    std_logic_vector (7 downto 0); 
             dataout : out   std_logic_vector (7 downto 0));
   end component;
   
   component DIG_GEC
      port ( GMII_RX_CLK        : in    std_logic; 
             GMII_RX_DV         : in    std_logic; 
             GMII_RX_ER         : in    std_logic; 
             reset              : in    std_logic; 
             test_mode          : in    std_logic; 
             trigger            : in    std_logic; 
             GMII_RXD           : in    std_logic_vector (7 downto 0); 
             user_addrs         : in    std_logic_vector (7 downto 0); 
             user_tx_data_in    : in    std_logic_vector (7 downto 0); 
             user_tx_size_in    : in    std_logic_vector (10 downto 0); 
             GMII_GTX_CLK       : out   std_logic; 
             GMII_TX_EN         : out   std_logic; 
             GMII_TX_ER         : out   std_logic; 
             busy               : out   std_logic; 
             crc_chk_en         : out   std_logic; 
             crc_chk_err        : out   std_logic; 
             crc_chk_init       : out   std_logic; 
             crc_gen_en         : out   std_logic; 
             crc_gen_init       : out   std_logic; 
             crc_gen_rd         : out   std_logic; 
             en_tx_data         : out   std_logic; 
             udp_data_valid_out : out   std_logic; 
             GMII_TXD           : out   std_logic_vector (7 downto 0); 
             udp_data_count     : out   std_logic_vector (10 downto 0); 
             user_rx_data_out   : out   std_logic_vector (7 downto 0));
   end component;
   
   component RX_IN_LATCH
      port ( clk : in    std_logic; 
             dv  : in    std_logic; 
             er  : in    std_logic; 
             d   : in    std_logic_vector (7 downto 0); 
             do  : out   std_logic_vector (7 downto 0); 
             dvo : out   std_logic; 
             ero : out   std_logic);
   end component;
   
begin
   XLXI_226 : CRC_chk
      port map (Clk=>GMII_RX_CLK,
                CRC_chk_en=>crc_chk_err,
                CRC_data(7 downto 0)=>rx_data(7 downto 0),
                CRC_en=>crc_chk_en,
                CRC_init=>crc_init,
                Reset=>reset,
                CRC_err=>crc_err);
   
   XLXI_238 : CRC_gen
      port map (Clk=>GMII_RX_CLK,
                CRC_rd=>crc_gen_rd,
                Data_en=>crc_gen_en,
                Frame_data(7 downto 0)=>txd_sig(7 downto 0),
                Init=>crc_gen_init,
                Reset=>reset,
                CRC_end=>open,
                CRC_out(7 downto 0)=>crc_out(7 downto 0));
   
   XLXI_248 : CRC_splice
      port map (crc(7 downto 0)=>crc_out(7 downto 0),
                data(7 downto 0)=>txd_sig(7 downto 0),
                rd=>crc_gen_rd,
                dataout(7 downto 0)=>GMII_TXD(7 downto 0));
   
   XLXI_249 : DIG_GEC
      port map (GMII_RXD(7 downto 0)=>rx_data(7 downto 0),
                GMII_RX_CLK=>GMII_RX_CLK,
                GMII_RX_DV=>rx_dv,
                GMII_RX_ER=>rx_er,
                reset=>reset,
                test_mode=>user_test_mode,
                trigger=>user_trigger,
                user_addrs(7 downto 0)=>user_addrs(7 downto 0),
                user_tx_data_in(7 downto 0)=>user_tx_data_in(7 downto 0),
                user_tx_size_in(10 downto 0)=>user_tx_size_in(10 downto 0),
                busy=>user_busy,
                crc_chk_en=>crc_chk_en,
                crc_chk_err=>crc_chk_err,
                crc_chk_init=>crc_init,
                crc_gen_en=>crc_gen_en,
                crc_gen_init=>crc_gen_init,
                crc_gen_rd=>crc_gen_rd,
                en_tx_data=>user_tx_enable_out,
                GMII_GTX_CLK=>GTX_CLK,
                GMII_TXD(7 downto 0)=>txd_sig(7 downto 0),
                GMII_TX_EN=>GMII_TX_EN,
                GMII_TX_ER=>GMII_TX_ER,
                udp_data_count(10 downto 0)=>user_rx_size_out(10 downto 0),
                udp_data_valid_out=>user_rx_valid_out,
                user_rx_data_out(7 downto 0)=>user_rx_data_out(7 downto 0));
   
   XLXI_251 : RX_IN_LATCH
      port map (clk=>GMII_RX_CLK,
                d(7 downto 0)=>GMII_RXD(7 downto 0),
                dv=>GMII_RX_DV,
                er=>GMII_RX_ER,
                do(7 downto 0)=>rx_data(7 downto 0),
                dvo=>rx_dv,
                ero=>rx_er);
   
end BEHAVIORAL;


