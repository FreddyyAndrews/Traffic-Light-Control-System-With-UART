library ieee;
use ieee.std_logic_1164.all;

entity four_bit_register_reset_increment is
    port (
        clk : in std_logic;
        reset : in std_logic;
        increment : in std_logic;
        data_out : out std_logic_vector(3 downto 0);
		  counter_3 : out std_LOGIC
    );
end four_bit_register_reset_increment;

architecture Structural of four_bit_register_reset_increment is
    component enardFF_2
        PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
    end component;

    component four_bit_counter_logic
        port(
            q : in std_logic_vector(3 downto 0);
            q_plus: out std_logic_vector(3 downto 0));
    end component;

    component two_to_one_mux
        port(
            a, b, sel : in std_logic;
            y : out std_logic);
    end component;

    signal temp_mux_to_ff : std_logic_vector(3 downto 0);
    signal temp_logic_to_mux : std_logic_vector(3 downto 0);
    signal temp_current_state : std_logic_vector(3 downto 0);
    signal reset_bar : std_logic;

begin
    reset_bar <= not reset;

    mux0: two_to_one_mux port map (a => temp_current_state(0), b => temp_logic_to_mux(0), sel => increment, y => temp_mux_to_ff(0));
    mux1: two_to_one_mux port map (a => temp_current_state(1), b => temp_logic_to_mux(1), sel => increment, y => temp_mux_to_ff(1));
    mux2: two_to_one_mux port map (a => temp_current_state(2), b => temp_logic_to_mux(2), sel => increment, y => temp_mux_to_ff(2));
    mux3: two_to_one_mux port map (a => temp_current_state(3), b => temp_logic_to_mux(3), sel => increment, y => temp_mux_to_ff(3));

    logic: four_bit_counter_logic port map (q => temp_current_state, q_plus => temp_logic_to_mux);

    dff0: enardFF_2 port map (i_resetBar => reset_bar, i_d => temp_mux_to_ff(0), i_enable => '1', i_clock => clk, o_q => temp_current_state(0), o_qBar => open);
    dff1: enardFF_2 port map (i_resetBar => reset_bar, i_d => temp_mux_to_ff(1), i_enable => '1', i_clock => clk, o_q => temp_current_state(1), o_qBar => open);
    dff2: enardFF_2 port map (i_resetBar => reset_bar, i_d => temp_mux_to_ff(2), i_enable => '1', i_clock => clk, o_q => temp_current_state(2), o_qBar => open);
    dff3: enardFF_2 port map (i_resetBar => reset_bar, i_d => temp_mux_to_ff(3), i_enable => '1', i_clock => clk, o_q => temp_current_state(3), o_qBar => open);

    data_out <= temp_current_state;
    counter_3 <= temp_current_state(3);
end Structural;