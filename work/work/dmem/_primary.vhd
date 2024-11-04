library verilog;
use verilog.vl_types.all;
entity dmem is
    port(
        clk             : in     vl_logic;
        MemWrite        : in     vl_logic;
        A               : in     vl_logic_vector(31 downto 0);
        WD              : in     vl_logic_vector(31 downto 0);
        RD              : out    vl_logic_vector(31 downto 0)
    );
end dmem;
