module Pipeline_IF(
  input clk_IF,
  input rst_IF,
  input en_IF,
  input [31:0]PC_in_IF,
  input [1:0] PCSrc,
  input [31:0] PC_ALU,
  output [31:0]PC_out_IF
);
  wire [31:0] PC_4,PC_in;
  assign PC_4=PC_out_IF+4;
  assign PC_in = (PCSrc == 2'b00) ? PC_4 :
        (PCSrc == 2'b01) ? PC_in_IF :
        (PCSrc == 2'b10) ? PC_ALU : 
        PC_4;
  REG32 u_REG32(
      .clk (clk_IF),
      .rst (rst_IF),
      .D   (PC_in),
      .CE  (en_IF),
      .Q   (PC_out_IF)
);
endmodule