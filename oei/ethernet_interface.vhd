-------------------------------------------------------------------------------
--
-- Title       : ethernet_interface
-- Design      : ethernet_controller
-- Author      : rrivera at fnal dot gov
-- Company     : Fermi National Accelerator Laboratory
--
-------------------------------------------------------------------------------
--
-- Modified   : Thu Nov 12 10:33:07 2015	  
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --

library ieee;								  
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;	  
	  		
use work.params_package.all;

entity ethernet_interface is
   port ( 								
   		  reset_in             	: in    std_logic; 		-- optional for user to reset, this block will self reset on startup					
          reset_out            	: out   std_logic;  		-- ethernet reset can be used for "reset on start-up" or for reset to PHY  
		  		
		  -- rx/tx signals
          rx_addr              	: out   std_logic_vector (31 downto 0); 
          rx_data              	: out   std_logic_vector (63 downto 0);   	
          rx_wren              	: out   std_logic;												   
          tx_data              	: in    std_logic_vector (63 downto 0); 	 					 
--erased for simple interface 
--erased for simple interface 
		  
		  -- burst signals
			b_force_packet          : in    std_logic;
   		  b_data               	: in    std_logic_vector (63 downto 0); 
          b_data_we            	: in    std_logic; 												                            
          b_enable             	: out   std_logic; 				  		  															 				   
--erased for simple interface   
		  
		  
		  -- internal address space signals							   
--erased for simple interface   
--erased for simple interface   
--erased for simple interface					   
--erased for simple interface					   
--erased for simple interface  
		   
--erased for simple interface  
		  
		  user_addr  			: in    std_logic_vector (7 downto 0);
		  
		  -- PHY interface signals
		  MASTER_CLK           	: in    std_logic; 	
			slow_clk : in std_logic;
		  
          PHY_RXD             	: in    std_logic_vector (7 downto 0); 
          PHY_RX_DV           	: in    std_logic; 
          PHY_RX_ER           	: in    std_logic; 				 	   
		  
          TX_CLK              	: out   std_logic; 
          PHY_TXD              	: out   std_logic_vector (7 downto 0); 
          PHY_TX_EN            	: out   std_logic; 
          PHY_TX_ER            	: out   std_logic
		  );
end ethernet_interface;



architecture BEHAVIORAL of ethernet_interface is	   
											 
	signal b_end_packet           	: std_logic;  
	signal b_masked_we           	: std_logic;  
	signal b_enable_sig           	: std_logic;
	signal four_bit_mode          	: std_logic;
	signal user_busy          		: std_logic;
	signal user_crc_err       		: std_logic;
	signal user_rx_data_out   		: std_logic_vector (7 downto 0);
	signal user_rx_size_out   		: std_logic_vector (10 downto 0);
	signal user_rx_valid_out  		: std_logic;
	signal user_tx_trigger       	: std_logic;
	signal user_tx_data_in    		: std_logic_vector (7 downto 0);
	signal user_tx_enable_out 		: std_logic;
	signal user_tx_size_in    		: std_logic_vector (10 downto 0);
	signal reset         	     	: std_logic;		
	                             				  		   
	signal user_rx_src_capture_for_ctrl 		: std_logic; 	-- take sender address, latch src when capture is '1' for dest														 
	signal user_rx_src_capture_for_data 		: std_logic; 	-- take sender address, latch src when capture is '1' for dest														 
		
	signal user_rx_src_addr   		: std_logic_vector (31 downto 0); 	
	signal user_rx_src_mac     		: std_logic_vector (47 downto 0); 
	signal user_rx_src_port    		: std_logic_vector (15 downto 0);  
	signal user_tx_dest_addr   		: std_logic_vector (31 downto 0); 	
	signal user_tx_dest_mac     	: std_logic_vector (47 downto 0); 
	signal user_tx_dest_port    	: std_logic_vector (15 downto 0); 		 
	
	signal user_tx_rden			   	: std_logic;						
	signal user_ready		   		: std_logic; 						
	signal user_b_force_packet	   	: std_logic;  						
	signal crc_chk_out	   			: std_logic;		
	
																		  
	signal ots_addr              	: std_logic_vector (63 downto 0);   
	signal ots_block_sel           	: unsigned (31 downto 0); 	 
	signal ots_block_addr         	: unsigned (31 downto 0); 	  
    signal ots_wren              	: std_logic;												   
    signal ots_din, ots_dout       	: std_logic_vector (63 downto 0); 	 					 
	signal ots_rden			   		: std_logic;						  	
	signal ots_ready	   			: std_logic; 						  	
	signal ots_user_mask  			: std_logic := '0'; 							   
    signal internal_eth_dout      	: std_logic_vector (63 downto 0); 	 				  	
	signal internal_reset  			: std_logic := '0'; 	   							  	
	signal reset_mgr_in  			: std_logic; 	   
	
	signal arp_announce				: std_logic := '0';  	
	signal burst_mode				: std_logic := '0';
	signal self_addr				: std_logic_vector(23 downto 0) := x"C0A885";	 --192.168.133.X;x"C0A81E";	 --192.168.30.X; 
	signal self_mac 				: std_logic_vector(39 downto 0) := x"008055EC00";                
	signal self_port				: std_logic_vector(15 downto 0) := ETH_CONTROLLER_DEFAULT_PORT;							                
	signal user_addr_byte			: std_logic_vector(7 downto 0)  := ETH_CONTROLLER_DEFAULT_ADDR;	
	signal user_addr_sig			: std_logic_vector(7 downto 0)  := ETH_CONTROLLER_DEFAULT_ADDR;	
	signal tx_data_dest_addr 		: std_logic_vector(31 downto 0);
	signal tx_data_dest_mac 		: std_logic_vector(47 downto 0);
	signal tx_data_dest_port 		: std_logic_vector(15 downto 0);
	signal tx_ctrl_dest_addr 		: std_logic_vector(31 downto 0);
	signal tx_ctrl_dest_mac 		: std_logic_vector(47 downto 0);
	signal tx_ctrl_dest_port 		: std_logic_vector(15 downto 0);	  
									 
	-------- start simple declaration section -----------  	  
	-- comments denoted as  will be removed in this case by install script
