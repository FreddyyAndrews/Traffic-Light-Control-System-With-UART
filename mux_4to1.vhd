library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1 is
    Port ( sel : in  STD_LOGIC_VECTOR (1 downto 0);
           din : in  STD_LOGIC_VECTOR (3 downto 0);
           dout : out  STD_LOGIC);
end mux_4to1;

architecture arch of mux_4to1 is
begin
	
    dout <= (din(0) and (not sel(0)) and (not sel(1))) or 
            (din(1) and sel(0) and (not sel(1))) or 
            (din(2) and (not sel(0)) and sel(1)) or 
            (din(3) and sel(0) and sel(1));

end arch;