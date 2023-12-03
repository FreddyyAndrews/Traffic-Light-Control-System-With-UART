
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity trigger_maker is
    port(
        clk : in std_logic; -- Input clock signal
		  GClock : in std_logic;
        trigger : out std_logic -- Output trigger signal
    );
end trigger_maker;

architecture behavioral of trigger_maker is
    signal clk_prev : std_logic := '0'; -- Signal to hold the previous clock state
begin
    process(clk)
    begin
        if rising_edge(clk) then
                trigger <= '1'; -- Trigger on the rising edge
            clk_prev <= clk; -- Update the previous clock state
        end if;
    end process;
	 
end behavioral;
