-------------------------------------------------------------------------------
--
-- Title       : GEC_RX_CTL_0
-- Design      : CAPTAN
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : u:\CAPTAN\Data_Conversion_Board\CAPTAN\CAPTAN\compile\GEC_RX_CTL_0.vhd
-- Generated   : 06/11/08 15:40:42
-- From        : u:/CAPTAN/Data_Conversion_Board/CAPTAN/CAPTAN/src/GEC_RX_CTL_0.asf
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

entity gec_rx_ctl_0 is 
	port (
		block_en: in STD_LOGIC;
		clock: in STD_LOGIC;
		data_fifo_full: in STD_LOGIC;
		data_fifo_wrerr: in STD_LOGIC;
		gec_user_crc_err: in STD_LOGIC;
		gec_user_rx_size_out: in STD_LOGIC_VECTOR (10 downto 0);
		gec_user_rx_valid_out: in STD_LOGIC;
		reset_n: in STD_LOGIC;
		crc_err_flag: out STD_LOGIC;
		data_fifo_wren: out STD_LOGIC;
		gec_rx_ctl_mux_sel: out STD_LOGIC;
		gec_rx_ctl_stat_out: out STD_LOGIC_VECTOR (7 downto 0);
		info_fifo_wr_data: out STD_LOGIC_VECTOR (15 downto 0);
		info_fifo_wren: out STD_LOGIC;
		rx_size_err_flag: out STD_LOGIC);
end gec_rx_ctl_0;

architecture gec_rx_ctl_0 of GEC_RX_CTL_0 is

-- diagram signals declarations
signal crc_err_reg: STD_LOGIC;
signal crc_loop_count: STD_LOGIC_VECTOR (4 downto 0);
signal gec_rx_data_count: STD_LOGIC_VECTOR (10 downto 0);
signal rx_data_count: STD_LOGIC_VECTOR (10 downto 0);
signal rx_size_err: STD_LOGIC;
signal stat_data_reg: STD_LOGIC_VECTOR (15 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    idle, enabled, data_arrive, rcvdone, S1, update_info, S2
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
			Sreg0 <= idle;
			-- Set default values for outputs, signals and variables
			-- ...
-- Initialize registers
			rx_data_count <= v_11_0;
			gec_rx_data_count <= v_11_0;
			stat_data_reg <= v_16_0;
			crc_err_reg <= '0';
			rx_size_err <= '0';
			crc_loop_count <= v_5_0;
-- Initialize error flag outputs
			crc_err_flag <= '0';
			rx_size_err_flag <= '0';
-- Initialize FIFO control outputs
			data_fifo_wren <= '0';
			info_fifo_wren <= '0';
			info_fifo_wr_data <= v_16_0;
-- Initialize other control outputs
			gec_rx_ctl_stat_out <= v_8_0;
			gec_rx_ctl_mux_sel <= '0';
-- '0' points to GEC
-- '1' points to GEC_RX_CTL_0
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
					if gec_user_rx_valid_out = '0' then	
						Sreg0 <= enabled;
					elsif gec_user_rx_valid_out = '1' then	
						Sreg0 <= data_arrive;
						rx_data_count <= rx_data_count + v_11_1;
						gec_rx_data_count <= gec_user_rx_size_out;
						--data_fifo_wren <= '1';
						-- Now driven by GEC user_rx_enable_out
						-- and OR'd with data_fifo_wren
						-- for last byte.
					end if;
				when data_arrive =>
					if gec_user_rx_valid_out = '1' then	
						Sreg0 <= data_arrive;
						rx_data_count <= rx_data_count + v_11_1;
						-- Increment count with each received byte
						-- data_fifo_wren <= '1';
						-- Now driven by GEC user_rx_enable_out
						-- and OR'd with data_fifo_wren
						-- for last byte.
					elsif gec_user_rx_valid_out = '0' then	
						Sreg0 <= update_info;
						if (gec_user_crc_err = '1') then
						  crc_err_reg <= '1';
						end if;
						if (gec_rx_data_count /= rx_data_count) then
						  rx_size_err <= '1';
						end if;
						rx_data_count <= rx_data_count + v_11_1;
						-- Add a count for the status byte
						-- to be sent back to the PC
						data_fifo_wren <= '0';
					end if;
				when rcvdone =>
					if block_en = '0' then	
						Sreg0 <= idle;
					elsif block_en = '1' then	
						Sreg0 <= enabled;
					end if;
				when S1 =>
					Sreg0 <= S2;
					info_fifo_wren <= '0';
					gec_rx_ctl_stat_out(1 downto 0) <= rx_size_err & crc_err_reg;
					data_fifo_wren <= '1';
				when update_info =>
					if (crc_loop_count = v_5_22) or 
						(gec_user_crc_err = '1') or
						(crc_err_reg = '1') then	
						Sreg0 <= S1;
						gec_rx_ctl_mux_sel <= '1';
						-- Set data mux to point to receive controller
						-- (instead of GEC) to load	extra info to send
						-- back to PC
						if (gec_user_crc_err = '0') then   -- this is a spoof
						  crc_err_reg <= '1';
						end if;
						info_fifo_wr_data(10 downto 0) <= rx_data_count;
						info_fifo_wren <= '1';
					elsif (crc_loop_count < v_5_22) and 
						(gec_user_crc_err = '0') then	
						Sreg0 <= update_info;
						crc_loop_count <= crc_loop_count + v_5_1;
					end if;
				when S2 =>
					Sreg0 <= rcvdone;
					rx_data_count <= v_11_0;
					stat_data_reg <= v_16_0;
					crc_err_reg <= '0';
					crc_err_flag <= '0';
					crc_loop_count <= v_5_0;
					rx_size_err_flag <= '0';
					data_fifo_wren <= '0';
					info_fifo_wren <= '0';
					info_fifo_wr_data <= v_16_0;
					gec_rx_ctl_stat_out <= v_8_0;
					gec_rx_ctl_mux_sel <= '0';
					-- '0' points to GEC
					-- '1' points to GEC_RX_CTL_0
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

end GEC_RX_CTL_0;
