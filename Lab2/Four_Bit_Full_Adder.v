`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:53:32 01/23/2020 
// Design Name: 
// Module Name:    Four_Bit_Full_Adder 
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
module Four_Bit_Full_Adder(
	 input [3:0] A,
	 input [3:0] B,
	 input Cin,
	 output [3:0] Sum,
	 output Cout
	 );
	 
	 wire C1, C2, C3;
	 
	 Full_Adder fa0 (A[0],B[0],Cin,Sum[0],C1);
	 Full_Adder fa1 (A[1],B[1],C1,Sum[1],C2);
	 Full_Adder fa2 (A[2],B[2],C2,Sum[2],C3);
	 Full_Adder fa3 (A[3],B[3],C3,Sum[3],Cout);

endmodule
