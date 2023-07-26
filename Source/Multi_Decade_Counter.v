module multi_decade_counter (
input clk, reset_n,
input enable,
output done,
output [3:0] ones, tens, hundereds
);
wire done0, done1, done2;
wire w0, w1, w2;
BCD_counter U1(
    .clk(clk),
    .reset_n(reset_n),
    .enable(enable),
    .done(done0),
    .Q(ones)
);
assign w0 = enable & done0;
BCD_counter U2(
    .clk(clk),
    .reset_n(reset_n),
    .enable(w0),
    .done(done1),
    .Q(tens)
);
assign w1 = w0 & done1;
BCD_counter U3(
    .clk(clk),
    .reset_n(reset_n),
    .enable(w1),
    .done(done2),
    .Q(hundereds)
);
assign w2 = w1 & done2;
assign done = w2;
endmodule
 
