-------------------------------------------------------------------------------
--
-- Title       : Decipherer
-- Design      : ethernet_controller
-- Author      : Ryan Rivera
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--
-- File        : c:\HDL_Designs\dig_gec\ethernet_controller\compile\decipherer.vhd
-- Generated   : 03/20/09 15:19:31
-- From        : c:/HDL_Designs/dig_gec/ethernet_controller/src/decipherer.asf
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

entity decipherer is 
	port (
		addrs: in STD_LOGIC_VECTOR (7 downto 0);
		clk: in STD_LOGIC;
		data: in STD_LOGIC_VECTOR (7 downto 0);
		dv: in STD_LOGIC;
		er: in STD_LOGIC;
		reset: in STD_LOGIC;
		arp_req_ip: out STD_LOGIC_VECTOR (31 downto 0);
		arp_req_mac: out STD_LOGIC_VECTOR (47 downto 0);
		arp_search_ip: out STD_LOGIC_VECTOR (31 downto 0);
		capture_source_addrs: out STD_LOGIC;
		crc_chk_en: out STD_LOGIC;
		crc_chk_err: out STD_LOGIC;
		crc_chk_init: out STD_LOGIC;
		dest_mac: out STD_LOGIC_VECTOR (47 downto 0);
		is_arp: out STD_LOGIC;
		is_idle: out STD_LOGIC;
		is_udp: out STD_LOGIC;
		src_mac: out STD_LOGIC_VECTOR (47 downto 0);
		udp_data_count: out STD_LOGIC_VECTOR (10 downto 0);
		udp_data_valid: out STD_LOGIC;
		udp_dest_ip_out: out STD_LOGIC_VECTOR (31 downto 0);
		udp_src_ip: out STD_LOGIC_VECTOR (31 downto 0);
		udp_src_port: out STD_LOGIC_VECTOR (15 downto 0));
end decipherer;

architecture decipherer_arch of decipherer is

