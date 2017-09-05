-------------------------------------------------------------------------------
--
-- Title       : Sample_Manager
-- Design      : PsiDecoder
-- Author      : Desktop Support
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\PsiDecoder\PsiDecoder\src\Sample_Manager.vhd
-- Generated   : Mon Feb 16 11:53:11 2009
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

use PsiDecoderParameters.all;

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Sample_Manager} architecture {Sample_Manager}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity Sample_Manager is
	 port(
		 ADC_DATA_IN : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 ADC_WR_EN : in STD_LOGIC;									 
		 EN_MAN_SAMPLE_SEL : in STD_LOGIC;
		 MAN_SAMPLE_SEL : in STD_LOGIC;
		 MASTER_CLOCK : in STD_LOGIC;			  
		 managed_data : out STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 wr_en : out STD_LOGIC
	     );
end Sample_Manager;

--}} End of automatically maintained section

architecture Sample_Manager of Sample_Manager is
	signal data_label : std_logic := '0'; 			  		 
	signal sample_sel : std_logic := '0';	  -- use first value after 500 samples lower than 470("0111010110") as selected sample.. (lowest sample wins) 			  
	signal sample_cnt : integer	range 0 to 511 := 0;											   
	signal check_other_label : std_logic := '0';												   
	signal save_val : STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
begin
	process( MASTER_CLOCK )
	begin
		if rising_edge(MASTER_CLOCK) then	 
			
			wr_en <= '0';
	
			if ADC_WR_EN = '1' then				  
				
				data_label <= not data_label;
				if (EN_MAN_SAMPLE_SEL = '0' and data_label = sample_sel) or (EN_MAN_SAMPLE_SEL = '1' and data_label = MAN_SAMPLE_SEL) then
					managed_data <= ADC_DATA_IN;
					wr_en <= '1';
				end if ;			   
				
				
				-- find correct sample to select
				
				if ADC_DATA_IN >= "0100101100" and sample_cnt < 500 then	 
					sample_cnt <= sample_cnt + 1;
				end if;
				
				if sample_cnt = 500 and ADC_DATA_IN < "0110010000" then --CHANGED TO 400!! (Sept 2010)-- "0111010110" then 	  -- found first potential UB	   
					check_other_label <= '1';  
					save_val <= ADC_DATA_IN;
				end if;																		 
				
				if check_other_label = '1' then								 -- check other potential UB	
					
					if ADC_DATA_IN < save_val then  -- DECIDE SAMPLE SELECT HERE!!!
						sample_sel <= data_label;								   
					else
						sample_sel <= not data_label;
					end if;
					
					check_other_label <= '0';	  	
					sample_cnt <= 0;
				end if;
					
				
			end if;						
		end if;
	end process;
	
end Sample_Manager;
