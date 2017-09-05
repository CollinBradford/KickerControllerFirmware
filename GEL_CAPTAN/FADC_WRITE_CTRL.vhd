----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ryan Rivera, rrivera@fnal.gov
-- 
-- Create Date:    11:09:15 07/28/2011 
-- Design Name: 
-- Module Name:    FADC_WRITE_CTRL - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FADC_WRITE_CTRL is
    Port ( fadc_dclk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           trigger : in  STD_LOGIC;
           rdy_for_trig : in  STD_LOGIC; 													--from readout controller
           post_trig_count : in  STD_LOGIC_VECTOR (MEM_ADDR_SIZE-1 downto 0); 	-- num of samples to take after trigger
           we_rise : out  STD_LOGIC;
           waddr_rise : out  STD_LOGIC_VECTOR (MEM_ADDR_SIZE-1 downto 0);
           dout_dbg_rise : out  STD_LOGIC_VECTOR (31 downto 0);
           dout_dbg_fall : out  STD_LOGIC_VECTOR (31 downto 0);
           we_fall : out  STD_LOGIC;
           waddr_fall : out  STD_LOGIC_VECTOR (MEM_ADDR_SIZE-1 downto 0);           
           done : out  STD_LOGIC); -- rising edge of done indicates ready to read
end FADC_WRITE_CTRL;


architecture Behavioral of FADC_WRITE_CTRL is

	signal cnt: integer range 0 to 2**MEM_ADDR_SIZE-1; --count number of samples after trigger
	signal trigger_old: STD_LOGIC;
	signal rdy_for_trig_old: STD_LOGIC;
	signal actually_ready: STD_LOGIC;
	signal done_sig: STD_LOGIC;
	signal we_rise_sig: STD_LOGIC;
	signal halt: STD_LOGIC;
	signal waddr_rise_sig: STD_LOGIC_VECTOR (MEM_ADDR_SIZE-1 downto 0);
	signal waddr_fall_sig: STD_LOGIC_VECTOR (MEM_ADDR_SIZE-1 downto 0);
	
begin

--desc:
	--on rising edge
		--we_rise=0.
		--if reset, waddr_rise=0, done=1. 
		--if rdy_for_trig and done and trigger rising edge, cnt = 0, done=0.
		--if rising rdy_for_trig, halt=0.
		--if cnt = post_trig_count and done=0, done=1, halt = 1; else if halt=0 we_rise = 1,waddr_rise++.   --reason why 0 is invalid
		--if done=0, cnt++.
	--on falling edge
		--during reset, we_fall=0, waddr_fall=0. 
		--if we_rise = 1, we_fall = 1, waddr_fall++; else we_fall = 0.

	done <= halt;
	we_rise <= we_rise_sig;
	waddr_rise <= waddr_rise_sig;
	waddr_fall <= waddr_fall_sig;
	
	dout_dbg_rise <= x"1" & "00" & waddr_rise_sig          & x"0" & "00" & waddr_rise_sig;
	dout_dbg_fall <= x"3" & "00" & waddr_fall_sig          & x"2" & "00" & waddr_fall_sig;
	
	process(fadc_dclk)
	begin
						
		------------------------------------
		--================================-- RISING EDGE PROCESS
		------------------------------------
		if rising_edge(fadc_dclk) then
		
			we_rise_sig <= '0';
			trigger_old <= trigger;
			rdy_for_trig_old <= rdy_for_trig;
			
			if reset = '1' then	
				waddr_rise_sig <= (others => '0');
				done_sig <= '1';	 --done is 0 while counting after trigger
				halt <= '0';		 --halt is 1 once counting has stopped
				actually_ready <= '0';	
				cnt <= 0;
			else
			
				if actually_ready = '1' and trigger_old = '0' and trigger = '1' then 					
					cnt <= 0;		 		
					actually_ready <= '0';	
					done_sig <= '0';
				end if;
				
				if rdy_for_trig_old = '0' and rdy_for_trig = '1' and halt = '1' then 	  --come out of done
					halt <= '0'; --continuously take data
				end if;
				
				if actually_ready = '0' and halt = '0' and done_sig = '1' then --wait while buffer fills up before taking data again
						 			 
					if cnt = 2**MEM_ADDR_SIZE-1 then
						actually_ready <= '1'; --continuously take data
					else
						cnt <= cnt + 1;	
					end if;
					
				end if;
				
				-- above is coming out of last read and receiving next trigger
				---------------												  
				-- below is the read process
				
				if conv_std_logic_vector(cnt,10) = post_trig_count and done_sig = '0' then
					done_sig <= '1';
					halt <= '1';	
					cnt <= 0;
				else
					if halt = '0' then							
						we_rise_sig <= '1';
						waddr_rise_sig <= waddr_rise_sig + 1;
					end if;
					
					if done_sig = '0' then					
						if cnt = 2**MEM_ADDR_SIZE-1 then
							cnt <= 0;
						else
							cnt <= cnt + 1;	
						end if;
					end if;
				end if;
				
			end if;				
			
		end if;
	
				
		------------------------------------
		--================================-- FALLING EDGE PROCESS
		------------------------------------
		
		if falling_edge(fadc_dclk) then
		
			we_fall <= '0';
			
			if reset = '1' then					
				waddr_fall_sig <= (others => '0');
			elsif we_rise_sig = '1' then
				we_fall <= '1';
				waddr_fall_sig <= waddr_fall_sig + 1;
			end if;
			
		end if;
		
	end process;


end Behavioral;
