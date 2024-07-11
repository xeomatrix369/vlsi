module t_ff (
  input T, clk,
  output Q, Qn
);

  reg next_Q;

  // Combinational logic for next state based on T
  always @(T) begin
    next_Q = ~Q;  // Toggle on every positive edge
  end

  // Sequential logic to update state on clock edge
  always @(posedge clk) begin
    Q <= next_Q;
  end

  assign Qn = ~Q; // Inverted output

endmodule
