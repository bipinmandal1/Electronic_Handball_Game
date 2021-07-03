`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   
// Design Name:   Shiftclock
// Module Name:   
// Project Name:  
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shiftclock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shiftclock_tbw;

	// Inputs
	reg CLKIN;

	// Outputs
	wire CLKOUT;

	// Instantiate the Unit Under Test (UUT)
	Shiftclock uut (
		.CLKIN(CLKIN), 
		.CLKOUT(CLKOUT)
	);

	initial begin
		// Initialize Inputs
		CLKIN = 1'b0;
	
	forever begin	
		// CLKIN is a 100 MHz clock (similar to the onboard clock on the FPGA)
		#5; 
		CLKIN = ~CLKIN;
	end
	
	end
      
endmodule

