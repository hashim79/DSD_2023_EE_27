module Lab_4_tb;
    logic a1, a0, b1, b0; 
    logic red, green, blue; // Outputs

    Lab4 UUT(
        .a1(a1),
        .a0(a0),
        .b1(b1),
        .b0(b0),
        .r(red),
        .g(green),
        .b(blue)
    );

    localparam period = 10; // Time period for delay

    initial begin
        
        a1 = 0; a0 = 0; b1 = 0; b0 = 0; #period;
        a1 = 0; a0 = 0; b1 = 0; b0 = 1; #period;
        a1 = 0; a0 = 0; b1 = 1; b0 = 0; #period;
        a1 = 0; a0 = 0; b1 = 1; b0 = 1; #period;
        
        a1 = 0; a0 = 1; b1 = 0; b0 = 0; #period;
        a1 = 0; a0 = 1; b1 = 0; b0 = 1; #period;
        a1 = 0; a0 = 1; b1 = 1; b0 = 0; #period;
        a1 = 0; a0 = 1; b1 = 1; b0 = 1; #period;
        
        a1 = 1; a0 = 0; b1 = 0; b0 = 0; #period;
        a1 = 1; a0 = 0; b1 = 0; b0 = 1; #period;
        a1 = 1; a0 = 0; b1 = 1; b0 = 0; #period;
        a1 = 1; a0 = 0; b1 = 1; b0 = 1; #period;
        
        a1 = 1; a0 = 1; b1 = 0; b0 = 0; #period;
        a1 = 1; a0 = 1; b1 = 0; b0 = 1; #period;
        a1 = 1; a0 = 1; b1 = 1; b0 = 0; #period;
        a1 = 1; a0 = 1; b1 = 1; b0 = 1; #period;

        #period; 
        $stop;
    end

    initial begin
        $monitor("Time=%0t | a1=%b, a0=%b, b1=%b, b0=%b | red=%b, green=%b, blue=%b", 
                  $time, a1, a0, b1, b0, red, green, blue);
    end
endmodule