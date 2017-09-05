
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:22:00 07/28/2011 
-- Design Name: 
-- Module Name:    FADC_READ_CTRL - Behavioral 
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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use fadc_params_package.all;

entity FADC_READ_CTRL is
    Port ( mclk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           done : in  STD_LOGIC;
           rdata : in  STD_LOGIC_VECTOR (63 downto 0);
           waddr_rise : in  STD_LOGIC_VECTOR (MEM_ADDR_SIZE-1 downto 0); --use as starting point
           raddr : out  STD_LOGIC_VECTOR (MEM_ADDR_SIZE-1 downto 0);
           burst_we : out  STD_LOGIC;
           burst_end_packet : out  STD_LOGIC;
           burst_data : out  STD_LOGIC_VECTOR (63 downto 0);
           rdy_for_trig : out  STD_LOGIC);
end FADC_READ_CTRL;

architecture Behavioral of FADC_READ_CTRL is

	signal reading: STD_LOGIC;	  
	signal rdy_for_trig_sig: STD_LOGIC;	  
	signal delay_state: STD_LOGIC; --need to delay because writing 64 bits every MCLK overloads Ethernet
	signal cnt: integer range 0 to 15; -- delay for ethernet to catch up
	signal raddr_sig: STD_LOGIC_VECTOR (MEM_ADDR_SIZE-1 downto 0); 
	signal done_old : STD_LOGIC;
	
begin

	--desc:
		--rdy_for_trig = not (reset or reading).
		--if reset, burst_we=0, burst_data=0xffffffffffffffff, reading=0.
		--if rising edge of done, cnt=0, reading=1, burst_we=1, raddr= waddr_rise. --write all F's
		--if reading = 1, cnt++, raddr--, burst_data = rdata. --first time data is from address = waddr_rise
		--if raddr_sig = waddr_rise and reading_old = '1', reading = 0, burst_we=0.	  
		--ADD BURST END PACKET!!!


	raddr <= raddr_sig;	   
	rdy_for_trig <= rdy_for_trig_sig;
	
	process(mclk)
	begin
	
		if rising_edge(mclk) then
							   							
			burst_we <= '0';
			burst_end_packet <= '0';
			done_old <= done;
		
			if reset = '1' then	
				reading <= '0';	
				delay_state	<= '0';		
				cnt <= 0;				
				burst_data <= (others => '1'); 
				rdy_for_trig_sig <= '0';
			else
			
				if reading = '1' and delay_state = '1' then			-- DELAY STATE
					cnt <= cnt + 1;	   
					
					if cnt = 3 then  --give RAM a few clocks to stabilize read data
						burst_data <= rdata; --first time data is from address = waddr_rise
						--burst_data <= rdata(63 downto 24) & "0000" & waddr_rise & raddr_sig;  --FOR DEBUGGING
						burst_we <= '1'; 	--write fadc data		  					
					elsif cnt = 4 then  --give 1 extra clock before changing raddr
						raddr_sig <= raddr_sig - 1;	 		  					
					elsif cnt = BURST_WE_DELAY then  --delay next write for some clocks
						cnt <= 0;
						delay_state <= '0';		
						
						if raddr_sig = waddr_rise then -- gone all the way around.. (delay state is just used to avoid initial case)
							reading <= '0';
							burst_end_packet <= '1';							
							burst_data <= (others => '1');
						end if;
					end if;
					
				elsif reading = '1' then								
					
					delay_state <= '1';		--got to delay state					
					
				elsif rdy_for_trig_sig = '1' and reading = '0' and done_old = '0' and done = '1' then 	
					reading <= '1';					
					burst_we <= '1'; 	--write all F's
					raddr_sig <= waddr_rise;				
					burst_data <= (others => '1');	
					rdy_for_trig_sig <= '0';		
					delay_state <= '0';
					cnt <= 0;
				else
					rdy_for_trig_sig <= '1';
				end if;	
				
				
				
			end if;
		
		end if;
		
	end process;
	
end Behavioral;
