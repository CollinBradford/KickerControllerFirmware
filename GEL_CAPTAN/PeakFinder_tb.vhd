--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:02:27 07/07/2016
-- Design Name:   
-- Module Name:   D:/cbradford/WorkingExampleCollinDebug/GPS_ADC_/GEL_CAPTAN/PeakFinder_tb.vhd
-- Project Name:  dig_mac
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PeakFinder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY PeakFinder_tb IS
END PeakFinder_tb;
 
ARCHITECTURE behavior OF PeakFinder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PeakFinder
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         data_in : IN  std_logic_vector(127 downto 0);
         empty : IN  std_logic;
			signal_threshold : IN std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(127 downto 0);
         out_enable : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal data_in : std_logic_vector(127 downto 0) := (others => '0');
	signal signal_threshold : std_logic_vector(7 downto 0);
   signal empty : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(127 downto 0);
   signal out_enable : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PeakFinder PORT MAP (
          clk => clk,
          reset => reset,
          data_in => data_in,
          empty => empty,
			 signal_threshold => signal_threshold,
          data_out => data_out,
          out_enable => out_enable
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '0';
      wait for clk_period*10;

      -- insert stimulus here 
			data_in(127 downto 7) <= (others => '0');
			signal_threshold <= "00000100";
			data_in(7 downto 0) <= "00001000";
			wait for clk_period * 10;
			data_in <= (others => '0');
			wait for clk_period * 10;
			data_in(7 downto 0) <= "00000010";
      wait;
   end process;

END;
