module BCD_counter_tb();
reg clk, enable, reset_n;
wire [3:0] Q;
wire done;

BCD_counter uut (
        .clk(clk),
        .enable(enable),
        .reset_n(reset_n),
        .Q(Q),
        .done(done)
);
localparam T = 20;
always 
begin
    clk = 1'b0;
    #(T/2)
    clk = 1'b1;
    #(T/2);
end

initial 
begin
reset_n = 1'b0;
#5
reset_n = 1'b1;
enable = 1'b1;
#(10*T)
enable = 1'b0;
#T
$stop;
end
endmodule
