	
	library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;  
	
	use params_package.ALL;
					  

	entity burst_traffic_controller is
		port (
					  
		MASTER_CLK : in std_logic;  -- 125 MHz Ethernet Clock
		RESET : in std_logic;								
										  		   
		BURST_END_PACKET: out std_logic;
		BURST_WE: in std_logic									  
			
			);
	end burst_traffic_controller;			  
	
	
	architecture burst_traffic_controller_arch of burst_traffic_controller is		  
	
		signal clocks_since_send : std_logic_vector(33 downto 0); 
		signal writes_in_curr_burst : std_logic_vector(7 downto 0);
		
	begin			 
		
		process(MASTER_CLK)
		begin
			
			if rising_edge(MASTER_CLK) then
				
				-- keep pulses to only one clock	
				BURST_END_PACKET <= '0';
				
				if reset = '1' then
					
					clocks_since_send <= (others => '0'); 		
					writes_in_curr_burst <= (others => '0'); 	   	
					
				else						-- main section	
					
					if clocks_since_send /= '1' & x"00000000" then -- increment clocks since last burst packet send
						clocks_since_send <= clocks_since_send + 1;	 
					end if;	 
					
					if BURST_WE = '1' then 
												
						if writes_in_curr_burst >= 181 then	
							writes_in_curr_burst <= (others => '0'); 	 
							clocks_since_send <= (others => '0'); 
						else							
							writes_in_curr_burst <= writes_in_curr_burst + 1;
						end if;	 
						
					else						
						
						-- check if between hits should end Burst Packet due to time out period
						if writes_in_curr_burst /= 0 and
							clocks_since_send >= '0' & x"0080" & '1' & x"E848" then--BURST_PERIOD_MAX & '1' & x"E848" then -- in ms : [<val> * 0x1E848] 125Mhz clocks is max wait
								BURST_END_PACKET <= '1';	 -- force end burst packet	 
								clocks_since_send <= (others => '0');  
								writes_in_curr_burst <= (others => '0'); 
						end if;	 
						
					end if;
					
				end if;	
				
			end if;	
			
		end process;		
		
		
	end architecture;
