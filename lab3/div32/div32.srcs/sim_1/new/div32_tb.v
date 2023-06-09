`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/14 10:20:12
// Design Name: 
// Module Name: div32_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module div_tb();
      reg clk;
      reg rst;
      reg [31:0] dividend;
      reg [31:0] divisor;
      reg start;
      wire [31:0] res;
      wire [31:0] rem;
      wire finish;
      wire zero;
divider  div(
      .clk(clk),
      .rst(rst),
      .dividend(dividend),
      .divisor(divisor),
      .start(start),
      .res(res),
      .rem(rem),
      .finish(finish),
      .divide_zero(zero)
);
      always #5 clk = ~clk;
      
      initial begin
      clk =0;
      rst = 1;
      start = 0;
      dividend = 32'd0;
      divisor  = 32'd0;
      //zero = 0;
      #10
      rst = 0;
      start = 1;
      dividend = 32'd8;
      divisor  = 32'd4;
      #335
      start = 0;
      #335
      start = 1;
      dividend = 32'd100;  
      divisor  = 32'd10;   
      #335
      start = 0;
      #335     
      start = 1;
      dividend = 32'd9;
      divisor  = 32'd4; 
      #335
      start = 0;
      #340   
      start = 1;         
      dividend = 32'd100; 
      divisor  = 32'd99;  
      #350
      start = 0;
      #340   
      start = 1;         
      dividend = 32'd99; 
      divisor  = 32'd0;  
      #350
      start = 0;
      #340   
      start = 1;         
      dividend = 32'd99; 
      divisor  = 32'd10;  
      #350
      start = 0;
      // #350 
      //       $stop();   
      end
endmodule
