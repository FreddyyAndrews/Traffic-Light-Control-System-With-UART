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

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "11/20/2023 13:04:36"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	testing IS
    PORT (
	resetTDRE : OUT std_logic;
	GResetBar : IN std_logic;
	BClk : IN std_logic;
	TDRE : IN std_logic;
	Ready : IN std_logic;
	TIE : IN std_logic;
	counter : IN std_logic;
	setTDRE : OUT std_logic;
	resetDFF : OUT std_logic;
	LoadTSR : OUT std_logic;
	shiftTSR : OUT std_logic;
	enableDFF : OUT std_logic;
	inc_counter : OUT std_logic;
	out_1 : OUT std_logic;
	out_0 : OUT std_logic;
	rst_Counter : OUT std_logic
	);
END testing;

-- Design Ports Information
-- resetTDRE	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ready	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- setTDRE	=>  Location: PIN_AD5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resetDFF	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LoadTSR	=>  Location: PIN_AF3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shiftTSR	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enableDFF	=>  Location: PIN_AE4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inc_counter	=>  Location: PIN_AD4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_1	=>  Location: PIN_AG3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_0	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_Counter	=>  Location: PIN_AE5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- counter	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TDRE	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TIE	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BClk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GResetBar	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF testing IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_resetTDRE : std_logic;
SIGNAL ww_GResetBar : std_logic;
SIGNAL ww_BClk : std_logic;
SIGNAL ww_TDRE : std_logic;
SIGNAL ww_Ready : std_logic;
SIGNAL ww_TIE : std_logic;
SIGNAL ww_counter : std_logic;
SIGNAL ww_setTDRE : std_logic;
SIGNAL ww_resetDFF : std_logic;
SIGNAL ww_LoadTSR : std_logic;
SIGNAL ww_shiftTSR : std_logic;
SIGNAL ww_enableDFF : std_logic;
SIGNAL ww_inc_counter : std_logic;
SIGNAL ww_out_1 : std_logic;
SIGNAL ww_out_0 : std_logic;
SIGNAL ww_rst_Counter : std_logic;
SIGNAL \GResetBar~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \BClk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Ready~input_o\ : std_logic;
SIGNAL \resetTDRE~output_o\ : std_logic;
SIGNAL \setTDRE~output_o\ : std_logic;
SIGNAL \resetDFF~output_o\ : std_logic;
SIGNAL \LoadTSR~output_o\ : std_logic;
SIGNAL \shiftTSR~output_o\ : std_logic;
SIGNAL \enableDFF~output_o\ : std_logic;
SIGNAL \inc_counter~output_o\ : std_logic;
SIGNAL \out_1~output_o\ : std_logic;
SIGNAL \out_0~output_o\ : std_logic;
SIGNAL \rst_Counter~output_o\ : std_logic;
SIGNAL \BClk~input_o\ : std_logic;
SIGNAL \BClk~inputclkctrl_outclk\ : std_logic;
SIGNAL \counter~input_o\ : std_logic;
SIGNAL \TIE~input_o\ : std_logic;
SIGNAL \TDRE~input_o\ : std_logic;
SIGNAL \inst|i_0~0_combout\ : std_logic;
SIGNAL \inst|i_1~combout\ : std_logic;
SIGNAL \GResetBar~input_o\ : std_logic;
SIGNAL \GResetBar~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|dff1|int_q~q\ : std_logic;
SIGNAL \inst|i_0~combout\ : std_logic;
SIGNAL \inst|dff0|int_q~q\ : std_logic;
SIGNAL \inst|resetTDRE~combout\ : std_logic;
SIGNAL \inst|inc_counter~combout\ : std_logic;
SIGNAL \inst|reset_counter~combout\ : std_logic;
SIGNAL \inst|ALT_INV_reset_counter~combout\ : std_logic;

BEGIN

resetTDRE <= ww_resetTDRE;
ww_GResetBar <= GResetBar;
ww_BClk <= BClk;
ww_TDRE <= TDRE;
ww_Ready <= Ready;
ww_TIE <= TIE;
ww_counter <= counter;
setTDRE <= ww_setTDRE;
resetDFF <= ww_resetDFF;
LoadTSR <= ww_LoadTSR;
shiftTSR <= ww_shiftTSR;
enableDFF <= ww_enableDFF;
inc_counter <= ww_inc_counter;
out_1 <= ww_out_1;
out_0 <= ww_out_0;
rst_Counter <= ww_rst_Counter;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\GResetBar~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \GResetBar~input_o\);

\BClk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \BClk~input_o\);
\inst|ALT_INV_reset_counter~combout\ <= NOT \inst|reset_counter~combout\;

-- Location: IOOBUF_X7_Y0_N9
\resetTDRE~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|resetTDRE~combout\,
	devoe => ww_devoe,
	o => \resetTDRE~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\setTDRE~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inc_counter~combout\,
	devoe => ww_devoe,
	o => \setTDRE~output_o\);

-- Location: IOOBUF_X7_Y0_N16
\resetDFF~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|resetTDRE~combout\,
	devoe => ww_devoe,
	o => \resetDFF~output_o\);

