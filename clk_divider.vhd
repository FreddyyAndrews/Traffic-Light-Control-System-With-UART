library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- use '+' operator, CONV_INTEGER func.

entity clk_divider is
    port(
        Sysclk, rst_b: in std_logic;
        Sel: in std_logic_vector(2 downto 0);
        BclkX8: buffer std_logic;
        Bclk: out std_logic
    );
end clk_divider;

architecture baudgen of clk_divider is
    signal ctr1: std_logic_vector(21 downto 0) := "0000000000000000000000"; -- divide by 41 counter
    signal ctr2: std_logic_vector(7 downto 0) := "00000000"; -- div by 256 counter
    signal ctr3: std_logic_vector(2 downto 0) := "000"; -- divide by 8 counter
    signal Clkdiv41: std_logic := '0';
begin

    -- first divide system clock by 41
    process (Sysclk)
    begin
        if rising_edge(Sysclk) then
            if (ctr1 = "1111111111111111101001") then -- 41 in binary
                ctr1 <= "0000000000000000000000";
                Clkdiv41 <= '1'; -- Pulse for one clock cycle
            else
                ctr1 <= ctr1 + 1;
                Clkdiv41 <= '0'; -- Ensure Clkdiv41 is low by default
            end if;
        end if;
    end process;

    -- clk_divdr is an 8-bit counter
    process (Clkdiv41)
    begin
        if rising_edge(Clkdiv41) then
            ctr2 <= ctr2 + 1;
        end if;
    end process;

    -- select baud rate
    BclkX8 <= ctr2(CONV_INTEGER(Sel)); 

    -- divide BclkX8 by 8
    process (BclkX8)
    begin
        if rising_edge(BclkX8) then
            ctr3 <= ctr3 + 1;
        end if;
    end process;

    -- Bclk is BclkX8 divided by 8
    Bclk <= ctr3(2); 

end baudgen;
