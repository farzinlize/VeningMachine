`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:06 05/02/2019 
// Design Name: 
// Module Name:    WAIT 
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
module WAIT(
	input clock,
	input in,
	input [7:0] k_wait,
	output waited
    );

reg [7:0] timer;
wire reset;

assign reset = ~in;
assign waited = (timer == k_wait);

always@(posedge clock or posedge reset)begin
	if(reset)
		timer <= 0;
	else if(!waited)
		timer <= timer+1;
end

endmodule
