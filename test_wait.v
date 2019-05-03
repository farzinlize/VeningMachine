`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:51:08 05/02/2019
// Design Name:   WAIT
// Module Name:   D:/FPGA/VENDING/test_wait.v
// Project Name:  VENDING
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WAIT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_wait;

	// Inputs
	reg clock;
	reg in;
	reg [7:0] k_wait;

	// Outputs
	wire waited;

	// Instantiate the Unit Under Test (UUT)
	WAIT uut (
		.clock(clock), 
		.in(in), 
		.k_wait(3),
		.waited(waited)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		in = 0;
		k_wait = 5;

		// Wait 100 ns for global reset to finish
		#100;
        
		in = 1;
		#80;
		in = 0;
		#40;
		in = 1;
		#250;
		in = 0;
		// Add stimulus here

	end
      
initial forever begin #20; clock = ~clock; end
		
endmodule

