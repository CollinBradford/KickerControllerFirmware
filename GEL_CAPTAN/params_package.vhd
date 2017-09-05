-------------------------------------------------------------------------------
--
-- Title       : params_package
-- Design      : CAPTAN
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : params_package.vhd
-- Generated   : Mon Jun  9 15:12:08 2008
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {params_package} architecture {params_package}}
	 
	
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
package params_package is	
 
-- Constants 
-- 3 bit constants
	constant v_3_0: std_logic_vector := "000";
	constant v_3_1: std_logic_vector := "001";
	constant v_3_7: std_logic_vector := "111";
	
-- 5 bit constants
	constant v_5_0: std_logic_vector := "00000";
	constant v_5_1: std_logic_vector := "00001";
	constant v_5_22: std_logic_vector := "10110"; 
-- for CRC Loop counting from GEC
		
-- 8 bit constants		
	constant v_8_0: std_logic_vector := "00000000";
	constant v_8_1: std_logic_vector := "00000001";
	constant v_8_255: std_logic_vector := "11111111";
	
-- 11 bit constants
	constant v_11_0: std_logic_vector := "00000000000";
	constant v_11_1: std_logic_vector := "00000000001";	
	constant v_11_2: std_logic_vector := "00000000010";
	
-- 16 bit constants
	constant v_16_0: std_logic_vector := "0000000000000000";
	constant v_16_1: std_logic_vector := "0000000000000001";
	constant delay_term: std_logic_vector := x"000A"; --x"07D0";
	
-- 32 bit constants:
	constant v_32_0: std_logic_vector := "00000000000000000000000000000000";
	constant v_32_1: std_logic_vector := "00000000000000000000000000000001";
	
-- 64 bit constants:
	constant v_64_0: std_logic_vector := "0000000000000000000000000000000000000000000000000000000000000000"; 
	constant v_64_1: std_logic_vector := "0000000000000000000000000000000000000000000000000000000000000001";
	constant dev_addr0: std_logic_vector := "0100000000000000000000000000000000000000000000000000000000000000";
	constant dev_addr1: std_logic_vector := "0100000000000000000000000000000000000000000000000000000000000001";
	-- test value
end params_package; 

package	body params_package is
	
-- Functions and procedures
end params_package;
