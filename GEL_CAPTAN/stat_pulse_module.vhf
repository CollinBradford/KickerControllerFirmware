--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : stat_pulse_module.vhf
-- /___/   /\     Timestamp : 08/04/2017 15:16:24
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/cbradford/PulsePerPackage/ipcore_dir -sympath D:/cbradford/PulsePerPackage/GEL_CAPTAN/ipcore_dir -intstyle ise -family virtex4 -flat -suppress -vhdl D:/cbradford/PulsePerPackage/GEL_CAPTAN/stat_pulse_module.vhf -w D:/cbradford/PulsePerPackage/GEL_CAPTAN/stat_pulse_module.sch
--Design Name: stat_pulse_module
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

entity ILD_MXILINX_stat_pulse_module is
   generic( INIT : bit :=  '0');
   port ( D : in    std_logic; 
          G : in    std_logic; 
          Q : out   std_logic);
end ILD_MXILINX_stat_pulse_module;

architecture BEHAVIORAL of ILD_MXILINX_stat_pulse_module is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute BOX_TYPE    : string ;
   attribute IOB         : string ;
   signal D_IN   : std_logic;
   signal XLXN_1 : std_logic;
   signal XLXN_2 : std_logic;
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component LDCE
      generic( INIT : bit :=  '0');
      port ( CLR : in    std_logic; 
             D   : in    std_logic; 
             G   : in    std_logic; 
             GE  : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of LDCE : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute IOB of I_36_24 : label is "TRUE";
begin
   I_36_23 : IBUF
      port map (I=>D,
                O=>D_IN);
   
   I_36_24 : LDCE
   generic map( INIT => INIT)
      port map (CLR=>XLXN_1,
                D=>D_IN,
                G=>G,
                GE=>XLXN_2,
                Q=>Q);
   
   I_36_32 : VCC
      port map (P=>XLXN_2);
   
   I_36_33 : GND
      port map (G=>XLXN_1);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity stat_pulse_module is
   port ( adc_fifo_overflow        : in    std_logic; 
          ethernet_fifo_in_en      : in    std_logic; 
          ethernet_fifo_overflow   : in    std_logic; 
          master_clk               : in    std_logic; 
          new_peak                 : in    std_logic; 
          reset                    : in    std_logic; 
          new_stat                 : out   std_logic; 
          stat_b_data              : out   std_logic_vector (63 downto 0); 
          stat_ethernet_fifo_in_en : out   std_logic);
end stat_pulse_module;

architecture BEHAVIORAL of stat_pulse_module is
   attribute HU_SET     : string ;
   signal XLXN_7                   : std_logic;
   signal XLXN_8                   : std_logic;
   signal XLXN_19                  : std_logic;
   signal XLXN_21                  : std_logic;
   component stat_pulse
      port ( master_clk                     : in    std_logic; 
             reset                          : in    std_logic; 
             adc_fifo_overflow              : in    std_logic; 
             ethernet_fifo_overflow         : in    std_logic; 
             new_peak                       : in    std_logic; 
             ethernet_fifo_in_en            : in    std_logic; 
             adc_fifo_overflow_lat_res      : out   std_logic; 
             ethernet_fifo_overflow_lat_res : out   std_logic; 
             stat_ethernet_fifo_in_en       : out   std_logic; 
             tx_data                        : out   std_logic_vector (63 downto 
            0); 
             new_stat                       : out   std_logic);
   end component;
   
   component ILD_MXILINX_stat_pulse_module
      generic( INIT : bit :=  '0');
      port ( D : in    std_logic; 
             G : in    std_logic; 
             Q : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_0";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_1";
begin
   XLXI_1 : stat_pulse
      port map (adc_fifo_overflow=>XLXN_7,
                ethernet_fifo_in_en=>ethernet_fifo_in_en,
                ethernet_fifo_overflow=>XLXN_8,
                master_clk=>master_clk,
                new_peak=>new_peak,
                reset=>reset,
                adc_fifo_overflow_lat_res=>XLXN_19,
                ethernet_fifo_overflow_lat_res=>XLXN_21,
                new_stat=>new_stat,
                stat_ethernet_fifo_in_en=>stat_ethernet_fifo_in_en,
                tx_data(63 downto 0)=>stat_b_data(63 downto 0));
   
   XLXI_2 : ILD_MXILINX_stat_pulse_module
      port map (D=>adc_fifo_overflow,
                G=>XLXN_19,
                Q=>XLXN_7);
   
   XLXI_3 : ILD_MXILINX_stat_pulse_module
      port map (D=>ethernet_fifo_overflow,
                G=>XLXN_21,
                Q=>XLXN_8);
   
end BEHAVIORAL;


