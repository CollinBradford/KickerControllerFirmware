-------------------------------------------------------------------------------
--
-- Title       : DIG Gigabit Ethernet Controller
-- Design      : ethernet_controller
-- Author      : Ryan Rivera
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--
-- File        : c:\HDL_Designs\dig_gec\ethernet_controller\compile\DIG_GEC.vhd
-- Generated   : Fri Mar 20 15:19:34 2009
-- From        : c:/HDL_Designs/dig_gec/ethernet_controller/src/DIG_GEC.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity DIG_GEC is
  port(
       GMII_RX_CLK : in STD_LOGIC;
       GMII_RX_DV : in STD_LOGIC;
       GMII_RX_ER : in STD_LOGIC;
       reset : in STD_LOGIC;
       test_mode : in STD_LOGIC;
       trigger : in STD_LOGIC;
       GMII_RXD : in std_logic_vector(7 downto 0);
       user_addrs : in STD_LOGIC_VECTOR(7 downto 0);
       user_tx_data_in : in std_logic_vector(7 downto 0);
       user_tx_size_in : in STD_LOGIC_VECTOR(10 downto 0);
       GMII_GTX_CLK : out STD_LOGIC;
       GMII_TX_EN : out STD_LOGIC;
       GMII_TX_ER : out STD_LOGIC;
       busy : out STD_LOGIC;
       crc_chk_en : out STD_LOGIC;
       crc_chk_err : out STD_LOGIC;
       crc_chk_init : out STD_LOGIC;
       crc_gen_en : out std_logic;
       crc_gen_init : out std_logic;
       crc_gen_rd : out std_logic;
       en_tx_data : out std_logic;
       udp_data_valid_out : out std_logic;
       GMII_TXD : out STD_LOGIC_VECTOR(7 downto 0);
       udp_data_count : out STD_LOGIC_VECTOR(10 downto 0);
       user_rx_data_out : out std_logic_vector(7 downto 0)
  );
end DIG_GEC;

architecture DIG_GEC of DIG_GEC is

---- Component declarations -----

component arp_reply
  port (
       addrs : in STD_LOGIC_VECTOR(7 downto 0);
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       tip : in STD_LOGIC_VECTOR(31 downto 0);
       tmac : in STD_LOGIC_VECTOR(47 downto 0);
       trigger : in STD_LOGIC;
       udp_busy : in STD_LOGIC;
       arp_busy : out STD_LOGIC;
       crc_gen_en : out STD_LOGIC;
       crc_gen_init : out STD_LOGIC;
       crc_gen_rd : out STD_LOGIC;
       dataout : out STD_LOGIC_VECTOR(7 downto 0);
       tx_en : out STD_LOGIC;
       tx_er : out STD_LOGIC
  );
end component;
component create_packet
  port (
       addrs : in STD_LOGIC_VECTOR(7 downto 0);
       arp_busy : in STD_LOGIC;
       checksum : in STD_LOGIC_VECTOR(15 downto 0);
       clk : in STD_LOGIC;
       data_length : in STD_LOGIC_VECTOR(10 downto 0);
       dest_ip : in STD_LOGIC_VECTOR(31 downto 0);
       dest_mac : in STD_LOGIC_VECTOR(47 downto 0);
       dest_port : in STD_LOGIC_VECTOR(15 downto 0);
       ping : in STD_LOGIC;
       reset : in STD_LOGIC;
       trigger : in STD_LOGIC;
       busy : out STD_LOGIC;
       crc_gen_en : out STD_LOGIC;
       crc_gen_init : out STD_LOGIC;
       crc_gen_rd : out STD_LOGIC;
       dataout : out STD_LOGIC_VECTOR(7 downto 0);
       en_tx_data : out STD_LOGIC;
       tx_en : out STD_LOGIC;
       tx_er : out STD_LOGIC;
       udp_data_sel : out STD_LOGIC
  );
