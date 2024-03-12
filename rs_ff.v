module rs_ff (
  input R, S, clk,
  output Q, Qn
);

  reg next_Q;

  // Combinational logic for next state based on S and R
  always @(S or R) begin
    if (S & ~R) next_Q = 1'b1;
    else if (~S & R) next_Q = 1'b0;
    else next_Q = Q; // Hold (S=R=0 or S=R=1)
  end

  // Sequential logic to update state on clock edge
  always @(posedge clk) begin
    Q <= next_Q;
  end

  assign Qn = ~Q; // Inverted output

endmodule
