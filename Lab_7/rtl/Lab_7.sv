module lab_7(
    output reg [7:0] anode,  // anode signals for 7-segment displays
    output reg [6:0] seg,    // segment signals for 7-segment display
    input logic clk,         // system clock (100 MHz)
    input logic write,       // write signal
    input logic reset,       // reset signal
    input logic [3:0] num,   // 4-bit number input
    input logic [2:0] sel,
    output logic dp          // selector input
);
    // internal signals
    logic slow_clk;            // 100 Hz clock
    logic [3:0] q[7:0];        // registers for display values
    logic [2:0] counter_sel;   // counter for display selection
    logic [7:0] en;            // enable signals for storage
    logic [3:0] m_out;         // multiplexer output
    logic [16:0] q1;
    logic [2:0] q2;
    logic [2:0] new_sel;
    
    // clock frequency controller: decreases the frequency to 763Hz
    assign dp=1;
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q1 <= 0;
        else
            q1 <= q1 + 1'b1;
    end
    
    assign slow_clk = q1[16];
    
    // this further decreases the frequency to 100Hz for each segment
    always_ff @(posedge slow_clk or posedge reset) begin
        if (reset)
            q2 <= 0;
        else
            q2 <= q2 + 1'b1;
    end

    // select active display
    always_comb begin
        if (write)
            new_sel = sel;
        else
            new_sel = q2;
    end

    // enable signal generation for registers
    // Condition for And gate
    always_comb begin 
        for (int i = 0; i < 8; i = i + 1) begin 
            en[i] = write & ~anode[i];
        end
    end
   

    // d flip-flops for storing values
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            q[0] <= 4'b0000; q[1] <= 4'b0000; q[2] <= 4'b0000; q[3] <= 4'b0000;
            q[4] <= 4'b0000; q[5] <= 4'b0000; q[6] <= 4'b0000; q[7] <= 4'b0000;
        end else begin
            if (en[0]) q[0] <= num;
            if (en[1]) q[1] <= num;
            if (en[2]) q[2] <= num;
            if (en[3]) q[3] <= num;
            if (en[4]) q[4] <= num;
            if (en[5]) q[5] <= num;
            if (en[6]) q[6] <= num;
            if (en[7]) q[7] <= num;
        end
    end

    // multiplexer for selecting the active display value
    always_comb begin
        case (new_sel)
            3'b000: m_out = q[0];
            3'b001: m_out = q[1];
            3'b010: m_out = q[2];
            3'b011: m_out = q[3];
            3'b100: m_out = q[4];
            3'b101: m_out = q[5];
            3'b110: m_out = q[6];
            3'b111: m_out = q[7];
        endcase
    end

    // seven-segment display decoder
    always_comb begin
        case (m_out)
4'b0000 : seg = 7'b0000001;
                    4'b0001 : seg = 7'b1001111;
                    4'b0010 : seg = 7'b0010010;
                    4'b0011 : seg = 7'b0000110;
                    4'b0100 : seg = 7'b1001100;
                    4'b0101 : seg = 7'b0100100;
                    4'b0110 : seg = 7'b0100000;
                    4'b0111 : seg = 7'b0001111;
                    4'b1000 : seg = 7'b0000000;
                    4'b1001 : seg = 7'b0000100;
                    4'b1010 : seg = 7'b0001000;
                    4'b1011 : seg = 7'b1100000;
                    4'b1100 : seg = 7'b0110001;
                    4'b1101 : seg = 7'b1000010;
                    4'b1110 : seg = 7'b0110000;
                    4'b1111 : seg = 7'b0111000;
        endcase
    end

    // anode control for cycling through displays
    always_comb begin
        case (new_sel)
            3'b000: anode = 8'b11111110;
            3'b001: anode = 8'b11111101;
            3'b010: anode = 8'b11111011;
            3'b011: anode = 8'b11110111;
            3'b100: anode = 8'b11101111;
            3'b101: anode = 8'b11011111;
            3'b110: anode = 8'b10111111;
            3'b111: anode = 8'b01111111;
        endcase
    end
endmodule