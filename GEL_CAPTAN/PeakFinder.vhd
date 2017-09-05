----------------------------------------------------------------------------------
-- Company: Fermilab
-- Engineer: Collin Bradford
-- 
-- Create Date:    13:51:43 07/07/2016 
-- Design Name: 
-- Module Name:    PeakFinder - Behavioral 
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
-- This module analyzes the input from the adc and looks for peaks.  
-- Once the input from the adc passes the user-set threshold, it will set the address on the trigger_address
-- pin to the address of the trigger.  It will also pusle the new_trigger signal.  
--
-- This module is meant to be used with a ram block to establish a looping buffer.  The addr_out and data_out pins
-- can be directly connected to the ram to establish this looping buffer.  
-- 
-- In the case that two triggers arrive one after another without a clock cycle inbetween or a single pulse 
-- lasts longer than the user set read time, a new trigger will be immediately set and no data should be lost.  
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PeakFinder is
    Port ( clk : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  data_in : in  STD_LOGIC_VECTOR (63 downto 0);
			  signal_threshold : in STD_LOGIC_VECTOR(7 downto 0);
			  user_sample_width : in STD_LOGIC_VECTOR(15 downto 0);
           data_out : out STD_LOGIC_VECTOR (63 downto 0);
			  addr_out : out STD_LOGIC_VECTOR (10 downto 0);
           out_enable : out  STD_LOGIC;
			  trigger_address : out STD_LOGIC_VECTOR(10 downto 0);
			  new_trigger : out STD_LOGIC);
end PeakFinder;

architecture Behavioral of PeakFinder is
	signal sample_one : unsigned(7 downto 0);
	signal sample_two : unsigned(7 downto 0);
	signal sample_three : unsigned(7 downto 0);
	signal sample_four : unsigned(7 downto 0);
	signal sample_five : unsigned(7 downto 0);
	signal sample_six : unsigned(7 downto 0);
	signal sample_seven : unsigned(7 downto 0);
	signal sample_eight : unsigned(7 downto 0);
	
	signal threshold : unsigned( 7 downto 0 );
	signal ramAddress : unsigned(10 downto 0);
	signal out_en_sig : std_logic;
	signal new_trigger_sig : std_logic;
	signal triggered : std_logic;--Means that a signal is over the threshold.  Sync with clk.
	signal userSampleWidth : unsigned(15 downto 0);
	signal samplesSinceTrig : unsigned(15 downto 0);
begin
	sample_one <= unsigned(data_in(15 downto 8));
	sample_two <= unsigned(data_in(7 downto 0));
	sample_three <= unsigned(data_in(31 downto 24));
	sample_four <= unsigned(data_in(23 downto 16));
	sample_five <= unsigned(data_in(47 downto 40));
	sample_six <= unsigned(data_in(39 downto 32));
	sample_seven <= unsigned(data_in(63 downto 56));
	sample_eight <= unsigned(data_in(55 downto 48));
	
	threshold <= unsigned(signal_threshold);
	userSampleWidth <= unsigned(user_sample_width);
	out_enable <= out_en_sig;
	new_trigger <= new_trigger_sig;
	addr_out <= std_logic_vector(ramAddress);
	
	process(clk)
	
	begin
		
		data_out(7 downto 0) <= data_in(15 downto 8);
		data_out(15 downto 8) <= data_in(7 downto 0);
		
		data_out(23 downto 16) <= data_in(31 downto 24);
		data_out(31 downto 24) <= data_in(23 downto 16);
		
		data_out(39 downto 32) <= data_in(47 downto 40);
		data_out(47 downto 40) <= data_in(39 downto 32);
		
		data_out(55 downto 48) <= data_in(63 downto 56);
		data_out(63 downto 56) <= data_in(55 downto 48);
		--I switched the signals because they weren't coming through right.  They were backwards.  
		--there is probably a good explination for this somewhere, but for now I am just going to work around it with this.  
		--data_out <= data_in;
		
		out_enable <= '1'; --We are constantly recording to the ram loop buffer.  
		
		if(reset = '0') then--reset is low
		
			if(rising_edge(clk)) then--rising edge of clk and reset is low
			
				ramAddress <= ramAddress + 1;
				
				if(triggered = '0') then--no reason to test the incoming signals if we are already triggered.  This will just screw up the new trigger signal.
				
					if (sample_one > threshold or sample_two > threshold or sample_three > threshold or sample_four > threshold
							or sample_five > threshold or sample_six > threshold or sample_seven > threshold or sample_eight > threshold) then--controlls start of trigger.  
						triggered <= '1';
						new_trigger_sig <= '1';
						trigger_address <= std_logic_vector(ramAddress);
					else
						triggered <= '0';
					end if;
					
				end if;
				
				if(samplesSinceTrig >= userSampleWidth and triggered = '1')then--Our sample count matches the user request.  
					
					if (sample_one > threshold or sample_two > threshold or sample_three > threshold or sample_four > threshold
							or sample_five > threshold or sample_six > threshold or sample_seven > threshold or sample_eight > threshold) then--Only disable the sample if we aren't about to trigger again.  If we are about to trigger again, then set the new trigger signal and start over.  
						triggered <= '1';
						new_trigger_sig <= '1';
						trigger_address <= std_logic_vector(ramAddress);
						samplesSinceTrig <= "0000000000000000";
					else
						triggered <= '0';
						samplesSinceTrig <= "0000000000000000";
					end if;
				
				else
				
					if(triggered = '1')then --We took another sample.  Increase the sample count
						samplesSinceTrig <= samplesSinceTrig + 1;
					end if;
					
				end if;
				
				if(new_trigger_sig = '1') then
					new_trigger_sig <= '0';
				end if;
				
			end if;
			
		else--reset is high
			samplesSinceTrig <= (others => '0');
			triggered <= '0';
			new_trigger_sig <= '0';
			ramAddress <= (others => '0');
		end if;
	end process;
end Behavioral;

