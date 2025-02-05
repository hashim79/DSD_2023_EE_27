
module lab_2(
    input logic a,
    input logic b,
    input logic c,
    output logic y,
    output logic x
);
   assign x = (~c) ^ ( a|b);
   assign y = ((~(a&b)) ^ (a|b)) & ( a|b);
endmodule
