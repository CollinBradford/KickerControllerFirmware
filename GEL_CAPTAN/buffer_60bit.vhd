----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:36:39 10/22/2009 
-- Design Name: 
-- Module Name:    buffer_12bit - Behavioral 
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

entity buffer_60bit is
    Port ( i : in  STD_LOGIC_VECTOR (59 downto 0);
           o : out  STD_LOGIC_VECTOR (59 downto 0));
end buffer_60bit;

architecture Behavioral of buffer_60bit is

begin
 o <= i;
end Behavioral;

