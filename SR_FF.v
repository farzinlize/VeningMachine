`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:04:44 05/02/2019 
// Design Name: 
// Module Name:    SR_FF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SR_FF(
	input set,
	input reset,
	input clock,
	output reg q
    );

reg q_prim;

initial begin
	q = 0;
	q_prim=1;
end

always@(posedge clock)begin
	case({set,reset})
	2'b00:	begin q=q; q_prim=q_prim; end
	2'b01:	begin q=1'b0; q_prim=1'b1;	end
	2'b10:	begin q=1'b1; q_prim=1'b0;	end
	2'b11:	begin q=1'b0; q_prim=1'b1;	end
	endcase
end

endmodule