-- Location: IOOBUF_X7_Y0_N23
\LoadTSR~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|resetTDRE~combout\,
	devoe => ww_devoe,
	o => \LoadTSR~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\shiftTSR~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|dff1|int_q~q\,
	devoe => ww_devoe,
	o => \shiftTSR~output_o\);

-- Location: IOOBUF_X3_Y0_N23
\enableDFF~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|dff1|int_q~q\,
	devoe => ww_devoe,
	o => \enableDFF~output_o\);

-- Location: IOOBUF_X1_Y0_N9
\inc_counter~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inc_counter~combout\,
	devoe => ww_devoe,
	o => \inc_counter~output_o\);

-- Location: IOOBUF_X3_Y0_N16
\out_1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|dff1|int_q~q\,
	devoe => ww_devoe,
	o => \out_1~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\out_0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|dff0|int_q~q\,
	devoe => ww_devoe,
	o => \out_0~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\rst_Counter~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_reset_counter~combout\,
	devoe => ww_devoe,
	o => \rst_Counter~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\BClk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BClk,
	o => \BClk~input_o\);

-- Location: CLKCTRL_G2
\BClk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \BClk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \BClk~inputclkctrl_outclk\);

-- Location: IOIBUF_X5_Y0_N8
\counter~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counter,
	o => \counter~input_o\);

-- Location: IOIBUF_X1_Y0_N1
\TIE~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TIE,
	o => \TIE~input_o\);

-- Location: IOIBUF_X1_Y0_N15
\TDRE~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TDRE,
	o => \TDRE~input_o\);

-- Location: LCCOMB_X1_Y1_N24
\inst|i_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i_0~0_combout\ = (\TIE~input_o\ & \TDRE~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TIE~input_o\,
	datad => \TDRE~input_o\,
	combout => \inst|i_0~0_combout\);

-- Location: LCCOMB_X5_Y1_N10
\inst|i_1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i_1~combout\ = (\inst|dff1|int_q~q\ & (\counter~input_o\ & !\inst|dff0|int_q~q\)) # (!\inst|dff1|int_q~q\ & ((\inst|dff0|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter~input_o\,
	datac => \inst|dff1|int_q~q\,
	datad => \inst|dff0|int_q~q\,
	combout => \inst|i_1~combout\);

-- Location: IOIBUF_X0_Y36_N15
\GResetBar~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GResetBar,
	o => \GResetBar~input_o\);

-- Location: CLKCTRL_G4
\GResetBar~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \GResetBar~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \GResetBar~inputclkctrl_outclk\);

-- Location: FF_X5_Y1_N11
\inst|dff1|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \inst|i_1~combout\,
	clrn => \GResetBar~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|dff1|int_q~q\);

-- Location: LCCOMB_X5_Y1_N12
\inst|i_0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i_0~combout\ = (!\inst|dff0|int_q~q\ & ((\inst|dff1|int_q~q\ & (\counter~input_o\)) # (!\inst|dff1|int_q~q\ & ((\inst|i_0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter~input_o\,
	datab => \inst|i_0~0_combout\,
	datac => \inst|dff0|int_q~q\,
	datad => \inst|dff1|int_q~q\,
	combout => \inst|i_0~combout\);

-- Location: FF_X5_Y1_N13
\inst|dff0|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \inst|i_0~combout\,
	clrn => \GResetBar~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|dff0|int_q~q\);

-- Location: LCCOMB_X5_Y1_N24
\inst|resetTDRE\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|resetTDRE~combout\ = (\inst|dff0|int_q~q\ & !\inst|dff1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|dff0|int_q~q\,
	datad => \inst|dff1|int_q~q\,
	combout => \inst|resetTDRE~combout\);

-- Location: LCCOMB_X5_Y1_N30
\inst|inc_counter\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inc_counter~combout\ = (!\inst|dff0|int_q~q\ & \inst|dff1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|dff0|int_q~q\,
	datad => \inst|dff1|int_q~q\,
	combout => \inst|inc_counter~combout\);

-- Location: LCCOMB_X5_Y1_N4
\inst|reset_counter\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reset_counter~combout\ = (\inst|dff0|int_q~q\) # (\inst|dff1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|dff0|int_q~q\,
	datad => \inst|dff1|int_q~q\,
	combout => \inst|reset_counter~combout\);

-- Location: IOIBUF_X69_Y73_N22
\Ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Ready,
	o => \Ready~input_o\);

ww_resetTDRE <= \resetTDRE~output_o\;

ww_setTDRE <= \setTDRE~output_o\;

ww_resetDFF <= \resetDFF~output_o\;

ww_LoadTSR <= \LoadTSR~output_o\;

ww_shiftTSR <= \shiftTSR~output_o\;

ww_enableDFF <= \enableDFF~output_o\;

ww_inc_counter <= \inc_counter~output_o\;

ww_out_1 <= \out_1~output_o\;

ww_out_0 <= \out_0~output_o\;

ww_rst_Counter <= \rst_Counter~output_o\;
END structure;


