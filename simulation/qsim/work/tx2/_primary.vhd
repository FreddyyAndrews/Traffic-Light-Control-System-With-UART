library verilog;
use verilog.vl_types.all;
entity tx2 is
    port(
        TxD             : out    vl_logic;
        GResetBar       : in     vl_logic;
        BClk            : in     vl_logic;
        startTx         : in     vl_logic;
        loadTDR         : in     vl_logic;
        BUSINPUT        : in     vl_logic_vector(7 downto 0)
    );
end tx2;
