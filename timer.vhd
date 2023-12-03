-- Adaptation du counter fourni en class pour fournir un signal «Done» lorsqu'il atteint 4
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY timer IS
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_Value 		: OUT	STD_LOGIC_VECTOR(3 downto 0);
		o_MST, o_SST		: OUT STD_LOGIC);
END timer;

ARCHITECTURE rtl OF timer IS
	SIGNAL int_a, int_na, int_b, int_nb, int_c, int_nc, int_d, int_nd : STD_LOGIC;
	SIGNAL int_notA, int_notB, int_notC, int_notD : STD_LOGIC;

	COMPONENT enARdFF_2
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

	int_na <= int_a xor (int_c and int_b and int_d);
	int_nb <= int_b xor (int_c and int_d);
	int_nc <= int_c xor int_d;
	int_nd <= not(int_d);
	
bit3: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => int_na,
			  i_enable => '1', 
			  i_clock => i_clock,
			  o_q => int_a,
	        o_qBar => int_notA);

bit2: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => int_nb, 
			  i_enable => '1',
			  i_clock => i_clock,
			  o_q => int_b,
	        o_qBar => int_notB);
				 
				

bit1: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => int_nc,
			  i_enable => '1', 
			  i_clock => i_clock,
			  o_q => int_c,
	        o_qBar => int_notC);
				 
bit0: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => int_nd,
			  i_enable => '1', 
			  i_clock => i_clock,
			  o_q => int_d,
	        o_qBar => int_notD);
				 

	o_Value	<= int_a & int_b & int_c & int_d;
	o_MST <= int_b;
	o_SST <= int_c;

END rtl;
