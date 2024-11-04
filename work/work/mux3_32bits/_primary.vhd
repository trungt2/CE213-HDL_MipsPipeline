library verilog;
use verilog.vl_types.all;
entity mux3_32bits is
    port(
        i1              : in     vl_logic_vector(31 downto 0);
        i2              : in     vl_logic_vector(31 downto 0);
        i3              : in     vl_logic_vector(31 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        o               : out    vl_logic_vector(31 downto 0)
    );
end mux3_32bits;
