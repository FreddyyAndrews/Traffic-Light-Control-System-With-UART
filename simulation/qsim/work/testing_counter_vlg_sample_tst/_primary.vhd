library verilog;
use verilog.vl_types.all;
entity testing_counter_vlg_sample_tst is
    port(
        BClkx8          : in     vl_logic;
        GReset          : in     vl_logic;
        RxD             : in     vl_logic;
        setTxRx         : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end testing_counter_vlg_sample_tst;
