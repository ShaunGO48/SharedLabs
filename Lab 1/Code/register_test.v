`include "definitions.vh"


module test_regs;

wire clk;
reg rst=0;
reg[`WORD - 1:0] d;
wire[`WORD - 1:0] q;

oscillator clk_gen(clk);

register UUT(
    .clk(clk),
    .reset(rst),
    .D(d),
    .Q(q)
    );

initial
begin
    d <=`WORD'd0; 
    #`CYCLE;
    d <=`WORD'd1;
    #`CYCLE;
    d <=`WORD'd2; 
    #(`CYCLE/5);
    d <=`WORD'd3; 
    #(`CYCLE*4/5);
    rst = 1;
    # `CYCLE;
    d <=`WORD'd4294967295; 
    # `CYCLE;
    rst = 0; 
    
end
endmodule
