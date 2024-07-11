module serial_adder (
  input inA, inB, clk,
  output sum, carry_out
);

  reg a, b, sum_reg, carry_reg;

  // Input registers for data synchronization
  always @(posedge clk) begin
    a <= inA;
    b <= inB;
  end

  // Serial addition logic
  always @(posedge clk) begin
    sum_reg <= a ^ b ^ carry_reg;
    carry_reg <= (a & b) | (a & carry_reg) | (b & carry_reg);
  end

  // Assign outputs
  assign sum = sum_reg;
  assign carry_out = carry_reg;

endmodule
