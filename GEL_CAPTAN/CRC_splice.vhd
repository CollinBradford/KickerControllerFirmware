----------------------------------------------------------------------------------
-- Company:  FNAL
-- Engineer:  Ryan Rivera
-- 
-- Create Date:    16:52:08 12/04/2007 
-- Design Name: 
-- Module Name:    CRC_splice - Behavioral 
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

entity CRC_splice is
    Port ( data : in  STD_LOGIC_VECTOR (7 downto 0);
           crc : in  STD_LOGIC_VECTOR (7 downto 0);
           rd : in  STD_LOGIC;
           dataout : out  STD_LOGIC_VECTOR (7 downto 0));
end CRC_splice;

architecture Behavioral of CRC_splice is

begin

	process(rd,crc,data)
	begin
	
		if rd = '1' then
			dataout <= crc;
		else
			dataout <= data;
		end if;
	
	end process;

end Behavioral;

