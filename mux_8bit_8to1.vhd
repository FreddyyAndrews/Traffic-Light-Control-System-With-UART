library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_8bit_8to1 is
    Port (
        sel : in  STD_LOGIC_VECTOR (2 downto 0);
        in0: in STD_LOGIC_VECTOR (7 downto 0);
        in1: in STD_LOGIC_VECTOR (7 downto 0);
        in2: in STD_LOGIC_VECTOR (7 downto 0);
        in3: in STD_LOGIC_VECTOR (7 downto 0);
        in4: in STD_LOGIC_VECTOR (7 downto 0);
        in5: in STD_LOGIC_VECTOR (7 downto 0);
        in6: in STD_LOGIC_VECTOR (7 downto 0);
        in7: in STD_LOGIC_VECTOR (7 downto 0);
        dout : out  STD_LOGIC_VECTOR (7 downto 0)
    );
end mux_8bit_8to1;

architecture Structural of mux_8bit_8to1 is
    component mux_32to8
        Port (
            sel : in  STD_LOGIC_VECTOR (1 downto 0);
            in3: in STD_LOGIC_VECTOR (7 downto 0);
            in2: in STD_LOGIC_VECTOR (7 downto 0);
            in1: in STD_LOGIC_VECTOR (7 downto 0);
            in0: in STD_LOGIC_VECTOR (7 downto 0);
            dout : out  STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;
	 
	 component mux2x1_8 
			port( A,B: in std_logic_vector(7 downto 0);
					S: in std_logic;
					F: out std_logic_vector(7 downto 0));
		end component;


    signal temp_out,temp_out2,outAll : STD_LOGIC_VECTOR (7 downto 0);
begin
    mux0: mux_32to8 port map (sel(1 downto 0), in3, in2, in1, in0, temp_out);
    mux1: mux_32to8 port map (sel(1 downto 0), in7, in6, in5, in4, temp_out2);
    mux3: mux2x1_8 port map (temp_out, temp_out2, sel(2), outAll);
    -- Selection between the two mux outputs based on sel(2)
    dout <= outAll;
end Structural;
