`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   
// Design Name:   Handball
// Module Name:   
// Project Name:  Lampball
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Handball
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Handball_tbw;

	// Inputs
	reg PULSER;
	reg RESET;
	reg START;
	reg CLKK;

	// Outputs
	wire [7:0] LGOUT;

	// Instantiate the Unit Under Test (UUT)
	Handball uut (
		.PULSER(PULSER), 
		.RESET(RESET), 
		.START(START), 
		.CLKK(CLKK), 
		.LGOUT(LGOUT)
	);

	reg CHANGE = 1'b0;
	
	//5 MHz clock running for 5500 ns
	always @ (CHANGE)
	begin
		repeat (55)
		begin
			#100;
			CLKK <= ~CLKK;
		end
	end


	initial begin
		// Initialize Inputs
		CHANGE = 1'b1;
		PULSER = 1'b0;
		RESET = 1'b1;
		START = 1'b0;
		CLKK = 1'b0;
		#400;
		
		// LED placed at leftmost position
		START = 1'b1;
		RESET = 1'b0;
		#400;
		
		// Player starts playing the game (presses the push button and releases it)
		START = 1'b0;
		PULSER = 1'b1;
		#200;
		PULSER = 1'b0;

		// Game runs successfully...Lampball (LED on the FPGA) is moving to the right
		//(the switched on LED on the FPGA changes postion from left to right) 
		#1200;

		// Lampball bounces off the right side and starts moving left 
		//(the switched on LED on the FPGA changes postion from right to left) 
		#1400;

		// Player presses the push button when the lampball hits the left side
		//(the switched on LED on the FPGA is at the leftmost position) 
		PULSER = 1'b1;
		#200;
		PULSER = 1'b0;
		
		// Player presses the button at the wrong time
		#400;
		PULSER = 1'b1;
		#200;
		PULSER = 1'b0;
		
		// LED placed at leftmost position
		#200;
		START = 1'b1;
		
		// Player attempts to replay game but forgets to switch START button off
		#200;
		PULSER = 1'b1;
		
		// Player quits 
		#200;
		PULSER = 1'b0;
		RESET = 1'b1;
		#200;		
			
	end
      
endmodule

