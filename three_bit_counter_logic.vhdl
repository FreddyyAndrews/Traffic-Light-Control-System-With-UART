library ieee;
use ieee.std_logic_1164.all;

entity three_bit_counter_logic is
    port(
        q : in std_logic_vector(2 downto 0);
        q_plus: out std_logic_vector(2 downto 0)
    );
end entity three_bit_counter_logic;

architecture Structural of three_bit_counter_logic is
begin
    q_plus(0) <= (not q(0));
    q_plus(1) <= q(0) xor q(1);
    q_plus(2) <= (q(0) and q(1)) xor q(2);
end Structural;
