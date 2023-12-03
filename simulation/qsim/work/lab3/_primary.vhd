library verilog;
use verilog.vl_types.all;
entity lab3 is
    port(
        BCD1            : out    vl_logic_vector(3 downto 0);
        GClock          : in     vl_logic;
        SSCS            : in     vl_logic;
        MSC             : in     vl_logic_vector(3 downto 0);
        SSC             : in     vl_logic_vector(3 downto 0);
        GReset          : in     vl_logic;
        BCD2            : out    vl_logic_vector(3 downto 0);
        counter         : out    vl_logic_vector(3 downto 0);
        MSTS            : out    vl_logic_vector(2 downto 0);
        SevSegDisp1     : out    vl_logic_vector(6 downto 0);
        SevSegDisp2     : out    vl_logic_vector(6 downto 0);
        SSTS            : out    vl_logic_vector(2 downto 0)
    );
end lab3;