-- diagram signals declarations
signal addrs_match_sig: STD_LOGIC;
signal capture_source_addrs_sig: STD_LOGIC;
signal is_arp_sig: STD_LOGIC;
signal is_udp_sig: STD_LOGIC;
signal udp_countdown: STD_LOGIC_VECTOR (15 downto 0);
signal udp_data_valid_sig: STD_LOGIC;
signal udp_dest_ip: STD_LOGIC_VECTOR (31 downto 0);
signal udp_zeros: STD_LOGIC_VECTOR (10 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    Idle, RecvPacket_IP_Payload_UDP_RecvDataLoop, RecvPacket_Type_S29, RecvPacket_IP_Payload_IP_TotLength2, RecvPacket_IP_Payload_UDP_SourcePort1,
    RecvPacket_IP_Payload_IP_VersionAndHeader, RecvPacket_Dest_S22, RecvPacket_IP_Payload_IP_TotLength1, RecvPacket_IP_Payload_IP_ToS,
    RecvPacket_Dest_S11, RecvPacket_IP_Payload_UDP_DestPort1, RecvPacket_IP_Payload_IP_TTL, RecvPacket_IP_Payload_IP_FragmentOffset,
    RecvPacket_IP_Payload_IP_FlagsAndFrag, RecvPacket_IP_Payload_IP_ID2, RecvPacket_IP_Payload_IP_ID1, RecvPacket_Dest_S12, RecvPacket_Dest_S13,
    RecvPacket_Dest_S14, RecvPacket_Dest_S15, RecvPacket_IP_Payload_IP_SourceAddr1, RecvPacket_IP_Payload_IP_Checksum2, RecvPacket_IP_Payload_IP_Checksum1,
    RecvPacket_IP_Payload_IP_Protocol, RecvPacket_IP_Payload_IP_SourceAddr3, RecvPacket_IP_Payload_IP_SourceAddr2, RecvPacket_IP_Payload_IP_DestAddr2,
    RecvPacket_IP_Payload_IP_DestAddr1, RecvPacket_IP_Payload_IP_SourceAddr4, RecvPacket_IP_Payload_IP_DestAddr4, RecvPacket_IP_Payload_IP_DestAddr3,
    RecvPacket_Type_S26, RecvPacket_IP_Payload_UDP_DestPort2, RecvPacket_IP_Payload_UDP_Length1, RecvPacket_IP_Payload_UDP_Checksum2,
    RecvPacket_IP_Payload_UDP_Checksum1, RecvPacket_IP_Payload_UDP_Length2, RecvPacket_IP_Payload_UDP_SourcePort2, RecvPacket_Src_S42,
    RecvPacket_Src_S44, RecvPacket_Src_S45, RecvPacket_Src_S46, RecvPacket_Src_S47, RecvPacket_Src_S43, RecvPacket_Type_S1, RecvPacket_Type_S48,
    RecvPacket_Type_S49, RecvPacket_ARP_Payload_HType2, RecvPacket_ARP_Payload_HType1, RecvPacket_ARP_Payload_PType1, RecvPacket_ARP_Payload_PType2,
    RecvPacket_ARP_Payload_HLen, RecvPacket_ARP_Payload_PLen, RecvPacket_ARP_Payload_Op1, RecvPacket_ARP_Payload_SMac1, RecvPacket_ARP_Payload_SMac2,
    RecvPacket_ARP_Payload_SMac3, RecvPacket_ARP_Payload_SMac4, RecvPacket_ARP_Payload_SMac5, RecvPacket_ARP_Payload_SMac6, RecvPacket_ARP_Payload_Sip1,
    RecvPacket_ARP_Payload_Sip2, RecvPacket_ARP_Payload_Sip3, RecvPacket_ARP_Payload_Sip4, RecvPacket_ARP_Payload_TMac1, RecvPacket_ARP_Payload_TMac2,
    RecvPacket_ARP_Payload_TMac3, RecvPacket_ARP_Payload_TMac4, RecvPacket_ARP_Payload_TMac5, RecvPacket_ARP_Payload_TMac6, RecvPacket_ARP_Payload_Tip1,
    RecvPacket_ARP_Payload_Tip2, RecvPacket_ARP_Payload_Tip3, RecvPacket_ARP_Payload_Tip4, RecvPacket_ARP_Payload_Op2, RecvPacket_Preamble_S50,
    RecvPacket_Preamble_S51, RecvPacket_CRC_ARP_S52, RecvPacket_CRC_ARP_S53, RecvPacket_CRC_ARP_crc1, RecvPacket_CRC_ARP_crc2, RecvPacket_CRC_ARP_crc3,
    RecvPacket_CRC_ARP_crc4, RecvPacket_Preamble_S54, RecvPacket_CRC_IP_S55, RecvPacket_CRC_IP_crc6, RecvPacket_CRC_IP_crc7, RecvPacket_CRC_IP_crc8,
    RecvPacket_CRC_IP_crc9, RecvPacket_CRC_IP_S56
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin

-- concurrent signals assignments

-- Diagram ACTION
is_arp <= is_arp_sig;
is_udp <= is_udp_sig;
udp_data_valid <= udp_data_valid_sig and addrs_match_sig;
capture_source_addrs <= capture_source_addrs_sig and addrs_match_sig;
udp_dest_ip_out <= udp_dest_ip;
-- get received data size and calc number of 0 bytess to fill
udp_dc : process(clk)
begin
if rising_edge(clk) then
	if reset = '1' then
		udp_data_count <= (others => '0');
		udp_zeros <= (others => '0');
	elsif Sreg0 = recvpacket_ip_payload_udp_checksum1 then
		udp_data_count <= udp_countdown(10 downto 0) - ("000" & x"08");
-- if number of bytes < 18 then need to add 0's	(header is 8)
		if udp_countdown(10 downto 0) < ("000" & x"1A")	then
			udp_zeros <= ("000" & x"1A") - udp_countdown(10 downto 0);
		else
			udp_zeros <= (others => '0');
		end if;
	end if;
end if;
end process;
-- First 3 bytes of IP address are assumed to be C0 A8 85
match_proc : process(clk)
begin
if rising_edge(clk) then
	addrs_match_sig <= '0';
	if udp_dest_ip = (x"C0A885" & addrs) or udp_dest_ip = x"C0A885FE" then --this UDP packet was intended for this firmware. 0xFE is CAPTAN broadcast
		addrs_match_sig <= '1';
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
			Sreg0 <= Idle;
			-- Set default values for outputs, signals and variables
			-- ...
-- **** only clear these on reset ****
--from ethernet frame
			dest_mac <= (others => '0');
			src_mac <= (others => '0');
--from arp payload
			arp_req_mac <= (others => '0');
			arp_req_ip <= (others => '0');
			arp_search_ip <= (others => '0');
--from ipv4 payload
			udp_src_ip <= (others => '0');
			udp_src_port <= (others => '0');
			udp_dest_ip <= (others => '0');
			is_udp_sig <= '0';
			is_arp_sig <= '0';
			is_idle <= '1';
--from ipv4 payload
			udp_data_valid_sig <= '0';
			--indicates packet data on data lines
			udp_countdown <= (others => '0');
			-- used to determine when udp packet data ends
--also used for various delay counts throughout reception
			crc_chk_init <= '0';
			crc_chk_en <= '0';
			crc_chk_err <= '0';
			capture_source_addrs_sig <= '0';
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when Idle =>
					is_udp_sig <= '0';
					is_arp_sig <= '0';
					is_idle <= '1';
					--from ipv4 payload
					udp_data_valid_sig <= '0';
					--indicates packet data on data lines
					udp_countdown <= (others => '0');
					-- used to determine when udp packet data ends
					--also used for various delay counts throughout reception
					crc_chk_init <= '0';
					crc_chk_en <= '0';
					crc_chk_err <= '0';
					capture_source_addrs_sig <= '0';
					if dv = '1' and er = '0' then	
						Sreg0 <= RecvPacket_Preamble_S50;
						is_idle <= '0';
						crc_chk_init <= '1';
						-- reset crc calculation
					end if;
				when RecvPacket_IP_Payload_UDP_RecvDataLoop =>
					udp_countdown <= udp_countdown - 1;
					if udp_countdown = x"0009" then	
						Sreg0 <= RecvPacket_CRC_IP_S55;
						udp_data_valid_sig <= '0';
					end if;
				when RecvPacket_IP_Payload_UDP_SourcePort1 =>
					Sreg0 <= RecvPacket_IP_Payload_UDP_SourcePort2;
					udp_src_port(7 downto 0) <= data;
					-- acquire src port to be used as destination port from CAPTAN
				when RecvPacket_IP_Payload_UDP_DestPort1 =>
					Sreg0 <= RecvPacket_IP_Payload_UDP_DestPort2;
				when RecvPacket_IP_Payload_UDP_DestPort2 =>
					Sreg0 <= RecvPacket_IP_Payload_UDP_Length1;
					udp_countdown(15 downto 8) <= data;
				when RecvPacket_IP_Payload_UDP_Length1 =>
					Sreg0 <= RecvPacket_IP_Payload_UDP_Length2;
					udp_countdown(7 downto 0) <= data;
				when RecvPacket_IP_Payload_UDP_Checksum2 =>
					if udp_countdown <= x"0009" then	--  for the 1 byte case (or illegal case)
						Sreg0 <= RecvPacket_CRC_IP_S55;
						udp_data_valid_sig <= '0';
					else
						Sreg0 <= RecvPacket_IP_Payload_UDP_RecvDataLoop;
						udp_countdown <= udp_countdown - 1;
					end if;
				when RecvPacket_IP_Payload_UDP_Checksum1 =>
					Sreg0 <= RecvPacket_IP_Payload_UDP_Checksum2;
					if udp_countdown > 9 then
						udp_data_valid_sig <= '1';
					elsif udp_countdown = 9 then -- is 1 byte packet (set IP address)
						capture_source_addrs_sig <= '1';
					end if;
				when RecvPacket_IP_Payload_UDP_Length2 =>
					Sreg0 <= RecvPacket_IP_Payload_UDP_Checksum1;
				when RecvPacket_IP_Payload_UDP_SourcePort2 =>
					Sreg0 <= RecvPacket_IP_Payload_UDP_DestPort1;
				when RecvPacket_IP_Payload_IP_TotLength2 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_ID1;
				when RecvPacket_IP_Payload_IP_VersionAndHeader =>
					Sreg0 <= RecvPacket_IP_Payload_IP_ToS;
				when RecvPacket_IP_Payload_IP_TotLength1 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_TotLength2;
				when RecvPacket_IP_Payload_IP_ToS =>
					Sreg0 <= RecvPacket_IP_Payload_IP_TotLength1;
				when RecvPacket_IP_Payload_IP_TTL =>
					Sreg0 <= RecvPacket_IP_Payload_IP_Protocol;
				when RecvPacket_IP_Payload_IP_FragmentOffset =>
					Sreg0 <= RecvPacket_IP_Payload_IP_TTL;
				when RecvPacket_IP_Payload_IP_FlagsAndFrag =>
					Sreg0 <= RecvPacket_IP_Payload_IP_FragmentOffset;
				when RecvPacket_IP_Payload_IP_ID2 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_FlagsAndFrag;
				when RecvPacket_IP_Payload_IP_ID1 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_ID2;
				when RecvPacket_IP_Payload_IP_SourceAddr1 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_SourceAddr2;
					udp_src_ip(23 downto 16) <= data;
				when RecvPacket_IP_Payload_IP_Checksum2 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_SourceAddr1;
					udp_src_ip(31 downto 24) <= data;
				when RecvPacket_IP_Payload_IP_Checksum1 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_Checksum2;
				when RecvPacket_IP_Payload_IP_Protocol =>
					Sreg0 <= RecvPacket_IP_Payload_IP_Checksum1;
				when RecvPacket_IP_Payload_IP_SourceAddr3 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_SourceAddr4;
					udp_src_ip(7 downto 0) <= data;
				when RecvPacket_IP_Payload_IP_SourceAddr2 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_SourceAddr3;
					udp_src_ip(15 downto 8) <= data;
				when RecvPacket_IP_Payload_IP_DestAddr2 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_DestAddr3;
					udp_dest_ip(15 downto 8) <= data;
				when RecvPacket_IP_Payload_IP_DestAddr1 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_DestAddr2;
					udp_dest_ip(23 downto 16) <= data;
				when RecvPacket_IP_Payload_IP_SourceAddr4 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_DestAddr1;
					udp_dest_ip(31 downto 24) <= data;
				when RecvPacket_IP_Payload_IP_DestAddr4 =>
					Sreg0 <= RecvPacket_IP_Payload_UDP_SourcePort1;
					udp_src_port(15 downto 8) <= data;
					-- acquire src port to be used as destination port from CAPTAN
				when RecvPacket_IP_Payload_IP_DestAddr3 =>
					Sreg0 <= RecvPacket_IP_Payload_IP_DestAddr4;
					udp_dest_ip(7 downto 0) <= data;
				when RecvPacket_ARP_Payload_HType2 =>
					Sreg0 <= RecvPacket_ARP_Payload_PType1;
				when RecvPacket_ARP_Payload_HType1 =>
					Sreg0 <= RecvPacket_ARP_Payload_HType2;
				when RecvPacket_ARP_Payload_PType1 =>
					Sreg0 <= RecvPacket_ARP_Payload_PType2;
				when RecvPacket_ARP_Payload_PType2 =>
					Sreg0 <= RecvPacket_ARP_Payload_HLen;
				when RecvPacket_ARP_Payload_HLen =>
					Sreg0 <= RecvPacket_ARP_Payload_PLen;
				when RecvPacket_ARP_Payload_PLen =>
					Sreg0 <= RecvPacket_ARP_Payload_Op1;
				when RecvPacket_ARP_Payload_Op1 =>
					Sreg0 <= RecvPacket_ARP_Payload_Op2;
				when RecvPacket_ARP_Payload_SMac1 =>
					Sreg0 <= RecvPacket_ARP_Payload_SMac2;
					arp_req_mac(39 downto 32) <= data;
				when RecvPacket_ARP_Payload_SMac2 =>
					Sreg0 <= RecvPacket_ARP_Payload_SMac3;
					arp_req_mac(31 downto 24) <= data;
				when RecvPacket_ARP_Payload_SMac3 =>
					Sreg0 <= RecvPacket_ARP_Payload_SMac4;
					arp_req_mac(23 downto 16) <= data;
				when RecvPacket_ARP_Payload_SMac4 =>
					Sreg0 <= RecvPacket_ARP_Payload_SMac5;
					arp_req_mac(15 downto 8) <= data;
				when RecvPacket_ARP_Payload_SMac5 =>
					Sreg0 <= RecvPacket_ARP_Payload_SMac6;
					arp_req_mac(7 downto 0) <= data;
				when RecvPacket_ARP_Payload_SMac6 =>
					Sreg0 <= RecvPacket_ARP_Payload_Sip1;
					arp_req_ip(31 downto 24) <= data;
				when RecvPacket_ARP_Payload_Sip1 =>
					Sreg0 <= RecvPacket_ARP_Payload_Sip2;
					arp_req_ip(23 downto 16) <= data;
				when RecvPacket_ARP_Payload_Sip2 =>
					Sreg0 <= RecvPacket_ARP_Payload_Sip3;
					arp_req_ip(15 downto 8) <= data;
				when RecvPacket_ARP_Payload_Sip3 =>
					Sreg0 <= RecvPacket_ARP_Payload_Sip4;
					arp_req_ip(7 downto 0) <= data;
				when RecvPacket_ARP_Payload_Sip4 =>
					Sreg0 <= RecvPacket_ARP_Payload_TMac1;
				when RecvPacket_ARP_Payload_TMac1 =>
					Sreg0 <= RecvPacket_ARP_Payload_TMac2;
				when RecvPacket_ARP_Payload_TMac2 =>
					Sreg0 <= RecvPacket_ARP_Payload_TMac3;
				when RecvPacket_ARP_Payload_TMac3 =>
					Sreg0 <= RecvPacket_ARP_Payload_TMac4;
				when RecvPacket_ARP_Payload_TMac4 =>
					Sreg0 <= RecvPacket_ARP_Payload_TMac5;
				when RecvPacket_ARP_Payload_TMac5 =>
					Sreg0 <= RecvPacket_ARP_Payload_TMac6;
				when RecvPacket_ARP_Payload_TMac6 =>
					Sreg0 <= RecvPacket_ARP_Payload_Tip1;
					arp_search_ip(31 downto 24) <= data;
				when RecvPacket_ARP_Payload_Tip1 =>
					Sreg0 <= RecvPacket_ARP_Payload_Tip2;
					arp_search_ip(23 downto 16) <= data;
				when RecvPacket_ARP_Payload_Tip2 =>
					Sreg0 <= RecvPacket_ARP_Payload_Tip3;
					arp_search_ip(15 downto 8) <= data;
				when RecvPacket_ARP_Payload_Tip3 =>
					Sreg0 <= RecvPacket_ARP_Payload_Tip4;
					arp_search_ip(7 downto 0) <= data;
				when RecvPacket_ARP_Payload_Tip4 =>
					Sreg0 <= RecvPacket_CRC_ARP_S52;
				when RecvPacket_ARP_Payload_Op2 =>
					Sreg0 <= RecvPacket_ARP_Payload_SMac1;
					arp_req_mac(47 downto 40) <= data;
				when RecvPacket_Dest_S22 =>
					Sreg0 <= RecvPacket_Dest_S11;
					dest_mac(39 downto 32) <= data;
				when RecvPacket_Dest_S11 =>
					Sreg0 <= RecvPacket_Dest_S12;
					dest_mac(31 downto 24) <= data;
				when RecvPacket_Dest_S12 =>
					Sreg0 <= RecvPacket_Dest_S13;
					dest_mac(23 downto 16) <= data;
				when RecvPacket_Dest_S13 =>
					Sreg0 <= RecvPacket_Dest_S14;
					dest_mac(15 downto 8) <= data;
				when RecvPacket_Dest_S14 =>
					Sreg0 <= RecvPacket_Dest_S15;
					dest_mac(7 downto 0) <= data;
				when RecvPacket_Dest_S15 =>
					Sreg0 <= RecvPacket_Src_S42;
					src_mac(47 downto 40) <= data;
				when RecvPacket_Src_S42 =>
					Sreg0 <= RecvPacket_Src_S44;
					src_mac(39 downto 32) <= data;
				when RecvPacket_Src_S44 =>
					Sreg0 <= RecvPacket_Src_S43;
					src_mac(31 downto 24) <= data;
				when RecvPacket_Src_S45 =>
					if data = x"08" then	
						Sreg0 <= RecvPacket_Type_S26;
					else
						Sreg0 <= RecvPacket_Type_S48;
					end if;
				when RecvPacket_Src_S46 =>
					Sreg0 <= RecvPacket_Src_S45;
					src_mac(7 downto 0) <= data;
				when RecvPacket_Src_S47 =>
					Sreg0 <= RecvPacket_Src_S46;
					src_mac(15 downto 8) <= data;
				when RecvPacket_Src_S43 =>
					Sreg0 <= RecvPacket_Src_S47;
					src_mac(23 downto 16) <= data;
				when RecvPacket_Type_S29 =>
					if is_arp_sig = '1' then	
						Sreg0 <= RecvPacket_ARP_Payload_HType1;
					elsif is_udp_sig = '1' then	
						Sreg0 <= RecvPacket_IP_Payload_IP_VersionAndHeader;
					else
						Sreg0 <= Idle;
						crc_chk_err <= '1';
						-- this allows crc_chk to output error status
					end if;
				when RecvPacket_Type_S26 =>
					if data = x"06" then	
						Sreg0 <= RecvPacket_Type_S49;
						is_arp_sig <= '1';
					elsif data = x"00" then	
						Sreg0 <= RecvPacket_Type_S29;
						is_udp_sig <= '1';
					end if;
				when RecvPacket_Type_S1 =>
					if is_arp_sig = '1' then	
						Sreg0 <= RecvPacket_ARP_Payload_HType1;
					elsif is_udp_sig = '1' then	
						Sreg0 <= RecvPacket_IP_Payload_IP_VersionAndHeader;
					else
						Sreg0 <= Idle;
						crc_chk_err <= '1';
						-- this allows crc_chk to output error status
					end if;
				when RecvPacket_Type_S48 =>
					Sreg0 <= RecvPacket_Type_S1;
				when RecvPacket_Type_S49 =>
					if is_arp_sig = '1' then	
						Sreg0 <= RecvPacket_ARP_Payload_HType1;
					elsif is_udp_sig = '1' then	
						Sreg0 <= RecvPacket_IP_Payload_IP_VersionAndHeader;
					else
						Sreg0 <= Idle;
						crc_chk_err <= '1';
						-- this allows crc_chk to output error status
					end if;
				when RecvPacket_Preamble_S50 =>
					udp_countdown <= x"0007";
					-- idle during preamble reception
					crc_chk_init <= '0';
					Sreg0 <= RecvPacket_Preamble_S51;
				when RecvPacket_Preamble_S51 =>
					udp_countdown <= udp_countdown - 1;
					if udp_countdown = x"0002" then	
						Sreg0 <= RecvPacket_Preamble_S54;
						crc_chk_en <= '1';
					end if;
				when RecvPacket_Preamble_S54 =>
					Sreg0 <= RecvPacket_Dest_S22;
					dest_mac(47 downto 40) <= data;
				when RecvPacket_CRC_ARP_S52 =>
					udp_countdown <= x"0011";
					Sreg0 <= RecvPacket_CRC_ARP_S53;
				when RecvPacket_CRC_ARP_S53 =>
					udp_countdown <= udp_countdown - 1;
					if udp_countdown = x"0001" then	
						Sreg0 <= RecvPacket_CRC_ARP_crc1;
					end if;
				when RecvPacket_CRC_ARP_crc1 =>
					Sreg0 <= RecvPacket_CRC_ARP_crc2;
				when RecvPacket_CRC_ARP_crc2 =>
					Sreg0 <= RecvPacket_CRC_ARP_crc3;
				when RecvPacket_CRC_ARP_crc3 =>
					Sreg0 <= RecvPacket_CRC_ARP_crc4;
					crc_chk_en <= '0';
				when RecvPacket_CRC_ARP_crc4 =>
					Sreg0 <= Idle;
					crc_chk_err <= '1';
					-- this allows crc_chk to output error status
				when RecvPacket_CRC_IP_S55 =>
					udp_countdown(10 downto 0) <= udp_zeros;
					udp_countdown(15 downto 11) <= '0' & x"0";
					if udp_zeros = ("000" & x"00") then	
						Sreg0 <= RecvPacket_CRC_IP_crc9;
					else
						Sreg0 <= RecvPacket_CRC_IP_S56;
					end if;
				when RecvPacket_CRC_IP_crc6 =>
					Sreg0 <= Idle;
					crc_chk_err <= '1';
					-- this allows crc_chk to output error status
				when RecvPacket_CRC_IP_crc7 =>
					Sreg0 <= RecvPacket_CRC_IP_crc6;
					crc_chk_en <= '0';
				when RecvPacket_CRC_IP_crc8 =>
					Sreg0 <= RecvPacket_CRC_IP_crc7;
				when RecvPacket_CRC_IP_crc9 =>
					Sreg0 <= RecvPacket_CRC_IP_crc8;
				when RecvPacket_CRC_IP_S56 =>
					udp_countdown <= udp_countdown - 1;
					if udp_countdown <= x"0001" then	-- '<' added for size 1 case
						Sreg0 <= RecvPacket_CRC_IP_crc9;
					end if;
--vhdl_cover_off
				when others =>
					null;
--vhdl_cover_on
			end case;
		end if;
	end if;
end process;

end decipherer_arch;
