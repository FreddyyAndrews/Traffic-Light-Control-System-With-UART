
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SignalGenerator is
    Port ( clk : in STD_LOGIC;
           signal_out : out STD_LOGIC);
end SignalGenerator;

architecture Behavioral of SignalGenerator is
    signal counter : integer range 0 to 50000; -- Counter for 1-second duration
    signal output_state : STD_LOGIC := '0'; -- Output state (0 or 1)
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if counter = 0 then
                -- Generate a 20 ns pulse every 1 second
                output_state <= '1';
            elsif counter = 1 then
                -- Generate a 20 ns pulse every 1 second
                output_state <= '1';
					           
				else 
                -- Keep the signal low for the rest of the time
                output_state <= '0';
            end if;

            -- Increment the counter and reset after 1 second
            if counter < 50000 then
            --if counter < 5 then
				counter <= counter + 1;
            else
                counter <= 0;
            end if;
				
        end if;
    end process;

    -- Assign the output signal
    signal_out <= output_state;

end Behavioral;
