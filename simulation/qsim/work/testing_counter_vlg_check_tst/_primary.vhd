library verilog;
use verilog.vl_types.all;
entity testing_counter_vlg_check_tst is
    port(
        RDR             : in     vl_logic_vector(7 downto 0);
        RDRD            : in     vl_logic;
        reset_f         : in     vl_logic;
        set_FE          : in     vl_logic;
        shift           : in     vl_logic;
        states          : in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end testing_counter_vlg_check_tst;
