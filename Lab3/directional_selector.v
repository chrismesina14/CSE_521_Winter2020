`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:54:13 02/06/2020 
// Design Name: 
// Module Name:    directional_selector 
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
module directional_selector1(
			input wire [7:0] cw,
			input wire [7:0] ccw,
			input wire  sel,
			output wire [7:0] an
    );
		assign an = (sel)? cw: ccw;
			 
endmodule 
