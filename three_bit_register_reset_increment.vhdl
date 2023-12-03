library ieee;
use ieee.std_logic_1164.all;

entity three_bit_register_reset_increment is
    port (
        clk : in std_logic;
        reset : in std_logic;
        increment : in std_logic;
        data_out : out std_logic_vector(2 downto 0);
		equals3, equals7, equals6 : out std_logic);
end three_bit_register_reset_increment;

architecture Structural of three_bit_register_reset_increment is
    component enardFF_2
        PORT(
            i_resetBar	: IN	STD_LOGIC;
            i_d		: IN	STD_LOGIC;
            i_enable	: IN	STD_LOGIC;
            i_clock		: IN	STD_LOGIC;
            o_q, o_qBar	: OUT	STD_LOGIC);
    end component;

    component three_bit_counter_logic
        port(
            q : in std_logic_vector(2 downto 0);
            q_plus: out std_logic_vector(2 downto 0));
    end component;

    component two_to_one_mux
        port(
            a, b, sel : in std_logic;
            y : out std_logic);
    end component;

    signal temp_mux_to_ff : std_logic_vector(2 downto 0);
    signal temp_logic_to_mux : std_logic_vector(2 downto 0);
    signal temp_current_state : std_logic_vector(2 downto 0);
    signal reset_bar : std_logic;
    signal temp_equals3, temp_equals7, temp_equals6 : std_logic;

begin
    reset_bar <= not reset;
    temp_equals3 <= (not temp_current_state(2)) and temp_current_state(1) and temp_current_state(0);
    temp_equals7 <= temp_current_state(2) and temp_current_state(1) and temp_current_state(0);
    temp_equals6 <= temp_current_state(2) and temp_current_state(1) and (not temp_current_state(0));

    -- MUX for 3 bits
    mux0: two_to_one_mux port map (a => temp_current_state(0), b => temp_logic_to_mux(0), sel => increment, y => temp_mux_to_ff(0));
    mux1: two_to_one_mux port map (a => temp_current_state(1), b => temp_logic_to_mux(1), sel => increment, y => temp_mux_to_ff(1));
    mux2: two_to_one_mux port map (a => temp_current_state(2), b => temp_logic_to_mux(2), sel => increment, y => temp_mux_to_ff(2));

    -- 3-bit Counter Logic
    logic: three_bit_counter_logic port map (q => temp_current_state, q_plus => temp_logic_to_mux);

    -- D Flip-Flops for 3 bits
    dff0: enardFF_2 port map (i_resetBar => reset_bar, i_d => temp_mux_to_ff(0), i_enable => '1', i_clock => clk, o_q => temp_current_state(0), o_qBar => open);
    dff1: enardFF_2 port map (i_resetBar => reset_bar, i_d => temp_mux_to_ff(1), i_enable => '1', i_clock => clk, o_q => temp_current_state(1), o_qBar => open);
    dff2: enardFF_2 port map (i_resetBar => reset_bar, i_d => temp_mux_to_ff(2), i_enable => '1', i_clock => clk, o_q => temp_current_state(2), o_qBar => open);

    -- 3-bit Output
    data_out <= temp_current_state;
	equals3 <= temp_equals3;
    equals7 <= temp_equals7;
    equals6 <= temp_equals6;
    
end Structural;
