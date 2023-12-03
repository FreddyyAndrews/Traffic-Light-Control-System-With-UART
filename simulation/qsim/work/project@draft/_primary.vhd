library verilog;
use verilog.vl_types.all;
entity projectDraft is
    port(
        SetBaudRate     : out    vl_logic;
        GClock          : in     vl_logic;
        GReset          : in     vl_logic;
        Tx_trigger      : in     vl_logic;
        rset_b          : in     vl_logic;
        sel             : in     vl_logic_vector(2 downto 0);
        SSCS            : in     vl_logic;
        MSC             : in     vl_logic_vector(3 downto 0);
        SSC             : in     vl_logic_vector(3 downto 0);
        rnotW           : out    vl_logic;
        TxD             : out    vl_logic;
        o_s1            : out    vl_logic;
        o_s2            : out    vl_logic;
        o_s0            : out    vl_logic;
        doneOneTransimission: out    vl_logic;
        BCLkx8          : out    vl_logic;
        BClk            : out    vl_logic;
        AddressBus      : out    vl_logic_vector(1 downto 0);
        BusOutput       : out    vl_logic_vector(7 downto 0);
        MSTS            : out    vl_logic_vector(2 downto 0);
        o_counter       : out    vl_logic_vector(3 downto 0);
        RDR             : out    vl_logic_vector(7 downto 0);
        RxD             : in     vl_logic;
        SetTxRx         : out    vl_logic_vector(1 downto 0);
        SSTS            : out    vl_logic_vector(2 downto 0);
        statess_out_rx  : out    vl_logic_vector(5 downto 0);
        tdr             : out    vl_logic_vector(7 downto 0)
    );
end projectDraft;
