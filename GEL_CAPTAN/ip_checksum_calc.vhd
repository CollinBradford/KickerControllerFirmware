-------------------------------------------------------------------------------
--
-- Title       : Checksum Calc
-- Design      : ethernet_controller
-- Author      : Ryan Rivera
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--
-- File        : c:\HDL_Designs\dig_gec\ethernet_controller\compile\ip_checksum_calc.vhd
-- Generated   : 03/20/09 15:19:30
-- From        : c:/HDL_Designs/dig_gec/ethernet_controller/src/ip_checksum_calc.asf
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

entity ip_checksum_calc is 
	port (
		addrs: in STD_LOGIC_VECTOR (7 downto 0);
		clk: in STD_LOGIC;
		length: in STD_LOGIC_VECTOR (10 downto 0);
		reset: in STD_LOGIC;
		trigger: in STD_LOGIC;
		cs: out STD_LOGIC_VECTOR (15 downto 0));
end ip_checksum_calc;

architecture ip_checksum_calc_arch of ip_checksum_calc is

-- diagram signals declarations
signal addrs_sig: STD_LOGIC_VECTOR (16 downto 0);
signal cs_sig: STD_LOGIC_VECTOR (16 downto 0);
signal length_sig: STD_LOGIC_VECTOR (16 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3, S4, S5, S6, S7
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin

-- concurrent signals assignments

-- Diagram ACTION
--inputs
addrs_sig(16 downto 8) <= '0' & x"85";
addrs_sig(7 downto 0) <= addrs;
length_sig(16 downto 11) <= (others => '0');
length_sig(10 downto 0) <= length;
--outputs
cs_proc: process(clk)
begin
	if rising_edge(clk) then
		if reset = '1' then
			cs <= (others => '0');
		elsif Sreg0 = S7 then
			cs <= cs_sig(15 downto 0);
		end if;
	end if;
end process;

----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clk)
begin
	if clk'event and clk = '1' then
		if reset = '1' then	
			Sreg0 <= S1;
			-- Set default values for outputs, signals and variables
			-- ...
			cs_sig <= '0' & x"00FA";
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when S1 =>
					cs_sig <= '0' & x"00FA";
					if trigger = '1' then	
						Sreg0 <= S2;
					end if;
				when S2 =>
					cs_sig <= cs_sig + length_sig;
					Sreg0 <= S3;
				when S3 =>
					if cs_sig(16) = '1' then
					  	cs_sig(15 downto 0) <= cs_sig(15 downto 0) + 1;
					  	cs_sig(16) <= '0';
					end if;
					Sreg0 <= S4;
				when S4 =>
					cs_sig <= cs_sig + addrs_sig;
					Sreg0 <= S5;
				when S5 =>
					if cs_sig(16) = '1' then
					  	cs_sig(15 downto 0) <= cs_sig(15 downto 0) + 1;
					  	cs_sig(16) <= '0';
					end if;
					Sreg0 <= S6;
				when S6 =>
					cs_sig <= not cs_sig;
					Sreg0 <= S7;
				when S7 =>
					Sreg0 <= S1;
--vhdl_cover_off
				when others =>
					null;
--vhdl_cover_on
			end case;
		end if;
	end if;
end process;

end ip_checksum_calc_arch;
