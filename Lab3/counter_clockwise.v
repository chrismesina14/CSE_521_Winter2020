`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:38:25 02/06/2020 
// Design Name: 
// Module Name:    counter_clockwise 
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
module counter_clockwise(
	 input wire clk, reset,en,
    output reg [3:0] an,  // enable 1-out-of-4 asserted low
    output reg [7:0] sseg // led segments
   );

   // constant declaration
   // refreshing rate around 800 Hz (50 MHz/2^16)
   localparam N = 28;
   // internal signal declaration
   reg [N-1:0] q_reg;
   wire [N-1:0] q_next;

   // N-bit counter
   // register
   always @(posedge clk, posedge reset)
      if (reset)
         q_reg <= 0;
      else if(en)
         q_reg <= q_next;

   // next-state logic
   assign q_next = q_reg + 1;

   // 2 MSBs of counter to control 4-to-1 multiplexing
   // and to generate active-low enable signal
	// sseg order -->> abcdefgdp
   always @*
      case (q_reg[N-1:N-3])
         3'b000:
            begin
               an =  4'b1110;
					sseg[7:0] = 8'b10011100;//top
               
            end
         3'b001:
            begin
             an =  4'b1101;
             sseg[7:0] = 8'b10011100;//top
            end
         3'b010:
            begin
               an =  4'b1011;
					sseg[7:0] = 8'b10011100;//top
               
            end
				3'b011:
            begin
               an =  4'b0111;
					sseg[7:0] = 8'b10011100;//top
            end
         3'b100:
            begin
               an =  4'b0111;
					sseg[7:0] = 8'b11100010;//bottom
            end
         3'b101:
            begin
               an =  4'b1011;
					sseg[7:0] = 8'b11100010;//bottom
            end
				3'b110:
            begin
               an =  4'b1101;
					sseg[7:0] = 8'b11100010;//bottom
            end
         default:
            begin
               an =  4'b1110;
					sseg[7:0] = 8'b11100010;//bottom
            end
       endcase
    
endmodule 