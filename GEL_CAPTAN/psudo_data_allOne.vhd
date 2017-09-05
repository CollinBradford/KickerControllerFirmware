----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:24:08 07/21/2016 
-- Design Name: 
-- Module Name:    psudo_data_allOne - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity psudo_data_allOne is
    Port ( value_in : in  STD_LOGIC_VECTOR (7 downto 0);
           value_out : out  STD_LOGIC_VECTOR (63 downto 0));
end psudo_data_allOne;

architecture Behavioral of psudo_data_allOne is

begin
	
	value_out(7 downto 0) <= value_in;
	value_out(15 downto 8) <= value_in;
	value_out(23 downto 16) <= value_in;
	value_out(31 downto 24) <= value_in;
	value_out(39 downto 32) <= value_in;
	value_out(47 downto 40) <= value_in;
	value_out(55 downto 48) <= value_in;
	value_out(63 downto 56) <= value_in;
	
end Behavioral;

