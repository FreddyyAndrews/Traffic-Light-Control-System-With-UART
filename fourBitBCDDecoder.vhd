library ieee;
use  ieee.std_logic_1164.all;

ENTITY fourBitBCDDecoder IS
	PORT(i_counterValue	: IN STD_LOGIC_VECTOR(3 downto 0);
	     o_BCD1, o_BCD2 : OUT STD_LOGIC_VECTOR(3 downto 0));
END fourBitBCDDecoder;

ARCHITECTURE structural OF fourBitBCDDecoder IS
	signal diff,i_sub : std_logic_vector(4 downto 0);
    signal i_mux : std_logic_vector(3 downto 0);
	
	component fivebitaddersub
		port(
			i_X, i_Y		: IN	STD_LOGIC_VECTOR(4 downto 0);
			op    : IN STD_LOGIC;
			o_Cout, o_V, o_Z		: OUT	STD_LOGIC;
			o_Sum			: OUT	STD_LOGIC_VECTOR(4 downto 0)
		);
	end component;
	
	component mux2x1_4
		port(
			A,B: in std_logic_vector(3 downto 0);
			S: in std_logic;
			F: out std_logic_vector(3 downto 0)
		);
	end component;
		
BEGIN

    i_sub <= '0' & i_counterValue;
    i_mux <= diff(3) & diff(2) & diff(1) & diff(0);
	sub : fivebitaddersub
		port map(
			i_X => i_sub,
			i_Y => "01010",
			op => '1',
			o_Cout => OPEN,
			o_V => OPEN,
			o_Z => OPEN,
			o_Sum => diff
		);
		
	mux : mux2x1_4
		port map(
			A => i_mux,
			B => i_counterValue,
			S => diff(4),
			F => o_BCD1
		);
	
	
	o_BCD2 <= '0' & '0' & '0' & not(diff(4));


END structural;

