-- Author: Ryan Rivera, FNAL

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity user_addrs_mux is
	port (
		user_addrs : in std_logic_vector(7 downto 0);	  
		user_length : in std_logic_vector(10 downto 0);
		test_mode : in std_logic;	
		ping_mode : in std_logic;
		
		udp_tx_length : out std_logic_vector(10 downto 0);
		
		addrs_out :	out std_logic_vector(7 downto 0)
	) ;
end;


architecture user_addrs_mux_arch of user_addrs_mux is
begin				  
	
	
	addrs_out <= x"03" when test_mode = '1' else user_addrs;		  
	udp_tx_length <=  						 --"000" & x"05"; -- "101" & x"C0";	 -- range: 0 to x5C0 (1472) 
		"000" & x"02" when ping_mode = '1' else
		"000" & x"05" when test_mode = '1' else	
		user_length;
	
end user_addrs_mux_arch;				