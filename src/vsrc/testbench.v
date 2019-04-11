//
module tb;
reg clk;
reg [15:0] a;
reg [6:0] b;
reg [31:0] c;

always #1 clk = ~clk;

initial
begin
    clk = 0;
    a = 16'h0000;     //Phase = a/65535*6.28 [pi]
    b = 7'b0000001;   //1-SIN,0-COS
    c = 0;
    #30 $finish;
end

always @(posedge clk)
begin
    a = a + 16'h02FF;
    if (b == 7'b0000001)
        b = 7'b0000000;
    else if (b == 7'b0000000)
        b = 7'b0000001;
    else
        $finish;
end

always @(posedge clk)
begin
    c = c + 1;
end

helloVPI helloVPI1(.clk(clk),
                   .a(a),
                   .b(b),
                   .c(c));

endmodule
