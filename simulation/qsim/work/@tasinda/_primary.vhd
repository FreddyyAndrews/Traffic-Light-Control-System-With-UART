library verilog;
use verilog.vl_types.all;
entity Tasinda is
    port(
        TxD             : out    vl_logic;
        GReset          : in     vl_logic;
        BClk            : in     vl_logic;
        Input_TDRE      : in     vl_logic;
        RnotW           : in     vl_logic;
        AddressBus      : in     vl_logic_vector(1 downto 0);
        DataBus         : in     vl_logic_vector(7 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        DoneTx          : out    vl_logic;
        Output_TDRE     : out    vl_logic
    );
end Tasinda;
