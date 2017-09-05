-------------------------------------------------------------------------------
--
-- Title       : GEC_RX_CTL_8
-- Design      : ethernet_controller
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : c:\HDL_Designs\dig_gec\ethernet_controller\compile\GEC_RX_CTL_8.vhd
-- Generated   : 03/20/09 15:19:32
-- From        : c:/HDL_Designs/dig_gec/ethernet_controller/src/GEC_RX_CTL_8.asf
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

entity GEC_RX_CTL_8 is 
	port (
		block_en: in STD_LOGIC;
		clock: in STD_LOGIC;
		data_fifo_full: in STD_LOGIC;
		data_fifo_wrerr: in STD_LOGIC;
		gec_user_crc_err: in STD_LOGIC;
		gec_user_rx_data_out: in STD_LOGIC_VECTOR (7 downto 0);
		gec_user_rx_size_out: in STD_LOGIC_VECTOR (10 downto 0);
		gec_user_rx_valid_out: in STD_LOGIC;
		reset_n: in STD_LOGIC;
		crc_err_flag: out STD_LOGIC;
		data_fifo_q_w_data: out STD_LOGIC_VECTOR (63 downto 0);
		data_fifo_wren: out STD_LOGIC;
		info_fifo_wr_data: out STD_LOGIC_VECTOR (15 downto 0);
		info_fifo_wren: out STD_LOGIC);
end GEC_RX_CTL_8;

architecture GEC_RX_CTL_8 of GEC_RX_CTL_8 is

-- diagram signals declarations
signal com_code: STD_LOGIC_VECTOR (2 downto 0);
signal crc_err_reg: STD_LOGIC;
signal crc_loop_count: STD_LOGIC_VECTOR (4 downto 0);
signal q_w_count: STD_LOGIC_VECTOR (7 downto 0);
signal q_w_counter: STD_LOGIC_VECTOR (7 downto 0);
signal q_w_reg: STD_LOGIC_VECTOR (63 downto 0);

-- BINARY ENCODED state machine: Sreg0
attribute enum_encoding: string;
type Sreg0_type is (
    idle, enabled, rcvdone, S1, check_crc, S2, S3_S4, S3_S7, S3_S8, S3_S9, S3_S10, S3_S11, S3_S12, S3_S6, S3_S5, S13
);
attribute enum_encoding of Sreg0_type: type is
	"0000 " &		-- idle
	"0001 " &		-- enabled
	"0010 " &		-- rcvdone
	"0011 " &		-- S1
	"0100 " &		-- check_crc
	"0101 " &		-- S2
	"0110 " &		-- S3_S4
	"0111 " &		-- S3_S7
	"1000 " &		-- S3_S8
	"1001 " &		-- S3_S9
	"1010 " &		-- S3_S10
	"1011 " &		-- S3_S11
	"1100 " &		-- S3_S12
	"1101 " &		-- S3_S6
	"1110 " &		-- S3_S5
	"1111" ; 		-- S13

signal Sreg0: Sreg0_type;

attribute state_vector: string;
attribute state_vector of GEC_RX_CTL_8: architecture is "Sreg0";

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clock)
begin
	if clock'event and clock = '1' then
		if reset_n = '0' then	
			Sreg0 <= idle;
			-- Set default values for outputs, signals and variables
			-- ...
			crc_err_reg <= '0';
			crc_loop_count <= v_5_0;
			q_w_reg <= v_32_0 & v_32_0;
-- Initialize error flag outputs
			crc_err_flag <= '0';
