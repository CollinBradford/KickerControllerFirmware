----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:44 09/19/2017 
-- Design Name: 
-- Module Name:    event_analysis - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--	This module is where the code for the data analysis lives.  The data is meant to come into the module as it comes out
-- of the data_send module.  The current configuration is for two 64 bit header blocks, so the code delays two clocks 
-- before starting analysis.  
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity event_analysis is
    Port ( --default signals
			  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  --incoming data signals
           data_in : in  STD_LOGIC_VECTOR (63 downto 0);
           data_in_we : in  STD_LOGIC;
			  data_in_end : in STD_LOGIC;
			  --incoming footer signal. This footer will be sent with the veto footer and can be attached to any signal.
			  footer_in : STD_LOGIC_VECTOR (63 downto 0);
			  --user register signals
           zero_cross_thresh_high : in  STD_LOGIC_VECTOR (7 downto 0);
           zero_cross_thresh_low : in  STD_LOGIC_VECTOR (7 downto 0);
			  zero_cross_veto_thresh : in STD_LOGIC_VECTOR (7 downto 0);
			  --clear and force veto signals
			  clear_veto : in STD_LOGIC;
			  force_veto : in STD_LOGIC;
			  veto_en : in STD_LOGIC;
			  --outgoing data signals
           data_out : out  STD_LOGIC_VECTOR (63 downto 0);
           data_out_we : out  STD_LOGIC;
			  data_out_end : out STD_LOGIC;
			  --outgoing analysis signals
           zero_cross_count : out  STD_LOGIC_VECTOR (7 downto 0);
			  --this signal is speciffic to the g-2 application and will veto the kicker signal in the event of a spark to 
			  --ensure that no damage is done to the kicker and surrounding components.  
			  veto : out STD_LOGIC;
			  --resets for the clear_veto and force_veto latches
			  reset_clear_veto : out STD_LOGIC;
			  reset_force_veto : out STD_LOGIC);
end event_analysis;

architecture Behavioral of event_analysis is
	--each individual data sample gets its own signal for easier processing
	signal sampleOne : unsigned(7 downto 0);
	signal sampleTwo : unsigned(7 downto 0);
	signal sampleThree : unsigned(7 downto 0);
	signal sampleFour : unsigned(7 downto 0);
	signal sampleFive : unsigned(7 downto 0);
	signal sampleSix : unsigned(7 downto 0);
	signal sampleSeven : unsigned(7 downto 0);
	signal sampleEight : unsigned(7 downto 0);
	--repeated signals
	signal userZeroCrossThreshHigh : unsigned(7 downto 0);
	signal userZeroCrossThreshLow : unsigned(7 downto 0);
	signal userZeroCrossVetoThresh : unsigned(7 downto 0);
	signal dataOutEnd : std_logic;
	signal resetClearVeto, resetForceVeto : std_logic;
	--module flags
	signal busy : std_logic;
	signal headerDelayOne, headerDelayTwo : std_logic;
	signal analysisRunning : std_logic;
	signal prepareEnd : std_logic;
	signal sendFooter : std_logic;
	signal finish : std_logic;
	--signal state
	signal lastSigLow, lastSigHigh : std_logic;
	signal zeroCrossCount : unsigned(7 downto 0);
	signal vetoed : std_logic;
	--footer signal 
	signal internalFooter : std_logic_vector(63 downto 0);
