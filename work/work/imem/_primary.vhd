library verilog;
use verilog.vl_types.all;
entity imem is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        RD              : out    vl_logic_vector(31 downto 0)
    );
end imem;
