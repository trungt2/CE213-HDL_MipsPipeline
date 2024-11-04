library verilog;
use verilog.vl_types.all;
entity mux2_32bits is
    port(
        i1              : in     vl_logic_vector(31 downto 0);
        i2              : in     vl_logic_vector(31 downto 0);
        s               : in     vl_logic;
        o               : out    vl_logic_vector(31 downto 0)
    );
end mux2_32bits;
