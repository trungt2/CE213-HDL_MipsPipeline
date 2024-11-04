library verilog;
use verilog.vl_types.all;
entity Fetch is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        StallF          : in     vl_logic;
        RD              : out    vl_logic_vector(31 downto 0);
        PCSrcD          : in     vl_logic;
        PCBranchD       : in     vl_logic_vector(31 downto 0);
        PCPlus4_F       : out    vl_logic_vector(31 downto 0);
        PCF             : in     vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        JA              : in     vl_logic_vector(31 downto 0);
        Jump            : in     vl_logic
    );
end Fetch;
