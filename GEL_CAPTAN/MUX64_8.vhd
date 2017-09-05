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

entity MUX64_8 is
    Port ( in0 : in  STD_LOGIC_VECTOR (63 downto 0);
           in1 : in  STD_LOGIC_VECTOR (63 downto 0);
           in2 : in  STD_LOGIC_VECTOR (63 downto 0);
           in3 : in  STD_LOGIC_VECTOR (63 downto 0);
			  in4 : in  STD_LOGIC_VECTOR (63 downto 0);
           in5 : in  STD_LOGIC_VECTOR (63 downto 0);
           in6 : in  STD_LOGIC_VECTOR (63 downto 0);
           in7 : in  STD_LOGIC_VECTOR (63 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           muxout : out  STD_LOGIC_VECTOR (63 downto 0));
end MUX64_8;

architecture Behavioral of MUX64_8 is

begin

	process(sel,in0,in1,in2,in3,in4,in5,in6,in7)
	begin

		if 	sel = 0 then	muxout <= in0;		
		elsif sel = 1 then	muxout <= in1;		
		elsif sel = 2 then	muxout <= in2;	
		elsif sel = 3 then	muxout <= in3;	
		elsif sel = 4 then	muxout <= in4;	
		elsif sel = 5 then	muxout <= in5;	
		elsif sel = 6 then	muxout <= in6;	
		elsif sel = 7 then	muxout <= in7;			
		end if;
		
	end process;
end Behavioral;

