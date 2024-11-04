library verilog;
use verilog.vl_types.all;
entity WB is
    port(
        MemToRegW       : in     vl_logic;
        ReadDataW       : in     vl_logic_vector(31 downto 0);
        ALUOutW         : in     vl_logic_vector(31 downto 0);
        ResultW         : out    vl_logic_vector(31 downto 0)
    );
end WB;
