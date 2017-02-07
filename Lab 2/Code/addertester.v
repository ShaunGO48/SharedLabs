`include "definitions.vh"
module adder_test;

	// Inputs
	reg [`WORD-1:0] Ain;
	reg [`WORD-1:0] Bin;

	// Outputs
	wire [`WORD-1:0] add_out;
	reg [`WORD-1:0] Answer;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.Ain(Ain), 
		.Bin(Bin), 
		.add_out(add_out)
	);

	initial begin
		// Initialize Inputs
		Ain = 0;
		Bin = 0;
        Answer = 0;
		// Wait 100 ns for global reset to finish
		#100;
		
		Ain = 4294967295;
        Bin = 0;
        Answer = 4294967295;
        // Wait 100 ns for global reset to finish
        #100;
                
        Ain = 4294967295;
        Bin = 1;
        Answer = 0;
        // Wait 100 ns for global reset to finish
        #100;
                        
        Ain = 4294967295;
        Bin = 2;
        Answer = 1;
        // Wait 100 ns for global reset to finish
        #100;
        
		// Add stimulus here

	end
      
endmodule

