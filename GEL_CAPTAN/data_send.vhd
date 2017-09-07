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
			  --burst data control signals
           b_data : out  STD_LOGIC_VECTOR (63 downto 0);
           b_data_we : out  STD_LOGIC;
			  b_force_packet : out STD_LOGIC);
end data_send;

architecture Behavioral of data_send is

signal startAddr : unsigned(9 downto 0);
signal endAddr : unsigned(9 downto 0);
signal userSampleSizeUns : unsigned(15 downto 0);
signal userPretrigSamplesUns : unsigned(15 downto 0);
signal triggerAddressUns : unsigned(9 downto 0);
signal ramAddrUns : unsigned(9 downto 0);
signal armed : std_logic;
signal reading : std_logic;
signal sendUDP : std_logic;
signal burstWrEn : std_logic;


begin

	b_force_packet <=  sendUDP;
	triggerAddressUns <= unsigned(trigger_addr);
	userSampleSizeUns <= unsigned(user_sample_size);
	userPretrigSamplesUns <= unsigned(user_pretrig_sample_size);
	ramAddrUns <= unsigned(ram_addr);

	process(clk) begin
		if(rising_edge(clk)) then
			if(rst = '0') then
				
				if(new_trigger = '1') then
					armed <= '1';
					startAddr <= triggerAddressUns - userPretrigSamplesUns;
					endAddr <= triggerAddressUns + userSampleSizeUns;
				end if;
				
				if(armed = '1' and ramAddrUns = startAddr) then --Begins read cycle when buffer reaches starting point.  
					b_data_we <= '1';
					reading <= '1';
					armed <= '0';
				end if;
				
				if(reading = '1' and ramAddrUns = endAddr) then --Ends read cycle when buffer reaches the end point. 
					b_data_we <= '0';
					reading <= '0';
					sendUDP <= '1';
				end if;
				
				if(sendUDP = '1') then
					sendUDP <= '0';
				end if;
				
			else--reset code here
				armed <= '0';
				sendUDP <= '0';
			end if;
		end if;
	end process;
	
	--b_data <= din;
	b_data(7 downto 0) <= data_in(63 downto 56);
	b_data(15 downto 8) <= data_in(55 downto 48);
	b_data(23 downto 16) <= data_in(47 downto 40);
	b_data(31 downto 24) <= data_in(39 downto 32);
	b_data(39 downto 32) <= data_in(31 downto 24);
	b_data(47 downto 40) <= data_in(23 downto 16);
	b_data(55 downto 48) <= data_in(15 downto 8);
	b_data(63 downto 56) <= data_in(7 downto 0);
	--This makes the data come out right for some reason.  Better to organize it here than on the coputer where it will take 
	--valuable clocks.  
	
end Behavioral;

