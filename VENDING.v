`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:00:43 05/02/2019 
// Design Name: 
// Module Name:    VENDING 
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
module VENDING(
	input clock,
	input in100,
	input in200,
	input in500,
	output out100,
	output out200,
	output delivery
    );

parameter [7:0] PRICE = 3, K = 5;

reg [7:0] sum;
reg [7:0] plus;
reg [7:0] minus;

initial begin
	sum = 0;
end

wire w_out100, w_out200;
wire alpha, beta, full, done, mode;

WAIT wait_out_100 (
    .clock(clock), 
    .in(out100), 
    .k_wait(K),
    .waited(w_out100)
    );

WAIT wait_out_200 (
    .clock(clock), 
    .in(out200), 
    .k_wait(K), 
    .waited(w_out200)
    );

SR_FF mode_sr (
    .set(full), 
    .reset(done), 
	 .clock(clock),
    .q(mode)
    );

assign alpha = (sum >= 4);
assign beta = (sum >= 5);
assign full = (sum >= PRICE);
assign done = (~(alpha | beta)) & mode;
assign delivery = done;

assign out100 = (alpha & (~beta)) & mode;
assign out200 = (alpha & beta) & mode;

always@(*)begin	//plus
	casez({in100,in200,in500})
		3'b1??: plus = 1;
		3'b01?: plus = 2;
		3'b001: plus = 5;
		default: plus = 0;
	endcase
end

always@(*)begin	//minus
	casez({(~(w_out100 | w_out200)),w_out100,w_out200})
		3'b1??: minus = 0;
		3'b01?: minus = 1;
		3'b001: minus = 2;
	endcase
end

always@(posedge clock or posedge done)begin //sum
	if(done)
		sum <= 0;
	else
		if(mode)
			sum <= sum - minus;
		else
			sum <= sum + plus;
end

endmodule
