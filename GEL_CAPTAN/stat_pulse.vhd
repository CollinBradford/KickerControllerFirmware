----------------------------------------------------------------------------------
-- Company: Fermilab
-- Engineer: Collin Bradford
-- 
-- Create Date:    12:48:44 07/27/2017 
-- Design Name: 
-- Module Name:    stat_pulse - Behavioral 
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
-- This module takes data from the project and puts it into a small statistic packet no more than 64 bits long.  This packet will then be sent along with
-- all the other burst data to the controll software on the computer.  The statistic packet will monitor the fifo overflow signals as well as the number
-- of pulses sent every statistic period.  The statistic period should probably be controlled with a user-set register that will come sometime.  
-- In order to have this work, I am going to have to be able to insert this packet into the normal flow of data coming from the adc without blocking
-- the adc data.  This will probably have to be accomplished with a multiplexer and will nessessitate that the stat data be only 64 bits long.  
-- otherwise, the stat pakcet might be split up because of the more important adc data.  

--
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity stat_pulse is
    Port ( master_clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           adc_fifo_overflow : in  STD_LOGIC;
           ethernet_fifo_overflow : in  STD_LOGIC;
           new_peak : in  STD_LOGIC;
           ethernet_fifo_in_en : in  STD_LOGIC;
			  adc_fifo_overflow_lat_res : out STD_LOGIC;
			  ethernet_fifo_overflow_lat_res : out STD_LOGIC;
           tx_data : out  STD_LOGIC_VECTOR (63 downto 0);
           stat_ethernet_fifo_in_en : out  STD_LOGIC;
			  new_stat : out STD_LOGIC);
end stat_pulse;

architecture Behavioral of stat_pulse is
	signal timer        : unsigned(19 downto 0);
	signal sendReady    : STD_LOGIC;
	signal triggers     : unsigned(31 downto 0); 
	signal sig_tx_data  : STD_LOGIC_VECTOR (63 downto 0);
	signal stat_sent    : STD_LOGIC;
	signal reset_lat    : STD_LOGIC;
	signal new_stat_sig : STD_LOGIC;
begin
	
	tx_data(63 downto 0) <= sig_tx_data(63 downto 0);
	
	sig_tx_data(63 downto 32) <= std_logic_vector(triggers(31 downto 0));         --T (number of triggers since last stat packet)
	sig_tx_data(31 downto 21) <= (others => '0');                                 --X (unused + padding for A)
	sig_tx_data(20)    <= adc_fifo_overflow;                                      --A (ADC FiFo overflow)
	sig_tx_data(19 downto 17) <= (others => '0');                                 --X (padding for E)
	sig_tx_data(16)    <= ethernet_fifo_overflow;                                 --E (ethernet FiFo overflow)
	sig_tx_data(15 downto 0)  <= (others => '1');                                 --F (Padding with 1's to designate packet as stat)
	
	new_stat <= new_stat_sig;
	
	process(master_clk) begin
		
		if(rising_edge(master_clk)) then
			
			if(reset = '0') then
				
				if(timer /= "11110100001001000000" and sendReady = '0') then
					timer <= timer + 1;
				elsif (sendReady = '0') then
					if(ethernet_fifo_in_en = '0') then --TODO if PeakFinder is currently triggered and sending data, wait until a better time.  Else, go ahead and send the packet.  
						new_stat_sig <= '1';
						stat_ethernet_fifo_in_en <= '1';
						timer <= (others => '0');
						stat_sent <= '1';
					else
						sendReady <= '1';
					end if;
				end if;
				
				if(sendReady = '1' and ethernet_fifo_in_en = '0' and stat_sent = '0') then --A send is due and PeakFinder is not Triggered.
					new_stat_sig <= '1';
					stat_ethernet_fifo_in_en <= '1';
					timer <= (others => '0');
					sendReady <= '0';
					stat_sent <= '1';
				end if;
				
				if(stat_sent = '1') then --Reset the fifo overflow latches and trigger count.  
					stat_sent <= '0';
					triggers <= (others => '0');
					adc_fifo_overflow_lat_res <= '1';
					ethernet_fifo_overflow_lat_res <= '1';
					reset_lat <= '1';
					new_stat_sig <= '0'; 
					stat_ethernet_fifo_in_en <= '0';
				end if;
				
				if(reset_lat = '1') then --Reset the latch resets after one clock to pulse the reset and allow them to work agian.  
					adc_fifo_overflow_lat_res <=  '0';
					ethernet_fifo_overflow_lat_res <= '0';
					reset_lat <= '0';
				end if;
				
				if(new_peak = '1') then --Count the triggers.
					triggers <= triggers + 1;
				end if;
				
			else --reset is high
				timer <= (others => '0');
				triggers <= (others => '1');
				sendReady <= '0';
				reset_lat <= '0';
				stat_sent <= '0';
				adc_fifo_overflow_lat_res <= '0';
				ethernet_fifo_overflow_lat_res <= '0';
			end if;
			
		end if;
		
	end process;

end Behavioral;

