----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:37 09/28/2017 
-- Design Name: 
-- Module Name:    ext_ip_addr_map - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
--
--CE109 -  00000100 = 0x04 = 4    => 91 - kicker controller 1
--CE110 -  00010100 = 0x14 = 20  => 92 - kicker controller 2
--CE112 -  00100100 = 0x24 = 36  => 93 - kicker controller 3
--CE106 -  01000100 = 0x44 = 68  => 94 - kicker controller spare
--
--
--192.168.30.91 -- kc1 -- kicker controller 1
--192.168.30.92 -- kc2 -- kicker controller 2
--192.168.30.93 -- kc3 -- kicker controller 3
--192.168.30.94 -- kcc -- kicker controller computer
--192.168.30.95 -- kc3 -- kicker controller spare

entity ext_ip_addr_map is
    Port ( ext_ip_addr : in  STD_LOGIC_VECTOR (7 downto 0);
           ip_addr_out : out  STD_LOGIC_VECTOR (7 downto 0));
end ext_ip_addr_map;

architecture Behavioral of ext_ip_addr_map is

begin

	 ip_addr_out <= "01011011" when ext_ip_addr = "00000100" else 
	  "01011100" when ext_ip_addr = "00010100" else 
	  "01011101" when ext_ip_addr = "00100100" else 
	  "01011110" when ext_ip_addr = "01000100" else
	  ext_ip_addr;
  
end Behavioral;

