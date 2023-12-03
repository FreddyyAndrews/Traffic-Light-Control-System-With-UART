library verilog;
use verilog.vl_types.all;
entity testing_bus_vlg_check_tst is
    port(
        andgates        : in     vl_logic;
        DoneTx          : in     vl_logic;
        o_s1            : in     vl_logic;
        o_s2            : in     vl_logic;
        o_TDRE          : in     vl_logic;
        startTx         : in     vl_logic;
        TxD             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end testing_bus_vlg_check_tst;
