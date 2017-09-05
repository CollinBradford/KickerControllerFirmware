----------------------------------------------------------------------------------
-- Company: FNAL
-- Engineer: Ryan Rivera
-- 
-- Create Date:    13:58:04 11/28/2007 
-- Design Name: 
-- Module Name:    fake_user_data - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fake_user_data is
    Port ( addrs : out  STD_LOGIC_VECTOR (7 downto 0);
           size : out  STD_LOGIC_VECTOR (10 downto 0);
           data : out  STD_LOGIC_VECTOR (7 downto 0));
end fake_user_data;

architecture Behavioral of fake_user_data is
begin

	addrs <= x"03";
	size <= "000" & x"12";
	data <= x"50";

end Behavioral;

