library verilog;
use verilog.vl_types.all;
entity RegFe_De is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        StallD          : in     vl_logic;
        Flush           : in     vl_logic;
        Ins_i           : in     vl_logic_vector(31 downto 0);
        Ins_o           : out    vl_logic_vector(31 downto 0);
        PC_i            : in     vl_logic_vector(31 downto 0);
        PC_o            : out    vl_logic_vector(31 downto 0)
    );
end RegFe_De;
