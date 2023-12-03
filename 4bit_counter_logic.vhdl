library ieee;
use ieee.std_logic_1164.all;

entity four_bit_counter_logic is
    port(
        q : in std_logic_vector(3 downto 0);
        q_plus: out std_logic_vector(3 downto 0)
    );
end entity four_bit_counter_logic;

architecture Structural of four_bit_counter_logic is
begin
    q_plus(0) <= (not q(0));
    q_plus(1) <= q(0) xor q(1);
    q_plus(2) <= (q(0) and q(1)) xor q(2);
    q_plus(3) <= ((q(0) and q(1)) and q(2)) xor q(3);
end Structural;
