library ieee;
use ieee.std_logic_1164.all;

entity Tx_controller is
    PORT (
        GResetBar, BClk, startTx , counter_3 : in std_logic;
        --resetTDRE, 
		  TDRE, resetDFF, loadTSR, shiftTSR, enableFF, inc_counter, reset_counter, DoneTx, o_s1, o_s0 : out std_logic);
end Tx_controller;

architecture Structural of Tx_controller is

    component enardFF_2
        PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
    end component;

    component eightBitRegister
	    PORT(
		i_resetBar, i_load : IN STD_LOGIC;
		i_clock : IN STD_LOGIC;
		i_Value : IN STD_LOGIC_VECTOR(7 downto 0);
		o_Value : OUT STD_LOGIC_VECTOR(7 downto 0));
    end component;

    component eight_bit_right_shift_register 
        PORT (
            parralel_input : in std_logic_vector(7 downto 0);
            load : in std_logic;
            serial_input : in std_logic;
            shift_right : in std_logic;
            clk: in std_logic;
            right_output : out std_logic);
        end component;

    signal i_0, i_1, o_1, o_0 : std_logic;

begin

    dff0: enardFF_2 port map(
        i_d => i_0,
        i_clock => BClk,
        o_q => o_0,
        i_enable => '1',
        i_resetBar => GResetBar
    );

    dff1: enardFF_2 port map(
        i_d => i_1,
        i_clock => BClk,
        o_q => o_1,
        i_enable => '1',
        i_resetBar => GResetBar
    );

    reset_counter <= not(o_1) and not(o_0);
	 --resetTDRE <= not(o_1) and (o_0);
	 resetDFF <= not(o_1) and (o_0);
	 loadTSR <= not(o_1) and (o_0);
	 shiftTSR <= (o_1);
	 enableFF <= (o_1) or (not(o_1) and not(o_0));
	 inc_counter <=(o_1) and not(o_0);
	 TDRE <= (o_1) and(o_0);
	 DoneTx <= (o_1) and (o_0);

	i_1 <= (o_1 and not o_0) or (not(o_1) and o_0);
	i_0 <= (not(o_1 or o_0)and startTx) or ((o_1 and not(o_0)) and counter_3);
	
	o_s1<=o_1;
	o_s0<=o_0;
end Structural;