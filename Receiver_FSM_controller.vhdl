library ieee;
use ieee.std_logic_1164.all;

ENTITY Receiver_FSM_controller IS
    PORT(
        BClkx8 : IN std_logic;
        GReset : IN std_logic;
        RxD : IN std_logic;
        c2: IN std_logic;
        b3: IN std_logic;
        d3: IN std_logic;
		  setTxRx: IN std_logic_vector(1 downto 0);
        shift, set_FE, RDRF, c_reset, b_reset, d_reset, c_inc, b_inc, d_inc: OUT std_logic;
        states_out: OUT std_logic_vector(5 downto 0);
		  reset_FE : out std_LOGIC);
END ENTITY Receiver_FSM_controller;

ARCHITECTURE Structual OF Receiver_FSM_controller IS

    component enARdFF_2 IS
    PORT(
        i_resetBar	: IN	STD_LOGIC;
        i_d		: IN	STD_LOGIC;
        i_enable	: IN	STD_LOGIC;
        i_clock		: IN	STD_LOGIC;
        o_q, o_qBar	: OUT	STD_LOGIC);
    END component;

    signal i_d0, i_d1, i_d2, i_d3, i_d4, i_d5: std_logic;
    signal start, A, B, C, D, E, F: std_logic;
    signal anystate, GResetBar, notAnyStateButStart : std_logic;
    signal temp_states_out: std_logic_vector(5 downto 0);
    signal temp_shift, temp_set_FE, temp_reset_FE, temp_RDRF, temp_c_reset, temp_b_reset, temp_d_reset, temp_c_inc, temp_b_inc, temp_d_inc, enable: std_logic;

begin
		--enable <= (not setTxRx(0)) and (not setTxRx(1));
		enable <= '1';
    GResetBar <= not (GReset);
    anystate  <= (start or A or B or C or D or E or F);
    notAnyStateButStart <= not(A or B or C or D or E or F);

    i_d0 <= start or (A and RxD) or (B and RxD) or F or E or (not enable);
    i_d1 <= ((A and (not RxD)) or (B and (not RxD) and (not c2))) and enable;
    i_d2 <= ((B and (not RxD) and c2) or (C and (not b3)) or D) and enable;
    i_d3 <= ((C and b3 and (not d3))) and enable;
    i_d4 <= ((C and b3 and d3 and (not RxD))) and enable;
    i_d5 <= ((C and b3 and d3 and RxD)) and enable;

    startFF : enardFF_2 port map
        (
          i_resetBar => notAnyStateButStart,
          i_d        => '1',
          i_enable   => '1',
          i_clock    => BClkx8,
          o_q        => start,
          o_qBar     => open
        );

    AFF : enardFF_2 port map
        (
          i_resetBar => GResetBar,
          i_d        => i_d0,
          i_enable   => '1',
          i_clock    => BClkx8,
          o_q        => A,
          o_qBar     => open
        );

    BFF : enardFF_2 port map
        (
          i_resetBar => GResetBar,
          i_d        => i_d1,
          i_enable   => '1',
          i_clock    => BClkx8,
          o_q        => B,
          o_qBar     => open
        );

    CFF : enardFF_2 port map
        (
          i_resetBar => GResetBar,
          i_d        => i_d2,
          i_enable   => '1',
          i_clock    => BClkx8,
          o_q        => C,
          o_qBar     => open
        );

    DFF : enardFF_2 port map
        (
          i_resetBar => GResetBar,
          i_d        => i_d3,
          i_enable   => '1',
          i_clock    => BClkx8,
          o_q        => D,
          o_qBar     => open
        );

    EFF : enardFF_2 port map
        (
          i_resetBar => GResetBar,
          i_d        => i_d4,
          i_enable   => '1',
          i_clock    => BClkx8,
          o_q        => E,
          o_qBar     => open
        );

    FFF : enardFF_2 port map
        (
          i_resetBar => GResetBar,
          i_d        => i_d5,
          i_enable   => '1',
          i_clock    => BClkx8,
          o_q        => F,
          o_qBar     => open
        );

    temp_states_out <= F & E & D & C & B & A;
    states_out <= temp_states_out;

    temp_shift <= D;
    shift <= temp_shift;

    temp_set_FE <= E;
    set_FE <= temp_set_FE;

    temp_RDRF <= F or E;
    RDRF <= temp_RDRF;

    temp_c_reset <= A;
    c_reset <= temp_c_reset;

    temp_b_reset <= D;
    b_reset <= temp_b_reset;

    temp_d_reset <= A;
    d_reset <= temp_d_reset;

    temp_c_inc <= B;
    c_inc <= temp_c_inc;

    temp_b_inc <= C;
    b_inc <= temp_b_inc;

    temp_d_inc <= D;
    d_inc <= temp_d_inc;
	 
	 temp_reset_FE <= F;
	 reset_FE <= temp_reset_FE;

end Structual;





    