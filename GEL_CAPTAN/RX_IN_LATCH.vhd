----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:11:47 03/18/2009 
-- Design Name: 
-- Module Name:    RX_IN_LATCH - Behavioral 
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

entity RX_IN_LATCH is
    Port ( clk : in  STD_LOGIC;
           dv : in  STD_LOGIC;
           er : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           dvo : out  STD_LOGIC;
           ero : out  STD_LOGIC;
           do : out  STD_LOGIC_VECTOR (7 downto 0));
end RX_IN_LATCH;

architecture Behavioral of RX_IN_LATCH is

begin

	process(clk)
	begin
		if falling_edge(clk) then
			dvo <= dv;
			ero <= er;
			do <= d;
		end if;
	end process;

end Behavioral;

