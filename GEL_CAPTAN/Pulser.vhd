----------------------------------------------------------------------------------
-- Company: Fermilab
-- Engineer: Collin Bradford
-- 
-- Create Date:    11:54:07 04/15/2016 
-- Design Name: 
-- Module Name:    Pulser - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Pulser is
    Port ( clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
           pulse : out STD_LOGIC);
end Pulser;

architecture Behavioral of Pulser is
	signal temp : STD_LOGIC_VECTOR(7 downto 0);
begin
	process(clk, rst) begin
		if(rst = '0') then
			if(rising_edge(clk)) then
				temp <= temp + 1;
			end if;
		else
			temp <= (others => '0');
		end if;
	end process;
	pulse <= temp(7);
end Behavioral;

