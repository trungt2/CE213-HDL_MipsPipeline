library verilog;
use verilog.vl_types.all;
entity Ex is
    port(
        ALUcontrolE     : in     vl_logic_vector(3 downto 0);
        ALUSrcE         : in     vl_logic;
        RegDstE         : in     vl_logic;
        RD1             : in     vl_logic_vector(31 downto 0);
        RD2             : in     vl_logic_vector(31 downto 0);
        RtE             : in     vl_logic_vector(4 downto 0);
        RdE             : in     vl_logic_vector(4 downto 0);
        ForwardAE       : in     vl_logic_vector(1 downto 0);
        ForwardBE       : in     vl_logic_vector(1 downto 0);
        ResultW         : in     vl_logic_vector(31 downto 0);
        ALUOutM         : in     vl_logic_vector(31 downto 0);
        SignImmE        : in     vl_logic_vector(31 downto 0);
        ALUOutE         : out    vl_logic_vector(31 downto 0);
        WriteDataE      : out    vl_logic_vector(31 downto 0);
        WriteRegE       : out    vl_logic_vector(4 downto 0)
    );
end Ex;
