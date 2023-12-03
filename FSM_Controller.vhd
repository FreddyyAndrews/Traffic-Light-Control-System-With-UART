LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity FSM_Controller is
	port(
		Deb_out, Ctr_expired, MST, SST, GClock, GReset : IN std_logic;
		MSTS, SSTS : OUT std_logic_vector(2 downto 0);
		ST, Set_Ctr, Sel, RC : OUT std_logic
	);
end FSM_Controller;
	
architecture rtl of FSM_Controller is
	Signal resetBar, q1, notq1, q0, notq0, i_q1, i_q0 : std_logic;
	
	component enardFF_2
		port(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC
		);
	end component;
	
begin
	resetBar <= not(GReset);
	d1 : enardFF_2
		port map(
			i_resetBar => resetBar,
			i_d => i_q1,
			i_enable => '1',
			i_clock => GClock,
			o_q => q1,
			o_qBar => notq1
		);
		
	d0 : enardFF_2
		port map(
			i_resetBar => resetBar,
			i_d => i_q0,
			i_enable => '1',
			i_clock => GClock,
			o_q => q0,
			o_qBar => notq0
		);
	
	i_q1 <= (not(q1) and q0 and MST) or (q1 and not(q0)) or (q1 and q0 and not(SST));
	i_q0 <= (not(q1) and not(q0) and DEb_out and Ctr_expired) or (not(q1) and q0 and not(MST)) or (q1 and not(q0) and Ctr_expired) or (q1 and q0 and not(SST));
	MSTS <= q1 & (not(q1) and q0) & (not(q1) and not(q0));
	SSTS <= not(q1) & (q1 and q0) & (q1 and not(q0));
	ST <= q0;
	Set_Ctr <= not(q0) and not (Ctr_expired);
	Sel <= q1;
    RC <= q0 or GReset;

end rtl;