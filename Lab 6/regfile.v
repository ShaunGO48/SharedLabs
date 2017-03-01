`include "definitions.vh"

module regfile#(
    parameter SIZE=32, bits=`CLOG2(SIZE))(
    input clk,
    input reset,
    input write,
    input [(bits - 1):0] address_A,
    input [(bits - 1):0] address_B,
    input [(bits - 1):0] address_dest,
    input [`WORD - 1:0] write_data,
    output reg [`WORD - 1:0] A=`WORD'b0,
    output reg [`WORD - 1:0] B=`WORD'b0
    );
    
    reg[`WORD - 1:0] rf [SIZE-1:0];
    integer i;
    
    // handle input
    always @(negedge(clk))
    begin
        if (reset)
            for(i=0;i<SIZE;i=i+1)
                rf[i]<=0;
        else if(write)
            rf[address_dest] <= write_data;
        
    end
    
    //handle output
    always @(posedge(clk))
    begin
        if(reset)
        begin
            A <= 0; //sets output reg A to zero
            B <= 0; //sets output reg B to zero
        end
        else
        begin
            A <= rf[address_A];
            B <= rf[address_B];
        end
    end
    
    initial
        $readmemh(`RMEMFILE, rf);

endmodule
