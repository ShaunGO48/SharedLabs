`timescale 1ns / 1ps

module mux_test;

	reg [4:0] Ain;
	reg [4:0] Bin;
	reg control;
	wire [4:0] mux_out;

	mux#(5) uut (
		.Ain(Ain), 
		.Bin(Bin), 
		.control(control), 
		.mux_out(mux_out)
	);

	initial begin
		Ain <= 0;
		Bin <= 1;
		control <= 0;
        #10;
        
        Ain <= 0;
        Bin <= 1;
        control <= 1;
        #10;

		Ain <= 31;
		Bin <= 15;
		control <= 0;
        #10;
        
        Ain <= 31;
        Bin <= 15;
        control <= 1;
        #10;
	end
      
endmodule

