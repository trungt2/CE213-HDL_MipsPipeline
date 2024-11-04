library verilog;
use verilog.vl_types.all;
entity Decode is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        InstrD          : in     vl_logic_vector(31 downto 0);
        PCPlus4D        : in     vl_logic_vector(31 downto 0);
        RegWriteW       : in     vl_logic;
        WriteRegW       : in     vl_logic_vector(4 downto 0);
        ResultW         : in     vl_logic_vector(31 downto 0);
        RegWriteD       : out    vl_logic;
        MemToRegD       : out    vl_logic;
        MemWriteD       : out    vl_logic;
        ALUcontrolD     : out    vl_logic_vector(3 downto 0);
        ALUSrcD         : out    vl_logic;
        RegDstD         : out    vl_logic;
        PCSrcD          : out    vl_logic;
        RD1             : out    vl_logic_vector(31 downto 0);
        RD2             : out    vl_logic_vector(31 downto 0);
        RsD             : out    vl_logic_vector(4 downto 0);
        RtD             : out    vl_logic_vector(4 downto 0);
        RdD             : out    vl_logic_vector(4 downto 0);
        SignImmD        : out    vl_logic_vector(31 downto 0);
        PCBranchD       : out    vl_logic_vector(31 downto 0);
        BranchD         : out    vl_logic;
        ForwardAD       : in     vl_logic_vector(1 downto 0);
        ForwardBD       : in     vl_logic_vector(1 downto 0);
        ALUOutM         : out    vl_logic_vector(31 downto 0);
        JA              : out    vl_logic_vector(31 downto 0);
        Jump            : out    vl_logic;
        stall           : in     vl_logic
    );
end Decode;
