library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_32to8 is
    Port ( sel : in  STD_LOGIC_VECTOR (1 downto 0);
				in3: in STD_LOGIC_VECTOR (7 downto 0);
				in2: in STD_LOGIC_VECTOR (7 downto 0);
				in1: in STD_LOGIC_VECTOR (7 downto 0);
				in0: in STD_LOGIC_VECTOR (7 downto 0);
				
				dout : out  STD_LOGIC_VECTOR (7 downto 0));
end mux_32to8;

architecture Structural of mux_32to8 is
    component mux_4to1
        Port ( sel : in  STD_LOGIC_VECTOR (1 downto 0);
               din : in  STD_LOGIC_VECTOR (3 downto 0);
               dout : out  STD_LOGIC);
    end component;

    type din_segments_array is array (0 to 7) of STD_LOGIC_VECTOR (3 downto 0);

	 signal din : STD_LOGIC_VECTOR (31 downto 0);
	 
	 
    signal temp_out : STD_LOGIC_VECTOR (7 downto 0);
    signal din_segments : din_segments_array;
	 
begin
        din(31 downto 24) <= in0;
        din(23 downto 16) <= in1;
        din(15 downto 8) <= in2;
        din(7 downto 0) <= in3;
    gen: for i in 0 to 7 generate
        din_segments(i) <= din(i) & din(i+8) & din(i+16) & din(i+24);
        uut: mux_4to1 port map (sel, din_segments(i), temp_out(i));
    end generate;

    dout <= temp_out;
end Structural;