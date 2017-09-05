----------------------------------------------------------------------------------
-- Company: Fermi National Accelerator Labratory
-- Engineer: Collin Bradford
-- 
-- Create Date:    11:52:20 04/07/2017 
-- Design Name: 
-- Module Name:    PsudoCounter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PsudoCounter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           SampleOne : out  STD_LOGIC_VECTOR (7 downto 0);
           SampleTwo : out  STD_LOGIC_VECTOR (7 downto 0);
			  SampleThree : out std_logic_vector (7 downto 0);
			  SampleFour : out std_logic_vector (7 downto 0);
			  SampleFive : out std_logic_vector (7 downto 0);
			  SampleSix : out std_logic_vector (7 downto 0);
			  SampleSeven : out std_logic_vector (7 downto 0);
			  SampleEight : out std_logic_vector (7 downto 0));
end PsudoCounter;

architecture Behavioral of PsudoCounter is
	signal counterOne : std_logic_vector(0 to 7);
	signal counterTwo : std_logic_vector(0 to 7);
	signal counterThree : std_logic_vector(0 to 7);
	signal counterFour : std_logic_vector(0 to 7);
	signal counterFive : std_logic_vector(0 to 7);
	signal counterSix : std_logic_vector(0 to 7);
	signal counterSeven : std_logic_vector(0 to 7);
	signal counterEight : std_logic_vector(0 to 7);
begin

	process(clk, reset) begin
		
		if(reset = '0') then--reset is disabled
			
			if(rising_edge(clk)) then 
				counterOne <= counterOne + 8;--increase counter one by one
				counterTwo <= counterOne + 9;--we want counter two to always be 1 sample ahead of counter 1.  Since we are adding onto the old value of counterOne, we add 2. 
				counterThree <= counterOne + 10;
				counterFour <= counterOne + 11;
				counterFive <= counterOne + 12;
				counterSix <= counterOne + 13;
				counterSeven <= counterOne + 14;
				counterEight <= counterOne + 15;
			end if;
			
		else--reset is enabled
			counterOne   <= "00000000";
			counterTwo   <= "00000001";
			counterThree <= "00000010";
			counterFour  <= "00000011";
			counterFive  <= "00000100";
			counterSix   <= "00000101";
			counterSeven <= "00000110";
			counterEight <= "00000111";
		end if;
		
	end process;
	
	SampleOne <= counterOne;
	SampleTwo <= counterTwo;

end Behavioral;

