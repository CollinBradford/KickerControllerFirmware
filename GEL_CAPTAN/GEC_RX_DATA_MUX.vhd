----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:22:26 06/10/2008 
-- Design Name: 
-- Module Name:    GEC_RX_DATA_MUX - Behavioral 
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

entity GEC_RX_DATA_MUX is
    Port ( in0 : in  STD_LOGIC_VECTOR (7 downto 0);
           in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC;
           muxout : out  STD_LOGIC_VECTOR (7 downto 0));
end GEC_RX_DATA_MUX;

architecture Behavioral of GEC_RX_DATA_MUX is

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

