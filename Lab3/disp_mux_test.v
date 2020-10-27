`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:11:00 02/04/2020 
// Design Name: 
// Module Name:    disp_mux_test 
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
module disp_mux_test
	(
		input wire clk, en
		input wire [3:0] btn,
		input wire [7:0] sw,
		output wire [3:0] an,
		output wire [7:0] sseg
    );
	 
	reg [7:0] d3_reg, d2_reg, d1_reg, d0_reg;
	 
	disp_mux disp_unit
		(.clk(clk), .reset(1'b0), .en(en), .an(an), .sseg(sseg));
		 
	always @(posedge clk)
	begin
		if(btn[3])
			d3_reg <= sw;
		if(btn[2])
			d2_reg <= sw;
		if(btn[1])
			d1_reg <= sw;
		if(btn[0])
			d0_reg <= sw;
	end
	
endmodule
