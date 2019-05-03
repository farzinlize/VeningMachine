`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:09:38 05/02/2019
// Design Name:   SR_FF
// Module Name:   D:/FPGA/VENDING/test_sr.v
// Project Name:  VENDING
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SR_FF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_sr;

	// Inputs
	reg set;
	reg reset;

	// Outputs
	wire q;

	// Instantiate the Unit Under Test (UUT)
	SR_FF uut (
		.set(set), 
		.reset(reset), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		set = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		set = 1;
		#20;
		set = 0;
		#20;
		reset = 1;
		#20;
		reset = 0;
		#20;
		set = 1;
		#20;
		reset = 1;
		#20;
		reset = 0;
		#20;
		set = 0;
		#20;
		reset = 1;
		#20;
		set = 1;
		#20;
		set = 0;
		#20;
		reset = 0;
		#20;
		set = 1;
		reset = 1;
		#20;
		set = 0;
		reset = 0;
		#20;
		set = 1;
		#20;
		set = 0;
		#20;
		reset = 1;
		#20;
	end
      
endmodule

