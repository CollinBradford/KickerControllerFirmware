--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:38:32 09/30/2016
-- Design Name:   
-- Module Name:   D:/cbradford/NewADCFirmware/GEL_CAPTAN/ClockLatchSignals_tb.vhd
-- Project Name:  dig_mac
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ClockLatchSignals
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
--USE ieee.numeric_std.ALL;
 
ENTITY ClockLatchSignals_tb IS
END ClockLatchSignals_tb;
 
ARCHITECTURE behavior OF ClockLatchSignals_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ClockLatchSignals
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         signals : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal signals : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ClockLatchSignals PORT MAP (
          clk => clk,
          rst => rst,
          signals => signals
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
		rst <= '0';
      wait for 10 ns;	
		
		rst <= '1';

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
