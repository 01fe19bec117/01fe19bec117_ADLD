`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:50:12 04/10/2022
// Design Name:   pwm_basic
// Module Name:   C:/Users/C0MPUTER/Desktop/PWM-generator-using-verilog-master/PWMGenerator1/pwm_basic_tb.v
// Project Name:  PWMGenerator1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pwm_basic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pwm_tb();
    localparam R=8;
	 reg clk,reset_n;
	 reg[R-1:0]duty;
	// Outputs
	wire pwm_out;

	// Instantiate the Unit Under Test (UUT)
	pwm #(.R(R))uut (
		.clk(clk),
		.reset_n(reset_n),
		.duty(duty),
		.pwm_out(pwm_out)
	);

//timer
initial
#(7 * 2**R * T) $stop;
//Generate Clock Signal
localparam T=10;
always
begin
clk=1'b0;
#(T/2);
clk=1'b1;
#(T/2);
end
initial
begin
reset_n=1'b0;
#2
reset_n=1'b1;
duty=0.25 * (2**R);
repeat (2 * 2**R)@(negedge clk);
duty=0.5 * (2**R);
repeat (2 * 2**R)@(negedge clk);
duty=0.75 * (2**R);
end    
endmodule
