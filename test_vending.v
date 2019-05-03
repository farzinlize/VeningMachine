`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:08:12 05/02/2019
// Design Name:   VENDING
// Module Name:   D:/FPGA/VENDING/test_vending.v
// Project Name:  VENDING
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VENDING
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_vending;

	// Inputs
	reg clock;
	reg in100;
	reg in200;
	reg in500;

	// Outputs
	wire out100;
	wire out200;
	wire delivery;

	// Instantiate the Unit Under Test (UUT)
	VENDING uut (
		.clock(clock), 
		.in100(in100), 
		.in200(in200), 
		.in500(in500), 
		.out100(out100), 
		.out200(out200),
		.delivery(delivery)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		in100 = 0;
		in200 = 0;
		in500 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//Purchace -> 100+100+100
		in100 = 1;
		#40;
		in100 = 0;
		#40;
		in100 = 1;
		#40;
		in100 = 0;
		#40;
		in100 = 1;
		#40;
		in100 = 0;
		#520;
		//Purchace -> 100+100+200
		in100 = 1;
		#40;
		in100 = 0;
		#40;
		in100 = 1;
		#40;
		in100 = 0;
		#40;
		in200 = 1;
		#40;
		in200 = 0;
		#520;
		//Purchace -> 100+100+500
		in100 = 1;
		#40;
		in100 = 0;
		#40;
		in100 = 1;
		#40;
		in100 = 0;
		#40;
		in500 = 1;
		#40;
		in500 = 0;
		#520;
		//Purchace -> 200+200
		in200 = 1;
		#40;
		in200 = 0;
		#40;
		in200 = 1;
		#40;
		in200 = 0;
		#520;
		//Purchace -> 200+500
		in200 = 1;
		#40;
		in200 = 0;
		#40;
		in500 = 1;
		#40;
		in500 = 0;
		#520;
		//Purchace -> 100+500
		in100 = 1;
		#40;
		in100 = 0;
		#40;
		in500 = 1;
		#40;
		in500 = 0;
		#520;
		//Purchace -> 200+100
		in200 = 1;
		#40;
		in200 = 0;
		#40;
		in100 = 1;
		#40;
		in100 = 0;
		#520;
		//Purchace -> 500
		in500 = 1;
		#40;
		in500 = 0;
		#520;
	end
 
initial forever begin #20; clock = ~clock; end
		
endmodule

