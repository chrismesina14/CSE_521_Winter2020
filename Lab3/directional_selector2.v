`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:12 02/06/2020 
// Design Name: 
// Module Name:    directional_selector2 
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
module directional_selector2(
			input wire [7:0] cwsseg,
			input wire [7:0] ccwsseg,
			input wire  sel,
			output wire [7:0] sseg
    );
		assign sseg = (sel)? cwsseg: ccwsseg;
			 
endmodule 
