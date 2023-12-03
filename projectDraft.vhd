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
-- CREATED		"Tue Nov 28 12:06:34 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY projectDraft IS 
	PORT
	(
		SSCS :  IN  STD_LOGIC;
		GReset :  IN  STD_LOGIC;
		GClock :  IN  STD_LOGIC;
		Tx_trigger :  IN  STD_LOGIC;
		RxD :  IN  STD_LOGIC;
		BaudSel :  IN  STD_LOGIC_VECTOR(0 TO 2);
		MSC :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		SSC :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		TxD :  OUT  STD_LOGIC;
		doneOneTransimission :  OUT  STD_LOGIC;
		BCLkx8 :  OUT  STD_LOGIC;
		BClk :  OUT  STD_LOGIC;
		U_SetBaudRate :  OUT  STD_LOGIC;
		U_rnotW :  OUT  STD_LOGIC;
		pin_name1 :  OUT  STD_LOGIC;
		BusOutput :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		MSTS :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		RDR :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SSTS :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		statess_out_rx :  OUT  STD_LOGIC_VECTOR(5 DOWNTO 0);
		tdr :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Tx_sattes :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		U_AddressBus :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		U_o_counter :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		U_SetTxRx :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		U_states :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END projectDraft;

ARCHITECTURE bdf_type OF projectDraft IS 

COMPONENT txdesign
	PORT(RnotW : IN STD_LOGIC;
		 GResetBar : IN STD_LOGIC;
		 BClk : IN STD_LOGIC;
		 i_TDRE : IN STD_LOGIC;
		 AddressBus : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 DataBus : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 and4bit : OUT STD_LOGIC;
		 TxD : OUT STD_LOGIC;
		 o_TDRE : OUT STD_LOGIC;
		 DoneTx : OUT STD_LOGIC;
		 startTx : OUT STD_LOGIC;
		 o_s1 : OUT STD_LOGIC;
		 o_s0 : OUT STD_LOGIC;
		 TRE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT clk_divider
	PORT(Sysclk : IN STD_LOGIC;
		 rst_b : IN STD_LOGIC;
		 Sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 BclkX8 : OUT STD_LOGIC;
		 Bclk : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT receiver
	PORT(BClkx8 : IN STD_LOGIC;
		 RxD : IN STD_LOGIC;
		 GReset : IN STD_LOGIC;
		 setTxRx : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 shift : OUT STD_LOGIC;
		 set_FE : OUT STD_LOGIC;
		 RDRF : OUT STD_LOGIC;
		 reset_FE : OUT STD_LOGIC;
		 RDR_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 states_out : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uart_fsm
	PORT(GClock : IN STD_LOGIC;
		 GReset : IN STD_LOGIC;
		 TxClock : IN STD_LOGIC;
		 TxDone : IN STD_LOGIC;
		 BaudSelIn : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 dataBus : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 MSTS : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 SSTS : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 SetBaudRate : OUT STD_LOGIC;
		 RnotW : OUT STD_LOGIC;
		 o_s1 : OUT STD_LOGIC;
		 o_s2 : OUT STD_LOGIC;
		 o_s0 : OUT STD_LOGIC;
		 o_doneOneTransmission : OUT STD_LOGIC;
		 o_counter_inc : OUT STD_LOGIC;
		 o_loadBus : OUT STD_LOGIC;
		 o_counter_reset : OUT STD_LOGIC;
		 AddressBus : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 BaudSelOut : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 dataBusOutput : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 o_counter_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 SelTxRx : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT eightbitregistersingle
	PORT(i_resetBar : IN STD_LOGIC;
		 i_load : IN STD_LOGIC;
		 i_clock : IN STD_LOGIC;
		 iValue0 : IN STD_LOGIC;
		 iValue1 : IN STD_LOGIC;
		 iValue2 : IN STD_LOGIC;
		 iValue3 : IN STD_LOGIC;
		 iValue4 : IN STD_LOGIC;
		 iValue5 : IN STD_LOGIC;
		 iValue6 : IN STD_LOGIC;
		 iValue7 : IN STD_LOGIC;
		 o_Value0 : OUT STD_LOGIC;
		 o_Value1 : OUT STD_LOGIC;
		 o_Value2 : OUT STD_LOGIC;
		 o_Value3 : OUT STD_LOGIC;
		 o_Value4 : OUT STD_LOGIC;
		 o_Value5 : OUT STD_LOGIC;
		 o_Value6 : OUT STD_LOGIC;
		 o_Value7 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT bushandleruart
	PORT(RnotW : IN STD_LOGIC;
		 AddressBus : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 BusInputFromFSM : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 RDRinput : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 SCCRinput : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 SCSRinput : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 BusOutputFromUART : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lab3vhdl
	PORT(SSCS : IN STD_LOGIC;
		 GReset : IN STD_LOGIC;
		 GClock : IN STD_LOGIC;
		 MSC : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 SSC : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 BCD1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 BCD2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 counter_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 MSTS : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 SevSegDisp1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		 SevSegDisp2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		 SSTS : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	RDRout :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SCSR :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	Tx_states :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	u_states_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(0 TO 7);


BEGIN 
BCLkx8 <= SYNTHESIZED_WIRE_8;
BClk <= SYNTHESIZED_WIRE_2;
U_rnotW <= SYNTHESIZED_WIRE_22;
BusOutput <= SYNTHESIZED_WIRE_20;
MSTS <= SYNTHESIZED_WIRE_12;
SSTS <= SYNTHESIZED_WIRE_13;
U_AddressBus <= SYNTHESIZED_WIRE_24;
U_SetTxRx <= SYNTHESIZED_WIRE_26;
SYNTHESIZED_WIRE_15 <= '1';
SYNTHESIZED_WIRE_17 <= '1';
SYNTHESIZED_WIRE_21 <= "00000000";



b2v_inst : txdesign
PORT MAP(RnotW => SYNTHESIZED_WIRE_22,
		 GResetBar => SYNTHESIZED_WIRE_23,
		 BClk => SYNTHESIZED_WIRE_2,
		 i_TDRE => SYNTHESIZED_WIRE_23,
		 AddressBus => SYNTHESIZED_WIRE_24,
		 DataBus => SYNTHESIZED_WIRE_25,
		 sel => SYNTHESIZED_WIRE_26,
		 TxD => TxD,
		 DoneTx => SYNTHESIZED_WIRE_27,
		 startTx => pin_name1,
		 o_s1 => Tx_states(1),
		 o_s0 => Tx_states(0),
		 TRE => tdr);





b2v_inst2 : clk_divider
PORT MAP(Sysclk => GClock,
		 rst_b => GReset,
		 Sel => SYNTHESIZED_WIRE_7,
		 BclkX8 => SYNTHESIZED_WIRE_8,
		 Bclk => SYNTHESIZED_WIRE_2);


b2v_inst3 : receiver
PORT MAP(BClkx8 => SYNTHESIZED_WIRE_8,
		 RxD => RxD,	
		 GReset => GReset,
		 setTxRx => SYNTHESIZED_WIRE_26,
		 RDR_out => RDRout,
		 states_out => statess_out_rx);


b2v_inst5 : uart_fsm
PORT MAP(GClock => GClock,
		 GReset => GReset,
		 TxClock => Tx_trigger,
		 TxDone => SYNTHESIZED_WIRE_27,
		 BaudSelIn => BaudSel,
		 dataBus => SYNTHESIZED_WIRE_25,
		 MSTS => SYNTHESIZED_WIRE_12,
		 SSTS => SYNTHESIZED_WIRE_13,
		 SetBaudRate => U_SetBaudRate,
		 RnotW => SYNTHESIZED_WIRE_22,
		 o_s1 => u_states_ALTERA_SYNTHESIZED(1),
		 o_s2 => u_states_ALTERA_SYNTHESIZED(2),
		 o_s0 => u_states_ALTERA_SYNTHESIZED(0),
		 o_doneOneTransmission => doneOneTransimission,
		 AddressBus => SYNTHESIZED_WIRE_24,
		 BaudSelOut => SYNTHESIZED_WIRE_7,
		 dataBusOutput => SYNTHESIZED_WIRE_20,
		 o_counter_out => U_o_counter,
		 SelTxRx => SYNTHESIZED_WIRE_26);


b2v_inst7 : eightbitregistersingle
PORT MAP(i_resetBar => SYNTHESIZED_WIRE_23,
		i_clock => SYNTHESIZED_WIRE_8,
		 i_load => SYNTHESIZED_WIRE_15,
		 iValue0 => '0',
		 iValue1 => '0',
		 iValue2 => '0',
		 iValue3 => '0',		 
		 iValue4 => '0',
		 iValue6 => '0',
		 iValue5 => SYNTHESIZED_WIRE_27,
		 iValue7 => SYNTHESIZED_WIRE_17,
		 o_Value0 => SCSR(0),
		 o_Value1 => SCSR(1),
		 o_Value2 => SCSR(2),
		 o_Value3 => SCSR(3),
		 o_Value4 => SCSR(4),
		 o_Value5 => SCSR(5),
		 o_Value6 => SCSR(6),
		 o_Value7 => SCSR(7));


b2v_inst8 : bushandleruart
PORT MAP(RnotW => SYNTHESIZED_WIRE_22,
		 AddressBus => SYNTHESIZED_WIRE_24,
		 BusInputFromFSM => SYNTHESIZED_WIRE_20,
		 RDRinput => RDRout,
		 SCCRinput => SYNTHESIZED_WIRE_21,
		 SCSRinput => SCSR,
		 BusOutputFromUART => SYNTHESIZED_WIRE_25);


SYNTHESIZED_WIRE_23 <= NOT(GReset);



b2v_instlab3 : lab3vhdl
PORT MAP(SSCS => SSCS,
		 GReset => GReset,
		 GClock => GClock,
		 MSC => MSC,
		 SSC => SSC,
		 MSTS => SYNTHESIZED_WIRE_12,
		 SSTS => SYNTHESIZED_WIRE_13);

RDR <= RDRout;
Tx_sattes <= Tx_states;
U_states <= u_states_ALTERA_SYNTHESIZED;

END bdf_type;