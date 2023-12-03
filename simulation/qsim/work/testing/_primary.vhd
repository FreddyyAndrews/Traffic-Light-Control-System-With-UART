library verilog;
use verilog.vl_types.all;
entity testing is
    port(
        SetBaudRate     : out    vl_logic;
        GClock          : in     vl_logic;
        GReset          : in     vl_logic;
        TxClock         : in     vl_logic;
        TxDoje          : in     vl_logic;
        dataBus         : in     vl_logic_vector(7 downto 0);
        MSTS            : in     vl_logic_vector(2 downto 0);
        SSTS            : in     vl_logic_vector(2 downto 0);
        RnotW           : out    vl_logic;
        o_s1            : out    vl_logic;
        o_s             : out    vl_logic;
        o_s0            : out    vl_logic;
        o_doneOneTransimission: out    vl_logic;
        o_counter_inc   : out    vl_logic;
        o_loadBus       : out    vl_logic;
        o_counte_reset  : out    vl_logic;
        AddressBus      : out    vl_logic_vector(1 downto 0);
        dataBusOutput   : out    vl_logic_vector(7 downto 0);
        o_counter_out   : out    vl_logic_vector(3 downto 0);
        SetTxRx         : out    vl_logic_vector(1 downto 0)
    );
end testing;
