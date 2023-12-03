library verilog;
use verilog.vl_types.all;
entity projectDraft_vlg_check_tst is
    port(
        BClk            : in     vl_logic;
        BCLkx8          : in     vl_logic;
        BusOutput       : in     vl_logic_vector(7 downto 0);
        doneOneTransimission: in     vl_logic;
        DoneTx          : in     vl_logic;
        MSTS            : in     vl_logic_vector(2 downto 0);
        RDR             : in     vl_logic_vector(7 downto 0);
        SSTS            : in     vl_logic_vector(2 downto 0);
        startTX         : in     vl_logic;
        statess_out_rx  : in     vl_logic_vector(5 downto 0);
        tdr             : in     vl_logic_vector(7 downto 0);
        Tx_sattes       : in     vl_logic_vector(1 downto 0);
        TxD             : in     vl_logic;
        U_AddressBus    : in     vl_logic_vector(1 downto 0);
        U_o_counter     : in     vl_logic_vector(3 downto 0);
        U_rnotW         : in     vl_logic;
        U_SetBaudRate   : in     vl_logic;
        U_SetTxRx       : in     vl_logic_vector(1 downto 0);
        U_states        : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end projectDraft_vlg_check_tst;
