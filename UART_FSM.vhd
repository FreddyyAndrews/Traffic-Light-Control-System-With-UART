LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY UART_FSM IS
	PORT(
		GClock : IN STD_LOGIC;
		GReset : IN STD_LOGIC;
		dataBus : IN STD_LOGIC_VECTOR(7 downto 0);
		MSTS, SSTS	: IN	STD_LOGIC_VECTOR(2 downto 0);
		TxClock : IN std_LOGIC;
		TxDone : IN STD_LOGIC;
		BaudSelIn: IN STD_LOGIC_VECTOR(2 downto 0);
		SetBaudRate : OUT std_LOGIC;
		AddressBus, SelTxRx 		: OUT	STD_LOGIC_VECTOR(1 downto 0);
		RnotW : OUT std_LOGIC;
		dataBusOutput : OUT STD_LOGIC_VECTOR(7 downto 0);
		o_counter_out : OUT STD_LOGIC_VECTOR(3 downto 0);
		o_s1, o_s2,o_s0 : OUT std_LOGIC;
		o_doneOneTransmission, o_counter_inc, o_loadBus,o_counter_reset : OUT std_logic; 
		BaudSelOut: OUT STD_LOGIC_VECTOR(2 downto 0));
END UART_FSM;

ARCHITECTURE structural OF UART_FSM IS
	SIGNAL i_s0, i_s1, i_s2, i_resetBar: STD_LOGIC;
	SIGNAL s0, s1, s2 , ns0, ns1, ns2 ,counter_reset_bar : STD_LOGIC;
	SIGNAL counter_inc, counter_reset, doneOneTransmission, loadBus: STD_LOGIC;
	SIGNAl counter_out : std_LOGIC_VECTOR(3 downto 0 );
	SIGNAL M, r, underscore, S, y, g, char1, char2, char3, char4, char5, char6, newline, muxMain, muxSide,X,charToSend : STD_LOGIC_VECTOR(7 downto 0);

	COMPONENT enARdFF_2
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;
	
	COMPONENT mux_32to8 
    PORT ( sel : in  STD_LOGIC_VECTOR (1 downto 0);
				in3: in STD_LOGIC_VECTOR (7 downto 0);
				in2: in STD_LOGIC_VECTOR (7 downto 0);
				in1: in STD_LOGIC_VECTOR (7 downto 0);
				in0: in STD_LOGIC_VECTOR (7 downto 0);
				dout : out  STD_LOGIC_VECTOR (7 downto 0));
	END COMPONENT;
	
	COMPONENT mux2x1_8 
	port( A,B: in std_logic_vector(7 downto 0);
			S: in std_logic;
			F: out std_logic_vector(7 downto 0));
	end COMPONENT;


	COMPONENT mux_8bit_8to1 
    PORT (
        sel : in  STD_LOGIC_VECTOR (2 downto 0);
        in0: in STD_LOGIC_VECTOR (7 downto 0);
        in1: in STD_LOGIC_VECTOR (7 downto 0);
        in2: in STD_LOGIC_VECTOR (7 downto 0);
        in3: in STD_LOGIC_VECTOR (7 downto 0);
        in4: in STD_LOGIC_VECTOR (7 downto 0);
        in5: in STD_LOGIC_VECTOR (7 downto 0);
        in6: in STD_LOGIC_VECTOR (7 downto 0);
        in7: in STD_LOGIC_VECTOR (7 downto 0);
        dout : buffer  STD_LOGIC_VECTOR (7 downto 0)
    );
	END COMPONENT;
	
	COMPONENT counter 
	PORT(
		inc_counter : IN std_LOGIC;
		i_resetBar	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_Value 		: OUT	STD_LOGIC_VECTOR(3 downto 0));
	END COMPONENT;
	
	
BEGIN
	

s2dff: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => i_s2, 
			  i_enable => '1',
			  i_clock => GClock,
			  o_q => s2,
	        o_qBar => ns2);
				 
				

s1dff: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => i_s1,
			  i_enable => '1', 
			  i_clock => GClock,
			  o_q => s1,
	        o_qBar => ns1);
				 
		
s0dff: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => i_s0,
			  i_enable => '1', 
			  i_clock => GClock,
			  o_q => s0,
	        o_qBar => ns0);

muxMainD: mux_32to8 
    PORT MAP (
        sel => MSTS(2 downto 1),
        in3 => r,
        in2 => r,  -- Changed ": =>" to "=>"
        in1 => y,  -- Changed ": =>" to "=>"
        in0 => g,  -- Changed ": =>" to "=>"
        dout => muxMain
    );

muxSideD: mux_32to8 
    PORT MAP (
        sel => SSTS(2 downto 1),
		  in3 => r,
        in2 => r,  -- Changed ": =>" to "=>"
        in1 => y,  -- Changed ": =>" to "=>"
        in0 => g,  -- Changed ": =>" to "=>"
        dout => muxSide
    );
	 
counter1: counter 
	PORT MAP(
		inc_counter => counter_inc,
		i_resetBar =>counter_reset_bar,
		i_clock	=> gclock,
		o_Value => counter_out);
	
	
muxCounter: mux_8bit_8to1 
    PORT MAP (
        sel => counter_out(2 downto 0),
        in0 => char1,
        in1 => char2,
        in2 => char3,
        in3 => char4,
        in4 => char5,
        in5 => X,
        in6 => X,
        in7 => X,
        dout =>charToSend
    );
	 
mux2x1_8_1: mux2x1_8
	port map( A => dataBus,
			B => charToSend,
			S => loadBus,
			F => dataBusOutput);

	i_resetBar <= not GReset;
	M <= "01001101";
	r <= "01110010";
	underscore <= "01011111";
	S <= "01010011";
	y <= "01111001";
	g <= "01100111";  
	X <= "01011000";
	newline <= "00001010";
			  
	i_s0 <= (ns2 and ns1 and ns0 and TxClock) or (ns2 and s1 and ns0 and TxDone and not(counter_out(1) and counter_out(2)));
	
	i_s1 <= (s2 and ns1 and ns0) or (ns2 and s1 and ns0 and (not TxDone));
	
	i_s2 <= ns2 and ns1 and s0;
	char1 <= M;
	char2 <= muxMain;
	char3 <= underscore;
	char4 <= S;
	char5 <= muxSide;
	char6 <= newline;
	
	SelTxRx(1) <= (ns2 and ns1 and s0) OR (ns2 and s1 and ns0) OR (s2 and ns1 and ns0);
	--AddressBus(0) <= (ns2 and s1 and ns0);
	AddressBus(1) <= (ns2 and ns1 and ns0);	
	RnotW <= (ns2 and s1 and ns0);
	SetBaudRate <= (ns2 and ns1 and ns0);
	counter_inc <= (ns2 and ns1 and s0);
	loadBus <= ns2 and ns1 and s0;
	counter_reset <= ns2 and ns1 and ns0;



    o_doneOneTransmission <= TxDone;
    o_counter_inc <= counter_inc;
    o_loadBus <= loadBus;
    o_counter_reset <= counter_reset;
	 counter_reset_bar <= not(counter_reset);
    o_s2 <= s2;
    o_s1<=s1;
    o_s0<=s0;
	 o_counter_out <= counter_out;
	 BaudSelOut <= BaudSelIn;
	 
END structural;
