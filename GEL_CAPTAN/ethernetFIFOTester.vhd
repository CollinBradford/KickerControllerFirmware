----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:37:51 07/06/2016 
-- Design Name: 
-- Module Name:    ethernetFIFOTester - Behavioral 
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

entity ethernetFIFOTester is
    Port ( full : in  STD_LOGIC;
           empty : in  STD_LOGIC;
           dout : in  STD_LOGIC;
           prog_empty : in  STD_LOGIC;
           m_clk : in  STD_LOGIC;
           rst : out  STD_LOGIC;
           din : out  STD_LOGIC_VECTOR (31 downto 0);
           wr_en : out  STD_LOGIC;
           rd_en : out  STD_LOGIC);
end ethernetFIFOTester;

architecture Behavioral of ethernetFIFOTester is

begin


end Behavioral;

