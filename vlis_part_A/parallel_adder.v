module parallel_adder (
  input [n-1:0] A, B,
  output [n-1:0] sum,
  output carry_out
);

  parameter integer n = 4; // Bit width (can be changed)

  wire [n-1:0] carry;

  // Generate full adders for each bit position
  genvar i;
  generate
    for (i = 0; i < n; i = i + 1) begin
      full_adder adder (sum[i], carry[i], A[i], B[i], carry[i-1]);
    end
  endgenerate

  // Assign final carry output
  assign carry_out = carry[n-1];

endmodule

module full_adder (
  output sum, carry_out,
  input inA, inB, carry_in
);

  assign sum = inA ^ inB ^ carry_in;
  assign carry_out = (inA & inB) | (inA & carry_in) | (inB & carry_in);

endmodule
