library verilog;
use verilog.vl_types.all;
entity testing_bus_vlg_sample_tst is
    port(
        AddressBus      : in     vl_logic_vector(1 downto 0);
        BClk            : in     vl_logic;
        DataBus         : in     vl_logic_vector(7 downto 0);
        RnotW           : in     vl_logic;
        sel             : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end testing_bus_vlg_sample_tst;
