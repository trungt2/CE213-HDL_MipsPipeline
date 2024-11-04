library verilog;
use verilog.vl_types.all;
entity control is
    generic(
        R               : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        lw              : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi1);
        sw              : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi1);
        beq             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        addi            : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        bne             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi1);
        J               : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        \And\           : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi0);
        Add             : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        Sub             : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi0);
        \Or\            : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi1);
        Slt             : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi0);
        \Sll\           : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        \Srl\           : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0)
    );
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        inst            : in     vl_logic_vector(5 downto 0);
        RegDst          : out    vl_logic;
        MemWrite        : out    vl_logic;
        MemToReg        : out    vl_logic;
        ALUcontrol      : out    vl_logic_vector(3 downto 0);
        ALUSrc          : out    vl_logic;
        RegWrite        : out    vl_logic;
        Branch          : out    vl_logic;
        Jump            : out    vl_logic;
        stall           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of R : constant is 1;
    attribute mti_svvh_generic_type of lw : constant is 1;
    attribute mti_svvh_generic_type of sw : constant is 1;
    attribute mti_svvh_generic_type of beq : constant is 1;
    attribute mti_svvh_generic_type of addi : constant is 1;
    attribute mti_svvh_generic_type of bne : constant is 1;
    attribute mti_svvh_generic_type of J : constant is 1;
    attribute mti_svvh_generic_type of \And\ : constant is 2;
    attribute mti_svvh_generic_type of Add : constant is 2;
    attribute mti_svvh_generic_type of Sub : constant is 2;
    attribute mti_svvh_generic_type of \Or\ : constant is 2;
    attribute mti_svvh_generic_type of Slt : constant is 2;
    attribute mti_svvh_generic_type of \Sll\ : constant is 2;
    attribute mti_svvh_generic_type of \Srl\ : constant is 2;
end control;
