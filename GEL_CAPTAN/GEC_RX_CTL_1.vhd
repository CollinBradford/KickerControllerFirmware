-------------------------------------------------------------------------------
--
-- Title       : GEC_RX_CTL_1
-- Design      : CAPTAN
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : u:\CAPTAN\Data_Conversion_Board\CAPTAN\CAPTAN\compile\GEC_RX_CTL_1.vhd
-- Generated   : 06/17/08 10:04:53
-- From        : u:/CAPTAN/Data_Conversion_Board/CAPTAN/CAPTAN/src/GEC_RX_CTL_1.asf
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

entity gec_rx_ctl_1 is 
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
end gec_rx_ctl_1;

architecture gec_rx_ctl_1 of GEC_RX_CTL_1 is

-- diagram signals declarations
signal crc_err_reg: STD_LOGIC;
signal crc_loop_count: STD_LOGIC_VECTOR (4 downto 0);
signal first_byte: STD_LOGIC;
signal q_w_byte_count: STD_LOGIC_VECTOR (2 downto 0);
signal q_w_reg: STD_LOGIC_VECTOR (63 downto 0);
signal rx_data_count: STD_LOGIC_VECTOR (4 downto 0);

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
			rx_data_count <= v_5_0;
			first_byte <= '0';
			crc_err_reg <= '0';
			crc_loop_count <= v_5_0;
			q_w_byte_count <= v_3_0;
			q_w_reg <= v_32_0 & v_32_0;
-- Initialize error flag outputs
			crc_err_flag <= '0';
-- Initialize FIFO control outputs
			data_fifo_wren <= '0';
			info_fifo_wren <= '0';
			info_fifo_wr_data <= v_16_0;
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
						info_fifo_wr_data(7 downto 0) <= gec_user_rx_data_out;
						-- Capture command byte
						--info_fifo_wren <= '1';
					end if;
				when data_arrive =>
					if gec_user_rx_valid_out = '1' then	
						Sreg0 <= data_arrive;
						info_fifo_wren <= '0';
						case q_w_byte_count is
						  when "000" =>
						    if (first_byte = '0') then
						      first_byte <= '1';
						      data_fifo_wren <= '0';
						      -- no quad word write strobe
						    else
						      data_fifo_wren <= '1';
						      -- generate a quad word write strobe
						      q_w_byte_count <= q_w_byte_count + "001";
						      -- increment q_w_byte_count
						    end if;
							rx_data_count <= rx_data_count + v_5_1;
							-- increment quad word count
							q_w_reg(7 downto 0) <= gec_user_rx_data_out;
						-- write the assemebled quad word data to the FIFO
						-- increment the count of quad words
						  when "001" =>
						    q_w_byte_count <= q_w_byte_count + "001";
						    -- increment q_w_byte_count
						    data_fifo_wren <= '0';
						    -- no quad word write strobe
							q_w_reg(15 downto 8) <= gec_user_rx_data_out;
						  when "010" =>
						    q_w_byte_count <= q_w_byte_count + "001";
						    -- increment q_w_byte_count
						    data_fifo_wren <= '0';
						    -- no quad word write strobe
							q_w_reg(23 downto 16) <= gec_user_rx_data_out;
						  when "011" =>
						    q_w_byte_count <= q_w_byte_count + "001";
						    -- increment q_w_byte_count
						    data_fifo_wren <= '0';
						    -- no quad word write strobe
							q_w_reg(31 downto 24) <= gec_user_rx_data_out;
						  when "100" =>
						    q_w_byte_count <= q_w_byte_count + "001";
						    -- increment q_w_byte_count
						    data_fifo_wren <= '0';
						    -- no quad word write strobe
							q_w_reg(39 downto 32) <= gec_user_rx_data_out;
						  when "101" =>
						    q_w_byte_count <= q_w_byte_count + "001";
						    -- increment q_w_byte_count
						    data_fifo_wren <= '0';
						    -- no quad word write strobe
							q_w_reg(47 downto 40) <= gec_user_rx_data_out;
						  when "110" =>
						    q_w_byte_count <= q_w_byte_count + "001";
						    -- increment q_w_byte_count
						    data_fifo_wren <= '0';
						    -- no quad word write strobe
							q_w_reg(55 downto 48) <= gec_user_rx_data_out;
						  when "111" =>
						    q_w_byte_count <= "000";
						    -- reset q_w_byte_count
							data_fifo_wren <= '0';
							q_w_reg(63 downto 56) <= gec_user_rx_data_out;
						  when others =>
						    data_fifo_wren <= '0';
						end case;
					elsif gec_user_rx_valid_out = '0' then	
						Sreg0 <= update_info;
						if (gec_user_crc_err = '1') then
						  crc_err_reg <= '1';
						end if;
						data_fifo_wren <= '0';
						info_fifo_wren <= '0';
					end if;
				when rcvdone =>
					if block_en = '0' then	
						Sreg0 <= idle;
					elsif block_en = '1' then	
						Sreg0 <= enabled;
					end if;
				when S1 =>
					Sreg0 <= S2;
					info_fifo_wr_data(13) <= crc_err_reg;
				when update_info =>
					if (crc_loop_count = v_5_22) or 
						(gec_user_crc_err = '1') or
						(crc_err_reg = '1') then	
						Sreg0 <= S1;
						if (gec_user_crc_err = '1') then
						  crc_err_reg <= '1';
						end if;
						info_fifo_wr_data(12 downto 8) <= rx_data_count;
						--info_fifo_wren <= '1';
					elsif (crc_loop_count < v_5_22) and 
						(gec_user_crc_err = '0') then	
						Sreg0 <= update_info;
						crc_loop_count <= crc_loop_count + v_5_1;
					end if;
				when S2 =>
					Sreg0 <= rcvdone;
					rx_data_count <= v_5_0;
					crc_err_reg <= '0';
					crc_err_flag <= '0';
					crc_loop_count <= v_5_0;
					data_fifo_wren <= '0';
					info_fifo_wren <= '1';
					info_fifo_wr_data <= v_16_0;
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

end GEC_RX_CTL_1;
