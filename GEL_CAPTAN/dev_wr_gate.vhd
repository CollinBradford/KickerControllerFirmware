-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : CAPTAN
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : u:\CAPTAN\Data_Conversion_Board\CAPTAN\CAPTAN\compile\dev_wr_gate.vhd
-- Generated   : 08/08/08 15:06:38
-- From        : u:\CAPTAN\Data_Conversion_Board\CAPTAN\CAPTAN\src\dev_wr_gate.asf
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

entity dev_wr_gate is 
	port (
		addr: in STD_LOGIC_VECTOR (63 downto 0);
		clock: in STD_LOGIC;
		data: in STD_LOGIC_VECTOR (31 downto 0);
		reset_n: in STD_LOGIC;
		we: in STD_LOGIC;
		data_out: out STD_LOGIC_VECTOR (31 downto 0);
		wr_out: out STD_LOGIC);
end dev_wr_gate;

architecture dev_wr_gate of dev_wr_gate is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11
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
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when S1 =>
					
					wr_out <= '0';
					if we = '1' and addr = dev_addr0 then	
						Sreg0 <= S2;
						data_out <= data;
					end if;
					
				when S2 =>
					Sreg0 <= S3;
					wr_out <= '1';
				when S3 =>
					Sreg0 <= S4;
				when S4 =>
					Sreg0 <= S5;
				when S5 =>
					Sreg0 <= S6;
				when S6 =>
					Sreg0 <= S7;
				when S7 =>
					Sreg0 <= S8;
				when S8 =>
					Sreg0 <= S9;
				when S9 =>
					Sreg0 <= S10;
				when S10 =>
					Sreg0 <= S11;
				when S11 =>
					Sreg0 <= S1;
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

end dev_wr_gate;
