----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:58 09/23/2016 
-- Design Name: 
-- Module Name:    ClockLatchSignals - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM
--use UNISIM.VComponents.all;

entity ClockLatchSignals is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           signals : out  STD_LOGIC_VECTOR (7 downto 0));
end ClockLatchSignals;

--So, this is a module that creates signals to latch the DCMs.  Upon reset, this module will loop through the signals one at 
--a time starting with 0 and going to 7.  To latch your clocks, simply attach a signal from this module to the dcm.  If there are 
--multiple DCMs, attach signal 0 to the first, signal 1 to the second, and so on.  Each DCM is given about 16 clocks to latch.

--ERROR:  The last latch signal does not stay high for more than a clock or two.  Since I don't need so many signals, I am just giong
--use the module, but it should be fixed for anyone who wants to use this signal.    

--ERROR:  For the first few clock cycles, the latch signals read U.  

architecture Behavioral of ClockLatchSignals is
signal delay : unsigned(3 downto 0) := (others => '0'); --creates the delay for each latch.  
signal clock_place : unsigned(2 downto 0) := (others => '0');  --Holds our place so we can tell which clock we need to latch next
signal triggered : std_logic;  --Set true after start of rst.  
signal done : std_logic;  --Sets when the trigger is finished.  Triggered is not reset until rst is low.  
--triggered and done are both reset when trigger is high, done is high, and rst is low.  
begin

	
	
	process(clk) begin
		
		if(rst = '1' and triggered = '0') then -- new trigger
			triggered <= '1';
			done <= '0';
		end if;
		
		if(triggered = 'U') then
			triggered <= '0';
		end if;
		
		if(done = 'U') then
			done <= '0';
		end if;
		
		if(triggered = '1' and done = '0') then --In the middle of a trigger.  This is going to be the most complicated part here.  
			
			if(delay = "1111") then --If the latch time has past
				delay <= "0000";--Reset the delay.
				if(clock_place = "111") then --If the end of the trigger has been reached,  
					clock_place <= "000";
					done <= '1';
				else --As long as the end of the trigger has not been reached.  
					clock_place <= clock_place + 1; --Change the clock place to latch the next clock.  
				end if;
				
				--This is where I have the code that simply checks the current latch clock and turns on that latch signal.  
				
				if(clock_place = "000") then
					signals <= "00000001";
				end if;
				
				if(clock_place = "001") then
					signals <= "00000010";
				end if;
				
				if(clock_place = "010") then
					signals <= "00000100";
				end if;
				
				if(clock_place = "011") then 
					signals <= "00001000";
				end if;
				
				if(clock_place = "100") then 
					signals <= "00010000";
				end if;
				
				if(clock_place = "101") then
					signals <= "00100000";
				end if;
				
				if(clock_place = "110") then 
					signals <= "01000000"; 
				end if;
				
				if(clock_place = "111") then 
					signals <= "10000000"; 
				end if;
				
			else --We are in the middle of a trigger delaying until the current clock latches.  
				delay <= delay + 1;
			end if;
			
		end if;
		
		if(triggered = '1' and done = '1') then --When the reset signal turns off, reset everything when we are done latching.  
			triggered <= '0';
			done <= '0';
			signals <= "00000000";
		end if;
		
	end process;
	
end Behavioral;

