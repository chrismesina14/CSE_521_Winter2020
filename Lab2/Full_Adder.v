`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:53:31 01/14/2020 
// Design Name: 
// Module Name:    Full_Adder 
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
module Full_Adder(
    input A,
    input B,
    input Cin,
    output Cout,
    output Sum
    );
	 
	 wire w1, w2, w3;
	 
	 assign w1 = A ^ B;
	 assign w2 = w1 & Cin;
	 assign w3 = A & B;
	 
	 assign Cout = w1 ^ Cin;
	 assign Sum = w2 | w3;


endmodule

