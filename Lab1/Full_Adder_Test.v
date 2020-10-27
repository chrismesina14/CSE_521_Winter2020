`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:45:35 01/14/2020 
// Design Name: 
// Module Name:    Full_Adder_Test 
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
module Full_Adder_Test(
    );
	 
	 reg A, B, Cin;
	 wire S, Cout;
	 
Full_Adder uut(.A(A),.B(B),.Cin(Cin),.Cout(Cout),.S(S));

initial begin
A=0;
B=0;
Cin=0;
#20 A=1;
#20 B=1;
#20 A=0;
#20 Cin=1;
#20 B=0;
#20 A=1;
#20 B=1;
#40;

end
endmodule
