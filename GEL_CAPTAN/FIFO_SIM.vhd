----------------------------------------------------------------------------------
-- Company: Fermilab
-- Engineer: Collin Bradford
-- 
-- Create Date:    14:19:52 07/06/2016 
-- Design Name: 
-- Module Name:    FIFO_SIM - Behavioral 
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

entity FIFO_SIM is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           full : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           wr_en : out  STD_LOGIC;
			  FIFO_RESET : out std_logic;
			  threshold : out std_logic_vector(7 downto 0));
end FIFO_SIM;
--FIFO reset is simply disabled and not needed.  We are pushing data here.  If we lose some, we can't get it back anyway.
architecture Behavioral of FIFO_SIM is
	signal counter : std_logic_vector(31 downto 0);
begin
	threshold <= "11000000";
	data_out <= counter;
	process(rst, clk, full) begin
		if(rst = '0') then
			if(rising_edge(clk)) then
				if(full = '0') then
					FIFO_RESET <= '0';
					counter <= counter + 1;
					wr_en <= '1';
				else
					wr_en <= '0';
					FIFO_RESET <= '0';
				end if;
			end if;
		else --reset code here.  
			counter <= (others => '0');
			FIFO_RESET <= '0';
		end if;
	end process;
	
end Behavioral;

