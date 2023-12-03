library ieee;
use ieee.std_logic_1164.all;
entity eightBitRightShiftRegister is
    PORT (
        serial_input : in std_logic;
        shift_right : in std_logic;
        clk: in std_logic;
        parralel_output : out std_logic_vector(7 downto 0));
end eightBitRightShiftRegister;
architecture Structural of eightBitRightShiftRegister is
    signal temp_q : std_logic_vector(7 downto 0);
    component enardFF_2
        PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
    end component;
begin
    dff0: enardFF_2 port map(
        i_d => serial_input,
        i_clock => clk,
        o_q => temp_q(0),
        i_enable => shift_right,
        i_resetBar => '1'
    );
    dff1: enardFF_2 port map(
        i_d => temp_q(0),
        i_clock => clk,
        o_q => temp_q(1),
        i_enable => shift_right,
        i_resetBar => '1'
    );
    dff2: enardFF_2 port map(
        i_d => temp_q(1),
        i_clock => clk,
        o_q => temp_q(2),
        i_enable => shift_right,
        i_resetBar => '1'
    );
    dff3: enardFF_2 port map(
        i_d => temp_q(2),
        i_clock => clk,
        o_q => temp_q(3),
        i_enable => shift_right,
        i_resetBar => '1'
    );
    dff4: enardFF_2 port map(
        i_d => temp_q(3),
        i_clock => clk,
        o_q => temp_q(4),
        i_enable => shift_right,
        i_resetBar => '1'
    );
    dff5: enardFF_2 port map(
        i_d => temp_q(4),
        i_clock => clk,
        o_q => temp_q(5),
        i_enable => shift_right,
        i_resetBar => '1'
    );
    dff6: enardFF_2 port map(
        i_d => temp_q(5),
        i_clock => clk,
        o_q => temp_q(6),
        i_enable => shift_right,
        i_resetBar => '1'
    );
    dff7: enardFF_2 port map(
        i_d => temp_q(6),
        i_clock => clk,
        o_q => temp_q(7),
        i_enable => shift_right,
        i_resetBar => '1'
    );
    parralel_output <= temp_q;
end Structural;