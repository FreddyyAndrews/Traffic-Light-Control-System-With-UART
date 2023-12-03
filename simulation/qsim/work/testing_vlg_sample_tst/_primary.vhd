library verilog;
use verilog.vl_types.all;
entity testing_vlg_sample_tst is
    port(
        dataBus         : in     vl_logic_vector(7 downto 0);
        GClock          : in     vl_logic;
        GReset          : in     vl_logic;
        MSTS            : in     vl_logic_vector(2 downto 0);
        SSTS            : in     vl_logic_vector(2 downto 0);
        TxClock         : in     vl_logic;
        TxDoje          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end testing_vlg_sample_tst;
