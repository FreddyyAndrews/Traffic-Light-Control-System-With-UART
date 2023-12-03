-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 32-bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Mon Nov 27 17:15:51 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY receiver IS 
	PORT
	(
		BClkx8 :  IN  STD_LOGIC;
		RxD :  IN  STD_LOGIC;
		GReset :  IN  STD_LOGIC;
		VCC :  IN  STD_LOGIC;
		setTxRx :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		VCC7 :  IN  STD_LOGIC;
		VCC6 :  IN  STD_LOGIC;
		VCC5 :  IN  STD_LOGIC;
		VCC4 :  IN  STD_LOGIC;
		VCC3 :  IN  STD_LOGIC;
		VCC2 :  IN  STD_LOGIC;
		VCC1 :  IN  STD_LOGIC;
		VCC0 :  IN  STD_LOGIC;
		shift :  OUT  STD_LOGIC;
		set_FE :  OUT  STD_LOGIC;
		RDRF :  OUT  STD_LOGIC;
		reset_FE :  OUT  STD_LOGIC;
		RDR_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		states_out :  OUT  STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END receiver;

ARCHITECTURE bdf_type OF receiver IS 

COMPONENT three_bit_register_reset_increment
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 increment : IN STD_LOGIC;
		 equals3 : OUT STD_LOGIC;
		 equals7 : OUT STD_LOGIC;
		 equals6 : OUT STD_LOGIC;
		 data_out : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT four_bit_register_reset_increment
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 increment : IN STD_LOGIC;
		 c3 : OUT STD_LOGIC;
		 data_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT receiver_fsm_controller
	PORT(BClkx8 : IN STD_LOGIC;
		 GReset : IN STD_LOGIC;
		 RxD : IN STD_LOGIC;
		 c2 : IN STD_LOGIC;
		 b3 : IN STD_LOGIC;
		 d3 : IN STD_LOGIC;
		 setTxRx : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 shift : OUT STD_LOGIC;
		 set_FE : OUT STD_LOGIC;
		 RDRF : OUT STD_LOGIC;
		 c_reset : OUT STD_LOGIC;
		 b_reset : OUT STD_LOGIC;
		 d_reset : OUT STD_LOGIC;
		 c_inc : OUT STD_LOGIC;
		 b_inc : OUT STD_LOGIC;
		 d_inc : OUT STD_LOGIC;
		 reset_FE : OUT STD_LOGIC;
		 states_out : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END COMPONENT;

COMPONENT eightbitregister
	PORT(i_resetBar : IN STD_LOGIC;
		 i_load : IN STD_LOGIC;
		 i_clock : IN STD_LOGIC;
		 i_Value : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 o_Value : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT eightbitrightshiftregister
	PORT(load : IN STD_LOGIC;
		 serial_input : IN STD_LOGIC;
		 shift_right : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 parralel_input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 parralel_output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;

SIGNAL	GDFX_TEMP_SIGNAL_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN 
shift <= SYNTHESIZED_WIRE_13;
RDRF <= SYNTHESIZED_WIRE_10;

GDFX_TEMP_SIGNAL_0 <= (VCC7 & VCC6 & VCC5 & VCC4 & VCC3 & VCC2 & VCC1 & VCC0);


b2v_b : three_bit_register_reset_increment
PORT MAP(clk => BClkx8,
		 reset => SYNTHESIZED_WIRE_0,
		 increment => SYNTHESIZED_WIRE_1,
		 equals6 => SYNTHESIZED_WIRE_7);


b2v_c : three_bit_register_reset_increment
PORT MAP(clk => BClkx8,
		 reset => SYNTHESIZED_WIRE_2,
		 increment => SYNTHESIZED_WIRE_3,
		 equals3 => SYNTHESIZED_WIRE_6);


b2v_d : four_bit_register_reset_increment
PORT MAP(clk => BClkx8,
		 reset => SYNTHESIZED_WIRE_4,
		 increment => SYNTHESIZED_WIRE_5,
		 c3 => SYNTHESIZED_WIRE_8);


SYNTHESIZED_WIRE_12 <= NOT(VCC);



SYNTHESIZED_WIRE_9 <= NOT(GReset);



b2v_inst4 : receiver_fsm_controller
PORT MAP(BClkx8 => BClkx8,
		 GReset => GReset,
		 RxD => RxD,
		 c2 => SYNTHESIZED_WIRE_6,
		 b3 => SYNTHESIZED_WIRE_7,
		 d3 => SYNTHESIZED_WIRE_8,
		 setTxRx => setTxRx,
		 shift => SYNTHESIZED_WIRE_13,
		 set_FE => set_FE,
		 RDRF => SYNTHESIZED_WIRE_10,
		 c_reset => SYNTHESIZED_WIRE_2,
		 b_reset => SYNTHESIZED_WIRE_0,
		 d_reset => SYNTHESIZED_WIRE_4,
		 c_inc => SYNTHESIZED_WIRE_3,
		 b_inc => SYNTHESIZED_WIRE_1,
		 d_inc => SYNTHESIZED_WIRE_5,
		 reset_FE => reset_FE,
		 states_out => states_out);


b2v_RDR : eightbitregister
PORT MAP(i_resetBar => SYNTHESIZED_WIRE_9,
		 i_load => SYNTHESIZED_WIRE_10,
		 i_clock => BClkx8,
		 i_Value => SYNTHESIZED_WIRE_11,
		 o_Value => RDR_out);


b2v_RSR : eightbitrightshiftregister
PORT MAP(load => SYNTHESIZED_WIRE_12,
		 serial_input => RxD,
		 shift_right => SYNTHESIZED_WIRE_13,
		 clk => BClkx8,
		 parralel_input => GDFX_TEMP_SIGNAL_0,
		 parralel_output => SYNTHESIZED_WIRE_11);


END bdf_type;