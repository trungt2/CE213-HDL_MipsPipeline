library verilog;
use verilog.vl_types.all;
entity RegFe is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        StallF          : in     vl_logic;
        PC              : in     vl_logic_vector(31 downto 0);
        PCF             : out    vl_logic_vector(31 downto 0)
    );
end RegFe;
