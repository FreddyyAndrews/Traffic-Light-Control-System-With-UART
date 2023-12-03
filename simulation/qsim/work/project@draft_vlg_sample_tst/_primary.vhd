library verilog;
use verilog.vl_types.all;
entity projectDraft_vlg_sample_tst is
    port(
        BaudSel         : in     vl_logic_vector(0 to 2);
        GClock          : in     vl_logic;
        GReset          : in     vl_logic;
        MSC             : in     vl_logic_vector(3 downto 0);
        RxD             : in     vl_logic;
        SSC             : in     vl_logic_vector(3 downto 0);
        SSCS            : in     vl_logic;
        Tx_trigger      : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end projectDraft_vlg_sample_tst;
