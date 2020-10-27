`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:57:42 02/06/2020 
// Design Name: 
// Module Name:    TopModule 
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
module TopModule(
    input wire clk, reset,sel,en,
    output  [3:0] an,  // enable 1-out-of-4 asserted low
    output  [7:0] sseg // led segments
   ); 
	 
	wire [7:0] cw;
	wire [7:0] ccw;
	wire [7:0] cwsseg;
	wire [7:0] ccwsseg;
	
	clockwise cwise (.clk(clk),.reset(reset),.sseg(cwsseg),.an(cw),.en(en));
	counter_clockwise ccwise(.clk(clk),.reset(reset),.sseg(ccwsseg),.an(ccw),.en(en));
	directional_selector1 ds1(.sel(sel),.cw(cw),.ccw(ccw),.an(an));
	directional_selector2 ds2(.sel(sel),.cwsseg(cwsseg),.ccwsseg(ccwsseg),.sseg(sseg));
	

endmodule
