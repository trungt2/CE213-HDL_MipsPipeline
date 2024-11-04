library verilog;
use verilog.vl_types.all;
entity Mem is
    port(
        clk             : in     vl_logic;
        MemWriteM       : in     vl_logic;
        ALUOutM         : in     vl_logic_vector(31 downto 0);
        WriteDataM      : in     vl_logic_vector(31 downto 0);
        ReadDataM       : out    vl_logic_vector(31 downto 0)
    );
end Mem;
