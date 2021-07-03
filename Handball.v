`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:58:51 04/21/2021 
// Design Name: 
// Module Name:    Handball 
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
module Handball(
    input PULSER,
    input RESET,
    input START,
    input CLKK,
    output [7:0] LGOUT
    );
	 
	 reg [1:0] S;
	 wire [7:0] LGIN;
	 wire MSB_IN, LSB_IN;
	 
	 assign MSB_IN = 1'b0;
	 assign LSB_IN = 1'b0;
	 assign LGIN = IN;
	 
	 Bidshift BS1 (LGIN, S, CLKK, ~RESET,LSB_IN,MSB_IN,LGOUT);
	 reg [3:0] count = 4'd1;
	 reg [7:0] IN = 8'b10000000;
	 always @(posedge CLKK or START or posedge PULSER)
	 begin
	    if (START == 1'b1) 
		 begin
		    S <= 2'b11;
			 IN <= 8'b10000000;
			 count <= 4'd1;
		 end
		 else
		 begin
		    if (LGOUT[7] != 1'b1)
			 begin
			    if (PULSER == 1'b1)
				 begin
				    S <= 2'b11;
					 IN <= 8'b00000000;
				 end
				 else
				 begin
				    if ((LGOUT[0] == 1'b1) || (count>=4'd8))
					 begin
					    S <= 2'b10;
						 count = count + 1;
					 end
					 else
					 begin
					    S <= 2'b01;
						 count = count + 1;
					 end
				 end
			 end
			 else
			 begin
				 
				   if ((LGOUT[0] == 1'b1) || (count>=4'd8))
					 begin
					    S <= 2'b10;
						 count = count + 1;
					 end
				   else
					 begin
					    S <= 2'b01;
						 count = count + 1;
					 end
			  end
		  end
	 end


endmodule
