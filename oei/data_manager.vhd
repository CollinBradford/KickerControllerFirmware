--erased - 		  
--erased   
--erased   Comments by rrivera at fnal dot gov : Aug 25, 2015 
--erased   
--erased   IMPORTANT!! IMPORTANT!! 				
--erased   It's very important to note!!!   	
--erased   										
--erased   The script that moves these files into a Firmware project will 		   
--erased    remove all "" comments.. 												
--erased   The only way (I think) to safely comment is to put "SCRIPT  COMMENT  OUT"  in your comment line with single spacing

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;		

entity data_manager is
   port ( b_data                 	: in    std_logic_vector (63 downto 0); 
          b_data_we              	: in    std_logic; 
          b_end_packet           	: in    std_logic; 
		  b_mode					: in    std_logic; 
          four_bit_mode          	: in    std_logic; 
          user_busy          		: in    std_logic; 
          user_crc_err       		: in    std_logic; 	  
		  user_crc_chk				: in    std_logic;		
		  
          user_rx_data_out   		: in    std_logic_vector (7 downto 0); 	 
          user_rx_valid_out  		: in    std_logic; 			   	
		  user_rx_src_addr   		: in	std_logic_vector (31 downto 0); 	
		  user_rx_src_mac     		: in	std_logic_vector (47 downto 0); 
		  user_rx_src_port    		: in	std_logic_vector (15 downto 0); 	
		  
		  tx_ctrl_dest_addr   		: in	std_logic_vector (31 downto 0); 	
		  tx_ctrl_dest_mac     		: in	std_logic_vector (47 downto 0); 
		  tx_ctrl_dest_port    		: in	std_logic_vector (15 downto 0); 
		  tx_data_dest_addr   		: in	std_logic_vector (31 downto 0); 	
		  tx_data_dest_mac     		: in	std_logic_vector (47 downto 0); 
		  tx_data_dest_port    		: in	std_logic_vector (15 downto 0); 
		  user_tx_dest_addr   		: out	std_logic_vector (31 downto 0); 	
		  user_tx_dest_mac     		: out	std_logic_vector (47 downto 0); 
		  user_tx_dest_port    		: out	std_logic_vector (15 downto 0);  		   		 
		
          user_tx_enable_out 		: in    std_logic; 	 
		  user_ready	 			: in    std_logic;
          MASTER_CLK             	: in    std_logic; 
          reset                  	: in    std_logic;  
          tx_data                	: in    std_logic_vector (63 downto 0); 
          b_enable               	: out   std_logic; 			
          user_tx_trigger       	: out   std_logic; 
          user_tx_data_in    		: out   std_logic_vector (7 downto 0); 
          user_tx_size_in    		: out   std_logic_vector (10 downto 0); 
          ram_addr               	: out   std_logic_vector (63 downto 0);   
          ram_rden               	: out   std_logic; 
          ram_wren               	: out   std_logic; 
          rx_data                	: out   std_logic_vector (63 downto 0));
end data_manager;

