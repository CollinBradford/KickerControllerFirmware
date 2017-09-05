----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:41:24 06/18/2008 
-- Design Name: 
-- Module Name:    MUX64_2 - Behavioral 
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

entity MUX64_2 is
    Port ( in0 : in  STD_LOGIC_VECTOR (63 downto 0);
           in1 : in  STD_LOGIC_VECTOR (63 downto 0);
           sel : in  STD_LOGIC;
           muxout : out  STD_LOGIC_VECTOR (63 downto 0));
end MUX64_2;

architecture Behavioral of MUX64_2 is

begin

	process(sel,in0,in1)
	begin
		if sel = '0' then
			muxout <= in0;
		else
			muxout <= in1;		
		end if;
	end process;
end Behavioral;

