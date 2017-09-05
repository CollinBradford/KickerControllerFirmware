----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:05:57 11/07/2008 
-- Design Name: 
-- Module Name:    burst_throughput_test_blk - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity burst_throughput_test_blk is
    Port ( write_clk : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (63 downto 0);
           we_out : out  STD_LOGIC
			  );
end burst_throughput_test_blk;

-- Note: this block assumes write_clk is slower than read_clk
architecture Behavioral of burst_throughput_test_blk is
signal data_to_read : std_logic;
signal data_to_write: std_logic;
signal identifier : STD_LOGIC_VECTOR (3 downto 0);		
signal we_counter : integer range 15 downto 0;	 
signal we_out_sig : std_logic;
begin
	data_out(63 downto 4) <= (others=>'0');
	data_out(3 downto 0) <= identifier;
	we_out <= we_out_sig;
	
	process(reset_n,write_clk)
	begin
		if reset_n = '0' then
			we_counter <= 0;
			identifier <= (others=>'0');
			we_out_sig <= '0';
		elsif rising_edge(write_clk) then
				
			
			we_counter <= we_counter + 1;
			if we_counter = 7 then
				we_counter <= 0;
				we_out_sig <= '1';
				identifier <= identifier + 1;	
			end if;
			
			if we_out_sig = '1' then
				we_out_sig <= '0';
			end if;
		end if;	
	end process;

end Behavioral;