architecture BEHAVIORAL of data_manager is	  
															   
   signal clear_delay_count                    	: std_logic;
   signal crc_err_flag, clear_crc_err_flag     	: std_logic;
   signal data_fifo_full                       	: std_logic;	 
   signal rx_data_fifo_wren                    	: std_logic;
   signal rx_data_fifo_wr_data                 	: std_logic_vector (63 downto 0);
   signal delay_count                          	: std_logic;
   signal rx_info_fifo_wren                    	: std_logic;                                   
   signal rx_info_fifo_wr_data                 	: std_logic_vector (15 downto 0);
   signal rx_data_fifo_empty                   	: std_logic;
   signal rx_data_fifo_read_enable             	: std_logic;
   signal rx_fifo_reset                        	: std_logic;
   signal rx_fifo_reset_sig                    	: std_logic;
   signal rx_info_fifo_empty                   	: std_logic;	 
   signal rx_info_fifo_full	                   	: std_logic;	
   signal rx_data_fifo_full	                   	: std_logic;	   
   signal rx_info_fifo_rden                    	: std_logic;
   signal start_delay_count                    	: std_logic;	      
   signal tx_data_fifo_din                     	: std_logic_vector (63 downto 0);
   signal tx_data_fifo_empty                   	: std_logic;
   signal tx_data_fifo_full                    	: std_logic;
   signal tx_data_fifo_rden                    	: std_logic;
   signal tx_data_fifo_read_enable             	: std_logic;	   
   signal tx_data_fifo_wr_en                   	: std_logic;		  
   signal tx_info_fifo_rden                    	: std_logic;	
   signal rx_data_sig                          	: std_logic_vector (63 downto 0);	  	
   																					 														  
   signal tx_data_reg			               	: std_logic_vector (63 downto 0); 
   signal rx_data_fifo_rd_data	               	: std_logic_vector (63 downto 0); 	   
                                               	
   																				 
   signal rx_src_addr_fifo_dout	               	: std_logic_vector (47 downto 0); 	
   signal rx_src_mac_fifo_dout	               	: std_logic_vector (47 downto 0); 	
   signal tx_ctrl_addr_fifo_dout	        	: std_logic_vector (31 downto 0); 
   signal tx_ctrl_port_fifo_dout	        	: std_logic_vector (15 downto 0); 	
   signal tx_ctrl_mac_fifo_dout	        		: std_logic_vector (47 downto 0); 
      
 
   signal tx_ctrl_fifo_empty                   	: std_logic;
   signal tx_ctrl_fifo_full                    	: std_logic;
   signal tx_ctrl_fifo_rden                    	: std_logic;
   signal tx_ctrl_fifo_read_enable             	: std_logic;	 
 				  												   
   signal tx_ctrl_fifo_wr_en              	   	: std_logic;	 
   signal tx_ctrl_fifo_reset_sig			   	: std_logic;   
   signal comm_dec_tx_fifo_reset				: std_logic;   
   signal tx_seq_ctl_sel						: std_logic;	 
   signal tx_seq_ret_to_sender						: std_logic;    
   signal tx_data_info_fifo_empty				: std_logic; 
   signal tx_ctrl_info_fifo_empty				: std_logic;	  
   signal tx_data_info_fifo_wr_en				: std_logic;
   signal tx_ctrl_info_fifo_wr_en				: std_logic;	 
   
   signal tx_data_info_fifo_din                 : std_logic_vector (15 downto 0);
   signal tx_data_info_fifo_dout               	: std_logic_vector (15 downto 0);
   signal tx_ctrl_info_fifo_din                 : std_logic_vector (15 downto 0);
   signal tx_ctrl_info_fifo_dout               	: std_logic_vector (15 downto 0);	  
   signal tx_ctrl_fifo_dout            	    	: std_logic_vector (63 downto 0); 
   signal tx_data_fifo_dout                 	: std_logic_vector (63 downto 0);	
   signal rx_info_fifo_rd_data                  : std_logic_vector (15 downto 0);	 
   signal tx_info_fifo_dout						: std_logic_vector (15 downto 0);  
   signal tx_seq_data_fifo_dout					: std_logic_vector (63 downto 0);	
   signal tx_ctrl_info_fifo_read_enable			: std_logic;
   signal tx_data_info_fifo_read_enable			: std_logic;
   signal tx_data_info_fifo_full				: std_logic;
   signal tx_ctrl_info_fifo_full				: std_logic;
   
   
       component DATA_FIFO_0
       port ( clk   : in    std_logic; 
              rd_en : in    std_logic; 
              srst  : in    std_logic; 
              wr_en : in    std_logic; 
              din   : in    std_logic_vector (63 downto 0); 
              empty : out   std_logic; 
              full  : out   std_logic; 
              dout  : out   std_logic_vector (63 downto 0));
                  end component;
    
    component INFO_FIFO_0
       port ( wr_en : in    std_logic; 
              clk   : in    std_logic; 
              srst  : in    std_logic; 
              din   : in    std_logic_vector (15 downto 0); 
              rd_en : in    std_logic; 
              dout  : out   std_logic_vector (15 downto 0); 
              empty : out   std_logic; 
              full  : out   std_logic);
                  end component;
   				
    
    component ADDR_FIFO
       port ( wr_en : in    std_logic; 
              clk   : in    std_logic; 
              srst  : in    std_logic; 
              din   : in    std_logic_vector (47 downto 0); 
              rd_en : in    std_logic; 
              dout  : out   std_logic_vector (47 downto 0); 
              empty : out   std_logic; 
              full  : out   std_logic);
                  end component;
   		  
   										
