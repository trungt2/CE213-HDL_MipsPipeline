library verilog;
use verilog.vl_types.all;
entity RegMem_WB is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        RegWriteM       : in     vl_logic;
        RegWriteW       : out    vl_logic;
        MemtoRegM       : in     vl_logic;
        MemtoRegW       : out    vl_logic;
        ReadDataM       : in     vl_logic_vector(31 downto 0);
        ReadDataW       : out    vl_logic_vector(31 downto 0);
        ALUOutM         : in     vl_logic_vector(31 downto 0);
        ALUOutW         : out    vl_logic_vector(31 downto 0);
        WriteRegM       : in     vl_logic_vector(4 downto 0);
        WriteRegW       : out    vl_logic_vector(4 downto 0)
    );
end RegMem_WB;
