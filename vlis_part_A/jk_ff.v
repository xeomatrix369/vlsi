module jk_ff (
  input J, K, clk,
  output Q, Qn
);

  reg next_Q;

  // Combinational logic for next state based on J and K
  always @(J or K) begin
    case ({J, K})
      2'b00: next_Q = Q;  // Hold (J=K=0)
      2'b01: next_Q = 1'b0; // Reset (K=1)
      2'b10: next_Q = 1'b1; // Set (J=1)
      2'b11: next_Q = ~Q;   // Toggle (J=K=1)
    endcase
  end

  // Sequential logic to update state on clock edge
  always @(posedge clk) begin
    Q <= next_Q;
  end

  assign Qn = ~Q; // Inverted output

endmodule
