library verilog;
use verilog.vl_types.all;
entity Tx is
    port(
        TxD             : out    vl_logic;
        GResetBar       : in     vl_logic;
        BClk            : in     vl_logic;
        AddressBus      : in     vl_logic_vector(1 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        RnotW           : in     vl_logic;
        i_TDRE          : in     vl_logic;
        DataBus         : in     vl_logic_vector(7 downto 0);
        DoneTx          : out    vl_logic;
        o_TDRE          : out    vl_logic
    );
end Tx;
