-------------------------------------------------------------------------------
--
-- Title       : Burst Controller State Machine
-- Design      : burst_controller
-- Author      : Ryan Rivera
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--
-- File        : C:\Documents and Settings\rrivera\Desktop\CAPTAN_burst_controller_1\burst_controller\compile\burst_controller_sm.vhd
-- Generated   : 04/08/11 10:17:01
-- From        : C:/Documents and Settings/rrivera/Desktop/CAPTAN_burst_controller_1/burst_controller/src/burst_controller_sm.asf
-- By          : FSM2VHDL ver. 5.0.7.2
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

entity burst_controller_sm is 
	port (
		b_data_we: in STD_LOGIC;
		b_end_burst: in STD_LOGIC;
		b_end_packet: in STD_LOGIC;
		burst_start: in STD_LOGIC;
		burst_stop: in STD_LOGIC;
		clk: in STD_LOGIC;
		reset_n: in STD_LOGIC;
		tx_data_full: in STD_LOGIC;
		tx_info_full: in STD_LOGIC;
		b_enable: out STD_LOGIC;
		burst_done: out STD_LOGIC;
		tx_data_we: out STD_LOGIC;
		tx_info: out STD_LOGIC_VECTOR (15 downto 0);
		tx_info_we: out STD_LOGIC);
end burst_controller_sm;

architecture burst_controller_sm_arch of burst_controller_sm is

constant max_packet_64_size: STD_LOGIC_VECTOR (7 downto 0) := x"B6";  -- 182;
-- diagram signals declarations
signal b_enable_sig: STD_LOGIC;
signal b_packet_64_size: STD_LOGIC_VECTOR (7 downto 0);
signal first_packet_sig: STD_LOGIC;
signal just_reset: STD_LOGIC;
signal reset_packet_size: STD_LOGIC;

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    End_Burst, Wait_for_End, Inform_Decoder_Done, End_Packet, Reset_Size, Idle
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin

-- concurrent signals assignments

-- Diagram ACTION
tx_data_we <= b_enable_sig and b_data_we and (not tx_data_full) and (not tx_info_full);
-- don't allow writes when tx fifo is full
b_enable <= b_enable_sig;
-- proc_size counts the number of quad-words
-- in the current packet and saves the value
-- in b_packet_64_size.
proc_size: process(reset_n,clk,b_data_we)
begin
	if reset_n = '0' then
		b_packet_64_size <= (others => '0');
	elsif rising_edge(clk) then
		just_reset <= '0';
		if b_enable_sig = '1' and b_data_we = '1' and tx_data_full = '0' and tx_info_full = '0' then
			b_packet_64_size <= b_packet_64_size + 1;
			if b_packet_64_size = max_packet_64_size or b_end_packet = '1' then -- include case where packet is ended at same time as b_we pulse
				b_packet_64_size <= x"01";
				-- start next packet (allows for burst to not use b_end_packet signal)
				just_reset <= '1';
			end if;
		elsif b_enable_sig = '1' and b_end_packet = '1' then
			b_packet_64_size <= (others => '0');
		elsif just_reset = '0' and reset_packet_size = '1' then
			b_packet_64_size <= (others => '0');
			-- follow reset_packet_size flag, if didn't just reset
		end if;
	end if;
end process;

----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clk)
begin
	if clk'event and clk = '1' then
		if reset_n = '0' then	
			Sreg0 <= Idle;
			-- Set default values for outputs, signals and variables
			-- ...
			tx_info <= (0 => '1',others => '0');
			b_enable_sig <= '0';
			burst_done <= '1';
			tx_info_we <= '0';
			first_packet_sig <= '1';
			reset_packet_size <= '0';
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when End_Burst =>
					Sreg0 <= Inform_Decoder_Done;
					tx_info_we <= '0';
					burst_done <= '1';
				when Wait_for_End =>
					if burst_stop = '1' or b_end_burst = '1' then	
						Sreg0 <= End_Burst;
						tx_info(15 downto 8) <= b_packet_64_size;
						tx_info(2 downto 0) <= "011";
						tx_info_we <= '1';
						b_enable_sig <= '0';
					elsif b_end_packet = '1' or b_packet_64_size = max_packet_64_size then	
						Sreg0 <= End_Packet;
						tx_info(15 downto 8) <= b_packet_64_size;
						tx_info_we <= '1';
						reset_packet_size <= '1';
					end if;
				when Inform_Decoder_Done =>
					Sreg0 <= Reset_Size;
					reset_packet_size <= '1';
				when End_Packet =>
					if b_end_packet='0' then	
						Sreg0 <= Wait_for_End;
						if first_packet_sig = '1' then
							tx_info(2 downto 0) <= "010";
							first_packet_sig <= '0';
						end if;
						tx_info_we <= '0';
						reset_packet_size <= '0';
					end if;
				when Reset_Size =>
					Sreg0 <= Idle;
					tx_info <= (0 => '1',others => '0');
					b_enable_sig <= '0';
					burst_done <= '1';
					tx_info_we <= '0';
					first_packet_sig <= '1';
					reset_packet_size <= '0';
				when Idle =>
					if burst_start = '1' then	
						Sreg0 <= Wait_for_End;
						b_enable_sig <= '1';
						burst_done <= '0';
					end if;
--vhdl_cover_off
				when others =>
					null;
--vhdl_cover_on
			end case;
		end if;
	end if;
end process;

end burst_controller_sm_arch;
