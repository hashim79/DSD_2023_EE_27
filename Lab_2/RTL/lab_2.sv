module lab_2(
    input logic a,
    input logic b,
    input logic c,
    output logic y,
    output logic x
);
    logic or_ab, and_ab, not_c, not_and_ab;
    
    assign or_ab = a | b;
    assign and_ab = a & b;
    assign not_c = ~c;
    assign not_and_ab = ~and_ab;
    
    assign x = not_c ^ or_ab;
    assign y = (not_and_ab ^ or_ab) & or_ab;
endmodule
