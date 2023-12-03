library verilog;
use verilog.vl_types.all;
entity testing_bus is
    port(
        DoneTx          : out    vl_logic;
        RnotW           : in     vl_logic;
        GResetBar       : in     vl_logic;
        BClk            : in     vl_logic;
        i_TDRE          : in     vl_logic;
        AddressBus      : in     vl_logic_vector(1 downto 0);
        DataBus         : in     vl_logic_vector(7 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        o_TDRE          : out    vl_logic;
        TxD             : out    vl_logic;
        andgates        : out    vl_logic;
        startTx         : out    vl_logic;
        o_s1            : out    vl_logic;
        o_s2            : out    vl_logic
    );
end testing_bus;
