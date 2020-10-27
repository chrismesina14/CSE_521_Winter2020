`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:12 01/28/2020 
// Design Name: 
// Module Name:    Top_Module 
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
module Top_Module(
    input [3:0] A,
	 input [3:0] B,
	 input Cin,
	 input wire clk, reset,
	 output [3:0] Sum,
	 output Cout,
	 output wire [3:0] an,
	 output wire [7:0] sseg
	 );
	 
	 disp_hex_mux seg_display(
	 .clk(clk), 
	 .reset(reset),
	 .an(an),
	 .sseg(sseg),
	 .hex3(Cout), 
	 .hex2(Sum), 
	 .hex1(1'b0), 
	 .hex0(1'b0),
	 .dp_in(0));
	 
	 
	 Four_Bit_Full_Adder FourBitFullAdder(
	 .A(A), 
	 .B(B), 
	 .Cin(Cin), 
	 .Cout(Cout), 
	 .Sum(Sum));


endmodule
