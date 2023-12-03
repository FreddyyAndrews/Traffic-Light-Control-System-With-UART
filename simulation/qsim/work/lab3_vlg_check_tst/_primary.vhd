library verilog;
use verilog.vl_types.all;
entity lab3_vlg_check_tst is
    port(
        BCD1            : in     vl_logic_vector(3 downto 0);
        BCD2            : in     vl_logic_vector(3 downto 0);
        counter         : in     vl_logic_vector(3 downto 0);
        MSTS            : in     vl_logic_vector(2 downto 0);
        SevSegDisp1     : in     vl_logic_vector(6 downto 0);
        SevSegDisp2     : in     vl_logic_vector(6 downto 0);
        SSTS            : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab3_vlg_check_tst;
