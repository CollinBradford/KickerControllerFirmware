
-- VHDL Instantiation Created from source file PeakFinder.vhd -- 15:28:48 09/05/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PeakFinder
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		data_in : IN std_logic_vector(63 downto 0);
		signal_threshold : IN std_logic_vector(7 downto 0);
		user_sample_width : IN std_logic_vector(15 downto 0);          
		data_out : OUT std_logic_vector(63 downto 0);
		addr_out : OUT std_logic_vector(10 downto 0);
		out_enable : OUT std_logic;
		trigger_address : OUT std_logic_vector(10 downto 0);
		new_trigger : OUT std_logic
		);
	END COMPONENT;

	Inst_PeakFinder: PeakFinder PORT MAP(
		clk => ,
		reset => ,
		data_in => ,
		signal_threshold => ,
		user_sample_width => ,
		data_out => ,
		addr_out => ,
		out_enable => ,
		trigger_address => ,
		new_trigger => 
	);


