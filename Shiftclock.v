`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:38:36 04/21/2021 
// Design Name: 
// Module Name:    Shiftclock 
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
module Shiftclock(
    input CLKIN,
    output CLKOUT
    );
     reg CLKOUT;
	  reg START = 1'b0; 
	  reg [25:0] counter = 26'd0;
	  parameter C0 = 26'd50000;
	  always @(posedge CLKIN) 
	  begin
	  counter <= counter + 1;
	  if (START == 1'b0)
	          begin
				      CLKOUT <= 1'b0;
						START <= 1'b1;
				 end
		else if (((counter / C0)% 2)== 1'b0)
		       CLKOUT <= 1'b0;
		else
		CLKOUT <= 1'b1;
		end

endmodule