begin
	--assign data signals
	sampleOne <= unsigned(data_in(7 downto 0));
	sampleTwo <= unsigned(data_in(15 downto 8));
	sampleThree <= unsigned(data_in(23 downto 16));
	sampleFour <= unsigned(data_in(31 downto 24));
	sampleFive <= unsigned(data_in(39 downto 32));
	sampleSix <= unsigned(data_in(47 downto 40));
	sampleSeven <= unsigned(data_in(55 downto 48));
	sampleEight <= unsigned(data_in(63 downto 56));
	--assign repeated signals
	userZeroCrossThreshHigh <= unsigned(zero_cross_thresh_high);
	userZeroCrossThreshLow <= unsigned(zero_cross_thresh_low);
	userZeroCrossVetoThresh <= unsigned(zero_cross_veto_thresh(7 downto 0));
	zero_cross_count <= std_logic_vector(zeroCrossCount);
	veto <= vetoed;
	data_out_end <= dataOutEnd;
	reset_clear_veto <= resetClearVeto;
	reset_force_veto <= resetForceVeto;
	--assign footer signals 
	internalFooter(7 downto 0) <= std_logic_vector(zeroCrossCount(7 downto 0));
	
	process(clk) begin
		--check for reset condition
		if(rising_edge(clk)) then
		
			--Reset pulsed signals
			headerDelayOne <= '0';
			headerDelayTwo <= '0';
			prepareEnd <= '0';
			sendFooter <= '0';
			data_out_we <= '0';
			dataOutEnd <= '0';
			resetClearVeto <= '0';
			resetForceVeto <= '0';
			finish <= '0';
			
		
			if(reset = '1') then
				busy <= '0';
			else
			
				if(data_in_we = '1') then
					data_out_we <= '1';
					data_out <= data_in;
				elsif(prepareEnd = '1') then				
					data_out_we <= '1';
					data_out <= footer_in;--we need one clock to figure out if we need to veto.  The header signals coming from anything else in the firmware applciation can be sent at this time.  					
				elsif(sendFooter = '1') then			
					data_out_we <= '1';
					data_out <= internalFooter;
				end if;
				
				
				
				if(data_in_we = '1' and busy = '0') then
					busy <= '1';
					headerDelayOne <= '1';
				elsif(headerDelayOne = '1') then 
					headerDelayTwo <= '1'; --delay for second header				
					analysisRunning <= '1';
					lastSigHigh <= '0';
					lastSigLow <= '0';
				elsif(analysisRunning = '1') then --We have actual data! start the analysis process	
				
					--If last time was not high and this time is, incriment the counter
					if(lastSigHigh = '0') then
						if(sampleOne > userZeroCrossThreshHigh or sampleTwo > userZeroCrossThreshHigh or sampleThree > userZeroCrossThreshHigh or sampleFour > userZeroCrossThreshHigh
							or sampleFive > userZeroCrossThreshHigh or sampleSix > userZeroCrossThreshHigh or sampleSeven > userZeroCrossThreshHigh or sampleEight > userZeroCrossThreshHigh) then
							lastSigHigh <= '1';
							zeroCrossCount <= zeroCrossCount + 1;
						end if;
					end if;
					--If the last signal set was not low and this time is low, incriment the counter
					if(lastSigLow = '0') then
						if(sampleOne < userZeroCrossThreshLow or sampleTwo < userZeroCrossThreshLow or sampleThree < userZeroCrossThreshLow or sampleFour < userZeroCrossThreshLow or sampleFive < userZeroCrossThreshLow
							or sampleSix < userZeroCrossThreshLow or sampleSeven < userZeroCrossThreshLow or sampleEight < userZeroCrossThreshLow) then
							lastSigLow <= '1';
							zeroCrossCount <= zeroCrossCount + 1; 
						end if;
					end if;
					
					--Reset the high signal if we are no longer above threshold
					if(lastSigHigh = '1' and sampleOne < userZeroCrossThreshHigh and sampleTwo < userZeroCrossThreshHigh and sampleThree < userZeroCrossThreshHigh and sampleFour < userZeroCrossThreshHigh
						and sampleFive < userZeroCrossThreshHigh and sampleSix < userZeroCrossThreshHigh and sampleSeven < userZeroCrossThreshHigh and sampleEight < userZeroCrossThreshHigh) then
						lastSigHigh <= '0';
					end if;
					--Reset the Low signal if we are no longer below threshold
					if(lastSigLow = '1' and sampleOne > userZeroCrossThreshLow and sampleTwo > userZeroCrossThreshLow and sampleThree > userZeroCrossThreshLow and sampleFour > userZeroCrossThreshLow and sampleFive > userZeroCrossThreshLow
						and sampleSix > userZeroCrossThreshLow and sampleSeven > userZeroCrossThreshLow and sampleEight > userZeroCrossThreshLow) then
						lastSigLow <= '0';
					end if;
					
				end if;
				
				
				
				--detect the end of the packet and prepare for it.  
				if(data_in_end = '1') then
					--The data currently on the pins is still valid and needs to be compared.  We won't give the final 
					--count until the event is actually over.  
					prepareEnd <= '1';
				elsif(prepareEnd = '1') then  --end the analysis and see if we need to veto.  
					analysisRunning <= '0';
					sendFooter <= '1';
					
					--Check if we will veto the signal and take approperate action
					if(zeroCrossCount > userZeroCrossVetoThresh and veto_en = '1') then
						vetoed <= '1';
					end if;
				elsif(sendFooter = '1') then --send the footer
					data_out <= internalFooter;
					finish <= '1';				
				elsif(finish = '1') then			 --Turn off the data_out_we signal and pulse data_out_end		
					dataOutEnd <= '1';
					busy <= '0';
				end if;
				
				
				---user controlled signals:
				
				--Clear veto signal
				if(force_veto = '1') then --Force veto signal
					vetoed <= '1';
					resetForceVeto <= '1';
				elsif(clear_veto = '1') then
					vetoed <= '0';
					resetClearVeto <= '1';
				end if;
								 
				
				
				
			end if;

				
