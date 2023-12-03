library verilog;
use verilog.vl_types.all;
entity baud_test is
    port(
        BclkX8          : out    vl_logic;
        clk             : in     vl_logic;
        sel             : in     vl_logic_vector(2 downto 0);
        Bclk            : out    vl_logic
    );
end baud_test;
