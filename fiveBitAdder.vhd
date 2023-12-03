LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fiveBitAdder IS
	PORT(
		i_Ai, i_Bi		: IN	STD_LOGIC_VECTOR(4 downto 0);
		i_GCarryIn     : IN STD_LOGIC;
		o_CarryOut, o_V, o_Z	: OUT	STD_LOGIC;
		o_Sum			: OUT	STD_LOGIC_VECTOR(4 downto 0));
END fiveBitAdder;

ARCHITECTURE rtl OF fiveBitAdder IS
	SIGNAL int_Sum, int_CarryOut : STD_LOGIC_VECTOR(4 downto 0);

	COMPONENT oneBitAdder
	PORT(
		i_CarryIn		: IN	STD_LOGIC;
		i_Ai, i_Bi		: IN	STD_LOGIC;
		o_Sum, o_CarryOut	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

add4: oneBitAdder
	PORT MAP (i_CarryIn => int_CarryOut(3), 
			  i_Ai => i_Ai(4),
			  i_Bi => i_Bi(4),
			  o_Sum => int_Sum(4),
			  o_CarryOut => int_CarryOut(4));

add3: oneBitAdder
	PORT MAP (i_CarryIn => int_CarryOut(2), 
			  i_Ai => i_Ai(3),
			  i_Bi => i_Bi(3),
			  o_Sum => int_Sum(3),
			  o_CarryOut => int_CarryOut(3));	
	
add2: oneBitAdder
	PORT MAP (i_CarryIn => int_CarryOut(1), 
			  i_Ai => i_Ai(2),
			  i_Bi => i_Bi(2),
			  o_Sum => int_Sum(2),
			  o_CarryOut => int_CarryOut(2));

add1: oneBitAdder
	PORT MAP (i_CarryIn => int_CarryOut(0), 
			  i_Ai => i_Ai(1),
			  i_Bi => i_Bi(1),
			  o_Sum => int_Sum(1),
			  o_CarryOut => int_CarryOut(1));

add0: oneBitAdder
	PORT MAP (i_CarryIn => i_GCarryIn, 
			  i_Ai => i_Ai(0),
			  i_Bi => i_Bi(0),
			  o_Sum => int_Sum(0),
			  o_CarryOut => int_CarryOut(0));

	-- Output Driver
	o_V <= int_CarryOut(4) and int_CarryOut(3);
	o_Sum <= int_Sum;
	o_CarryOut <= int_CarryOut(4);
	o_Z <= not(int_Sum(0) or int_Sum(1) or int_Sum(2) or int_Sum(3) or int_Sum(4));

END rtl;
