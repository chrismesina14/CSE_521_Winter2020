`timescale 1ns / 1ps

module disp_hex_mux
	(
	input wire clk, reset, en, ccw,
	output reg [3:0] an,
	output reg [7:0] sseg
	);
	
	localparam N = 28;
	
	reg [N-1:0] q_reg;
	wire [N-1:0] q_next;
	
	always @(posedge clk, posedge reset)
		if(reset)
			q_reg <= 0;
		else if (en)
			q_reg <= q_next;
	
	assign q_next = q_reg + 1;
	
	always @*
      case (q_reg[N-1:N-3])
         3'b000:
			if(ccw)
            begin
               an =  4'b0111;
					sseg[7:0] = 8'b10011100;//top
            end
			else
				begin
               an =  4'b0111;
					sseg[7:0] = 8'b11100010;//bottom
            end
				
         3'b001:
			if(ccw)
           begin
             an =  4'b1011;
             sseg[7:0] = 8'b10011100;//top
           end
			else
				begin
               an =  4'b1011;
					sseg[7:0] = 8'b11100010;//bottom
            end
				
         3'b010:
			if(ccw)
            begin
               an =  4'b1101;
					sseg[7:0] = 8'b10011100;//top
            end
			else
				begin
               an =  4'b1101;
					sseg[7:0] = 8'b11100010;//bottom
            end
				
			3'b011:
			if(ccw)
            begin
               an =  4'b1110;
					sseg[7:0] = 8'b10011100;//top
            end
			else
				begin
               an =  4'b1110;
					sseg[7:0] = 8'b11100010;//bottom
				end
				
         3'b100:
			if(ccw)
            begin
               an =  4'b1110;
					sseg[7:0] = 8'b11100010;//bottom
            end
			else
				begin
               an =  4'b1110;
					sseg[7:0] = 8'b10011100;//top
            end
				
         3'b101:
			if(ccw)
            begin
               an =  4'b1101;
					sseg[7:0] = 8'b11100010;//bottom
            end
			else
				begin
               an =  4'b1101;
					sseg[7:0] = 8'b10011100;//top
            end
				
			3'b110:
           if(ccw)
				 begin
					an =  4'b1011;
					sseg[7:0] = 8'b11100010;//bottom
				 end
			  else
				begin
					an =  4'b1011;
					sseg[7:0] = 8'b10011100;//top
				end
				
         default:
			if(ccw)
            begin
               an =  4'b0111;
					sseg[7:0] = 8'b11100010;//bottom
            end
			else
				begin
               an =  4'b0111;
					sseg[7:0] = 8'b10011100;//top
            end
       endcase
    
endmodule  
