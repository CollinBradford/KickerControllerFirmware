----------------------------------------------------------------------------------
-- Company: Fermilab
-- Engineer: Collin Bradford
-- 
-- Create Date:    14:07:15 08/11/2017 
-- Design Name: 
-- Module Name:    stat_mux - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: This module combines the data and control signals from the statistics module with the data and conrol signals from the 
--  adc.  For obvious reasons, the adc data always comes first, and, although the stsatistics module won't send a packet while adc data
--  is activly being sent, if a trigger comes in the exact same clock cycle as a statistic packet, the statistics packet and adc packet 
--  will be sent at the same time.  If this every happens, this module will give the adc data priority and will ignore the disruptive 
--  statistic packet.  
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stat_mux is
    Port ( ethernet_data : in  STD_LOGIC_VECTOR (63 downto 0);
           stat_data : in  STD_LOGIC_VECTOR (63 downto 0);
           new_stat : in  STD_LOGIC;
           new_peak : in  STD_LOGIC;
           ethernet_data_wr_en : in  STD_LOGIC;
           stat_data_wr_en : in  STD_LOGIC;
           master_clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           combined_data_out : out  STD_LOGIC_VECTOR (63 downto 0);
           combined_new_packet : out  STD_LOGIC);
end stat_mux;

architecture Behavioral of stat_mux is

begin

	if(

end Behavioral;

