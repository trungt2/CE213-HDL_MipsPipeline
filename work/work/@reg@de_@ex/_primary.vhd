library verilog;
use verilog.vl_types.all;
entity RegDe_Ex is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        FlushE          : in     vl_logic;
        RegWriteD       : in     vl_logic;
        RegWriteE       : out    vl_logic;
        MemtoRegD       : in     vl_logic;
        MemtoRegE       : out    vl_logic;
        MemWriteD       : in     vl_logic;
        MemWriteE       : out    vl_logic;
        ALUControlD     : in     vl_logic_vector(3 downto 0);
        ALUControlE     : out    vl_logic_vector(3 downto 0);
        ALUSrcD         : in     vl_logic;
        ALUSrcE         : out    vl_logic;
        RegDstD         : in     vl_logic;
        RegDstE         : out    vl_logic;
        RD1_in          : in     vl_logic_vector(31 downto 0);
        RD1_out         : out    vl_logic_vector(31 downto 0);
        RD2_in          : in     vl_logic_vector(31 downto 0);
        RD2_out         : out    vl_logic_vector(31 downto 0);
        RsD             : in     vl_logic_vector(4 downto 0);
        RsE             : out    vl_logic_vector(4 downto 0);
        RtD             : in     vl_logic_vector(4 downto 0);
        RtE             : out    vl_logic_vector(4 downto 0);
        RdE             : out    vl_logic_vector(4 downto 0);
        RdD             : in     vl_logic_vector(4 downto 0);
        SignImmE        : out    vl_logic_vector(31 downto 0);
        SignImmD        : in     vl_logic_vector(31 downto 0)
    );
end RegDe_Ex;
