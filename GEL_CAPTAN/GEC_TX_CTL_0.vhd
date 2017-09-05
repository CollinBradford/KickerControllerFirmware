-------------------------------------------------------------------------------
--
-- Title       : GEC_TX_CTL_0
-- Design      : CAPTAN
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : u:\CAPTAN\Data_Conversion_Board\CAPTAN\CAPTAN\compile\GEC_TX_CTL_0.vhd
-- Generated   : 06/11/08 15:13:34
-- From        : u:/CAPTAN/Data_Conversion_Board/CAPTAN/CAPTAN/src/GEC_TX_CTL_0.asf
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

entity gec_tx_ctl_0 is 
	port (
		block_en: in STD_LOGIC;
		clk: in STD_LOGIC;
		data_fifo_empty: in STD_LOGIC;
		data_fifo_rderr: in STD_LOGIC;
		gec_user_busy: in STD_LOGIC;
		gec_user_tx_enable_out: in STD_LOGIC;
		info_fifo_empty: in STD_LOGIC;
		info_fifo_rd_data: in STD_LOGIC_VECTOR (15 downto 0);
		info_fifo_rderr: in STD_LOGIC;
		reset_n: in STD_LOGIC;
		data_fifo_rden: out STD_LOGIC;
		data_fifo_rden_en: out STD_LOGIC;
		gec_user_trigger: out STD_LOGIC;
		gec_user_tx_size_in: out STD_LOGIC_VECTOR (10 downto 0);
		info_fifo_rden: out STD_LOGIC);
end gec_tx_ctl_0;

architecture gec_tx_ctl_0 of GEC_TX_CTL_0 is

-- diagram signals declarations
signal tx_data_count: STD_LOGIC_VECTOR (10 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    idle, enabled, chk_busy, txmtdone, data_rdy_read_Ififo, trgrd, data_rdy_savecount, txmt_xmiting, txmt_last_byte
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clk)
begin
	if clk'event and clk = '1' then
		if reset_n = '0' then	
			Sreg0 <= idle;
			-- Set default values for outputs, signals and variables
			-- ...
			gec_user_trigger <= '0';
			gec_user_tx_size_in <= v_11_0;
			tx_data_count <= v_11_0;
			info_fifo_rden <= '0';
			data_fifo_rden <= '0';
			data_fifo_rden_en <= '0';
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
					if info_fifo_empty = '0' and block_en = '1' then	-- FIFO has an entry
						Sreg0 <= data_rdy_read_Ififo;
						info_fifo_rden <= '1';
						-- Read the info word
						data_fifo_rden_en <= '1';
						-- this enables the OR'd
						-- conbination of user_tx_enable_out
						-- and data_fifo_rden
					elsif block_en = '0' then	
						Sreg0 <= idle;
					elsif info_fifo_empty = '1' and block_en = '1' then	-- FIFO is empty
						Sreg0 <= enabled;
					end if;
				when chk_busy =>
					if gec_user_busy = '0' then	
						Sreg0 <= trgrd;
						gec_user_trigger <= '1';
						-- GEC not busy
						-- assert trigger to GEC
					elsif gec_user_busy = '1' then	
						Sreg0 <= chk_busy;
					end if;
				when txmtdone =>
					if block_en = '1' then	
						Sreg0 <= enabled;
					elsif block_en = '0' then	
						Sreg0 <= idle;
					end if;
				when trgrd =>
					if gec_user_tx_enable_out = '0' then	-- wait for enable tx reply
						Sreg0 <= trgrd;
					elsif gec_user_tx_enable_out = '1' then	
						Sreg0 <= txmt_xmiting;
						if (tx_data_count = v_11_1) then
						  data_fifo_rden_en <= '0';
						-- turn off FIFO accesses early
						-- only one byte is requested and
						-- it has been preloaded (this should
						-- not happen in loopback tests
						else
						  tx_data_count <= tx_data_count - v_11_1;
						end if;
						-- decrement count of bytes;
						-- user_tx_enable_out from the GEC is
						-- enabling read operations on the data
						-- FIFO
					end if;
				when data_rdy_read_Ififo =>
					Sreg0 <= data_rdy_savecount;
					info_fifo_rden <= '0';
					-- terminate info word read
					data_fifo_rden <= '1';
					-- read the first data byte for preset
				when data_rdy_savecount =>
					Sreg0 <= chk_busy;
					gec_user_tx_size_in <= info_fifo_rd_data(10 downto 0);
					-- Present transmit size to GEC
					data_fifo_rden <= '0';
					-- terminate first data word read
					-- Data should be present at the output
					-- of the data FIFO (and the input to the
					-- GEC)
					tx_data_count <= info_fifo_rd_data(10 downto 0);
					-- initialize byte count for transmission
					-- Last byte with error codes for end
					-- of transmission has already been put
					-- into the data FIFO.
				when txmt_xmiting =>
					if tx_data_count = v_11_1 then	
						Sreg0 <= txmt_last_byte;
						data_fifo_rden_en <= '0';
						-- disable read enable control to
						-- data FIFO
					elsif tx_data_count /= v_11_1 then	
						Sreg0 <= txmt_xmiting;
						tx_data_count <= tx_data_count - v_11_1;
						-- decrement count of bytes
					end if;
				when txmt_last_byte =>
					Sreg0 <= txmtdone;
					gec_user_trigger <= '0';
					gec_user_tx_size_in <= v_11_0;
					tx_data_count <= v_11_0;
					info_fifo_rden <= '0';
					data_fifo_rden <= '0';
					data_fifo_rden_en <= '0';
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

end GEC_TX_CTL_0;
