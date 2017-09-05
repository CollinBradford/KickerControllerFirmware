-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : CAPTAN
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : u:\CAPTAN\Data_Conversion_Board\CAPTAN\CAPTAN\compile\dev_wr_gate_t.vhd
-- Generated   : 08/11/08 10:17:19
-- From        : u:\CAPTAN\Data_Conversion_Board\CAPTAN\CAPTAN\src\dev_wr_gate_t.asf
-- By          : FSM2VHDL ver. 5.0.0.9
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

entity dev_wr_gate_t is 
	port (
		addr: in STD_LOGIC_VECTOR (63 downto 0);
		clock: in STD_LOGIC;
		data: in STD_LOGIC_VECTOR (31 downto 0);
		reset_n: in STD_LOGIC;
		we: in STD_LOGIC;
		data_out: out STD_LOGIC_VECTOR (31 downto 0);
		wr_out: out STD_LOGIC);
end dev_wr_gate_t;

architecture dev_wr_gate_t of dev_wr_gate_t is

constant count_inc: STD_LOGIC_VECTOR (3 downto 0) := "0001";
constant count_max: STD_LOGIC_VECTOR (3 downto 0) := "1000";
-- diagram signals declarations
signal pulse_count: STD_LOGIC_VECTOR (3 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S4, S5
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
			wr_out <= '0';
			data_out <= v_32_0;
			pulse_count <= "0000";
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when S1 =>
					if we = '1' and addr = dev_addr1 then	
						Sreg0 <= S4;
						data_out <= data;
						wr_out <= '0';
					elsif we = '0' or addr /= dev_addr1 then	
						Sreg0 <= S1;
						wr_out <= '0';
					end if;
				when S4 =>
					if pulse_count /= count_max then	
						Sreg0 <= S4;
						wr_out <= '1';
						pulse_count <= pulse_count + count_inc;
					elsif pulse_count = count_max then	
						Sreg0 <= S5;
						pulse_count <= "0000";
					end if;
				when S5 =>
					Sreg0 <= S1;
					wr_out <= '1';
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

end dev_wr_gate_t;
