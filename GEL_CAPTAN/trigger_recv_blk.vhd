----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:17 08/01/2011 
-- Design Name: 
-- Module Name:    trigger_recv_blk - Behavioral 
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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity trigger_recv_blk is
    Port ( scin0 : in  STD_LOGIC;
           scin1 : in  STD_LOGIC;
           scin2 : in  STD_LOGIC;
           scin3 : in  STD_LOGIC;
           selCh0 : in  STD_LOGIC;
           trig : out  STD_LOGIC;
           cnt : out  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end trigger_recv_blk;

architecture Behavioral of trigger_recv_blk is

	signal trig_in : std_logic;
	signal trig_old : std_logic;
   signal cnt_sig :  STD_LOGIC_VECTOR (31 downto 0);
	
begin

	cnt <= cnt_sig;
	
	process(clk)
	begin
	
		if rising_edge(clk) then
		
			trig_old <= trig_in;
			trig <= '0';
			
			if rst = '1' then
				cnt_sig <= (others => '0');
				trig_in <= '0';
			else
			
				if selCh0 = '1' then -- only ch0
					trig_in <= scin0;
				else
					trig_in <= scin0 and scin1 and scin2 and scin3;
				end if;
				
				
				if trig_old = '0' and trig_in = '1' then
					cnt_sig <= cnt_sig + 1;
					trig <= '1';
				end if;
				
			end if;
			
		end if;
	
	end process;


end Behavioral;

