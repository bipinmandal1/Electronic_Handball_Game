`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:35:28 04/21/2021 
// Design Name: 
// Module Name:    Bidshift 
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
module Bidshift(
    input [7:0] SRIN,
    input [1:0] SEL,
    input CK,
    input CLEAR,
    input SIL,
    input SIR,
    output [7:0] SROUT
    );
reg [7:0] SROUT;
always @(posedge CK)
begin
if (CLEAR == 1'b0)begin SROUT = 8'b00000000; end
else
begin
  if (SEL == 2'b00) begin
    SROUT <= SROUT;
	 end
  else if (SEL == 2'b01) begin
    SROUT <= {SIR, SROUT[7:1]}; 
	 end
  else if (SEL == 2'b10) begin
    SROUT <= {SROUT[6:0], SIL}; 
	 end
  else
  begin
    SROUT <= SRIN;
	 end
end
end

endmodule
