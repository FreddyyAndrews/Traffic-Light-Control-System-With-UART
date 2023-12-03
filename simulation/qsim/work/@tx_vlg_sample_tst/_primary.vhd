library verilog;
use verilog.vl_types.all;
entity Tx_vlg_sample_tst is
    port(
        AddressBus      : in     vl_logic_vector(1 downto 0);
        BClk            : in     vl_logic;
        DataBus         : in     vl_logic_vector(7 downto 0);
        GResetBar       : in     vl_logic;
        i_TDRE          : in     vl_logic;
        RnotW           : in     vl_logic;
        sel             : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end Tx_vlg_sample_tst;
