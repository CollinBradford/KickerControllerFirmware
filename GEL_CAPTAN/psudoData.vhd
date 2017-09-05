----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:18:45 07/18/2016 
-- Design Name: 
-- Module Name:    psudoData - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity psudoData is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           delay : in  STD_LOGIC_VECTOR (7 downto 0);
           data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end psudoData;

architecture Behavioral of psudoData is
signal counter : unsigned(7 downto 0);
signal counter_two : unsigned(7 downto 0);
signal delayCounter : unsigned(7 downto 0);
signal unsDelay : unsigned(7 downto 0);

begin
	unsDelay <= (others => '0');
	process(clk) begin
		data_out(7 downto 0) <= std_logic_vector(counter);
		data_out(15 downto 8) <= std_logic_vector(counter_two);
		
		if(reset = '0') then
			if(rising_edge(clk)) then
					counter <= counter + 2;
			end if;
			counter_two <= counter + 1;
		else
			counter <= (others => '0');
			counter_two <= (others => '0');
		end if;
	end process;
	
end Behavioral;

