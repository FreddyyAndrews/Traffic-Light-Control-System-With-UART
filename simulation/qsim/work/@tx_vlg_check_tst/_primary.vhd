library verilog;
use verilog.vl_types.all;
entity Tx_vlg_check_tst is
    port(
        DoneTx          : in     vl_logic;
        o_TDRE          : in     vl_logic;
        TxD             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Tx_vlg_check_tst;
