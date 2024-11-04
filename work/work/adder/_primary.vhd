library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        i1              : in     vl_logic_vector(31 downto 0);
        i2              : in     vl_logic_vector(31 downto 0);
        o               : out    vl_logic_vector(31 downto 0)
    );
end adder;
