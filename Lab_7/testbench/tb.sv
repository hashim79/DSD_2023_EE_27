`timescale 1ns / 1ps

module lab_7_tb;

    // Testbench Signals
    reg clk;
    reg reset;
    reg write;
    reg [3:0] num;
    reg [2:0] sel;
    wire [7:0] anode;
    wire [6:0] seg;
    wire dp;

    // Instantiate the DUT (Device Under Test)
    lab_7 dut (
        .clk(clk),
        .reset(reset),
        .write(write),
        .num(num),
        .sel(sel),
        .anode(anode),
        .seg(seg),
        .dp(dp)
    );

    // Generate a 100 MHz clock
    always #5 clk = ~clk; // 10ns period -> 100MHz

    initial begin
        $display("Starting testbench...");
        clk = 0;
        reset = 1;
        write = 0;
        num = 4'b0000;
        sel = 3'b000;
        
        #10 reset = 0;
        
    
        
        // 3. Store **any** desired number for selectors 0-7

        #10 write = 1; sel = 3'b000; num = 4'b1101; // Store 'D'
        #10 write = 1; sel = 3'b001; num = 4'b0111; // Store '7'
        #10 write = 1; sel = 3'b010; num = 4'b1001; // Store '9'
        #10 write = 1; sel = 3'b011; num = 4'b1010; // Store 'A'
        #10 write = 1; sel = 3'b100; num = 4'b0011; // Store '3'
        #10 write = 1; sel = 3'b101; num = 4'b0001; // Store '1'
        #10 write = 1; sel = 3'b110; num = 4'b0100; // Store '4'
        #10 write = 1; sel = 3'b111; num = 4'b1111; // Store 'F'
        
        #10 write = 0; // Hold write low and check stored values
        
        // Wait for multiplexing to cycle through displays
        #100;

        // End the simulation
        $display("Testbench completed.");
 
    end
endmodule
