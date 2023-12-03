LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY BusHandlerUART IS
	PORT(
		BusInputFromFSM	: IN std_logic_vector(7 downto 0);
		RnotW		: IN	STD_LOGIC;
		AddressBus	: IN std_logic_vector(1 downto 0);
		SCSRinput : IN std_logic_vector(7 downto 0);
		RDRinput : IN std_logic_vector(7 downto 0);
		SCCRinput: IN std_logic_vector(7 downto 0);
		BusOutputFromUART		: OUT std_logic_vector(7 downto 0));
END BusHandlerUART;

architecture Structural of BusHandlerUART is
	
	component mux_8bit_8to1 
    Port (
        sel : in  STD_LOGIC_VECTOR (2 downto 0);
        in0: in STD_LOGIC_VECTOR (7 downto 0);
        in1: in STD_LOGIC_VECTOR (7 downto 0);
        in2: in STD_LOGIC_VECTOR (7 downto 0);
        in3: in STD_LOGIC_VECTOR (7 downto 0);
        in4: in STD_LOGIC_VECTOR (7 downto 0);
        in5: in STD_LOGIC_VECTOR (7 downto 0);
        in6: in STD_LOGIC_VECTOR (7 downto 0);
        in7: in STD_LOGIC_VECTOR (7 downto 0);
        dout : out  STD_LOGIC_VECTOR (7 downto 0)
    );	end component;


    signal selecter : STD_LOGIC_VECTOR (2 downto 0);
begin
     
	MUX : mux_8bit_8to1
    Port map(
        sel => selecter,
        in0 => RDRinput,
        in1 => BusInputFromFSM,
        in2 => SCSRinput,
        in3 => "ZZZZZZZZ",
        in4 => SCCRinput,
        in5 => SCCRinput,
        in6 => SCCRinput,
        in7 => SCCRinput,
        dout => BusOutputFromUART
    );
	  
	  selecter(0)<= not (RnotW);
	  selecter(1) <= addressBus(0);
	  selecter(2) <= addressBus(1);

	  
end Structural;