-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : ethernet_controller
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : c:\HDL_Designs\dig_gec\ethernet_controller\compile\delay_counter.vhd
-- Generated   : 03/20/09 15:19:31
-- From        : c:/HDL_Designs/dig_gec/ethernet_controller/src/delay_counter.asf
-- By          : FSM2VHDL ver. 5.0.5.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use params_package.all;

entity delay_counter is 
	port (
		clear_delay_count: in STD_LOGIC;
		clock: in STD_LOGIC;
		reset_n: in STD_LOGIC;
		start_delay_count: in STD_LOGIC;
		delay_count: out STD_LOGIC);
end delay_counter;

architecture delay_counter of delay_counter is

-- diagram signals declarations
signal delay_val: STD_LOGIC_VECTOR (15 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clock)
begin
	if clock'event and clock = '1' then
		if reset_n = '0' then	
			Sreg0 <= S1;
			-- Set default values for outputs, signals and variables
			-- ...
			delay_val <= v_16_0;
			delay_count <= '0';
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when S1 =>
					if start_delay_count = '1' then	
						Sreg0 <= S2;
						delay_count <= '1';
						-- Inhibit
					elsif start_delay_count = '0' then	
						Sreg0 <= S1;
						delay_val <= v_16_0;
					end if;
				when S2 =>
					if delay_val >= delay_term then	
						Sreg0 <= S3;
						delay_count <= '0';
					elsif delay_val < delay_term then	
						Sreg0 <= S2;
						delay_val <= delay_val + v_16_1;
					end if;
				when S3 =>
					if clear_delay_count = '1' then	
						Sreg0 <= S1;
						delay_val <= v_16_0;
					elsif clear_delay_count = '0' then	
						Sreg0 <= S3;
					end if;
--vhdl_cover_off
				when others =>
					null;
--vhdl_cover_on
			end case;
		end if;
	end if;
end process;

end delay_counter;
