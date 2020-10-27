`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:51 02/04/2020 
// Design Name: 
// Module Name:    disp_mux 
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
module disp_mux
	(
		input wire clk, reset,en,
		output reg [3:0] an,
		output reg [7:0] sseg
    );
	 
	 localparam N = 18;
	 reg [N-1:0] q_reg;
	 wire [N-1:0] q_next;
	 
	 always @(posedge clk, posedge reset)
		if(reset)
			q_reg <= 0;
		else if(en)
			q_reg <= q_next;
			
	assign q_next = q_reg + 1;
	
	always @*
		case (q_reg[N-1:N-3])
         3'b000:
            begin
               an =  4'b0111;
					sseg[7:0] = 8'b10011100;//top
               
            end
         3'b001:
            begin
             an =  4'b1011;
             sseg[7:0] = 8'b10011100;//top
            end
         3'b010:
            begin
               an =  4'b1101;
					sseg[7:0] = 8'b10011100;//top
               
            end
				3'b011:
            begin
               an =  4'b1110;
					sseg[7:0] = 8'b10011100;//top
            end
         3'b100:
            begin
               an =  4'b1110;
					sseg[7:0] = 8'b11100010;//bottom
            end
         3'b101:
            begin
               an =  4'b1101;
					sseg[7:0] = 8'b11100010;//bottom
            end
				3'b110:
            begin
               an =  4'b1011;
					sseg[7:0] = 8'b11100010;//bottom; left most is 1 because .dp
            end
         default:
            begin
               an =  4'b0111;
					sseg[7:0] = 8'b11100010;//bottom
            end
       endcase
    
endmodule
