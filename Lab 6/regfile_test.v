`include "definitions.vh"


module regfile_test;
    wire clk;
    reg reset = 0;
    reg write;
    reg [4:0] address_A;
    reg [4:0] address_B;
    reg [4:0] address_dest;
    reg [`WORD-1:0] write_data;
    wire [`WORD-1:0] A;
    wire [`WORD-1:0] B;
    
    oscillator clk_gen(clk);
    
    regfile UUT(
        .clk(clk),
        .reset(reset),
        .write(write),
        .address_A(address_A),
        .address_B(address_B),
        .address_dest(address_dest),
        .write_data(write_data),
        .A(A),
        .B(B)
    );
    
    initial begin
        write = 1;
        address_A = 0;
        address_B = 1;
        address_dest = 2;
        write_data = 10;
        #`CYCLE;
        
        write = 1;
        address_A = 9;
        address_B = 12;
        address_dest = 3;
        write_data = 25;
        #`CYCLE;
        
        #`CYCLE;
        
        address_A = 12;
        address_B = 9;
        #`CYCLE;
        
        address_A = 2;
        address_B = 3;
        #`CYCLE;
        
        reset = 1;
        #`CYCLE;
        
        reset = 0;
        address_A = 10;
        address_B = 10;
        address_dest = 10;
        write_data = 16;
        #`CYCLE;
        
      
    end

endmodule