begin

	rx_data(63 downto 0) <= rx_data_sig(63 downto 0);  	  	
	
	user_tx_dest_addr  <= 	tx_data_dest_addr when tx_seq_ctl_sel = '1'	else
							tx_ctrl_addr_fifo_dout when tx_seq_ret_to_sender = '1' else 
							tx_ctrl_dest_addr;	 
	user_tx_dest_port  <= 	tx_data_dest_port when tx_seq_ctl_sel = '1'	else
							tx_ctrl_port_fifo_dout when tx_seq_ret_to_sender = '1' else 
							tx_ctrl_dest_port;	  
	user_tx_dest_mac   <= 	tx_data_dest_mac when tx_seq_ctl_sel = '1'	else
							tx_ctrl_mac_fifo_dout when tx_seq_ret_to_sender = '1' else 
							tx_ctrl_dest_mac;	  								 		  
		
   		  
--erased
--erased
--erased
--erased
--erased
--erased
--erased
--erased                        
--erased
--erased
--erased
--erased

--erased                               
--erased    
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased    
																									 																
--erased                               
--erased    
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased  
				
--erased                               
--erased    
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased  
													
				
				
--erased                        
--erased    
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased    
	                                                                    
--erased    
--erased    
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased    
                                                                        
--erased    
--erased    
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased    
	                                                                    
--erased    
--erased    
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased    
				 	
--erased    
--erased    
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased    
--erased  
--erased   
--erased   
--erased  	
				
--erased    
--erased    
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased  
				
				  	   
	tx_ctrl_fifo_reset_sig <=  comm_dec_tx_fifo_reset or reset;	 
	
