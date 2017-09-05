-------------------------------------------------------------------------------
--
-- Title       : fadc_params_package
-- Design      : CAPTAN
-- Author      : rrivera
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : fadc_params_package.vhd
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
--{entity {fadc_params_package} architecture {fadc_params_package}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
package fadc_params_package is

	constant MEM_ADDR_SIZE: integer := 10; -- number of bits in memory address (RAM must use entire address range)
	constant BURST_WE_DELAY: integer := 15; -- number of master clocks to delay betweenburst writes

end fadc_params_package;
package body fadc_params_package is
-- Functions and procedures
end fadc_params_package;

