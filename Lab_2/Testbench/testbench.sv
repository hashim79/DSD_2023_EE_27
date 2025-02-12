module testbench;

logic a1;
logic b1;
logic c1;
logic y1;
logic x1; 

localparam period = 10;

lab_2 UUT(
    .a(a1),  
    .b(b1),  
    .c(c1),  
    .y(y1),
    .x(x1)  
);


initial
begin
 
    a1 = 0; b1 = 0; c1 = 0;
    #period; 
    
    a1 = 0; b1 = 0; c1 = 1;
    #period;
    
    a1 = 0; b1 = 1; c1 = 0;
    #period;
    
    a1 = 0; b1 = 1; c1 = 1;
    #period;
    
    a1 = 1; b1 = 0; c1 = 0;
    #period;
    
    a1 = 1; b1 = 0; c1 = 1;
    #period;
    
    a1 = 1; b1 = 1; c1 = 0;
    #period;
    
    a1 = 1; b1 = 1; c1 = 1;
    #period;
    
    $stop; 
end

initial
begin
    /* The following system task prints out the values of signals
       every time there is a change, making debugging easier */
    $monitor("y=%b, x=%b, a=%b, b=%b, c=%b", y1, x1, a1, b1, c1);
end

endmodule


