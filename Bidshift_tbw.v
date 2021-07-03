`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   
// Design Name:   Bidshift
// Module Name:   
// Project Name:  Lampball
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Bidshift
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Bidshift_tbw;

	// Inputs
	reg [7:0] SRIN;
	reg [1:0] SEL;
	reg CK;
	reg CLEAR;
	reg SIL;
	reg SIR;

	// Outputs
	wire [7:0] SROUT;
	
	// Instantiate the Unit Under Test (UUT)
	Bidshift uut (
		.SRIN(SRIN), 
		.SEL(SEL), 
		.CK(CK), 
		.CLEAR(CLEAR), 
		.SIL(SIL), 
		.SIR(SIR), 
		.SROUT(SROUT)
	);
	
	reg CHANGE = 1'b0;

	//5 MHz clock running for 5500 ns
	always @ (CHANGE)
	begin
		repeat (55)
		begin
			#100;
			CK <= ~CK;
		end
	end

	initial begin
		// Initialize Inputs
		CHANGE = 1'b1;
		SRIN = 8'b10000000;
		SEL = 2'b00;
		CLEAR = 1'b1;
		CK = 1'b0;
		SIL = 1'b0;
		SIR = 1'b0;		
		#100;
		
		//Parallel load
		SEL = 2'b11;		
		#400;
		
		// Left shift with SIL = 1
		SEL = 2'b10;
		SIL = 1'b1;
		#800;

		// Left shift with SIL = 0
		SEL = 2'b10;
		SIL = 1'b0;
		#800;

		//Unchanged outputs
		SEL = 2'b00;		
		#400;
		
		//Parallel load
		SEL = 2'b11;
		#400;
		
		// Right shift with SIR = 1
		SEL = 2'b01;
		SIR = 1'b1;
		#800;
		
		// Right shift with SIR = 0
		SEL = 2'b01;
		SIR = 1'b0;
		#800;

		//Clear
		CLEAR = 1'b0;
		#500;
	end
  
endmodule