--erased for simple interface  will be commented out	
     signal internal_block_sel  		: std_logic_vector (31 downto 0) := (others => '0'); 	  
     signal internal_addr  				: std_logic_vector (31 downto 0):= (others => '0');  	  
	 signal internal_we					: std_logic := '0';							
     signal internal_din				: std_logic_vector (63 downto 0):= (others => '0'); 	  
     signal internal_dout				: std_logic_vector (63 downto 0):= (others => '0'); 	
		  
     --signal user_addr					: std_logic_vector (7 downto 0):= (others => '0'); 
	-------- end simple declaration section -----------	
  	 											  								     
begin										 
	
   ec_wrapper : entity work.ethernet_controller_wrapper
      port map (
	  			GMII_RXD(7 downto 0)=>PHY_RXD(7 downto 0),
                GMII_RX_CLK=>MASTER_CLK,	
                GMII_RX_DV=>PHY_RX_DV,
                GMII_RX_ER=>PHY_RX_ER,		
                GMII_TXD(7 downto 0)=>PHY_TXD(7 downto 0),
                GMII_TX_EN=>PHY_TX_EN,
                GMII_TX_ER=>PHY_TX_ER,
                GTX_CLK=>TX_CLK,
				
                reset=>reset,	
										   	   
                self_addr(31 downto 8)=>self_addr,
				self_addr(7 downto 0)=>user_addr_sig,
                self_mac(47 downto 8)=>self_mac,	  				  
                self_mac(7 downto 0)=>user_addr_sig,	  
                self_port=>self_port,	  
				arp_announce=>arp_announce,								
				
                user_tx_dest_addr(31 downto 0)=>user_tx_dest_addr(31 downto 0),
                user_tx_dest_mac(47 downto 0)=>user_tx_dest_mac(47 downto 0),
                user_tx_dest_port(15 downto 0)=>user_tx_dest_port(15 downto 0),					
															  
                user_rx_src_capture_for_ctrl=>user_rx_src_capture_for_ctrl,	 
                user_rx_src_capture_for_data=>user_rx_src_capture_for_data,
                user_rx_src_addr(31 downto 0)=>user_rx_src_addr(31 downto 0),  
                user_rx_src_mac(47 downto 0)=>user_rx_src_mac(47 downto 0),
                user_rx_src_port(15 downto 0)=>user_rx_src_port(15 downto 0),	
																				 
                user_tx_trigger=>user_tx_trigger,
                user_tx_data_in(7 downto 0)=>user_tx_data_in(7 downto 0),
                user_tx_size_in(10 downto 0)=>user_tx_size_in(10 downto 0),
                crc_err=>user_crc_err,	
				crc_chk_out=>crc_chk_out,
                four_bit_mode_out=>four_bit_mode,		 
                udp_fwd_port=>open,	 -- could use this to reject packets that are not 2001, e.g. (or to choose between data manager and something else)
                user_busy=>user_busy,
                user_rx_data_out(7 downto 0)=>user_rx_data_out(7 downto 0),
                user_rx_size_out(10 downto 0)=>user_rx_size_out(10 downto 0),
                user_rx_valid_out=>user_rx_valid_out,				
                user_tx_enable_out=>user_tx_enable_out);
   
   data_manager_blk : entity work.data_manager
      port map (b_data(63 downto 0)=>b_data(63 downto 0),
                b_data_we=>b_data_we,
                b_end_packet=>b_end_packet,	   
				b_mode=>burst_mode,
                four_bit_mode=>four_bit_mode,
                user_busy=>user_busy,
                user_crc_err=>user_crc_err,	
				user_crc_chk=>crc_chk_out,
                
				user_rx_data_out(7 downto 0)=>user_rx_data_out(7 downto 0),	  
                user_rx_valid_out=>user_rx_valid_out,	   
				user_rx_src_addr=>user_rx_src_addr,  
                user_rx_src_mac=>user_rx_src_mac,
                user_rx_src_port=>user_rx_src_port,	
				
				tx_ctrl_dest_addr=>tx_ctrl_dest_addr,  
                tx_ctrl_dest_mac=>tx_ctrl_dest_mac,
                tx_ctrl_dest_port=>tx_ctrl_dest_port,		  
				tx_data_dest_addr=>tx_data_dest_addr,  
                tx_data_dest_mac=>tx_data_dest_mac,
                tx_data_dest_port=>tx_data_dest_port,	  
				user_tx_dest_addr=>user_tx_dest_addr,  
                user_tx_dest_mac=>user_tx_dest_mac,
                user_tx_dest_port=>user_tx_dest_port,							
														   
                MASTER_CLK=>MASTER_CLK,
                reset=>reset,		  
                tx_data(63 downto 0)=>ots_dout(63 downto 0),
                b_enable=>b_enable_sig,			 					
				
                user_tx_trigger=>user_tx_trigger,		 
                user_tx_enable_out=>user_tx_enable_out,
                user_tx_data_in(7 downto 0)=>user_tx_data_in(7 downto 0),
                user_tx_size_in(10 downto 0)=>user_tx_size_in(10 downto 0),		 
				
                ram_addr(63 downto 0)=>ots_addr,
                ram_rden=>ots_rden,							
                ram_wren=>ots_wren,								   
				user_ready=>ots_ready,
                rx_data(63 downto 0)=>ots_din(63 downto 0));
				
				
	b_masked_we <= b_data_we and b_enable_sig;
	b_enable <= b_enable_sig;
	
   burst_traffic_controller_blk : entity work.burst_traffic_controller
      port map (BURST_WE=>b_masked_we,
	  			MASTER_CLK=>MASTER_CLK,		
	  			BURST_FORCE_PACKET=>user_b_force_packet,
                RESET=>reset,
                BURST_END_PACKET=>b_end_packet);
				
				
	-------- start reset section -----------
	-- handle self reset for Eth Interface and input and output reset
	reset_mgr : entity work.reset_mgr
		port map (
			slow_clk => slow_clk,
			reset_start => reset_mgr_in,
			reset => reset);
						  		 
	reset_out <= reset;
   	-------- end reset section -----------	  
	   
	   
	-------- start internal address space section -----------	
	-- Assume works like a dual port RAM and is always "ready"
		-- one port on user firmware
		-- one port on ethernet interface
	--
	--
	
	ots_block_sel <= unsigned(ots_addr(63 downto 32)); 
	ots_block_addr <= unsigned(ots_addr(31 downto 0));	 
	rx_addr <= std_logic_vector(ots_block_addr);
	rx_data <= ots_din;
	
	-- NOTE: User code is treated as "block 0"
	ots_user_mask <= '1' when ( ots_block_sel = 0) else '0';  		
	rx_wren <= ots_user_mask and ots_wren;		   
	user_tx_rden <= ots_user_mask and ots_rden;	
	
	ots_dout <= tx_data when (ots_user_mask = '1') else internal_eth_dout;
	ots_ready <= (not ots_user_mask) or user_ready; -- ots address space is always ready	  
	
	reset_mgr_in <= internal_reset or reset_in;
																								  
	
	process(MASTER_CLK)
	begin
		if (rising_edge(MASTER_CLK)) then 		
			
			if(unsigned(user_addr) = 0) then --take internally if user_addr is 0	 
				user_addr_sig <= user_addr_byte;
			else
				user_addr_sig <= user_addr;		 
			end if;				
			
			internal_eth_dout <= (others => '0');
			internal_dout <= (others => '0');
			internal_reset <= '0';
			arp_announce <= '0';
		
			if ( ots_wren = '1' and  				-- WRITE eth ===========
				 ots_block_sel = x"1") then -- Ethernet block address space
				if ( ots_block_addr = x"0" ) then 
					 self_addr <= ots_din(23 downto 0); 
					 arp_announce <= '1';
				elsif ( ots_block_addr = x"1" ) then 
					 user_addr_byte <= ots_din(7 downto 0); 
					 arp_announce <= '1';
				elsif ( ots_block_addr = x"2" ) then 
					 self_mac <= ots_din(39 downto 0); 
					 arp_announce <= '1';
				elsif ( ots_block_addr = x"3" ) then 
					 tx_ctrl_dest_addr <= ots_din(31 downto 0); 
				elsif ( ots_block_addr = x"4" ) then 
					 tx_ctrl_dest_mac <= ots_din(47 downto 0); 
				elsif ( ots_block_addr = x"5" ) then 
					 tx_ctrl_dest_port <= ots_din(15 downto 0); 
				elsif ( ots_block_addr = x"6" ) then 
					 tx_data_dest_addr <= ots_din(31 downto 0); 
				elsif ( ots_block_addr = x"7" ) then 
					 tx_data_dest_mac <= ots_din(47 downto 0); 
				elsif ( ots_block_addr = x"8" ) then 
					 tx_data_dest_port <= ots_din(15 downto 0); 
				elsif ( ots_block_addr = x"9" ) then 
					 burst_mode <= ots_din(0); 
				elsif ( ots_block_addr = x"FFFFFFFF" ) then 
					 internal_reset <= ots_din(0); 
				end if;
			elsif ( internal_we = '1' and  				-- WRITE internal ===========
				 unsigned(internal_block_sel) = x"1") then -- Ethernet block address space
				if ( unsigned(internal_addr) = x"0" ) then 
					 self_addr <= internal_din(23 downto 0); 
					 arp_announce <= '1';
				elsif ( unsigned(internal_addr) = x"1" ) then 
					 user_addr_byte <= internal_din(7 downto 0); 
					 arp_announce <= '1';
				elsif ( unsigned(internal_addr) = x"2" ) then 
					 self_mac <= internal_din(39 downto 0); 
					 arp_announce <= '1';
				elsif ( unsigned(internal_addr) = x"3" ) then 
					 tx_ctrl_dest_addr <= internal_din(31 downto 0); 
				elsif ( unsigned(internal_addr) = x"4" ) then 
					 tx_ctrl_dest_mac <= internal_din(47 downto 0); 
				elsif ( unsigned(internal_addr) = x"5" ) then 
					 tx_ctrl_dest_port <= internal_din(15 downto 0); 
				elsif ( unsigned(internal_addr) = x"6" ) then 
					 tx_data_dest_addr <= internal_din(31 downto 0); 
				elsif ( unsigned(internal_addr) = x"7" ) then 
					 tx_data_dest_mac <= internal_din(47 downto 0); 
				elsif ( unsigned(internal_addr) = x"8" ) then 
					 tx_data_dest_port <= internal_din(15 downto 0); 
				elsif ( unsigned(internal_addr) = x"9" ) then 
					 burst_mode <= internal_din(0); 
				elsif ( unsigned(internal_addr) = x"FFFFFFFF" ) then 
					 internal_reset <= internal_din(0); 
				end if;
			elsif ( user_rx_src_capture_for_ctrl = '1' ) then  				-- SPECIAL WRITE for source capture for ctrl ===========
				 tx_ctrl_dest_addr <= user_rx_src_addr;
				 tx_ctrl_dest_mac <= user_rx_src_mac;
				 tx_ctrl_dest_port <= user_rx_src_port;
			elsif ( user_rx_src_capture_for_data = '1' ) then  				-- SPECIAL WRITE for source capture for data ===========
				 tx_data_dest_addr <= user_rx_src_addr;
				 tx_data_dest_mac <= user_rx_src_mac;
				 tx_data_dest_port <= user_rx_src_port;
			end if;
		
			if ( ots_rden = '1' and  				-- READ eth ===========
				 ots_block_sel = x"1") then -- Ethernet block address space
				if ( ots_block_addr = x"0" ) then 
					 internal_eth_dout(23 downto 0) <= self_addr; 
				elsif ( ots_block_addr = x"1" ) then 
					 internal_eth_dout(7 downto 0) <= user_addr_byte; 
				elsif ( ots_block_addr = x"2" ) then 
					 internal_eth_dout(39 downto 0) <= self_mac; 
				elsif ( ots_block_addr = x"3" ) then 
					 internal_eth_dout(31 downto 0) <= tx_ctrl_dest_addr; 
				elsif ( ots_block_addr = x"4" ) then 
					 internal_eth_dout(47 downto 0) <= tx_ctrl_dest_mac; 
				elsif ( ots_block_addr = x"5" ) then 
					 internal_eth_dout(15 downto 0) <= tx_ctrl_dest_port; 
				elsif ( ots_block_addr = x"6" ) then 
					 internal_eth_dout(31 downto 0) <= tx_data_dest_addr; 
				elsif ( ots_block_addr = x"7" ) then 
					 internal_eth_dout(47 downto 0) <= tx_data_dest_mac; 
				elsif ( ots_block_addr = x"8" ) then 
					 internal_eth_dout(15 downto 0) <= tx_data_dest_port; 
				elsif ( ots_block_addr = x"9" ) then 
					 internal_eth_dout(0) <= burst_mode; 
				elsif ( ots_block_addr = x"64" ) then 
					 internal_eth_dout(15 downto 0) <= ETH_INTERFACE_VERSION; 
				end if;
			end if;
		
			if ( 				-- always READ internal ===========
				 unsigned(internal_block_sel) = x"1") then -- Ethernet block address space
				if ( unsigned(internal_addr) = x"0" ) then 
					 internal_dout(23 downto 0) <= self_addr; 
				elsif ( unsigned(internal_addr) = x"1" ) then 
					 internal_dout(7 downto 0) <= user_addr_byte; 
				elsif ( unsigned(internal_addr) = x"2" ) then 
					 internal_dout(39 downto 0) <= self_mac; 
				elsif ( unsigned(internal_addr) = x"3" ) then 
					 internal_dout(31 downto 0) <= tx_ctrl_dest_addr; 
				elsif ( unsigned(internal_addr) = x"4" ) then 
					 internal_dout(47 downto 0) <= tx_ctrl_dest_mac; 
				elsif ( unsigned(internal_addr) = x"5" ) then 
					 internal_dout(15 downto 0) <= tx_ctrl_dest_port; 
				elsif ( unsigned(internal_addr) = x"6" ) then 
					 internal_dout(31 downto 0) <= tx_data_dest_addr; 
				elsif ( unsigned(internal_addr) = x"7" ) then 
					 internal_dout(47 downto 0) <= tx_data_dest_mac; 
				elsif ( unsigned(internal_addr) = x"8" ) then 
					 internal_dout(15 downto 0) <= tx_data_dest_port; 
				elsif ( unsigned(internal_addr) = x"9" ) then 
					 internal_dout(0) <= burst_mode; 
				elsif ( unsigned(internal_addr) = x"64" ) then 
					 internal_dout(15 downto 0) <= ETH_INTERFACE_VERSION; 
				end if;
			end if;



			
		end if;
	end process;
		
				
		  
	-------- end internal address space section -----------
	   
	   																  
--erased for simple interface 	
--erased for simple interface
--erased for simple interface
	
	-------- start simple section -----------  
	-- comments denoted as  will be removed in this case by install script
--erased for simple interface  will be commented out	
									   
	 user_ready <= '1';
	 user_b_force_packet <= b_force_packet;	  
		
	-------- end simple section -----------
	   
end BEHAVIORAL;

