module d_ff (
  input D, clk,
  output Q
);

  reg next_Q;

  // Sequential logic to update state on clock edge
  always @(posedge clk) begin
    next_Q <= D;
  end

  // Assign output based on the captured value
  assign Q = next_Q;

endmodule
