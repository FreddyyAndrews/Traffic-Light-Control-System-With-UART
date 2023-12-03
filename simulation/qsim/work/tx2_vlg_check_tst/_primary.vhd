library verilog;
use verilog.vl_types.all;
entity tx2_vlg_check_tst is
    port(
        TxD             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end tx2_vlg_check_tst;
