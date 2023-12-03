library verilog;
use verilog.vl_types.all;
entity baud_test_vlg_check_tst is
    port(
        Bclk            : in     vl_logic;
        BclkX8          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end baud_test_vlg_check_tst;
