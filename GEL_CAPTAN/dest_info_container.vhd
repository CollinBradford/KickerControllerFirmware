-- Author: Ryan Rivera, FNAL

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- this block latches the mac, ip, and port for the destination
	-- field of UDP packets. Info is valid whenever a properly addressed single byte packet is received.		 
	-- Only set the first time after RESET!
entity dest_info_container is
	port (
	
		clk 			: in std_logic;
		reset 			: in std_logic;	
		we 				: in std_logic;		  	 	
	
		mac_from_udp 	: in std_logic_vector(47 downto 0);  
		ip_from_udp 	: in std_logic_vector(31 downto 0);   
		port_from_udp 	: in std_logic_vector(15 downto 0);		 
		
		dest_mac 		: out std_logic_vector(47 downto 0);  
		dest_ip 		: out std_logic_vector(31 downto 0);   
		dest_port 		: out std_logic_vector(15 downto 0) 
	) ;
end;


architecture dest_info_container_arch of dest_info_container is	 
begin				  
									   
	process(clk)
	begin	
		if rising_edge(clk) then
			if reset = '1' then				 
				
				dest_mac	<= 	(others => '0');
				dest_ip  	<=	(others => '0');
				dest_port	<=	(others => '0');   							
				
				-- change only if ping packet received (1 byte packet)
			elsif we = '1' then	  
				
				dest_mac	<= 	mac_from_udp; 
				dest_ip  	<=	ip_from_udp; 
				dest_port	<=	port_from_udp;	 
				
			end if;				   	
		end if;			
	end process;	   
	
end dest_info_container_arch;