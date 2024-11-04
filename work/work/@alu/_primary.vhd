library verilog;
use verilog.vl_types.all;
entity Alu is
    port(
        ALUcontrol      : in     vl_logic_vector(3 downto 0);
        opA             : in     vl_logic_vector(31 downto 0);
        opB             : in     vl_logic_vector(31 downto 0);
        ALUresult       : out    vl_logic_vector(31 downto 0)
    );
end Alu;
