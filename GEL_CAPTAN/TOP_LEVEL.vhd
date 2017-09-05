--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2.03i
--  \   \         Application : sch2vhdl
--  /   /         Filename : TOP_LEVEL.vhf
-- /___/   /\     Timestamp : 01/25/2008 15:27:05
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx_9_2\bin\nt\sch2vhdl.exe -intstyle ise -family virtex4 -flat -suppress -w C:/Xilinx_9_2/Projects/dig_mac_4GEL/TOP_LEVEL.sch TOP_LEVEL.vhf
--Design Name: TOP_LEVEL
--Device: virtex4
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity OBUF8_MXILINX_TOP_LEVEL is
   port ( I : in    std_logic_vector (7 downto 0); 
          O : out   std_logic_vector (7 downto 0));
end OBUF8_MXILINX_TOP_LEVEL;

architecture BEHAVIORAL of OBUF8_MXILINX_TOP_LEVEL is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   attribute BOX_TYPE    : string ;
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
begin
   I_36_30 : OBUF
      port map (I=>I(0),
                O=>O(0));
   
   I_36_31 : OBUF
      port map (I=>I(1),
                O=>O(1));
   
   I_36_32 : OBUF
      port map (I=>I(2),
                O=>O(2));
   
   I_36_33 : OBUF
      port map (I=>I(3),
                O=>O(3));
   
   I_36_34 : OBUF
      port map (I=>I(7),
                O=>O(7));
   
   I_36_35 : OBUF
      port map (I=>I(6),
                O=>O(6));
   
   I_36_36 : OBUF
      port map (I=>I(5),
                O=>O(5));
   
   I_36_37 : OBUF
      port map (I=>I(4),
                O=>O(4));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity IBUF8_MXILINX_TOP_LEVEL is
   port ( I : in    std_logic_vector (7 downto 0); 
          O : out   std_logic_vector (7 downto 0));
end IBUF8_MXILINX_TOP_LEVEL;

