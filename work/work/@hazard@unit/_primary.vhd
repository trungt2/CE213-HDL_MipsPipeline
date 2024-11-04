library verilog;
use verilog.vl_types.all;
entity HazardUnit is
    port(
        rst             : in     vl_logic;
        StallFi         : out    vl_logic;
        StallDi         : out    vl_logic;
        BranchDi        : in     vl_logic;
        ForwardADi      : out    vl_logic_vector(1 downto 0);
        ForwardBDi      : out    vl_logic_vector(1 downto 0);
        FlushEi         : out    vl_logic;
        ForwardAEi      : out    vl_logic_vector(1 downto 0);
        ForwardBEi      : out    vl_logic_vector(1 downto 0);
        MemtoRegEi      : in     vl_logic;
        RegWriteEi      : in     vl_logic;
        MemtoRegMi      : in     vl_logic;
        RegWriteMi      : in     vl_logic;
        RegWriteWi      : in     vl_logic;
        RsEi            : in     vl_logic_vector(4 downto 0);
        RtEi            : in     vl_logic_vector(4 downto 0);
        RsDi            : in     vl_logic_vector(4 downto 0);
        RtDi            : in     vl_logic_vector(4 downto 0);
        WriteRegMi      : in     vl_logic_vector(4 downto 0);
        WriteRegWi      : in     vl_logic_vector(4 downto 0);
        WriteRegEi      : in     vl_logic_vector(4 downto 0)
    );
end HazardUnit;
