library verilog;
use verilog.vl_types.all;
entity tx2_vlg_sample_tst is
    port(
        BClk            : in     vl_logic;
        BUSINPUT        : in     vl_logic_vector(7 downto 0);
        GResetBar       : in     vl_logic;
        loadTDR         : in     vl_logic;
        startTx         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end tx2_vlg_sample_tst;