--			--rising edge events
--			if(reset = '0') then
--				--when we receive a new signal
--				if(data_in_we = '1' and busy = '0') then
--					busy <= '1';
--					data_out <= data_in;
--					data_out_we <= '1';
--					headerDelayOne <= '1';
--				end if;
--				--delay for second header
--				if(headerDelayOne = '1') then
--					data_out <= data_in;
--					headerDelayTwo <= '1';
--					headerDelayOne <= '0';
--				end if;
--				--We have actual data! start the analysis process
--				if(headerDelayTwo <= '1') then
--					headerDelayTwo <= '0';
--					analysisRunning <= '1';
--					data_out <= data_in;
--					--Check if any samples are above the threshold
--					if(sampleOne > userZeroCrossThreshHigh or sampleTwo > userZeroCrossThreshHigh or sampleThree > userZeroCrossThreshHigh or sampleFour > userZeroCrossThreshHigh
--						or sampleFive > userZeroCrossThreshHigh or sampleSix > userZeroCrossThreshHigh or sampleSeven > userZeroCrossThreshHigh or sampleEight > userZeroCrossThreshHigh) then
--						lastSigHigh <=  '1';
--						zeroCrossCount <= zeroCrossCount + 1;
--					end if;
--					--Check if any samples are below the threshold
--					if(sampleOne < userZeroCrossThreshLow or sampleTwo < userZeroCrossThreshLow or sampleThree < userZeroCrossThreshLow or sampleFour < userZeroCrossThreshLow or sampleFive < userZeroCrossThreshLow
--						or sampleSix < userZeroCrossThreshLow or sampleSeven < userZeroCrossThreshLow or sampleEight < userZeroCrossThreshLow) then
--						lastSigLow <= '0';
--						zeroCrossCount <= zeroCrossCount + 1;
--					end if;
--				end if;
--				--Regular analysis code
--				if(analysisRunning <= '1') then
--					data_out <= data_in;
--					--If last time was not high and this time is, incriment the counter
--					if(lastSigHigh = '0') then
--						if(sampleOne > userZeroCrossThreshHigh or sampleTwo > userZeroCrossThreshHigh or sampleThree > userZeroCrossThreshHigh or sampleFour > userZeroCrossThreshHigh
--							or sampleFive > userZeroCrossThreshHigh or sampleSix > userZeroCrossThreshHigh or sampleSeven > userZeroCrossThreshHigh or sampleEight > userZeroCrossThreshHigh) then
--							lastSigHigh <= '1';
--							zeroCrossCount <= zeroCrossCount + 1;
--						end if;
--					end if;
--					--If the last signal set was not low and this time is low, incriment the counter
--					if(lastSigLow = '0') then
--						if(sampleOne < userZeroCrossThreshLow or sampleTwo < userZeroCrossThreshLow or sampleThree < userZeroCrossThreshLow or sampleFour < userZeroCrossThreshLow or sampleFive < userZeroCrossThreshLow
--							or sampleSix < userZeroCrossThreshLow or sampleSeven < userZeroCrossThreshLow or sampleEight < userZeroCrossThreshLow) then
--							lastSigLow <= '1';
--							zeroCrossCount <= zeroCrossCount + 1; 
--						end if;
--					end if;
--					--Reset the high signal if we are no longer above threshold
--					if(lastSigHigh = '1' and sampleOne < userZeroCrossThreshHigh and sampleTwo < userZeroCrossThreshHigh and sampleThree < userZeroCrossThreshHigh and sampleFour < userZeroCrossThreshHigh
--						and sampleFive < userZeroCrossThreshHigh and sampleSix < userZeroCrossThreshHigh and sampleSeven < userZeroCrossThreshHigh and sampleEight < userZeroCrossThreshHigh) then
--						lastSigHigh <= '0';
--					end if;
--					--Reset the Low signal if we are no longer below threshold
--					if(lastSigLow = '1' and sampleOne > userZeroCrossThreshLow and sampleTwo > userZeroCrossThreshLow and sampleThree > userZeroCrossThreshLow and sampleFour > userZeroCrossThreshLow and sampleFive > userZeroCrossThreshLow
--						and sampleSix > userZeroCrossThreshLow and sampleSeven > userZeroCrossThreshLow and sampleEight > userZeroCrossThreshLow) then
--						lastSigLow <= '0';
--					end if;
--				end if;
--				--detect the end of the packet and prepare for it.  
--				if(data_in_end = '1') then
--					--The data currently on the pins is still valid and needs to be compared.  We won't give the final 
--					--count until the event is actually over.  
--					prepareEnd <= '1';
--				end if;
--				--end the analysis and see if we need to veto.   
--				if(prepareEnd <= '1') then 
--					analysisRunning <= '0';
--					prepareEnd <= '0';
--					sendFooter <= '1';
--					data_out <= footer_in;--we need one clock to figure out if we need to veto.  The header signals coming from anything else in the firmware applciation can be sent at this time.  
--					--Check if we will veto the signal and take approperate action
--					if(zeroCrossCount > userZeroCrossVetoThresh and veto_en = '1') then
--						vetoed <= '1';
--					end if;
--				end if;
--				--send the footer
--				if(sendFooter <= '1') then
--					data_out <= internalFooter;
--					finish <= '1';
--				end if;
--				--Turn off the data_out_we signal and pulse data_out_end
--				if(finish <= '1') then
--					data_out_we <= '0';
--					dataOutEnd <= '1';
--					busy <= '0';
--				end if;
--				
--				--Clear veto signal
--				if(clear_veto = '1') then
--					vetoed <= '0';
--					resetClearVeto <= '1';
--				end if;
--				--Force veto signal
--				if(force_veto = '1') then
--					vetoed <= '1';
--					resetForceVeto <= '1';
--				end if;
--				
--				--Reset pulsed signals
--				if(dataOutEnd = '1') then
--					dataOutEnd <= '0';
--				end if;
--				if(resetClearVeto <= '1') then
--					resetClearVeto <= '0';
--				end if;
--				if(resetForceVeto <= '1') then
--					resetForceVeto <= '0';
--				end if;
--				--reset code
--			else
--				busy <= '0';
--			end if;
		end if;
	end process;
end Behavioral;