architecture BEHAVIORAL of IBUF8_MXILINX_TOP_LEVEL is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute BOX_TYPE    : string ;
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
begin
   I_36_30 : IBUF
      port map (I=>I(4),
                O=>O(4));
   
   I_36_31 : IBUF
      port map (I=>I(5),
                O=>O(5));
   
   I_36_32 : IBUF
      port map (I=>I(6),
                O=>O(6));
   
   I_36_33 : IBUF
      port map (I=>I(7),
                O=>O(7));
   
   I_36_34 : IBUF
      port map (I=>I(3),
                O=>O(3));
   
   I_36_35 : IBUF
      port map (I=>I(2),
                O=>O(2));
   
   I_36_36 : IBUF
      port map (I=>I(1),
                O=>O(1));
   
   I_36_37 : IBUF
      port map (I=>I(0),
                O=>O(0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity TOP_LEVEL is
   port ( GMII_RXD_0    : in    std_logic_vector (7 downto 0); 
          GMII_RX_CLK_0 : in    std_logic; 
          GMII_RX_DV_0  : in    std_logic; 
          GMII_RX_ER_0  : in    std_logic; 
          GTX_CLK_0     : out   std_logic; 
          PHY_RESET     : out   std_logic; 
          PHY_TXD       : out   std_logic_vector (7 downto 0); 
          PHY_TXEN      : out   std_logic; 
          PHY_TXER      : out   std_logic);
end TOP_LEVEL;

architecture BEHAVIORAL of TOP_LEVEL is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   attribute BOX_TYPE    : string ;
   attribute HU_SET      : string ;
   signal GMII_RXD_0_sig    : std_logic_vector (7 downto 0);
   signal GMII_RX_CLK_0_sig : std_logic;
   signal GMII_RX_DV_0_sig  : std_logic;
   signal GMII_RX_ER_0_sig  : std_logic;
   signal GTX_CLK_0_sig     : std_logic;
   signal PHY_TXD_sig       : std_logic_vector (7 downto 0);
   signal PHY_TXEN_sig      : std_logic;
   signal PHY_TXER_sig      : std_logic;
   signal reset_n           : std_logic;
   signal user_test_mode    : std_logic;
   signal user_trigger      : std_logic;
   signal XLXN_316          : std_logic_vector (7 downto 0);
   signal XLXN_317          : std_logic_vector (10 downto 0);
   signal XLXN_318          : std_logic_vector (7 downto 0);
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component fake_user_data
      port ( addrs : out   std_logic_vector (7 downto 0); 
             size  : out   std_logic_vector (10 downto 0); 
             data  : out   std_logic_vector (7 downto 0));
   end component;
   
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component IBUF8_MXILINX_TOP_LEVEL
      port ( I : in    std_logic_vector (7 downto 0); 
             O : out   std_logic_vector (7 downto 0));
   end component;
   
   component OBUF8_MXILINX_TOP_LEVEL
      port ( I : in    std_logic_vector (7 downto 0); 
             O : out   std_logic_vector (7 downto 0));
   end component;
   
   component IBUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFG : component is "DEFAULT";
   attribute CAPACITANCE of IBUFG : component is "DONT_CARE";
   attribute BOX_TYPE of IBUFG : component is "BLACK_BOX";
   
   component gigabit_ethernet_controller
      port ( user_tx_data_in    : in    std_logic_vector (7 downto 0); 
             user_tx_size_in    : in    std_logic_vector (10 downto 0); 
             user_addrs         : in    std_logic_vector (7 downto 0); 
             GMII_RXD           : in    std_logic_vector (7 downto 0); 
             GMII_RX_DV         : in    std_logic; 
             GMII_RX_ER         : in    std_logic; 
             GMII_RX_CLK        : in    std_logic; 
             user_test_mode     : in    std_logic; 
             user_trigger       : in    std_logic; 
             reset_n            : in    std_logic; 
             user_rx_size_out   : out   std_logic_vector (10 downto 0); 
             GMII_TX_EN         : out   std_logic; 
             GMII_TX_ER         : out   std_logic; 
             GTX_CLK            : out   std_logic; 
             user_busy          : out   std_logic; 
             user_rx_valid_out  : out   std_logic; 
             user_tx_enable_out : out   std_logic; 
             user_rx_data_out   : out   std_logic_vector (7 downto 0); 
             GMII_TXD           : out   std_logic_vector (7 downto 0); 
             crc_err            : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_180 : label is "XLXI_180_0";
   attribute HU_SET of XLXI_195 : label is "XLXI_195_1";
begin
   XLXI_17 : OBUF
      port map (I=>reset_n,
                O=>PHY_RESET);
   
   XLXI_143 : fake_user_data
      port map (addrs(7 downto 0)=>XLXN_316(7 downto 0),
                data(7 downto 0)=>XLXN_318(7 downto 0),
                size(10 downto 0)=>XLXN_317(10 downto 0));
   
   XLXI_178 : IBUF
      port map (I=>GMII_RX_DV_0,
                O=>GMII_RX_DV_0_sig);
   
   XLXI_179 : IBUF
      port map (I=>GMII_RX_ER_0,
                O=>GMII_RX_ER_0_sig);
   
   XLXI_180 : IBUF8_MXILINX_TOP_LEVEL
      port map (I(7 downto 0)=>GMII_RXD_0(7 downto 0),
                O(7 downto 0)=>GMII_RXD_0_sig(7 downto 0));
   
   XLXI_192 : OBUF
      port map (I=>GTX_CLK_0_sig,
                O=>GTX_CLK_0);
   
   XLXI_193 : OBUF
      port map (I=>PHY_TXER_sig,
                O=>PHY_TXER);
   
   XLXI_194 : OBUF
      port map (I=>PHY_TXEN_sig,
                O=>PHY_TXEN);
   
   XLXI_195 : OBUF8_MXILINX_TOP_LEVEL
      port map (I(7 downto 0)=>PHY_TXD_sig(7 downto 0),
                O(7 downto 0)=>PHY_TXD(7 downto 0));
   
   XLXI_237 : IBUFG
      port map (I=>GMII_RX_CLK_0,
                O=>GMII_RX_CLK_0_sig);
   
   XLXI_274 : gigabit_ethernet_controller
      port map (GMII_RXD(7 downto 0)=>GMII_RXD_0_sig(7 downto 0),
                GMII_RX_CLK=>GMII_RX_CLK_0_sig,
                GMII_RX_DV=>GMII_RX_DV_0_sig,
                GMII_RX_ER=>GMII_RX_ER_0_sig,
                reset_n=>reset_n,
                user_addrs(7 downto 0)=>XLXN_316(7 downto 0),
                user_test_mode=>user_test_mode,
                user_trigger=>user_trigger,
                user_tx_data_in(7 downto 0)=>XLXN_318(7 downto 0),
                user_tx_size_in(10 downto 0)=>XLXN_317(10 downto 0),
                crc_err=>open,
                GMII_TXD(7 downto 0)=>PHY_TXD_sig(7 downto 0),
                GMII_TX_EN=>PHY_TXEN_sig,
                GMII_TX_ER=>PHY_TXER_sig,
                GTX_CLK=>GTX_CLK_0_sig,
                user_busy=>open,
                user_rx_data_out=>open,
                user_rx_size_out=>open,
                user_rx_valid_out=>open,
                user_tx_enable_out=>open);
   
   XLXI_275 : GND
      port map (G=>user_test_mode);
   
   XLXI_276 : VCC
      port map (P=>reset_n);
   
end BEHAVIORAL;


