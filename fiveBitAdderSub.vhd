LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fiveBitAdderSub IS
	PORT(
		i_X, i_Y		: IN	STD_LOGIC_VECTOR(4 downto 0);
		op    : IN STD_LOGIC;
		o_Cout, o_V, o_Z		: OUT	STD_LOGIC;
		o_Sum			: OUT	STD_LOGIC_VECTOR(4 downto 0));
END fiveBitAdderSub;

ARCHITECTURE rtl OF fiveBitAdderSub IS
	SIGNAL int_Y : STD_LOGIC_VECTOR(4 downto 0);
	COMPONENT fiveBitAdder
	PORT(
		i_GCarryIn		: IN	STD_LOGIC;
		i_Ai, i_Bi		: IN	STD_LOGIC_VECTOR(4 downto 0);
		o_Sum: OUT	STD_LOGIC_VECTOR(4 downto 0);
		o_CarryOut, o_V, o_Z	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN
	int_Y(0) <= i_Y(0) xor op;
	int_Y(1) <= i_Y(1) xor op;
	int_Y(2) <= i_Y(2) xor op;
	int_Y(3) <= i_Y(3) xor op;
	int_Y(4) <= i_Y(4) xor op;
	
add: fiveBitAdder
	PORT MAP (i_GCarryIn => op, 
			  i_Ai => i_X,
			  i_Bi => int_Y,
			  o_Sum => o_Sum,
			  o_CarryOut => o_Cout,
			  o_V => o_V,
			  o_Z => o_Z
			  );	

END rtl;
