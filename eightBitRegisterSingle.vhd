LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Registers used for the Gmask, DMask and Affichage Values.
-- This was a modified version of the 3bitRegister from the notes to accomodate 8 bits
ENTITY eightBitRegisterSingle IS
	PORT(
		i_resetBar, i_load : IN STD_LOGIC;
		i_clock : IN STD_LOGIC;
		iValue0, iValue1, iValue2, iValue3, iValue4, iValue5, iValue6, iValue7: IN STD_LOGIC;
		o_Value0, o_Value1, o_Value2, o_Value3, o_Value4, o_Value5, o_Value6, o_Value7 : OUT STD_LOGIC);
END eightBitRegisterSingle;

ARCHITECTURE rtl OF eightBitRegisterSingle IS
	SIGNAL int_Value0, int_Value1, int_Value2, int_Value3, int_Value4, int_Value5, int_Value6, int_Value7, int_notValue0, int_notValue1, int_notValue2, int_notValue3, int_notValue4, int_notValue5, int_notValue6, int_notValue7: STD_LOGIC;
	COMPONENT enardFF_2
		PORT(
			i_resetBar : IN STD_LOGIC;
			i_d : IN STD_LOGIC;
			i_enable : IN STD_LOGIC;
			i_clock : IN STD_LOGIC;
			o_q, o_qBar : OUT STD_LOGIC);
	END COMPONENT;
	BEGIN
	
	bb: enardFF_2
	PORT MAP (i_resetBar => i_resetBar,
		i_d => iValue7,
		i_enable => i_load,
		i_clock => i_clock,
		o_q => int_Value7,
		o_qBar => int_notValue7);
		
	bc: enardFF_2
	PORT MAP (i_resetBar => i_resetBar,
		i_d => iValue6,
		i_enable => i_load,
		i_clock => i_clock,
		o_q => int_Value6,
		o_qBar => int_notValue6);
	
	
	bd: enardFF_2
	PORT MAP (i_resetBar => i_resetBar,
		i_d => iValue5,
		i_enable => i_load,
		i_clock => i_clock,
		o_q => int_Value5,
		o_qBar => int_notValue5);
	
	be: enardFF_2
	PORT MAP (i_resetBar => i_resetBar,
		i_d => iValue4,
		i_enable => i_load,
		i_clock => i_clock,
		o_q => int_Value4,
		o_qBar => int_notValue4);
	
	bf: enardFF_2
	PORT MAP (i_resetBar => i_resetBar,
		i_d => iValue3,
		i_enable => i_load,
		i_clock => i_clock,
		o_q => int_Value3,
		o_qBar => int_notValue3);
	
	bg: enardFF_2
	PORT MAP (i_resetBar => i_resetBar,
		i_d => iValue2,
		i_enable => i_load,
		i_clock => i_clock,
		o_q => int_Value2,
		o_qBar => int_notValue2);
	
	bh: enardFF_2
	PORT MAP (i_resetBar => i_resetBar,
		i_d => iValue1,
		i_enable => i_load,
		i_clock => i_clock,
		o_q => int_Value1,
		o_qBar => int_notValue1);
	
	bi: enardFF_2
	PORT MAP (i_resetBar => i_resetBar,
		i_d => iValue0,
		i_enable => i_load,
		i_clock => i_clock,
		o_q => int_Value0,
		o_qBar => int_notValue0);
	
	-- Output Driver
	o_Value0 <= int_Value0;
	o_Value1 <= int_Value1;
	o_Value2 <= int_Value2;
	o_Value3 <= int_Value3;
	o_Value4 <= int_Value4;
	o_Value5 <= int_Value5;
	o_Value6 <= int_Value6;
	o_Value7 <= int_Value7;

END rtl;