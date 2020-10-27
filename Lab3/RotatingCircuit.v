`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:44 02/11/2020 
// Design Name: 
// Module Name:    RotatingCircuit 
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
module RotatingCircuit(
	input wire clk, reset, en, ccw,		// ccw is the button to push to run the rotating circtuit 
													// while en is the button to enable clockwise direction
	output reg [3:0] an,
	output reg [7:0] sseg
	);
	
	localparam N = 28;			// The speed of the circuit
	
	reg [N-1:0] q_reg;
	wire [N-1:0] q_next;
	
	always @(posedge clk, posedge reset)
		if(reset)
			q_reg <= 0;
		else if (en)
			q_reg <= q_next;
	
	assign q_next = q_reg + 1;
	
	// This case statement implements the clockwise and counter-clockwise direction of the 
	// Seven Segment LEDs
	always @*
      case (q_reg[N-1:N-3])
         3'b000:
			if(ccw)
            begin
               an =  4'b0111;
					sseg[7:0] = 8'b10011100;	// top LED
            end
			else
				begin
               an =  4'b0111;
					sseg[7:0] = 8'b11100010;	// bottom LED
            end
				
         3'b001:
			if(ccw)
           begin
             an =  4'b1011;
             sseg[7:0] = 8'b10011100;		// top LED
           end
			else
				begin
               an =  4'b1011;
					sseg[7:0] = 8'b11100010;	//bottom LED
            end
				
         3'b010:
			if(ccw)
            begin
               an =  4'b1101;
					sseg[7:0] = 8'b10011100;	//top LED
            end
			else
				begin
               an =  4'b1101;
					sseg[7:0] = 8'b11100010;	//bottom LED
            end
				
			3'b011:
			if(ccw)
            begin
               an =  4'b1110;
					sseg[7:0] = 8'b10011100;	//top LED
            end
			else
				begin
               an =  4'b1110;
					sseg[7:0] = 8'b11100010;	//bottom LED
				end
				
         3'b100:
			if(ccw)
            begin
               an =  4'b1110;
					sseg[7:0] = 8'b11100010;	//bottom LED
            end
			else
				begin
               an =  4'b1110;
					sseg[7:0] = 8'b10011100;	//top LED
            end
				
         3'b101:
			if(ccw)
            begin
               an =  4'b1101;
					sseg[7:0] = 8'b11100010;	//bottom LED
            end
			else
				begin
               an =  4'b1101;
					sseg[7:0] = 8'b10011100;	//top LED
            end
				
			3'b110:
           if(ccw)
				 begin
					an =  4'b1011;
					sseg[7:0] = 8'b11100010;	//bottom LED
				 end
			  else
				begin
					an =  4'b1011;
					sseg[7:0] = 8'b10011100;	//top LED
				end
				
         default:
			if(ccw)
            begin
               an =  4'b0111;
					sseg[7:0] = 8'b11100010;	//bottom LED
            end
			else
				begin
               an =  4'b0111;
					sseg[7:0] = 8'b10011100;	//top LED
            end
       endcase
    
endmodule
