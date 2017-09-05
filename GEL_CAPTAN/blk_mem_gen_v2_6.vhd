--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : 
--  /   /         Filename : xil_3076_103
-- /___/   /\     Timestamp : 07/06/2016 09:55:02
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity blk_mem_gen_v2_6 is
   port ( addra : in    std_logic_vector (5 downto 0); 
          addrb : in    std_logic_vector (5 downto 0); 
          clka  : in    std_logic; 
          clkb  : in    std_logic; 
          dina  : in    std_logic_vector (63 downto 0); 
          dinb  : in    std_logic_vector (63 downto 0); 
          wea   : in    std_logic_vector (0 downto 0); 
          web   : in    std_logic_vector (0 downto 0); 
          douta : out   std_logic_vector (63 downto 0); 
          doutb : out   std_logic_vector (63 downto 0));
end blk_mem_gen_v2_6;

architecture BEHAVIORAL of blk_mem_gen_v2_6 is
begin
end BEHAVIORAL;

-- synopsys translate_off
configuration CFG_blk_mem_gen_v2_6 of  blk_mem_gen_v2_6 is
   for BEHAVIORAL
   end for;
end CFG_blk_mem_gen_v2_6;
-- synopsys translate_on

