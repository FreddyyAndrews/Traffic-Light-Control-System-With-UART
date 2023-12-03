library verilog;
use verilog.vl_types.all;
entity lab3_vlg_sample_tst is
    port(
        GClock          : in     vl_logic;
        GReset          : in     vl_logic;
        MSC             : in     vl_logic_vector(3 downto 0);
        SSC             : in     vl_logic_vector(3 downto 0);
        SSCS            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab3_vlg_sample_tst;
