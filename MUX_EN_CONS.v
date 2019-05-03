`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:04 05/02/2019 
// Design Name: 
// Module Name:    MUX_EN_CONS 
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
module MUX_EN_CONS_4_8bit(
	input [7:0] cons0,
	input [7:0] cons1,
	input [7:0] cons2,
	input [7:0] cons3,
	input select0,
	input select1,
	input select2,
	input select3,
	output [7:0] result
    );

always@(*)begin
	casez({select0,select1,select2,select3})
		4'b1???: result = cons0;
		4'b01??: result = cons1;
		4'b001?: result = cons2;
		4'b0001: result = cons3;
	endcase
end

endmodule
