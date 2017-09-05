----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:36:39 10/22/2009 
-- Design Name: 
-- Module Name:    buffer_4x12_to_10 - Behavioral 
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

entity buffer_4x12_to_10 is
    Port ( i : in  STD_LOGIC_VECTOR (47 downto 0);
           o : out  STD_LOGIC_VECTOR (39 downto 0));
end buffer_4x12_to_10;

architecture Behavioral of buffer_4x12_to_10 is
 -- take the 10 most significant bits from the 4 12-bit inputs and place in a new bus
begin
 o(9 downto 0) <= i(11 downto 2);
 o(19 downto 10) <= i(23 downto 14);
 o(29 downto 20) <= i(35 downto 26);
 o(39 downto 30) <= i(47 downto 38);
end Behavioral;

