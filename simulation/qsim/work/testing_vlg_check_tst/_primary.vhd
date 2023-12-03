library verilog;
use verilog.vl_types.all;
entity testing_vlg_check_tst is
    port(
        AddressBus      : in     vl_logic_vector(1 downto 0);
        dataBusOutput   : in     vl_logic_vector(7 downto 0);
        o_counte_reset  : in     vl_logic;
        o_counter_inc   : in     vl_logic;
        o_counter_out   : in     vl_logic_vector(3 downto 0);
        o_doneOneTransimission: in     vl_logic;
        o_loadBus       : in     vl_logic;
        o_s             : in     vl_logic;
        o_s0            : in     vl_logic;
        o_s1            : in     vl_logic;
        RnotW           : in     vl_logic;
        SetBaudRate     : in     vl_logic;
        SetTxRx         : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end testing_vlg_check_tst;
