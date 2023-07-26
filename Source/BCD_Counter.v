module BCD_counter (
input clk, reset_n,
input enable,
output [3:0] Q,
output done
);
reg [3:0] Q_reg, Q_next;
always @(posedge clk, negedge reset_n)

begin  
        Q_reg <= Q_reg;
        if(!reset_n)
        Q_reg <= 'b0;
        else if (enable)
        Q_reg <= Q_next;
        else
        Q_reg <= Q_reg;    
end
assign done = Q_reg == 9;
always @(*)
begin
    Q_next = done? 'b0: Q_reg +1;
end
endmodule
