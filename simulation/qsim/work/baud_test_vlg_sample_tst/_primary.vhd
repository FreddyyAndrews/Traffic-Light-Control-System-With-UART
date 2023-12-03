library verilog;
use verilog.vl_types.all;
entity baud_test_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        sel             : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end baud_test_vlg_sample_tst;
