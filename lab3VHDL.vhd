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

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
-- CREATED		"Sun Nov 26 15:32:51 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY lab3VHDL IS 
	PORT
	(
		SSCS :  IN  STD_LOGIC;
		GReset :  IN  STD_LOGIC;
		GClock :  IN  STD_LOGIC;
		Clock_Slow: IN STD_LOGIC;
		MSC :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		SSC :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		BCD1 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		BCD2 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		counter_o :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		SevSegDisp1 :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		SevSegDisp2 :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		MSTS :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		SSTS :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END lab3VHDL;

ARCHITECTURE structural OF lab3VHDL IS 

COMPONENT timer
	PORT(i_resetBar : IN STD_LOGIC;
		 i_clock : IN STD_LOGIC;
		 o_MST : OUT STD_LOGIC;
		 o_SST : OUT STD_LOGIC;
		 o_Value : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dec_7seg
	PORT(i_hexDigit : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 o_segment_a : OUT STD_LOGIC;
		 o_segment_b : OUT STD_LOGIC;
		 o_segment_c : OUT STD_LOGIC;
		 o_segment_d : OUT STD_LOGIC;
		 o_segment_e : OUT STD_LOGIC;
		 o_segment_f : OUT STD_LOGIC;
		 o_segment_g : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT debouncer_2
	PORT(i_clock : IN STD_LOGIC;
		 i_raw : IN STD_LOGIC;
		 o_clean : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT fsm_controller
	PORT(Deb_out : IN STD_LOGIC;
		 Ctr_expired : IN STD_LOGIC;
		 MST : IN STD_LOGIC;
		 SST : IN STD_LOGIC;
		 GClock : IN STD_LOGIC;
		 GReset : IN STD_LOGIC;
		 ST : OUT STD_LOGIC;
		 Set_Ctr : OUT STD_LOGIC;
		 Sel : OUT STD_LOGIC;
		 RC : OUT STD_LOGIC;
		 MSTS : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 SSTS : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT counter
	PORT(inc_counter : IN STD_LOGIC;
		 i_resetBar : IN STD_LOGIC;
		 i_clock : IN STD_LOGIC;
		 o_Value : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2x1_4
	PORT(S : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 F : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT fourbitbcddecoder
	PORT(i_counterValue : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 o_BCD1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 o_BCD2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT fourbitcomparator
	PORT(i_Ai : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 i_Bi : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 o_GT : OUT STD_LOGIC;
		 o_LT : OUT STD_LOGIC;
		 o_EQ : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SevSegDisp_ALTERA_SYNTHESIZED1 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SevSegDisp_ALTERA_SYNTHESIZED2 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 
BCD1 <= SYNTHESIZED_WIRE_5;
BCD2 <= SYNTHESIZED_WIRE_6;
counter_o <= SYNTHESIZED_WIRE_25;



b2v_inst : timer
PORT MAP(i_resetBar => SYNTHESIZED_WIRE_0,
		 i_clock => Clock_Slow,
		 o_MST => SYNTHESIZED_WIRE_9,
		 o_SST => SYNTHESIZED_WIRE_10);


SYNTHESIZED_WIRE_8 <= SYNTHESIZED_WIRE_1 OR SYNTHESIZED_WIRE_2;


SYNTHESIZED_WIRE_12 <= NOT(SYNTHESIZED_WIRE_22);



SYNTHESIZED_WIRE_14 <= NOT(SYNTHESIZED_WIRE_22);



b2v_inst19 : dec_7seg
PORT MAP(i_hexDigit => SYNTHESIZED_WIRE_5,
		 o_segment_a => SevSegDisp_ALTERA_SYNTHESIZED1(0),
		 o_segment_b => SevSegDisp_ALTERA_SYNTHESIZED1(1),
		 o_segment_c => SevSegDisp_ALTERA_SYNTHESIZED1(2),
		 o_segment_d => SevSegDisp_ALTERA_SYNTHESIZED1(3),
		 o_segment_e => SevSegDisp_ALTERA_SYNTHESIZED1(4),
		 o_segment_f => SevSegDisp_ALTERA_SYNTHESIZED1(5),
		 o_segment_g => SevSegDisp_ALTERA_SYNTHESIZED1(6));


b2v_inst20 : dec_7seg
PORT MAP(i_hexDigit => SYNTHESIZED_WIRE_6,
		 o_segment_a => SevSegDisp_ALTERA_SYNTHESIZED2(0),
		 o_segment_b => SevSegDisp_ALTERA_SYNTHESIZED2(1),
		 o_segment_c => SevSegDisp_ALTERA_SYNTHESIZED2(2),
		 o_segment_d => SevSegDisp_ALTERA_SYNTHESIZED2(3),
		 o_segment_e => SevSegDisp_ALTERA_SYNTHESIZED2(4),
		 o_segment_f => SevSegDisp_ALTERA_SYNTHESIZED2(5),
		 o_segment_g => SevSegDisp_ALTERA_SYNTHESIZED2(6));


b2v_inst23 : debouncer_2
PORT MAP(i_clock => GClock,
		 i_raw => SSCS,
		 o_clean => SYNTHESIZED_WIRE_7);


b2v_inst3 : fsm_controller
PORT MAP(Deb_out => SYNTHESIZED_WIRE_7,
		 Ctr_expired => SYNTHESIZED_WIRE_8,
		 MST => SYNTHESIZED_WIRE_9,
		 SST => SYNTHESIZED_WIRE_10,
		 GClock => GClock,
		 GReset => GReset,
		 ST => SYNTHESIZED_WIRE_0,
		 Set_Ctr => SYNTHESIZED_WIRE_23,
		 Sel => SYNTHESIZED_WIRE_24,
		 RC => SYNTHESIZED_WIRE_22,
		 MSTS => MSTS,
		 SSTS => SSTS);


b2v_inst4 : counter
PORT MAP(inc_counter => SYNTHESIZED_WIRE_23,
		 i_resetBar => SYNTHESIZED_WIRE_12,
		 i_clock => Clock_Slow,
		 o_Value => SYNTHESIZED_WIRE_16);


b2v_inst5 : counter
PORT MAP(inc_counter => SYNTHESIZED_WIRE_23,
		 i_resetBar => SYNTHESIZED_WIRE_14,
		 i_clock => Clock_Slow,
		 o_Value => SYNTHESIZED_WIRE_17);


b2v_inst6 : mux2x1_4
PORT MAP(S => SYNTHESIZED_WIRE_24,
		 A => SYNTHESIZED_WIRE_16,
		 B => SYNTHESIZED_WIRE_17,
		 F => SYNTHESIZED_WIRE_25);


b2v_inst7 : mux2x1_4
PORT MAP(S => SYNTHESIZED_WIRE_24,
		 A => MSC,
		 B => SSC,
		 F => SYNTHESIZED_WIRE_21);


b2v_inst8 : fourbitbcddecoder
PORT MAP(i_counterValue => SYNTHESIZED_WIRE_25,
		 o_BCD1 => SYNTHESIZED_WIRE_5,
		 o_BCD2 => SYNTHESIZED_WIRE_6);


b2v_inst9 : fourbitcomparator
PORT MAP(i_Ai => SYNTHESIZED_WIRE_25,
		 i_Bi => SYNTHESIZED_WIRE_21,
		 o_GT => SYNTHESIZED_WIRE_2,
		 o_EQ => SYNTHESIZED_WIRE_1);

SevSegDisp1 <= SevSegDisp_ALTERA_SYNTHESIZED1;
SevSegDisp2 <= SevSegDisp_ALTERA_SYNTHESIZED2;

END structural;