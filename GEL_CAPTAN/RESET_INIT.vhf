--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : RESET_INIT.vhf
-- /___/   /\     Timestamp : 08/02/2011 18:00:41
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family virtex4 -flat -suppress -vhdl C:/Captan/FastADC/FAST_ADC_FW_01/FAST_ADC_FW_/GEL_CAPTAN/RESET_INIT.vhf -w C:/Captan/FastADC/FAST_ADC_FW_01/FAST_ADC_FW_/GEL_CAPTAN/RESET_INIT.sch
--Design Name: RESET_INIT
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

entity RESET_INIT is
   port ( CLOCK_INIT : in    std_logic; 
          RESET_INIT : out   std_logic);
end RESET_INIT;

architecture BEHAVIORAL of RESET_INIT is
   attribute BOX_TYPE   : string ;
   attribute INIT       : string ;
   signal XLXN_7     : std_logic;
   signal XLXN_8     : std_logic;
   signal XLXN_11    : std_logic;
   signal XLXN_14    : std_logic;
   signal XLXN_36    : std_logic;
   signal XLXN_37    : std_logic;
   signal XLXN_39    : std_logic;
   signal XLXN_41    : std_logic;
   signal XLXN_45    : std_logic;
   signal XLXN_46    : std_logic;
   signal XLXN_48    : std_logic;
   signal XLXN_50    : std_logic;
   signal XLXN_54    : std_logic;
   signal XLXN_55    : std_logic;
   signal XLXN_57    : std_logic;
   signal XLXN_59    : std_logic;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute INIT of XLXI_1 : label is "1";
   attribute INIT of XLXI_2 : label is "1";
   attribute INIT of XLXI_3 : label is "1";
   attribute INIT of XLXI_7 : label is "1";
   attribute INIT of XLXI_36 : label is "1";
   attribute INIT of XLXI_37 : label is "1";
   attribute INIT of XLXI_38 : label is "1";
   attribute INIT of XLXI_39 : label is "1";
   attribute INIT of XLXI_40 : label is "1";
   attribute INIT of XLXI_41 : label is "1";
   attribute INIT of XLXI_42 : label is "1";
   attribute INIT of XLXI_43 : label is "1";
   attribute INIT of XLXI_44 : label is "1";
   attribute INIT of XLXI_45 : label is "1";
   attribute INIT of XLXI_46 : label is "1";
   attribute INIT of XLXI_47 : label is "1";
begin
   XLXI_1 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_14,
                Q=>XLXN_11);
   
   XLXI_2 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_11,
                Q=>XLXN_8);
   
   XLXI_3 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_8,
                Q=>XLXN_7);
   
   XLXI_7 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_7,
                Q=>XLXN_41);
   
   XLXI_36 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_36,
                Q=>XLXN_50);
   
   XLXI_37 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_37,
                Q=>XLXN_36);
   
   XLXI_38 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_39,
                Q=>XLXN_37);
   
   XLXI_39 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_41,
                Q=>XLXN_39);
   
   XLXI_40 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_45,
                Q=>XLXN_59);
   
   XLXI_41 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_46,
                Q=>XLXN_45);
   
   XLXI_42 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_48,
                Q=>XLXN_46);
   
   XLXI_43 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_50,
                Q=>XLXN_48);
   
   XLXI_44 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_54,
                Q=>RESET_INIT);
   
   XLXI_45 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_55,
                Q=>XLXN_54);
   
   XLXI_46 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_57,
                Q=>XLXN_55);
   
   XLXI_47 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_59,
                Q=>XLXN_57);
   
   XLXI_48 : GND
      port map (G=>XLXN_14);
   
end BEHAVIORAL;