-- Initialize FIFO control outputs
			data_fifo_wren <= '0';
			info_fifo_wren <= '0';
			info_fifo_wr_data <= v_16_0;
			com_code <= "000";
			data_fifo_q_w_data <= (others => '0');
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when idle =>
					if block_en = '0' then	
						Sreg0 <= idle;
					elsif block_en = '1' then	
						Sreg0 <= enabled;
					end if;
				when enabled =>
					if gec_user_rx_valid_out = '1' and
						block_en = '1' and
						gec_user_rx_size_out > v_11_1 then	
						Sreg0 <= S13;
						info_fifo_wr_data(7 downto 0) <= gec_user_rx_data_out;
						-- Put the entire command/size word in the info
						-- FIFO
						-- this is not written until
						-- all info for the fifo is
						-- accumulated
						--q_w_count <= gec_user_rx_data_out (7 downto 3);
						-- set the terminal count of quad words
						-- using that portion of the command/size
						-- word
						com_code <= gec_user_rx_data_out(2 downto 0);
						-- save command code
					elsif gec_user_rx_valid_out = '0' and
						block_en = '1' then	
						Sreg0 <= enabled;
					elsif block_en = '0' then	
						Sreg0 <= idle;
					elsif gec_user_rx_valid_out = '1' and
						block_en = '1' and
						gec_user_rx_size_out = v_11_1 then	
						Sreg0 <= check_crc;
						info_fifo_wr_data(7 downto 0) <= gec_user_rx_data_out;
						info_fifo_wr_data(15 downto 8) <= v_8_0;
						-- Capture command byte
					end if;
				when rcvdone =>
					if block_en = '0' then	
						Sreg0 <= idle;
						info_fifo_wren <= '0';
					elsif block_en = '1' then	
						Sreg0 <= enabled;
						info_fifo_wren <= '0';
					end if;
				when S1 =>
					Sreg0 <= S2;
					info_fifo_wr_data(3) <= crc_err_reg;
					-- keep the crc error status
					-- at this point the info should be complete
					crc_err_flag <= crc_err_reg;
					-- assert the crc error status on the output
				when check_crc =>
					if (crc_loop_count = v_5_22) or 
						(gec_user_crc_err = '1') or
						(crc_err_reg = '1') then	-- CRC timed out  -- or CRC err detected
						Sreg0 <= S1;
						if (gec_user_crc_err = '1') then
						  crc_err_reg <= '1';
						end if;
					elsif (crc_loop_count < v_5_22) and 
						(gec_user_crc_err = '0') then	-- waiting for CRC time out
						Sreg0 <= check_crc;
						crc_loop_count <= crc_loop_count + v_5_1;
					end if;
				when S2 =>
					Sreg0 <= rcvdone;
					crc_err_reg <= '0';
					-- reset the crc error counter
					crc_err_flag <= '0';
					-- reset the crc error flag (output)
					crc_loop_count <= v_5_0;
					-- reset the 22 cycle crc loop counter
					data_fifo_wren <= '0';
					info_fifo_wren <= '1';
					-- we actually write the info fifo here.
				when S13 =>
					Sreg0 <= S3_S4;
					q_w_count <= gec_user_rx_data_out;
					info_fifo_wr_data(15 downto 8) <= gec_user_rx_data_out;
				when S3_S4 =>
					Sreg0 <= S3_S5;
					data_fifo_q_w_data(63 downto 56) <= gec_user_rx_data_out;
					q_w_counter <= v_8_1;
					-- initialize the counter
					case com_code is
					  when "000" =>
					-- read
					    q_w_count <= v_8_1;
					-- Increment the quad word count for writes
					-- First word is the starting address
					-- next n words (I received a count of n)
					-- is the actual quad word data for writing.
					-- This will cause only the address word
					-- to be written to the data fifo.
					  when "001" =>
					-- write
					    q_w_count <= q_w_count + v_8_1;
					-- watch out for overflow
					-- writes the starting address first plus the
					-- data
					  when "010" =>
					-- read
					    q_w_count <= v_8_1;
					-- This will cause only the address word
					-- to be written to the data fifo.
					  when "011" =>
					-- read
					    q_w_count <= v_8_1;
					-- This will cause only the address word
					-- to be written to the data fifo.
					  when others =>
					    q_w_count <= v_8_1;
					end case;
				when S3_S7 =>
					Sreg0 <= S3_S8;
					data_fifo_q_w_data(39 downto 32) <= gec_user_rx_data_out;
				when S3_S8 =>
					Sreg0 <= S3_S9;
					data_fifo_q_w_data(31 downto 24) <= gec_user_rx_data_out;
				when S3_S9 =>
					Sreg0 <= S3_S10;
					data_fifo_q_w_data(23 downto 16) <= gec_user_rx_data_out;
				when S3_S10 =>
					Sreg0 <= S3_S11;
					data_fifo_q_w_data(15 downto 8) <= gec_user_rx_data_out;
				when S3_S11 =>
					Sreg0 <= S3_S12;
					data_fifo_wren <= '1';
					-- write the assembled data to the FIFO
					data_fifo_q_w_data(7 downto 0) <= gec_user_rx_data_out;
				when S3_S12 =>
					if q_w_counter < q_w_count then	
						Sreg0 <= S3_S5;
						data_fifo_q_w_data(63 downto 56) <= gec_user_rx_data_out;
						data_fifo_wren <= '0';
						-- Finish the write to the data fifo
						q_w_counter <= q_w_counter + v_8_1;
						-- increment the counter
					elsif q_w_counter = q_w_count then	
						Sreg0 <= check_crc;
						data_fifo_wren <= '0';
						-- finish data FIFO write
						if (gec_user_crc_err = '1') then
						  crc_err_reg <= '1';
						end if;
						crc_loop_count <= crc_loop_count + v_5_1;
						-- increment loop counter for catching CRC errors
					end if;
				when S3_S6 =>
					Sreg0 <= S3_S7;
					data_fifo_q_w_data(47 downto 40) <= gec_user_rx_data_out;
				when S3_S5 =>
					Sreg0 <= S3_S6;
					data_fifo_q_w_data(55 downto 48) <= gec_user_rx_data_out;
--vhdl_cover_off
				when others =>
					null;
--vhdl_cover_on
			end case;
		end if;
	end if;
end process;

end GEC_RX_CTL_8;
