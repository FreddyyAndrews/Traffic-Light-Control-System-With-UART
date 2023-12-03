
library ieee;
use ieee.std_logic_1164.all;

entity two_to_one_mux is
    port(
        a, b, sel : in std_logic;
        y : out std_logic
    );

end entity two_to_one_mux;

architecture Structural of two_to_one_mux is
begin
    y <= (a and not sel) or (b and sel);
end Structural;