--erased  	 assume there is a select signal from TX_CTRL		
--erased  	 tx_seq_ctl_sel = 0 for ctrl fifo and 1 for burst data fifo	 
	tx_ctrl_fifo_read_enable <= tx_data_fifo_rden when tx_seq_ctl_sel = '0' else '0';
	tx_data_fifo_read_enable <= tx_data_fifo_rden when tx_seq_ctl_sel = '1' else '0'; 
	tx_ctrl_info_fifo_read_enable <= tx_info_fifo_rden when tx_seq_ctl_sel = '0' else '0';
	tx_data_info_fifo_read_enable <= tx_info_fifo_rden when tx_seq_ctl_sel = '1' else '0';
	tx_info_fifo_dout <= tx_data_info_fifo_dout when tx_seq_ctl_sel = '1' else tx_ctrl_info_fifo_dout;
	tx_seq_data_fifo_dout <= tx_data_fifo_dout when tx_seq_ctl_sel = '1' else tx_ctrl_fifo_dout;
		
													
			
	
		
	tx_data_fifo_din <= b_data;		  							
	rx_fifo_reset_sig <= rx_fifo_reset or reset;
				
				
				
  		RX_DATA_FIFO : DATA_FIFO_0
  		   port map (clk=>MASTER_CLK,
  		             din(63 downto 0)=>rx_data_fifo_wr_data(63 downto 0),
  		             rd_en=>rx_data_fifo_read_enable,
  		             srst=>rx_fifo_reset_sig,
  		             wr_en=>rx_data_fifo_wren,
  		             dout(63 downto 0)=>rx_data_fifo_rd_data(63 downto 0),
  		             empty=>rx_data_fifo_empty,
  		             full=>rx_data_fifo_full);		

  		RX_DATA_INFO_FIFO : INFO_FIFO_0
  		   port map (clk=>MASTER_CLK,
  		             din(15 downto 0)=>rx_info_fifo_wr_data(15 downto 0),
  		             rd_en=>rx_info_fifo_rden,
  		             srst=>rx_fifo_reset_sig,
  		             wr_en=>rx_info_fifo_wren,
  		             dout(15 downto 0)=>rx_info_fifo_rd_data(15 downto 0),
  		             empty=>rx_info_fifo_empty,
  		             full=>rx_info_fifo_full);
                                   				
  		RX_SRC_ADDR_FIFO : ADDR_FIFO
  		   port map (clk=>MASTER_CLK,
  		             din(31 downto 0)=>user_rx_src_addr(31 downto 0), 
  		             din(47 downto 32)=>user_rx_src_port(15 downto 0),
  		             rd_en=>rx_info_fifo_rden,
  		             srst=>rx_fifo_reset_sig,
  		             wr_en=>rx_info_fifo_wren,
  		             dout(47 downto 0)=>rx_src_addr_fifo_dout(47 downto 0),
  		             empty=>open,
  		             full=>open);
                                  				
  		RX_SRC_MAC_FIFO : ADDR_FIFO
  		   port map (clk=>MASTER_CLK,
  		             din(47 downto 0)=>user_rx_src_mac(47 downto 0), 
  		             rd_en=>rx_info_fifo_rden,
  		             srst=>rx_fifo_reset_sig,
  		             wr_en=>rx_info_fifo_wren,
  		             dout(47 downto 0)=>rx_src_mac_fifo_dout(47 downto 0),
  		             empty=>open,
  		             full=>open);
                  
					 
       	TX_DATA_FIFO : DATA_FIFO_0
       	   port map (clk=>MASTER_CLK,
       	             din(63 downto 0)=>tx_data_fifo_din(63 downto 0),
       	             rd_en=>tx_data_fifo_read_enable,
       	             srst=>reset,
       	             wr_en=>tx_data_fifo_wr_en,
       	             dout(63 downto 0)=>tx_data_fifo_dout(63 downto 0),
       	             empty=>tx_data_fifo_empty,
       	             full=>tx_data_fifo_full);
				
   		TX_DATA_INFO_FIFO : INFO_FIFO_0
   		   port map (clk=>MASTER_CLK,
   		             din(15 downto 0)=>tx_data_info_fifo_din(15 downto 0),
   		             rd_en=>tx_data_info_fifo_read_enable,
   		             srst=>reset,
   		             wr_en=>tx_data_info_fifo_wr_en,
   		             dout(15 downto 0)=>tx_data_info_fifo_dout(15 downto 0),
   		             empty=>tx_data_info_fifo_empty,
   		             full=>tx_data_info_fifo_full);
      	
      	TX_CTRL_FIFO : DATA_FIFO_0
      	   port map (clk=>MASTER_CLK,
      	             din(63 downto 0)=>tx_data(63 downto 0),
      	             rd_en=>tx_ctrl_fifo_read_enable,
      	             srst=>tx_ctrl_fifo_reset_sig,
      	             wr_en=>tx_ctrl_fifo_wr_en,
      	             dout(63 downto 0)=>tx_ctrl_fifo_dout(63 downto 0),
      	             empty=>tx_ctrl_fifo_empty,
      	             full=>tx_ctrl_fifo_full);
				
   		TX_CTRL_INFO_FIFO : INFO_FIFO_0
   		   port map (clk=>MASTER_CLK,
   		             din(15 downto 0)=>tx_ctrl_info_fifo_din(15 downto 0),
   		             rd_en=>tx_ctrl_info_fifo_read_enable,
   		             srst=>tx_ctrl_fifo_reset_sig,
   		             wr_en=>tx_ctrl_info_fifo_wr_en,
   		             dout(15 downto 0)=>tx_ctrl_info_fifo_dout(15 downto 0),
   		             empty=>tx_ctrl_info_fifo_empty,
   		             full=>tx_ctrl_info_fifo_full);	 		

   		TX_CTRL_ADDR_FIFO : ADDR_FIFO
   		   port map (clk=>MASTER_CLK,
   		             din(47 downto 0)=>rx_src_addr_fifo_dout(47 downto 0),
   		             rd_en=>tx_ctrl_info_fifo_read_enable,
   		             srst=>tx_ctrl_fifo_reset_sig,
   		             wr_en=>tx_ctrl_info_fifo_wr_en,
   		             dout(31 downto 0)=>tx_ctrl_addr_fifo_dout(31 downto 0),  
   		             dout(47 downto 32)=>tx_ctrl_port_fifo_dout(15 downto 0),
   		             empty=>open,
   		             full=>open);	

   		TX_CTRL_MAC_FIFO : ADDR_FIFO
   		   port map (clk=>MASTER_CLK,
   		             din(47 downto 0)=>rx_src_mac_fifo_dout(47 downto 0),
   		             rd_en=>tx_ctrl_info_fifo_read_enable,
   		             srst=>tx_ctrl_fifo_reset_sig,
   		             wr_en=>tx_ctrl_info_fifo_wr_en,
   		             dout(47 downto 0)=>tx_ctrl_mac_fifo_dout(47 downto 0),   
   		             empty=>open,
   		             full=>open);
																 											
   burst_controller_sm : entity work.burst_controller_sm
      port map (
                b_data_we=>b_data_we,  
                b_end_packet=>b_end_packet,	   
				b_mode=>b_mode,
                clk=>MASTER_CLK,
                reset=>reset,
                tx_data_full=>tx_data_fifo_full,
                tx_info_full=>tx_data_info_fifo_full,   
                b_enable=>b_enable,
                tx_data_we=>tx_data_fifo_wr_en,
                tx_info(15 downto 0)=>tx_data_info_fifo_din(15 downto 0),
                tx_info_we=>tx_data_info_fifo_wr_en);
					 
   
   GEC_RX_CTRL : entity work.rx_ctl
      port map (
                clock=>MASTER_CLK,				 					   
                four_bit_mode=>four_bit_mode,
                user_crc_err=>user_crc_err,	 
				user_crc_chk=>user_crc_chk,
                user_rx_data_out(7 downto 0)=>user_rx_data_out(7 downto 0),	   
                user_rx_valid_out=>user_rx_valid_out,
                reset=>reset,						
                crc_err_flag=>crc_err_flag,	  
                clear_crc_err_flag=>clear_crc_err_flag,
                data_fifo_wdata(63 downto 0)=>rx_data_fifo_wr_data(63 downto 0),
                data_fifo_wren=>rx_data_fifo_wren,
                info_fifo_wren=>rx_info_fifo_wren,
                info_fifo_wr_data(15 downto 0)=>rx_info_fifo_wr_data(15 downto 0));	  							

   
   RAM_COMM_DEC : entity work.ram_comm_dec
      port map (						   
                clock=>MASTER_CLK,
                reset=>reset,
                rx_data_fifo_rd_data(63 downto 0)=>rx_data_fifo_rd_data(63 downto 0),
				ram_wdata(63 downto 0)=>rx_data_sig(63 downto 0),
                rx_info_fifo_empty=>rx_info_fifo_empty,							  
				rx_info_fifo_full=>rx_info_fifo_full,	   
				rx_data_fifo_full=>rx_data_fifo_full,
                rx_info_fifo_rd_data(15 downto 0)=>rx_info_fifo_rd_data(15 downto 0),				
                tx_info_fifo_full=>tx_ctrl_info_fifo_full,	  
                ram_addr(63 downto 0)=>ram_addr(63 downto 0),
                ram_rden=>ram_rden,
                ram_wren=>ram_wren,		   			
				user_ready=>user_ready,
				user_rx_valid_out=>user_rx_valid_out,  
                crc_err_flag=>crc_err_flag,	  
                clear_crc_err_flag=>clear_crc_err_flag,	  
                rx_data_fifo_rden=>rx_data_fifo_read_enable,
                Rx_FIFO_Reset=>rx_fifo_reset,
                rx_info_fifo_rden=>rx_info_fifo_rden,		 
                tx_data_fifo_wren=>tx_ctrl_fifo_wr_en,
                Tx_FIFO_Reset=>comm_dec_tx_fifo_reset,

                tx_info_fifo_wren=>tx_ctrl_info_fifo_wr_en,
                tx_info_fifo_wr_data(15 downto 0)=>tx_ctrl_info_fifo_din(15 downto 0));
   
   GEC_TX_SEQ_CTL : entity work.tx_seq_ctl
      port map (					   
                reset=>reset,						   
                clk=>MASTER_CLK,					   			
                four_bit_mode=>four_bit_mode,	 
				
                dest_busy=>user_busy,		 
                user_trigger=>user_tx_trigger,	   
                user_tx_enable_out=>user_tx_enable_out,	  
                tx_data(7 downto 0)=>user_tx_data_in(7 downto 0), 
                user_tx_size_in(10 downto 0)=>user_tx_size_in(10 downto 0),
				
				fifo_sel=>tx_seq_ctl_sel, 
				ret_to_sender=>tx_seq_ret_to_sender,
																					  
                data_fifo_empty=>tx_data_fifo_empty,	
                data_fifo_rd_data(63 downto 0)=>tx_seq_data_fifo_dout(63 downto 0),	   
                data_fifo_rden=>tx_data_fifo_rden,	  
														 
                data_info_fifo_empty=>tx_data_info_fifo_empty,	
                ctrl_info_fifo_empty=>tx_ctrl_info_fifo_empty,	
				
                info_fifo_rd_data(15 downto 0)=>tx_info_fifo_dout(15 downto 0),	
                info_fifo_rden=>tx_info_fifo_rden);
   									

   
end BEHAVIORAL;



			  