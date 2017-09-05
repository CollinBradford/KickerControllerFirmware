----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:23:45 08/13/2008 
-- Design Name: 
-- Module Name:    IDELAY_CTRL - Behavioral 
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

entity IDELAY_CTRL is
    Port ( clk : in  STD_LOGIC;
           we : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR (7 downto 0);
           del_ce : out  STD_LOGIC;
           del_inc : out  STD_LOGIC;
           del_rst : out  STD_LOGIC);
end IDELAY_CTRL;

architecture Behavioral of IDELAY_CTRL is

begin


end Behavioral;