end component;
component dataout_mux
  port (
       arp_data_out : in STD_LOGIC_VECTOR(7 downto 0);
       arp_tx_en : in STD_LOGIC;
       arp_tx_er : in STD_LOGIC;
       sel_udp : in STD_LOGIC;
       udp_data_out : in STD_LOGIC_VECTOR(7 downto 0);
       udp_tx_en : in STD_LOGIC;
       udp_tx_er : in STD_LOGIC;
       tx_en : out STD_LOGIC;
       tx_er : out STD_LOGIC;
       txd : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component decipherer
  port (
       addrs : in STD_LOGIC_VECTOR(7 downto 0);
       clk : in STD_LOGIC;
       data : in STD_LOGIC_VECTOR(7 downto 0);
       dv : in STD_LOGIC;
       er : in STD_LOGIC;
       reset : in STD_LOGIC;
       arp_req_ip : out STD_LOGIC_VECTOR(31 downto 0);
       arp_req_mac : out STD_LOGIC_VECTOR(47 downto 0);
       arp_search_ip : out STD_LOGIC_VECTOR(31 downto 0);
       capture_source_addrs : out STD_LOGIC;
       crc_chk_en : out STD_LOGIC;
       crc_chk_err : out STD_LOGIC;
       crc_chk_init : out STD_LOGIC;
       dest_mac : out STD_LOGIC_VECTOR(47 downto 0);
       is_arp : out STD_LOGIC;
       is_idle : out STD_LOGIC;
       is_udp : out STD_LOGIC;
       src_mac : out STD_LOGIC_VECTOR(47 downto 0);
       udp_data_count : out STD_LOGIC_VECTOR(10 downto 0);
       udp_data_valid : out STD_LOGIC;
       udp_dest_ip_out : out STD_LOGIC_VECTOR(31 downto 0);
       udp_src_ip : out STD_LOGIC_VECTOR(31 downto 0);
       udp_src_port : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component dest_info_container
  port (
       clk : in STD_LOGIC;
       ip_from_udp : in STD_LOGIC_VECTOR(31 downto 0);
       mac_from_udp : in STD_LOGIC_VECTOR(47 downto 0);
       port_from_udp : in STD_LOGIC_VECTOR(15 downto 0);
       reset : in STD_LOGIC;
       we : in STD_LOGIC;
       dest_ip : out STD_LOGIC_VECTOR(31 downto 0);
       dest_mac : out STD_LOGIC_VECTOR(47 downto 0);
       dest_port : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component filter_data_out
  port (
       enable : in std_logic;
       rx_data : in std_logic_vector(7 downto 0);
       out_data : out std_logic_vector(7 downto 0)
  );
end component;
component ip_checksum_calc
  port (
       addrs : in std_logic_vector(7 downto 0);
       clk : in std_logic;
       length : in std_logic_vector(10 downto 0);
       reset : in std_logic;
       trigger : in std_logic;
       cs : out std_logic_vector(15 downto 0)
  );
end component;
component or33
  port (
       a1 : in std_logic;
       a2 : in std_logic;
       b1 : in std_logic;
       b2 : in std_logic;
       c1 : in std_logic;
       c2 : in std_logic;
       ao : out std_logic;
       bo : out std_logic;
       co : out std_logic
  );
end component;
component udp_data_splicer
  port (
       clk : in std_logic;
       gen_data : in std_logic_vector(7 downto 0);
       sel_user : in std_logic;
       user_data : in std_logic_vector(7 downto 0);
       udp_data_out : out std_logic_vector(7 downto 0)
  );
end component;
component user_addrs_mux
  port (
       ping_mode : in STD_LOGIC;
       test_mode : in STD_LOGIC;
       user_addrs : in STD_LOGIC_VECTOR(7 downto 0);
       user_length : in STD_LOGIC_VECTOR(10 downto 0);
       addrs_out : out STD_LOGIC_VECTOR(7 downto 0);
       udp_tx_length : out STD_LOGIC_VECTOR(10 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal arp_busy : STD_LOGIC;
signal arp_crc_gen_en_sig : STD_LOGIC;
signal arp_crc_gen_init_sig : STD_LOGIC;
signal arp_crc_gen_rd_sig : STD_LOGIC;
signal arp_tx_en : STD_LOGIC;
signal arp_tx_er : STD_LOGIC;
signal busy_sig : STD_LOGIC;
signal capture_addrs : STD_LOGIC;
signal clk : STD_LOGIC;
signal crc_chk_en_sig : STD_LOGIC;
signal crc_chk_err_sig : STD_LOGIC;
signal crc_chk_init_sig : STD_LOGIC;
signal crc_gen_en_sig : std_logic;
signal crc_gen_init_sig : std_logic;
signal crc_gen_rd_sig : std_logic;
signal dec_chk_err_sig : STD_LOGIC;
signal en_tx_data_sig : STD_LOGIC;
signal is_arp_packet_sig : STD_LOGIC;
signal is_idle : STD_LOGIC;
signal is_udp_packet_sig : STD_LOGIC;
signal sel_udp : STD_LOGIC;
signal trigger_sig : STD_LOGIC;
signal tx_en : STD_LOGIC;
signal tx_er : STD_LOGIC;
signal udp_crc_gen_en_sig : std_logic;
signal udp_crc_gen_init_sig : std_logic;
signal udp_crc_gen_rd_sig : std_logic;
signal udp_datasplicer_sel : std_logic;
signal udp_data_valid : std_logic;
signal udp_tx_en : STD_LOGIC;
signal udp_tx_er : STD_LOGIC;
signal addrs_sig : STD_LOGIC_VECTOR (7 downto 0);
signal arp_data_out : STD_LOGIC_VECTOR (7 downto 0);
signal arp_req_ip : STD_LOGIC_VECTOR (31 downto 0);
signal arp_req_mac : STD_LOGIC_VECTOR (47 downto 0);
signal arp_search_ip : STD_LOGIC_VECTOR (31 downto 0);
signal checksum : STD_LOGIC_VECTOR (15 downto 0);
signal data_out : STD_LOGIC_VECTOR (7 downto 0);
signal dest_ip : STD_LOGIC_VECTOR (31 downto 0);
signal dest_mac : STD_LOGIC_VECTOR (47 downto 0);
signal dest_port : STD_LOGIC_VECTOR (15 downto 0);
signal frame_dest_mac : STD_LOGIC_VECTOR (47 downto 0);
signal frame_src_mac : STD_LOGIC_VECTOR (47 downto 0);
signal udp_data_count_sig : STD_LOGIC_VECTOR (10 downto 0);
signal udp_data_out : STD_LOGIC_VECTOR (7 downto 0);
signal udp_dest_ip : STD_LOGIC_VECTOR (31 downto 0);
signal udp_gen_data : STD_LOGIC_VECTOR (7 downto 0);
signal udp_src_ip : STD_LOGIC_VECTOR (31 downto 0);
signal udp_src_port : STD_LOGIC_VECTOR (15 downto 0);
signal udp_tx_length : STD_LOGIC_VECTOR (10 downto 0);

begin

----  Component instantiations  ----

ArpReplyBlock : arp_reply
  port map(
       addrs => addrs_sig,
       arp_busy => arp_busy,
       clk => clk,
       crc_gen_en => arp_crc_gen_en_sig,
       crc_gen_init => arp_crc_gen_init_sig,
       crc_gen_rd => arp_crc_gen_rd_sig,
       dataout => arp_data_out,
       reset => reset,
       tip => arp_req_ip,
       tmac => arp_req_mac,
       trigger => is_arp_packet_sig,
       tx_en => arp_tx_en,
       tx_er => arp_tx_er,
       udp_busy => sel_udp
  );

CRC_OR : or33
  port map(
       a1 => arp_crc_gen_en_sig,
       a2 => udp_crc_gen_en_sig,
       ao => crc_gen_en_sig,
       b1 => arp_crc_gen_init_sig,
       b2 => udp_crc_gen_init_sig,
       bo => crc_gen_init_sig,
       c1 => arp_crc_gen_rd_sig,
       c2 => udp_crc_gen_rd_sig,
       co => crc_gen_rd_sig
  );

ChecksumCalcBlock : ip_checksum_calc
  port map(
       addrs => addrs_sig,
       clk => clk,
       cs => checksum,
       length => udp_tx_length,
       reset => reset,
       trigger => trigger_sig
  );

CreatePacketBlock : create_packet
  port map(
       addrs => addrs_sig,
       arp_busy => arp_busy,
       busy => busy_sig,
       checksum => checksum,
       clk => clk,
       crc_gen_en => udp_crc_gen_en_sig,
       crc_gen_init => udp_crc_gen_init_sig,
       crc_gen_rd => udp_crc_gen_rd_sig,
       data_length => udp_tx_length,
       dataout => udp_gen_data,
       dest_ip => dest_ip,
       dest_mac => dest_mac,
       dest_port => dest_port,
       en_tx_data => en_tx_data_sig,
       ping => capture_addrs,
       reset => reset,
       trigger => trigger_sig,
       tx_en => udp_tx_en,
       tx_er => udp_tx_er,
       udp_data_sel => sel_udp
  );

DataoutMux : dataout_mux
  port map(
       arp_data_out => arp_data_out,
       arp_tx_en => arp_tx_en,
       arp_tx_er => arp_tx_er,
       sel_udp => sel_udp,
       tx_en => tx_en,
       tx_er => tx_er,
       txd => data_out,
       udp_data_out => udp_data_out,
       udp_tx_en => udp_tx_en,
       udp_tx_er => udp_tx_er
  );

DecipherBlock : decipherer
  port map(
       addrs => addrs_sig,
       arp_req_ip => arp_req_ip,
       arp_req_mac => arp_req_mac,
       arp_search_ip => arp_search_ip,
       capture_source_addrs => capture_addrs,
       clk => clk,
       crc_chk_en => crc_chk_en_sig,
       crc_chk_err => dec_chk_err_sig,
       crc_chk_init => crc_chk_init_sig,
       data => GMII_RXD,
       dest_mac => frame_dest_mac,
       dv => GMII_RX_DV,
       er => GMII_RX_ER,
       is_arp => is_arp_packet_sig,
       is_idle => is_idle,
       is_udp => is_udp_packet_sig,
       reset => reset,
       src_mac => frame_src_mac,
       udp_data_count => udp_data_count_sig,
       udp_data_valid => udp_data_valid,
       udp_dest_ip_out => udp_dest_ip,
       udp_src_ip => udp_src_ip,
       udp_src_port => udp_src_port
  );

DestInfoContainer : dest_info_container
  port map(
       clk => clk,
       dest_ip => dest_ip,
       dest_mac => dest_mac,
       dest_port => dest_port,
       ip_from_udp => udp_src_ip,
       mac_from_udp => frame_src_mac,
       port_from_udp => udp_src_port,
       reset => reset,
       we => capture_addrs
  );

FilterDataOutBlock : filter_data_out
  port map(
       enable => udp_data_valid,
       out_data => user_rx_data_out,
       rx_data => GMII_RXD
  );

udp_datasplicer_sel <= not(test_mode) and en_tx_data_sig;

crc_chk_err_sig <= is_udp_packet_sig and dec_chk_err_sig;

trigger_sig <= capture_addrs or trigger;

UDPDataSplicer : udp_data_splicer
  port map(
       clk => clk,
       gen_data => udp_gen_data,
       sel_user => udp_datasplicer_sel,
       udp_data_out => udp_data_out,
       user_data => user_tx_data_in
  );

UserAddrsBlock : user_addrs_mux
  port map(
       addrs_out => addrs_sig,
       ping_mode => capture_addrs,
       test_mode => test_mode,
       udp_tx_length => udp_tx_length,
       user_addrs => user_addrs,
       user_length => user_tx_size_in
  );


---- Terminal assignment ----

    -- Inputs terminals
	clk <= GMII_RX_CLK;

    -- Output\buffer terminals
	GMII_GTX_CLK <= clk;
	GMII_TXD <= data_out;
	GMII_TX_EN <= tx_en;
	GMII_TX_ER <= tx_er;
	busy <= busy_sig;
	crc_chk_en <= crc_chk_en_sig;
	crc_chk_err <= crc_chk_err_sig;
	crc_chk_init <= crc_chk_init_sig;
	crc_gen_en <= crc_gen_en_sig;
	crc_gen_init <= crc_gen_init_sig;
	crc_gen_rd <= crc_gen_rd_sig;
	en_tx_data <= udp_datasplicer_sel;
	udp_data_count <= udp_data_count_sig;
	udp_data_valid_out <= udp_data_valid;


end DIG_GEC;
