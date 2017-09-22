----------------------------------------------------------------------------------
-- Company: Fermilab
-- Engineer: Collin Bradford
-- 
-- Create Date:    10:14:49 07/08/2016 
-- Design Name: 
-- Module Name:    data_send - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: The data_send module receives a trigger event from the peak_finder module with the address of the event.  
-- It then waits until the circular buffer has come around to the start address and reads out the information.  This module
-- takes into account the number of pretrigger samples, the read size, and the positive delay requested by the user when 
-- collecting the samples to read.  The module also adds header and footer information to the starting and ending packets.
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity data_send is
    Port ( --default signals
			  rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  --data signals
           data_in : in  STD_LOGIC_VECTOR (63 downto 0);
			  --trigger signals
			  new_trigger : in STD_LOGIC;
			  trigger_addr : in STD_LOGIC_VECTOR (9 downto 0);
			  ram_addr : in STD_LOGIC_VECTOR (9 downto 0);
			  --user sample sizes
			  user_sample_size : in STD_LOGIC_VECTOR (15 downto 0);
			  user_pretrig_sample_size : in STD_LOGIC_VECTOR (15 downto 0);
			  user_positive_delay : in STD_LOGIC_VECTOR(15 downto 0);
			  --header/footer signals
			  debug_signals : in STD_LOGIC_VECTOR(7 downto 0);
			  signal_ID : in STD_LOGIC_VECTOR(3 downto 0);
			  header : in STD_LOGIC_VECTOR(59 downto 0);
			  --burst data control signals
           b_data : out  STD_LOGIC_VECTOR (63 downto 0);
           b_data_we : out  STD_LOGIC;
			  b_force_packet : out STD_LOGIC);
end data_send;

architecture Behavioral of data_send is
--address signals
signal startAddr : unsigned(9 downto 0);
signal endAddr : unsigned(9 downto 0);
--repeated signals
signal userSampleSizeUns : unsigned(15 downto 0);
signal userPretrigSamplesUns : unsigned(15 downto 0);
signal userPositiveDelayUns : unsigned(15 downto 0);
signal triggerAddressUns : unsigned(9 downto 0);
signal ramAddrUns : unsigned(9 downto 0);
--positive delay signals
signal positiveDelayTimer : unsigned(15 downto 0);
signal timing : std_logic;
--internal flags
signal armed : std_logic;
signal reading : std_logic;
signal sendUDP : std_logic;
signal burstWrEn : std_logic;
signal headerTwoStart : std_logic;
signal busy : std_logic;
--outgoing data signals 
signal dataOut : std_logic_vector(63 downto 0);
signal headerOneOut : std_logic_vector(63 downto 0);
signal headerTwoOut : std_logic_vector(63 downto 0);
--header signals
signal missedTriggerCount : unsigned(7 downto 0);
signal triggerCount : unsigned(31 downto 0); --Keeps a count of the number of triggers
signal sampleSize : unsigned(15 downto 0); --Number of samles for this read (in clocks meaning that 1 clock = 4 samples)

begin	
	--repeated signal assignments
	b_force_packet <=  sendUDP;
	triggerAddressUns <= unsigned(trigger_addr);
	userSampleSizeUns <= unsigned(user_sample_size);
	userPretrigSamplesUns <= unsigned(user_pretrig_sample_size);
	userPositiveDelayUns <= unsigned(user_positive_delay);
	ramAddrUns <= unsigned(ram_addr);
	--data signal assignments (repeated)
	dataOut(7 downto 0) <= data_in(63 downto 56);
	dataOut(15 downto 8) <= data_in(55 downto 48);
	dataOut(23 downto 16) <= data_in(47 downto 40);
	dataOut(31 downto 24) <= data_in(39 downto 32);
	dataOut(39 downto 32) <= data_in(31 downto 24);
	dataOut(47 downto 40) <= data_in(23 downto 16);
	dataOut(55 downto 48) <= data_in(15 downto 8);
	dataOut(63 downto 56) <= data_in(7 downto 0);
	--header one signal assignments
	headerOneOut(63 downto 32) <= std_logic_vector(triggerCount(31 downto 0));
	headerOneOut(31 downto 16) <= std_logic_vector(sampleSize(15 downto 0));
	headerOneOut(15 downto 8) <= debug_signals(7 downto 0);
	headerOneOut(7 downto 0) <= std_logic_vector(missedTriggerCount(7 downto 0));
	--header two signal assignments
	headerTwoOut(63 downto 60) <= signal_ID(3 downto 0);
	headerTwoOut(59 downto 0) <= header(59 downto 0);
	
	process(clk) begin
		if(rst = '0') then
			if(rising_edge(clk)) then
				--latch the address data as soon as we recieve a trigger event
				if(new_trigger = '1') then
					--only latch the new trigger if we don't already have one.  
					if(busy = '0') then
						busy <= '1';
						timing <= '1';
						positiveDelayTimer <= (others => '0');
						triggerCount <= triggerCount + 1;
						sampleSize <= userSampleSizeUns + userPretrigSamplesUns;
						startAddr <= triggerAddressUns + userPositiveDelayUns - userPretrigSamplesUns;--This last number accounts for any delay in the firmware.  There must be at least -2 clocks allowed for placement of the header information.  Currently, another clock is requried by the peak_finder moduel for a total of -2.
						endAddr <= triggerAddressUns + userSampleSizeUns + userPositiveDelayUns;
					--If we get a trigger that we can't take care of because we are busy, incriment the missed trigger count.  
					else
						missedTriggerCount <= missedTriggerCount + 1;
					end if;
				end if;
				--If we are triggered and the timing is finished, activate the armed flag.  
				if(timing = '1' and positiveDelayTimer = userPositiveDelayUns) then
					armed <= '1';
					timing <= '0';
				else
					--if we aren't finished timing, but are still timing, then increase the positiveDelayTimer.  
					if(timing = '1') then
						positiveDelayTimer <= positiveDelayTimer + 1;
					end if;
				end if;
				--once we reach the start address for the readout, send header one
				if(armed = '1' and ramAddrUns = startAddr) then --Begins read cycle when buffer reaches starting point.  
					b_data_we <= '1';
					headerTwoStart <= '1';
					armed <= '0';
					b_data <= headerOneOut;
				end if;
				--send header two
				if(headerTwoStart = '1') then
					headerTwoStart <= '0';
					b_data <= headerTwoOut;
					reading <= '1';
				end if;
				--start reading (starts after headers are sent)
				if(reading = '1') then
					b_data <= dataOut;
				end if;
				--once we reach the end address
				if(reading = '1' and ramAddrUns = endAddr) then --Ends read cycle when buffer reaches the end point. 
					b_data_we <= '0';
					reading <= '0';
					sendUDP <= '1';
					busy <= '0';
				end if;
				--pulsed signals
				if(sendUDP = '1') then
					sendUDP <= '0';
				end if;
			end if;
		else--reset code here
			armed <= '0';
			sendUDP <= '0';
			reading <= '0';
			headerTwoStart <= '0';
			triggerCount <= (others => '0');
			busy <= '0';
			missedTriggerCount <= (others => '0');
			timing <= '0';
			positiveDelayTimer <= (others => '0');
		end if;
	end process;
end Behavioral;

