library verilog;
use verilog.vl_types.all;
entity RegEx_Mem is
    port(
        clk             : in     vl_logic;
        Reset           : in     vl_logic;
        RegWriteE       : in     vl_logic;
        RegWriteM       : out    vl_logic;
        MemtoRegE       : in     vl_logic;
        MemtoRegM       : out    vl_logic;
        MemWriteE       : in     vl_logic;
        MemWriteM       : out    vl_logic;
        ALUOutE         : in     vl_logic_vector(31 downto 0);
        ALUOutM         : out    vl_logic_vector(31 downto 0);
        WriteDataE      : in     vl_logic_vector(31 downto 0);
        WriteDataM      : out    vl_logic_vector(31 downto 0);
        WriteRegE       : in     vl_logic_vector(31 downto 0);
        WriteRegM       : out    vl_logic_vector(31 downto 0)
    );
end RegEx_Mem;
