--------------------------------------------------------------------------------
-- Company: Fermilab
-- Engineer: Collin Bradford
--
-- Create Date:   14:51:35 07/06/2016
-- Design Name:   
-- Module Name:   D:/cbradford/WorkingExampleCollinDebug/GPS_ADC_/GEL_CAPTAN/FIFO_SIM_tb.vhd
-- Project Name:  dig_mac
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FIFO_SIM
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
 
ENTITY FIFO_SIM_tb IS
END FIFO_SIM_tb;
 
ARCHITECTURE behavior OF FIFO_SIM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FIFO_SIM
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         full : IN  std_logic;
         data_out : OUT  std_logic_vector(31 downto 0);
         wr_en : OUT  std_logic;
         FIFO_RESET : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '1';
   signal clk : std_logic := '0';
   signal full : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(31 downto 0);
   signal wr_en : std_logic;
   signal FIFO_RESET : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FIFO_SIM PORT MAP (
          rst => rst,
          clk => clk,
          full => full,
          data_out => data_out,
          wr_en => wr_en,
          FIFO_RESET => FIFO_RESET
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
		
		rst <= '0';

      wait for clk_period*50;
		
		full <= '1';
		
		wait for clk_period * 10;
		
		full <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
